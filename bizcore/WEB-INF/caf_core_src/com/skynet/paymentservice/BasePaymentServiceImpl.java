package com.skynet.paymentservice;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.stream.Collectors;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.skynet.paymentservice.terms.HistoryCheckResult;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentHistory;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.skynet.paymentservice.terms.PaymentItemHistory;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.skynet.paymentservice.terms.ActionResultCompareResult;

/**
 * 支付服务的基础实现
 * 
 * @author clariones
 *
 */
public abstract class BasePaymentServiceImpl implements PaymentService {
	protected BusinessServiceProxy businessServiceProxy;
	protected Map<String, PaymentPerformer> validPaymentPerformers;
	protected static Map<String, AtomicLong> lockTime;
	protected static BasicPaymentPollingWorker pollingWorker = null;
	
	@Override
	public BusinessServiceProxy getBusinessServiceProxy() {
		return businessServiceProxy;
	}

	public void setBusinessServiceProxy(BusinessServiceProxy businessServiceProxy) {
		this.businessServiceProxy = businessServiceProxy;
	}

	public Map<String, PaymentPerformer> getValidPaymentPerformers() {
		return validPaymentPerformers;
	}

	public void setValidPaymentPerformers(Map<String, PaymentPerformer> validPaymentGateways) {
		this.validPaymentPerformers = validPaymentGateways;
	}

	public ObjectMapper getObjectMapper() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
		return mapper;
	}

	protected String convertToJsonString(PaymentActionResult result) throws PaymentServiceException {
		try {
			return getObjectMapper().writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			throw new PaymentServiceException(PaymentService.CODE_SYSTEM_ERROR, e);
		}
	}

	@Override
	public PaymentPerformer getPaymentPerformer(PaymentServiceContext ctx, String paymentOptionCode)
			throws PaymentServiceException {
		Map<String, PaymentPerformer> map = getValidPaymentPerformers();
		if (map == null || !map.containsKey(paymentOptionCode)) {
			return null;
		}
		PaymentPerformer pp = map.get(paymentOptionCode);
		if (pp == null) {
			throw new PaymentServiceException(PaymentService.CODE_CONFIG_ERROR, "没有配置" + paymentOptionCode + "对应的支付网关");
		}
		if (pp instanceof BasePaymentPerformerImpl) {
			((BasePaymentPerformerImpl) pp).setPaymentMethodCode(paymentOptionCode);
		}
		return pp;
	}

	protected static final NumberFormat cashFormat = new DecimalFormat("#,##0.00#");

	protected String formatAmount(BigDecimal amount) {
		return cashFormat.format(amount);
	}


	//////////////// //////////////// //////////////// ////////////////

	protected Object getGlobalLockForMainOrder(OrderData mainOrder) {
		synchronized (this.getClass()) {
			ensureLockTimePool();
			String key = mainOrder.getId();
			AtomicLong ts = lockTime.get(key);
			if (ts == null) {
				ts = new AtomicLong(System.currentTimeMillis());
				lockTime.put(key, ts);
			} else {
				ts.set(System.currentTimeMillis());
			}
			return ts;
		}
	}

	protected void ensureLockTimePool() {
		if (lockTime != null) {
			return;
		}
		lockTime = new ConcurrentHashMap<>();
		new Thread() {
			@Override
			public void run() {
				checkLockTime();
			}
		}.start();
	}

	protected void checkLockTime() {
		while (true) {
			Iterator<Entry<String, AtomicLong>> it = lockTime.entrySet().iterator();
			long curTs = System.currentTimeMillis();
			while (it.hasNext()) {
				Entry<String, AtomicLong> ent = it.next();
				AtomicLong ts = ent.getValue();
				if (curTs - ts.get() > getLockTimeOutInMs()) {
					it.remove();
				}
			}

			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

	protected long getLockTimeOutInMs() {
		// 默认30秒后, 自动释放全局锁
		return 30000L;
	}

	///////////////////////////////////////////////////////////

	@Override
	public PaymentRequestResponse handleRequireToPay(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException {
		PaymentRequestResponse response = processRequirToPay(ctx, order, payment);
		return response;
	}

	private PaymentRequestResponse processRequirToPay(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException {
		synchronized (this.getGlobalLockForMainOrder(order)) {
			// 先检查本次支付是否有必要继续进行下去: 先检查订单本身是否有效, 再检查支付方式所指定的支付金额是否有效
			boolean passed = getBusinessServiceProxy().checkMainOrderPayIsValid(ctx, order, payment);
			if (!passed) {
				throw new PaymentServiceException(PaymentService.CODE_CHECKING_FAILED, ctx.getReasonMessage());
			}
			// 是否支持的组合方式
			passed = checkValidPaymentCombination(ctx, order, payment);
			if (!passed) {
				throw new PaymentServiceException(PaymentService.CODE_NOT_SUPPORT, ctx.getReasonMessage());
			}
			// 之前是否已经有支付行为了
			PaymentInfomation historyPayment = findLastHistoryPayment(ctx, order);
			if (historyPayment == null) {
				PaymentRequestResponse result = handleNewPaymentRequirement(ctx, order, payment);
				return result;
			}
			// 支付方式是否发生了变化
			boolean paymentOptionChanged = !isSamePayment(payment, historyPayment);
			if (paymentOptionChanged) {
				log(ctx, order, historyPayment, "重新支付订单");
				PaymentRequestResponse result = handleChangedPaymentRequirment(ctx, order, historyPayment, payment);
				return result;
			}
			// 相同的支付请求再次到达
			log(ctx, order, historyPayment, "再次支付订单");
			PaymentRequestResponse result = handlePaymentRequirmentRetrying(ctx, order, historyPayment, payment);
			return result;
		}
	}

	protected void log(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment, String message) {
		System.out.printf("%s:%s-%s\n", message, order.getId(), payment.getId());
	}

	protected PaymentRequestResponse handlePaymentRequirmentRetrying(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment, PaymentInfomation payment) throws PaymentServiceException {
		// 已经在入口处检查了payment option 不会为空
		List<PaymentItemData> paymentItems = historyPayment.getPaymentItemList();

		PaymentHistory historyPaymentRecord = findPaymentRecord(ctx, historyPayment);
		if (historyPaymentRecord.getItemRecordList() == null || historyPaymentRecord.getItemRecordList().isEmpty()) {
			// 历史支付由于某种原因, 并没有完成, 中间就失败了, 所以才会出现这种有总体记录, 但是没有各项支付的情况
			// 这个的结论是: 历史支付是确定失败的
			log(ctx, order, historyPayment, "历史支付无效");
			PaymentRequestResponse result = closeExistedPaymentAndThenStartNewPayment(ctx, order, historyPayment,
					payment, historyPaymentRecord);
			return result;
		}

		boolean allStillValid = true;
		boolean needRedoPaymentAction = false;
		boolean needManualHanding = false;
		boolean notSure = false;
		Map<String, HistoryCheckResult> checkResults = new HashMap<>();
		// 逐个检查历史支付的情况
		for (PaymentItemData paymentItem : paymentItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
					paymentItem.getPaymentOptionCode(), historyPaymentRecord);
			HistoryCheckResult checkResult = performer.checkHistoryResult(ctx, lastPaymentItemHistory);
			checkResults.put(paymentItem.getPaymentOptionCode(), checkResult);
			allStillValid = allStillValid && checkResult.isStillValid();
			needRedoPaymentAction = needRedoPaymentAction || checkResult.isShouldRedo();
			needManualHanding = needManualHanding || checkResult.isNeedManualHanding();
			notSure = notSure || checkResult.isNotSure();
		}
		if (allStillValid) {
			log(ctx, order, historyPayment, "历史支付仍然有效");
			PaymentRequestResponse result = assemblePaymentRequestResponseWithHistory(ctx, historyPayment,
					historyPaymentRecord);
			return result;
		}
		if (needManualHanding) {
			log(ctx, order, historyPayment, "历史支付需要人工处理");
			throw new PaymentServiceException(CODE_PAYING, "您有历史支付未处理,请联系客服,协商处理.");
		}
		if (notSure) {
			log(ctx, order, historyPayment, "历史支付无法确定支付结果");
			throw new PaymentServiceException(CODE_PAYING, "您有历史支付未得到服务商确认,请稍后再试");
		}
		if (needRedoPaymentAction) {
			log(ctx, order, historyPayment, "历史支付已失效,需要重新交互");
			PaymentRequestResponse result = closeAndRetryPayment(ctx, order, historyPayment, historyPaymentRecord,
					checkResults);
			return result;
		}
		log(ctx, order, historyPayment, "历史支付无法处理");
		throw new PaymentServiceException(CODE_PAYING, "您的历史支付尚未处理完成,请联系客服,协商处理.");
	}

	protected PaymentRequestResponse closeAndRetryPayment(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment, PaymentHistory historyPaymentRecord,
			Map<String, HistoryCheckResult> checkResults) throws PaymentServiceException {
		// TODO Auto-generated method stub

		PaymentRequestResponse result = new PaymentRequestResponse();
		result.setPaymentId(historyPaymentRecord.getPaymentDetailId());
		List<PaymentItemData> historyPayItems = historyPayment.getPaymentItemList();
		boolean allSuccess = true;
		for (PaymentItemData item : historyPayItems) {
			String poCode = item.getPaymentOptionCode();
			HistoryCheckResult checkResult = checkResults.get(poCode);
			if (checkResult == null) {
				throw new PaymentServiceException(CODE_SYSTEM_ERROR, "没有" + item.getPaymentOptionName() + "的历史支付.");
			}
			PaymentPerformer performer = getPaymentPerformer(ctx, poCode);
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx, poCode, historyPaymentRecord);
			PaymentActionResult lastTimeActionResult = performer.getActionResultFromHistory(ctx,
					lastPaymentItemHistory);
			if (!checkResult.isShouldRedo()) {
				result.appendResult(item, lastTimeActionResult);
				continue;
			}
			log(ctx, order, historyPayment, "重试" + item.getPaymentOptionName() + "支付");
			allSuccess = allSuccess && performer.closePaymentAsFailed(ctx, order, historyPayment, item,
					lastPaymentItemHistory, lastTimeActionResult);
			if (!allSuccess) {
				break;
			}
			PaymentActionResult paymentActionResult = performer.redoPaymentAction(ctx, order, historyPayment, item,
					lastPaymentItemHistory, lastTimeActionResult);
			PaymentItemHistory rcd = new PaymentItemHistory();
			rcd.setAmount(item.getAmount());
			rcd.setData(item);
			rcd.setPaymentOptionCode(item.getPaymentOptionCode());
			rcd.setResult(paymentActionResult);
			rcd.setStatusCode(paymentActionResult.getCode());
			rcd.setStatusName(paymentActionResult.getStatus());
			savePaymentItemHistory(ctx, order, historyPayment, historyPaymentRecord, rcd);
			historyPaymentRecord.addItemHistory(rcd);
			
			result.appendResult(item, paymentActionResult);
		}
		if (!allSuccess) {
			log(ctx, order, historyPayment, "重试支付失败");
			throw new PaymentServiceException(CODE_PAYING, "尝试重新支付失败. 请稍后去订单查看支付结果");
		}
		if (!result.isSuccess()) {
			result.setResponseCode(RESPONSE_RETRY_PAYING_FAILED);
			result.setResponseMessage(ctx.getReasonMessage());
		}else if (result.isCanFinish()) {
			result = handleAllSuccess(ctx, order, historyPayment, historyPaymentRecord);
		}else {
			result.setResponseCode(RESPONSE_SUCCESS);
			result.setResponseMessage(null);
		}
		return result;
	}


	protected PaymentRequestResponse assemblePaymentRequestResponseWithHistory(PaymentServiceContext ctx,
			PaymentInfomation historyPayment, PaymentHistory historyPaymentRecord) throws PaymentServiceException {
		PaymentRequestResponse result = new PaymentRequestResponse();
		result.setPaymentId(historyPaymentRecord.getPaymentDetailId());
		List<PaymentItemData> historyPayItems = historyPayment.getPaymentItemList();
		for (PaymentItemData item : historyPayItems) {
			String poCode = item.getPaymentOptionCode();
			PaymentPerformer performer = getPaymentPerformer(ctx, poCode);
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx, item.getPaymentOptionCode(),
					historyPaymentRecord);
			PaymentActionResult paymentActionResult = performer.getActionResultFromHistory(ctx, lastPaymentItemHistory);
			result.appendResult(item, paymentActionResult);
		}
		if (!result.isSuccess()) {
			result.setResponseCode(RESPONSE_REQUIRE_TO_PAY_FAILED);  // 默认的失败代码
//			result.setResponseMessage(ctx.getReasonMessage());
			result.setResultCode(ResultCode.NOT_START);		  // 默认的结果代码.  这两个默认值需要根据情况,在不同的场景下重设
		}else {
			result.setResponseCode(RESPONSE_SUCCESS);
//			result.setResponseMessage(null);
			result.setResultCode(ResultCode.CONTINUE);
		}
		return result;
	}

	protected PaymentItemHistory findLastPaymentItemHistory(PaymentServiceContext ctx, String paymentOptionCode,
			PaymentHistory historyPaymentRecord) {
		List<PaymentItemHistory> list = historyPaymentRecord.getItemRecordList();
		if (list == null || list.isEmpty()) {
			return null;
		}
		int size = list.size();
		for (int i = 0; i < size; i++) {
			PaymentItemHistory record = list.get(size - i - 1);
			if (record.getPaymentOptionCode().equals(paymentOptionCode)) {
				return record;
			}
		}
		return null;
	}

	protected PaymentRequestResponse closeExistedPaymentAndThenStartNewPayment(PaymentServiceContext ctx,
			OrderData order, PaymentInfomation historyPayment, PaymentInfomation payment,
			PaymentHistory historyPaymentRecord) throws PaymentServiceException {
		closeExistedPaymentAndThenMarkAsFailed(ctx, order, historyPayment, historyPaymentRecord);
		log(ctx, order, historyPayment, "全部历史支付已关闭,重新开始支付");
		PaymentRequestResponse result = this.handleNewPaymentRequirement(ctx, order, payment);
		return result;
	}

	protected abstract void markPaymentAsFailed(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment) throws PaymentServiceException;
	protected abstract void markPaymentAsPaid(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment) throws PaymentServiceException;
	protected abstract void markPaymentAsPaying(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment) throws PaymentServiceException;
	protected abstract void markPaymentAsCancelled(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment) throws PaymentServiceException;

	/**
	 * 根据payment info的ID信息, 查找出它相关的所有记录, 主要是包括每个支付选项的执行结果
	 * 
	 * @param ctx
	 * @param historyPayment
	 * @return
	 * @throws PaymentServiceException
	 */
	protected abstract PaymentHistory findPaymentRecord(PaymentServiceContext ctx, PaymentInfomation historyPayment)
			throws PaymentServiceException;

	protected PaymentRequestResponse handleChangedPaymentRequirment(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment, PaymentInfomation payment) throws PaymentServiceException {
		// 已经在入口处检查了payment option 不会为空
		List<PaymentItemData> paymentItems = historyPayment.getPaymentItemList();

		PaymentHistory historyPaymentRecord = findPaymentRecord(ctx, historyPayment);
		if (historyPaymentRecord.getItemRecordList() == null || historyPaymentRecord.getItemRecordList().isEmpty()) {
			// 历史支付由于某种原因, 并没有完成, 中间就失败了, 所以才会出现这种有总体记录, 但是没有各项支付的情况
			// 这个的结论是: 历史支付是确定失败的
			log(ctx, order, historyPayment, "历史支付无效");
			PaymentRequestResponse result = closeExistedPaymentAndThenStartNewPayment(ctx, order, historyPayment,
					payment, historyPaymentRecord);
			return result;
		}

		boolean allCanClose = true;
		Map<String, HistoryCheckResult> checkResults = new HashMap<>();
		// 逐个检查历史支付的情况
		for (PaymentItemData paymentItem : paymentItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
					paymentItem.getPaymentOptionCode(), historyPaymentRecord);
			HistoryCheckResult checkResult = performer.checkHistoryResult(ctx, lastPaymentItemHistory);
			checkResults.put(paymentItem.getPaymentOptionCode(), checkResult);
			allCanClose = allCanClose && checkResult.isMayCancell();
		}
		if (!allCanClose) {
			log(ctx, order, historyPayment, "历史支付无法关闭, 不能变更");
			throw new PaymentServiceException(CODE_PAYING, "您有已发生的支付不能变更,请联系客服,协商处理.");
		}
		PaymentRequestResponse result = closeExistedPaymentAndThenStartNewPayment(ctx, order, historyPayment, payment,
				historyPaymentRecord);
		return result;
	}

	protected PaymentRequestResponse handleNewPaymentRequirement(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException {
		log(ctx, order, payment, "开始新支付");
		PaymentRequestResponse result = new PaymentRequestResponse();
		PaymentHistory paymentHistory = logPaymentStartEvent(ctx, order, payment);
		result.setPaymentId(paymentHistory.getPaymentDetailId());
		List<PaymentItemData> paymentItems = payment.getPaymentItemList();
		for (PaymentItemData paymentItem : paymentItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentActionResult actionResult = performer.requireToPay(ctx, order, payment, paymentItem);
			PaymentItemHistory rcd = new PaymentItemHistory();
			rcd.setAmount(paymentItem.getAmount());
			rcd.setData(paymentItem);
			rcd.setPaymentOptionCode(paymentItem.getPaymentOptionCode());
			rcd.setResult(actionResult);
			rcd.setStatusCode(actionResult.getCode());
			rcd.setStatusName(actionResult.getStatus());
			savePaymentItemHistory(ctx, order, payment, paymentHistory, rcd);
			paymentHistory.addItemHistory(rcd);

			result.appendResult(paymentItem, actionResult);
		}
		if (!result.isSuccess()) {
			result.setResponseCode(RESPONSE_REQUIRE_TO_PAY_FAILED);
			result.setResponseMessage(ctx.getReasonMessage());
			result.setResultCode(PaymentService.ResultCode.NOT_START);
		}else if (result.isCanFinish()) {
			result = handleAllSuccess(ctx, order, payment, paymentHistory);
			return result;
		}else {
			result.setResponseCode(RESPONSE_SUCCESS);
			result.setResponseMessage(null);
			result.setResultCode(PaymentService.ResultCode.CONTINUE);
			addPaymentPollingTask(ctx, order, payment);
		}
		return result;
	}

	protected void addPaymentPollingTask(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment) {
		ensurePaymentPollingTask(ctx);
		addIntoPollingTaskQueue(ctx, order, payment);
		notifyPollingTaskHasNewTask(ctx);
	}

	protected void notifyPollingTaskHasNewTask(PaymentServiceContext ctx) {
		pollingWorker.onNewTaskAdded(ctx);
	}

	protected void addIntoPollingTaskQueue(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment) {
		pollingWorker.addTask(ctx, order, payment, 30000L);
	}

	protected void ensurePaymentPollingTask(PaymentServiceContext ctx) {
		if (pollingWorker == null) {
			pollingWorker = new BasicPaymentPollingWorker();
			pollingWorker.setPaymentService(this);
		}
		pollingWorker.startToRun();
	}

	protected abstract void savePaymentItemHistory(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory paymentHistory, PaymentItemHistory rcd)
			throws PaymentServiceException;

	protected abstract PaymentHistory logPaymentStartEvent(PaymentServiceContext paymentServiceContext, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException;

	protected abstract PaymentInfomation findLastHistoryPayment(PaymentServiceContext paymentServiceContext,
			OrderData order) throws PaymentServiceException;

	protected boolean checkValidPaymentCombination(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException {
		List<PaymentItemData> paymentItemList = payment.getPaymentItemList();
		if (paymentItemList == null || paymentItemList.isEmpty()) {
			ctx.setReasonMessage("没有指定任何支付方式");
			return false;
		}
		if (paymentItemList.size() == 1) {
			return true; // 如果只有1种支付方式, 直接不再检查.
		}
		int notFCPayer = 0;
		StringBuilder sb = new StringBuilder();
		for (PaymentItemData paymentItem : paymentItemList) {
			PaymentPerformer paymentGateway = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			if (!paymentGateway.isFullyControlled()) {
				notFCPayer++;
				sb.append(' ').append(paymentItem.getPaymentOptionName());
			}
		}
		if (notFCPayer > 1) {
			ctx.setReasonMessage("不能同时选择" + sb.toString() + ", 只能选择其中之一");
			return false;
		}

		return true;
	}

	// 判断是否是同样的支付请求
	/**
	 * 判断规则有点复杂, 后面再细化. 目前的规则简单的划定为: option 和 amount 都相等
	 * 
	 * @param historyPayment
	 * @param payment
	 * @return
	 */
	protected boolean isSamePayment(PaymentInfomation payment1, PaymentInfomation payment2) {
		if (payment1.getAmount().compareTo(payment2.getAmount()) != 0) {
			return false;
		}
		List<PaymentItemData> itemList1 = payment1.getPaymentItemList();
		List<PaymentItemData> itemList2 = payment2.getPaymentItemList();
		if (itemList1.size() != itemList2.size()) {
			return false;
		}
		Map<String, BigDecimal> amountMap1 = itemList1.stream()
				.collect(Collectors.toMap(it -> it.getPaymentOptionCode(), it -> it.getAmount()));
		for (PaymentItemData item : itemList2) {
			BigDecimal amount = amountMap1.get(item.getPaymentOptionCode());
			if (amount == null) {
				return false;
			}
			if (amount.compareTo(item.getAmount()) != 0) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 
	 * @param context
	 * @param order
	 * @param payment
	 * @return
	 * @throws PaymentServiceException 
	 */
	@Override
	public PaymentRequestResponse handleCheckPaymentStatusEvent(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException {
		synchronized (this.getGlobalLockForMainOrder(order)) {
			// 查找之前的支付记录
			PaymentInfomation historyPayment = findLastHistoryPayment(ctx, order);
			if (historyPayment == null) {
				throw new PaymentServiceException(PaymentService.CODE_CHECKING_FAILED, "订单" + order.getId() + "没有开始支付");
			}
			if (!historyPayment.getId().equals(payment.getId())) {
				throw new PaymentServiceException(PaymentService.CODE_CHECKING_FAILED,
						"订单" + order.getId() + "的最后一次支付记录与请求的支付ID不一致");
			}
			// 查找历史支付记录
			PaymentHistory historyPaymentRecord = findPaymentRecord(ctx, payment);
			if (historyPaymentRecord.getItemRecordList() == null
					|| historyPaymentRecord.getItemRecordList().isEmpty()) {
				// 历史支付由于某种原因, 并没有完成, 中间就失败了, 所以才会出现这种有总体记录, 但是没有各项支付的情况
				// 这个的结论是: 历史支付是确定失败的
				log(ctx, order, historyPayment, "历史支付无效");
				PaymentRequestResponse result = closeExistedPaymentAndThenReturn(ctx, order, payment,
						historyPaymentRecord);
				return result;
			}

			boolean anyChanged = false;
			boolean allSuccess = true;
			boolean anyManualHandling = false;
			boolean anyWait = false;
			boolean anyFailed = false;
			boolean anyContinue = false;
			// Map<String, HistoryCheckResult> checkResults = new HashMap<>();

			// 逐个检查历史支付的情况
			List<PaymentItemData> paymentItems = payment.getPaymentItemList();
			for (PaymentItemData paymentItem : paymentItems) {
				PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
				PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
						paymentItem.getPaymentOptionCode(), historyPaymentRecord);

				PaymentActionResult historyResult = performer.getActionResultFromHistory(ctx, lastPaymentItemHistory);
				PaymentActionResult newResult = performer.queryPaymentStatusByHistoryRecord(ctx, historyResult);
				// 比较两次状态是否有变化
				ActionResultCompareResult compareResult = performer.compareAndUpdatePaymentItemStatus(ctx, order, payment,
						historyPaymentRecord, historyResult, newResult);
				// 决策总体结果
				anyChanged = anyChanged || compareResult.isChanged();
				allSuccess = allSuccess && compareResult.isTreatAsSuccess();
				anyManualHandling = anyManualHandling || compareResult.isNeedManualHanding();
				anyWait = anyWait || compareResult.isNeedWait();
				anyFailed = anyFailed || compareResult.isTreatAsFail();
				anyContinue = anyContinue || compareResult.isNeedContinue();

				// 记录变化
				if (compareResult.isChanged()) {
					PaymentItemHistory rcd = new PaymentItemHistory();
					rcd.setAmount(paymentItem.getAmount());
					rcd.setData(paymentItem);
					rcd.setPaymentOptionCode(paymentItem.getPaymentOptionCode());
					rcd.setResult(newResult);
					rcd.setStatusCode(newResult.getCode());
					rcd.setStatusName(newResult.getStatus());
					savePaymentItemHistory(ctx, order, payment, historyPaymentRecord, rcd);
					historyPaymentRecord.addItemHistory(rcd);
				}
			}

			if (!anyChanged) {
				// 没有任何变化的情况下, 告知客户
				PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment,
						historyPaymentRecord);
				if (!result.isSuccess()) {
					result.setResponseCode(RESPONSE_NO_CHANGE);
				}
				result.setResponseMessage("支付状态转变尚未完成,请稍后再试");
				result.setResultCode(ResultCode.WAITING);
				return result;
			}

			if (anyManualHandling) {
				// 有任何一个说要人工处理的, 那么情况就超出预期了, 需要人工处理
				PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment,
						historyPaymentRecord);
				result.setResponseCode(RESPONSE_MANUAL_HANDLING);
				result.setResultCode(ResultCode.MANUAL_HANDLING);
				return result;
			}

			if (allSuccess) {
				// 如果都成功了, 触发'完成'
				PaymentRequestResponse result = handleAllSuccess(ctx, order, payment, historyPaymentRecord);
				return result;
			}
			if (anyFailed) {
				// 如果有任何一个失败了, 触发 '失败'
				PaymentRequestResponse result = handleAnyFailed(ctx, order, payment, historyPaymentRecord);
				return result;
			}
			if (anyContinue) {
				// 如果前面没有说要失败的, 要人工处理的, 然后有一个说还要继续的, 那么其他performer就要暂时等一下, 继续下一步
				markPaymentAsPaying(ctx, order, payment);
				PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment,
						historyPaymentRecord);
				result.setResponseCode(RESPONSE_SUCCESS);
				result.setResultCode(ResultCode.CONTINUE);
				return result;
			}
			// 无法确定, 既不是成功,也不是失败, 也不确定人工需要处理, 等等看也不知道会怎么样, 也只好先等等看了
			markPaymentAsPaying(ctx, order, payment);
			PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment,
					historyPaymentRecord);
			result.setResponseCode(RESPONSE_WAITING);
			result.setResultCode(ResultCode.WAITING);
			return result;
		}
	}

	

	// 有任何失败, 先尝试关闭其他支付, 然后告诉客户支付失败了
	protected PaymentRequestResponse handleAnyFailed(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord) throws PaymentServiceException {
		List<PaymentItemData> paymentItems = payment.getPaymentItemList();
		boolean allCanClose = true;
		Map<String, HistoryCheckResult> checkResults = new HashMap<>();
		// 逐个检查历史支付的情况
		for (PaymentItemData paymentItem : paymentItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
					paymentItem.getPaymentOptionCode(), historyPaymentRecord);
			HistoryCheckResult checkResult = performer.checkHistoryResult(ctx, lastPaymentItemHistory);
			checkResults.put(paymentItem.getPaymentOptionCode(), checkResult);
			allCanClose = allCanClose && checkResult.isMayCancell();
		}
		if (!allCanClose) {
			log(ctx, order, payment, "历史支付无法自动关闭, 需要人工介入");
			throw new PaymentServiceException(CODE_PAYING, "您的支付已经失效,但是有同批支付不能自动关闭,请联系客服,协商处理.");
		}
		// 关闭所有历史支付
		closeExistedPaymentAndThenMarkAsFailed(ctx, order, payment, historyPaymentRecord);
		
		for (PaymentItemData paymentItem : paymentItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
					paymentItem.getPaymentOptionCode(), historyPaymentRecord);

			PaymentActionResult historyResult = performer.getActionResultFromHistory(ctx, lastPaymentItemHistory);
			performer.commitWhenFailed(ctx, order, payment, paymentItem, lastPaymentItemHistory, historyResult);
		}
		
		
		PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment, historyPaymentRecord);
		result.setResponseCode(RESPONSE_FAILED);
		result.setResultCode(ResultCode.SURE_FAIL);
		this.getBusinessServiceProxy().onPaymentFailed(ctx, order, payment, result);
		return result;
	}

	protected void closeExistedPaymentAndThenMarkAsFailed(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord) throws PaymentServiceException {
		List<PaymentItemData> historyPayItems = payment.getPaymentItemList();
		boolean allSuccess = true;
		for (PaymentItemData item : historyPayItems) {
			String poCode = item.getPaymentOptionCode();
			PaymentPerformer performer = getPaymentPerformer(ctx, poCode);
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx, poCode, historyPaymentRecord);
			PaymentActionResult lastTimeActionResult = performer.getActionResultFromHistory(ctx,
					lastPaymentItemHistory);
			log(ctx, order, payment, "关闭" + item.getPaymentOptionName() + "支付");
			allSuccess = allSuccess && performer.closePaymentAsFailed(ctx, order, payment, item,
					lastPaymentItemHistory, lastTimeActionResult);
			if (!allSuccess) {
				break;
			}
		}
		if (!allSuccess) {
			log(ctx, order, payment, "关闭历史支付失败");
			throw new PaymentServiceException(CODE_PAYING, "尝试关闭历史支付失败. 请稍后重新尝试支付或与客户联系.");
		}
		// 关闭完成后, 查询一遍最新的状态, 需要更新的, 还要更新record
		for (PaymentItemData paymentItem : historyPayItems) {
			PaymentPerformer performer = getPaymentPerformer(ctx, paymentItem.getPaymentOptionCode());
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx,
					paymentItem.getPaymentOptionCode(), historyPaymentRecord);
			
			PaymentActionResult historyResult = performer.getActionResultFromHistory(ctx, lastPaymentItemHistory);
			PaymentActionResult newResult = performer.queryPaymentStatusByHistoryRecord(ctx, historyResult);
			// 比较两次状态是否有变化
			ActionResultCompareResult compareResult = performer.compareAndUpdatePaymentItemStatus(ctx, order, payment,
					historyPaymentRecord, historyResult, newResult);
			// 记录变化
			if (compareResult.isChanged()) {
				PaymentItemHistory rcd = new PaymentItemHistory();
				rcd.setAmount(paymentItem.getAmount());
				rcd.setData(paymentItem);
				rcd.setPaymentOptionCode(paymentItem.getPaymentOptionCode());
				rcd.setResult(newResult);
				rcd.setStatusCode(newResult.getCode());
				rcd.setStatusName(newResult.getStatus());
				savePaymentItemHistory(ctx, order, payment, historyPaymentRecord, rcd);
				historyPaymentRecord.addItemHistory(rcd);
			}
		}
		markPaymentAsFailed(ctx, order, payment);
		log(ctx, order, payment, "全部历史支付已关闭");
	}

	protected PaymentRequestResponse handleAllSuccess(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory paymentRecord) throws PaymentServiceException {
		List<PaymentItemData> historyPayItems = payment.getPaymentItemList();
		PaymentRequestResponse result = new PaymentRequestResponse();
		for (PaymentItemData paymentItem : historyPayItems) {
			String poCode = paymentItem.getPaymentOptionCode();
			PaymentPerformer performer = getPaymentPerformer(ctx, poCode);
			PaymentItemHistory lastPaymentItemHistory = findLastPaymentItemHistory(ctx, poCode, paymentRecord);
			PaymentActionResult lastTimeActionResult = performer.getActionResultFromHistory(ctx,
					lastPaymentItemHistory);
			result.appendResult(paymentItem, lastTimeActionResult);
			performer.commitWhenSuccess(ctx, order, payment, paymentItem, lastPaymentItemHistory, lastTimeActionResult);
		}
		
		markPaymentAsPaid(ctx, order, payment);
		result.setResponseCode(RESPONSE_SUCCESS);
		result.setResultCode(ResultCode.SURE_SUCCESS);
		logPaymentSuccessResult(ctx, order, payment, paymentRecord);
		invokeBusinessOnPaySuccess(ctx, order, payment, paymentRecord, result);
		return result;
	}

	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
	public void invokeBusinessOnPaySuccess(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentHistory paymentRecord, PaymentRequestResponse result) throws PaymentServiceException {
		handleAccountTransactionWhenPaid(ctx, order, payment, paymentRecord, result);
		getBusinessServiceProxy().onPaymentSuccess(ctx, order, payment, paymentRecord, result);
	}

	protected abstract void handleAccountTransactionWhenPaid(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentHistory paymentRecord, PaymentRequestResponse result) throws PaymentServiceException;

	protected abstract void logPaymentSuccessResult(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentHistory historyPaymentRecord) throws PaymentServiceException;

	protected PaymentRequestResponse closeExistedPaymentAndThenReturn(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord) throws PaymentServiceException {
		// 关闭所有历史支付
		closeExistedPaymentAndThenMarkAsFailed(ctx, order, payment, historyPaymentRecord);
		PaymentRequestResponse result = this.assemblePaymentRequestResponseWithHistory(ctx, payment,
				historyPaymentRecord);
		result.setResponseCode(RESPONSE_FAILED);
		result.setResultCode(ResultCode.SURE_FAIL);
		return result;
	}
}
package com.skynet.paymentservice;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.bean.result.WxPayOrderCloseResult;
import com.github.binarywang.wxpay.bean.result.WxPayOrderQueryResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.skynet.paymentservice.terms.HistoryCheckResult;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentHistory;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.skynet.paymentservice.terms.PaymentItemHistory;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.skynet.paymentservice.terms.ActionResultCompareResult;
import com.skynet.paymentservice.terms.WechatPaymentItem;
import com.terapico.utils.MapUtil;
import com.terapico.utils.RandomUtil;

/**
 * 微信支付的执行类.
 * 
 * 微信支付的内部状态为:
 * <ol>
 * <li>NOT_START: 尚未开始</li>
 * <li>NOT_PAY:</li>
 * <li>WAITING: 订单查询存在, 但是状态不确定,可能将会成功,也可能取消</li>
 * <li>SUCCESS: 已确认成功</li>
 * <li>FAILED: 已确认失败/关闭/取消, 总之确认不成功</li>
 * </ol>
 * 
 * 参见微信支付文档, 订单查询结果:
 * <ul>
 * <li>SUCCESS—支付成功 </li>
 * <li>REFUND—转入退款 </li>
 * <li>NOTPAY—未支付 </li>
 * <li>CLOSED—已关闭 </li>
 * <li>REVOKED—已撤销（刷卡支付） </li>
 * <li>USERPAYING--用户支付中 </li>
 * <li>PAYERROR--支付失败(其他原因，如银行返回失败)</li>
 * </ul>
 * 
 * @author clariones
 *
 */

public class WechatPayPerformer extends BasePaymentPerformerImpl{
	protected static final String KEY_QUERY_INFO = "queryInfo";
	
	protected static int COUNT = 0;
	protected static final String DETAIL_OUT_TRADE_NO = "outTradeNo";
	protected static final String DETAIL_PAY_INFO = "payInfo";
	
	public static final String NOT_START = "NOT_START"; // 尚未开始
	public static final String NOT_PAY = "NOT_PAY"; // 已经统一下单, 尚未确认结果
	public static final String WAITING = "WAITING"; // 订单查询存在, 但是状态不确定,可能将会成功,也可能取消
	public static final String SUCCESS = "SUCCESS"; // 已确认成功
	public static final String FAILED = "FAILED"; // 已确认失败/关闭/取消, 总之确认不成功
	public static final String REFUND = "REFUND"; // 转入退款
	
	// 调试用的
	public static String DEBUG_TRADE_STATE = null;
	// 此函数必须手工改代码. 仅用于调试
	private final void adapteQueryResultForDebug(PaymentServiceContext ctx, WxPayOrderQueryResult queryResult) {
		if (ctx.isProductEnvironment()) {
			return;
		}
		if (DEBUG_TRADE_STATE == null) {
			return;
		}
		queryResult.setTradeState(DEBUG_TRADE_STATE);
	}
	
	protected static final BigDecimal ONE_HUNDRED = new BigDecimal(100);
	protected WxPayService wxPayService;
	
	public WxPayService getWxPayService() {
		return wxPayService;
	}
	public void setWxPayService(WxPayService wxPayService) {
		this.wxPayService = wxPayService;
	}

	// 调用统一下单接口
	protected WxPayMpOrderResult placeUniqOrder(PaymentServiceContext ctx, String remoteIp, String orderBody, String outTradeNo, BigDecimal amount,String openId) throws WxPayException {
		WxPayUnifiedOrderRequest.WxPayUnifiedOrderRequestBuilder requestBuilder = WxPayUnifiedOrderRequest.newBuilder();
		Integer wxTotalFee = amount.multiply(ONE_HUNDRED).intValue();
		if (!ctx.isProductEnvironment()) {
			wxTotalFee = Math.min(wxTotalFee, 1);
		}
		requestBuilder.notifyUrl(getNotifyUrl())
				.body(orderBody).outTradeNo(outTradeNo).tradeType(getTradeType())
				.totalFee(wxTotalFee).openid(openId).spbillCreateIp(remoteIp);
		WxPayMpOrderResult wxOrder = wxPayService.createOrder(requestBuilder.build());
		return wxOrder;
	}
	
	protected String getTradeType() {
		return getWxPayService().getConfig().getTradeType();
	}
	protected String getNotifyUrl() {
		return getWxPayService().getConfig().getNotifyUrl();
	}
	
	protected String makeOrderBody(OrderData order) {
		return order.getTitle();
	}
	protected String makeOutTradeNo(OrderData order, PaymentInfomation payment) {
		return String.format("%s_%s_%s", order.getId(), payment.getId(), RandomUtil.randomHexChars(6));
	}
	@Override
	public HistoryCheckResult checkHistoryResult(PaymentServiceContext ctx,
			PaymentItemHistory lastPaymentItemHistory) throws PaymentServiceException {
		PaymentActionResult historyResult = getActionResultFromHistory(ctx, lastPaymentItemHistory);
		HistoryCheckResult checkResult = newCheckResultInstance();
		
		switch (historyResult.getCode()) {
		case NOT_START:
			// 还没开始, 可以关闭历史记录, 重新支付
			checkResult.setShouldRedo(true);
			checkResult.setCanClose(true);
			break;
		case NOT_PAY:
			// 已下单, 未完成支付, 可以尝试关闭, 应该还是有效
			checkResult.setStillValid(true);
			checkResult.setCanClose(true);
			break;
		case WAITING:
			// 等待中. 因为某种原因进入无法确认的状态. 通常不会进入这里
			checkResult.setNotSure(true);
			break;
		case SUCCESS:
			checkResult.setFinishedSuccess(true);
			break;
		case FAILED:
			checkResult.setFinishedFailed(true);
			break;
		case REFUND:
			checkResult.setNotSure(true);
			break;
		default:
			throw new PaymentServiceException(PaymentService.CODE_SYSTEM_ERROR, "微信支付状态"+historyResult.getCode()+"未处理");
		}
		return checkResult;
	}
	@Override
	public PaymentActionResult redoPaymentAction(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment, PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) throws PaymentServiceException {
		if(!(paymentItem instanceof WechatPaymentItem)) {
			throw new PaymentServiceException(PaymentService.CODE_SYSTEM_ERROR, "微信支付没有找到正确的输入");
		}
		COUNT++;
		String outTradeNo = makeOutTradeNo(order, historyPayment);
		String orderBody = makeOrderBody(order);
		
		WechatPaymentItem itemData = (WechatPaymentItem) paymentItem;
		return placeWechatOrder(ctx, outTradeNo, orderBody, itemData);
	
	}
	private PaymentActionResult placeWechatOrder(PaymentServiceContext ctx, String outTradeNo, String orderBody,
			WechatPaymentItem itemData) {
		BigDecimal amount = itemData.getAmount();
		
		PaymentActionResult actionResult = new PaymentActionResult();
		actionResult.setAmount(amount);
		actionResult.setPaymentMethodCode(getPaymentMethodCode());
		
		String tradeType = this.getTradeType();
		if ("JSAPI".equals(tradeType)) {
			if (itemData.getOpenId() == null || itemData.getOpenId().isEmpty()) {
				Map<String, Object> detail = MapUtil.put("tradeType", tradeType).into_map();
				actionResult.setDetail(detail);
				actionResult.setCanFinish(false);
				actionResult.setMessage("微信支付需要用户的openid");
				actionResult.setStatus("统一下单失败");
				actionResult.setCode(NOT_START);
				actionResult.setSuccess(false);
				return actionResult;
			}
		}
		try {
			String remoteIp = itemData.getRemoteIP();
			String openId = itemData.getOpenId();
			WxPayMpOrderResult wxResult = placeUniqOrder(ctx, remoteIp, orderBody, outTradeNo, amount, openId);

			Map<String, Object> detail = MapUtil.put(DETAIL_PAY_INFO, wxResult).put(DETAIL_OUT_TRADE_NO, outTradeNo).into_map();
			actionResult.setDetail(detail);
			actionResult.setCanFinish(false);
			actionResult.setMessage("统一下单完成");
			actionResult.setStatus("未支付");
			actionResult.setCode(NOT_PAY);
			actionResult.setSuccess(true);
			return actionResult;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> detail = MapUtil.put("exception", e.getMessage()).into_map();
			actionResult.setDetail(detail);
			actionResult.setCanFinish(false);
			actionResult.setMessage("统一下单失败:"+e.getMessage());
			actionResult.setStatus("统一下单失败");
			actionResult.setCode(NOT_START);
			actionResult.setSuccess(false);
			return actionResult;
		}
	}
	/**
	 * 微信支付关闭历史支付, 需要拿到outTradNo
	 */
	@Override
	public boolean closePaymentAsFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation historyPayment,
			PaymentItemData item, PaymentItemHistory lastPaymentItemHistory, PaymentActionResult lastTimeActionResult)
			throws PaymentServiceException {
		try {
			Map<String, Object> detail = lastTimeActionResult.getDetail();
			String outTradeNo = (String) detail.get(DETAIL_OUT_TRADE_NO);

			// 先查询, 再关闭
			WxPayOrderQueryResult queryResult = wxPayService.queryOrder(null, outTradeNo);
			logInteractionResult(ctx, "查询订单"+outTradeNo, queryResult);
			switch (queryResult.getTradeState()) {
			case "SUCCESS":
				ctx.setReasonMessage("支付已经完成, 不能取消");
				return false;
			case "REFUND":
				ctx.setReasonMessage("支付已经转入退款, 不能取消");
				return false;
			case "NOTPAY":
			case "USERPAYING":
				break;
			case "CLOSED":
				ctx.setReasonMessage("支付已经关闭");
				return true;
			case "REVOKED":
				ctx.setReasonMessage("支付已经撤销");
				return true;
			case "PAYERROR":
				ctx.setReasonMessage("支付失败");
				return true;
			default:
				throw new PaymentServiceException(PaymentService.CODE_WECHAT, "微信支付查询异常返回:" + queryResult.getTradeState()+","+queryResult.getReturnMsg());
			}
			
			// 不能关闭的都被过滤,到这里来表示初步判断可以关闭
			WxPayOrderCloseResult closeResult = wxPayService.closeOrder(outTradeNo);
			logInteractionResult(ctx, "关闭订单"+outTradeNo, closeResult);
			if ("SUCCESS".equals(closeResult.getResultCode())) {
				return true; // 关闭成功
			}
			ctx.setReasonMessage(closeResult.getReturnMsg());
			return false;
		} catch (WxPayException e) {
			e.printStackTrace();
			throw new PaymentServiceException(PaymentService.CODE_WECHAT, e);
		}
	}
	protected void logInteractionResult(PaymentServiceContext ctx, String title, Object data) {
		try {
			System.out.printf("[WECHATPAY_PERFORMER] %s: %s\n", title, this.getObjectMapper().writeValueAsString(data));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	@Override
	public PaymentActionResult requireToPay(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem) throws PaymentServiceException {
		if(!(paymentItem instanceof WechatPaymentItem)) {
			throw new PaymentServiceException(PaymentService.CODE_SYSTEM_ERROR, "微信支付没有找到正确的输入");
		}
		String outTradeNo = makeOutTradeNo(order, payment);
		String orderBody = makeOrderBody(order);
		
		WechatPaymentItem itemData = (WechatPaymentItem) paymentItem;
		return placeWechatOrder(ctx, outTradeNo, orderBody, itemData);
	}
	
	@Override
	public PaymentActionResult queryPaymentStatusByHistoryRecord(PaymentServiceContext ctx,
			PaymentActionResult historyResult) throws PaymentServiceException {
		PaymentActionResult result = new PaymentActionResult();
		result.initWith(historyResult);
		result.setPaymentMethodCode(getPaymentMethodCode());
		if (historyResult.getDetail() == null) {
			result.setCode(NOT_START);
			result.setStatus("未支付");
			result.setSuccess(false);
			return result;
		}
		
		try {
			Map<String, Object> detail = historyResult.getDetail();
			String outTradeNo = (String) detail.get(DETAIL_OUT_TRADE_NO);

			// 先查询, 再关闭
			WxPayOrderQueryResult queryResult = wxPayService.queryOrder(null, outTradeNo);
			adapteQueryResultForDebug(ctx, queryResult);
			logInteractionResult(ctx, "查询订单"+outTradeNo, queryResult);
			if (!"SUCCESS".equals(queryResult.getReturnCode())) {
				// 通讯失败, 等等看
				result.setCode(WAITING);
				result.setStatus("通讯失败");
				result.setMessage(queryResult.getReturnMsg());
				result.setSuccess(false);
				return result;
			}
			// 保存本次查询结果 
			result.setSuccess(true);
			if (result.getDetail() == null) {
				result.setDetail(new HashMap<>());
			}
			Map<String, Object> queryInfo = MapUtil
				.put("errCode", queryResult.getErrCode())
				.put("outTradeNo", queryResult.getOutTradeNo())
				.put("resultCode", queryResult.getResultCode())
				.put("tradeState", queryResult.getTradeState())
				.put("tradeStateDesc", queryResult.getTradeStateDesc())
				.put("tradeType", queryResult.getTradeType())
				.put("transactionId", queryResult.getTransactionId())
				.put("xmlStr", queryResult.getXmlString())
				.into_map();
			result.getDetail().put(KEY_QUERY_INFO, queryInfo);
			
			switch (queryResult.getTradeState()) {
			case "SUCCESS":{
				result.setCode(SUCCESS);
				result.setStatus("支付成功");
				result.setMessage(null);
				break;
			}
			case "REFUND":{
				result.setCode(REFUND);
				result.setStatus("退款中");
				result.setMessage(queryResult.getTradeStateDesc());
				break;
			}
			case "NOTPAY":
			case "USERPAYING": {
				result.setCode(WAITING);
				result.setStatus("支付中");
				result.setMessage(queryResult.getTradeStateDesc());
				break;
			}
			case "CLOSED":{
				result.setCode(FAILED);
				result.setStatus("已取消");
				result.setMessage(queryResult.getTradeStateDesc());
				break;
			}
			case "REVOKED":{
				result.setCode(FAILED);
				result.setStatus("已撤销");
				result.setMessage(queryResult.getTradeStateDesc());
				break;
			}
			case "PAYERROR":{
				result.setCode(FAILED);
				result.setStatus("失败");
				result.setMessage(queryResult.getTradeStateDesc());
				break;
			}
			default:
				throw new PaymentServiceException(PaymentService.CODE_WECHAT, "微信支付查询异常返回:" + queryResult.getTradeState()+","+queryResult.getReturnMsg());
			}
			
			return result;
		} catch (WxPayException e) {
			e.printStackTrace();
			throw new PaymentServiceException(PaymentService.CODE_WECHAT, e);
		}
	
	}
	
	
	
	@Override
	@SuppressWarnings("unchecked")
	public ActionResultCompareResult compareAndUpdatePaymentItemStatus(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord, PaymentActionResult historyResult,
			PaymentActionResult newResult) throws PaymentServiceException {
		Map<String, Object> hisQueryInfo = (Map<String, Object>) historyResult.getDetail().get(KEY_QUERY_INFO);
		Map<String, Object> newQueryInfo = (Map<String, Object>) newResult.getDetail().get(KEY_QUERY_INFO);
		ActionResultCompareResult result = newCompareResultInstance();
		if (hisQueryInfo == null || newQueryInfo == null) {
			// 如果不包含查询结果, 那一定是特殊处理过.
			result.setChanged(true);
		}else {
			String hs = (String) hisQueryInfo.get("tradeState");
			String cs = (String) newQueryInfo.get("tradeState");
			result.setChanged(!hs.equals(cs));
		}

		if (newQueryInfo == null) {
			switch (newResult.getCode()) {
			case NOT_START:
				result.setTreatAsFail(true);
				break;
			case NOT_PAY:
				result.setNeedWait(true);
				break;
			case WAITING:
				result.setNeedWait(true);
				break;
			case SUCCESS:
				result.setTreatAsSuccess(true);
				break;
			case FAILED:
				result.setTreatAsFail(true);
				break;
			case REFUND:
				result.setNeedManualHanding(true);
				result.setTreatAsFail(true);
				break;
			default:
				throw new PaymentServiceException(PaymentService.CODE_SYSTEM_ERROR, "微信支付状态"+historyResult.getCode()+"未处理");

			}
			return result;
		}
		
		String tradeState =  (String) newQueryInfo.get("tradeState");
		/*
	protected boolean changed = false;
	protected boolean needManualHanding = false;
	protected boolean treatAsSuccess = false;
	protected boolean treatAsFail = false;
	protected boolean needWait = false;
	protected boolean needContinue = false;
		 */
		switch (tradeState) {
			case "SUCCESS":
				result.setTreatAsSuccess(true);
				break;
			case "REFUND":
				result.setTreatAsFail(true);
				break;
			case "NOTPAY":
				result.setNeedWait(true);
				break;
			case "USERPAYING":
				result.setNeedWait(true);
				break;
			case "CLOSED":
				result.setTreatAsFail(true);
				break;
			case "REVOKED":
				result.setTreatAsFail(true);
				break;
			case "PAYERROR":
				result.setTreatAsFail(true);
				break;
			default:
				throw new PaymentServiceException(PaymentService.CODE_WECHAT, "微信支付查询结果 " + tradeState +" 未处理");
			}
		
		return result;
	}
	@Override
	public void commitWhenSuccess(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) {
		// TODO Auto-generated method stub
		
	}
	
	
}

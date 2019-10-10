package com.skynet.paymentservice;

import com.skynet.paymentservice.terms.HistoryCheckResult;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentHistory;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.skynet.paymentservice.terms.PaymentItemHistory;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.skynet.paymentservice.terms.ActionResultCompareResult;

public interface PaymentPerformer {
	String getPaymentMethodCode();

	/**
	 * 是否完全自主控制的支付方式. 目前只要 余额 认为是全权控制的, 其他都不是.
	 * 
	 * @return
	 */
	boolean isFullyControlled();

	/**
	 * 
	 * @param ctx
	 * @param lastPaymentItemHistory
	 * @return
	 * @throws PaymentServiceException
	 */
	HistoryCheckResult checkHistoryResult(PaymentServiceContext paymentServiceContext,
			PaymentItemHistory lastPaymentItemHistory) throws PaymentServiceException;

	/**
	 * 决定重试上次支付的时候, 会调用此函数.
	 * 
	 * @param ctx
	 * @param order
	 * @param historyPayment
	 * @param item
	 * @param lastPaymentItemHistory
	 * @param lastTimeActionResult
	 * @return
	 * @throws PaymentServiceException
	 */
	PaymentActionResult redoPaymentAction(PaymentServiceContext paymentServiceContext, OrderData order,
			PaymentInfomation historyPayment, PaymentItemData item, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) throws PaymentServiceException;

	/**
	 * 经过判断, 需要关闭历史支付的时候, 会调用此函数.
	 * 
	 * @param ctx
	 * @param order
	 * @param historyPayment
	 * @param item
	 * @param lastTimeActionResult
	 * @param lastPaymentItemHistory
	 * @return
	 * @throws PaymentServiceException
	 */
	boolean closePaymentAsFailed(PaymentServiceContext paymentServiceContext, OrderData order,
			PaymentInfomation historyPayment, PaymentItemData item, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) throws PaymentServiceException;

	/**
	 * 从记录中获得 PaymentActionResult
	 * 
	 * @param paymentServiceContext
	 * @param lastPaymentItemHistory
	 * @return
	 * @throws PaymentServiceException
	 */
	PaymentActionResult getActionResultFromHistory(PaymentServiceContext paymentServiceContext,
			PaymentItemHistory lastPaymentItemHistory) throws PaymentServiceException;

	/**
	 * 请求开始支付
	 * 
	 * @param paymentServiceContext
	 * @param order
	 * @param payment
	 * @param paymentItem
	 * @return
	 * @throws PaymentServiceException
	 */
	PaymentActionResult requireToPay(PaymentServiceContext paymentServiceContext, OrderData order,
			PaymentInfomation payment, PaymentItemData paymentItem) throws PaymentServiceException;

	/**
	 * 根据记录中的支付选项的detail信息, 查询刷新该支付选项当前的状态
	 * 
	 * @param ctx
	 * @param historyResult
	 * @return
	 */
	PaymentActionResult queryPaymentStatusByHistoryRecord(PaymentServiceContext ctx, PaymentActionResult historyResult)
			throws PaymentServiceException;

	/**
	 * 比较支付选项对应的支付状态是否发生了变化.
	 * 
	 * 需要判断: 是否发生了变化; 是否需要继续; 是否可以认定失败了; 是否可以认为成功了; 是否需要人工参与
	 * 
	 * @param ctx
	 * @param order
	 * @param payment
	 * @param historyPaymentRecord
	 * @param historyResult
	 * @param newResult
	 * @return
	 * @throws PaymentServiceException
	 */
	ActionResultCompareResult compareAndUpdatePaymentItemStatus(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord, PaymentActionResult historyResult,
			PaymentActionResult newResult) throws PaymentServiceException;

	/**
	 * 支付失败的回调. 默认情况下, 无需特别处理, 此接口仅作为一个扩展点.
	 * 
	 * @param ctx
	 * @param order
	 * @param payment
	 * @param paymentItem
	 * @param lastPaymentItemHistory
	 *            : 对应本支付选项的最后一次记录
	 * @param historyResult:
	 *            对应本支付选项的, 最后一次操作的结果
	 * @throws PaymentServiceException
	 */
	void commitWhenFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory, PaymentActionResult historyResult)
			throws PaymentServiceException;

	/**
	 * 支付失败的回调. 默认情况下, 无需特别处理, 此接口仅作为一个扩展点.
	 * 
	 * @param ctx
	 * @param order
	 * @param payment
	 * @param paymentItem
	 * @param lastPaymentItemHistory
	 *            : 对应本支付选项的最后一次记录
	 * @param historyResult:
	 *            对应本支付选项的, 最后一次操作的结果
	 * @throws PaymentServiceException
	 */
	void commitWhenSuccess(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult);

}

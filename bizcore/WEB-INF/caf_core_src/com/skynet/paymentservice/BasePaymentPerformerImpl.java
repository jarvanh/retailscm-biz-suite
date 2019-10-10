package com.skynet.paymentservice;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.skynet.paymentservice.terms.BasicHistoryCheckResult;
import com.skynet.paymentservice.terms.BasicResultCompareResult;
import com.skynet.paymentservice.terms.HistoryCheckResult;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.skynet.paymentservice.terms.PaymentItemHistory;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.skynet.paymentservice.terms.ActionResultCompareResult;
import com.terapico.uccaf.BaseUserContext;

public abstract class BasePaymentPerformerImpl implements PaymentPerformer{
	protected String paymentMethodCode;
	@Override
	public String getPaymentMethodCode() {
		return paymentMethodCode;
	}
	public void setPaymentMethodCode(String paymentMethodCode) {
		this.paymentMethodCode = paymentMethodCode;
	}

	@Override
	public boolean isFullyControlled() {
		return false;
	}

	protected ObjectMapper getObjectMapper() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
		return mapper;
	}
	protected void log(PaymentServiceContext ctx, String message) {
		Object uctx = ctx.getOriginalContext();
		if (uctx instanceof BaseUserContext) {
			((BaseUserContext) uctx).log(message);
			return;
		}
		System.out.println(message);
	}
	
	@Override
	public PaymentActionResult getActionResultFromHistory(PaymentServiceContext ctx,
			PaymentItemHistory lastPaymentItemHistory) {
		// 假设每次加载都可以直接把结果加载进来
		return lastPaymentItemHistory.getResult();
	}
	
	protected ActionResultCompareResult newCompareResultInstance() {
		return new BasicResultCompareResult();
	}
	
	protected HistoryCheckResult newCheckResultInstance() {
		return new BasicHistoryCheckResult();
	}
	
	@Override
	public void commitWhenFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory, PaymentActionResult historyResult)
			throws PaymentServiceException {
		String message = String.format("%s(%s)支付失败了.", paymentItem.getPaymentOptionName(), paymentItem.getPaymentOptionCode());
		log(ctx, message);
	}
//	@Override
//	public PaymentItemHistoryCheckResult checkHistoryResult(PaymentServiceContext ctx,
//			PaymentItemHistory lastPaymentItemHistory) throws PaymentServiceException {
//		throw new UnsupportedOperationException(String.format("%s尚未实现%s()方法", this.getClass().getName(), "checkHistoryResult"));
//
//	}
//	@Override
//	public PaymentActionResult redoPaymentAction(PaymentServiceContext ctx, OrderData order,
//			PaymentInfomation historyPayment, PaymentItemData item) throws PaymentServiceException {
//		throw new UnsupportedOperationException(String.format("%s尚未实现%s()方法", this.getClass().getName(), "redoPaymentAction"));
//
//	}
//	@Override
//	public boolean closePaymentAsFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation historyPayment,
//			PaymentItemData item) throws PaymentServiceException {
//		throw new UnsupportedOperationException(String.format("%s尚未实现%s()方法", this.getClass().getName(), "closePaymentAsFailed"));
//	}
//	@Override
//	public PaymentActionResult requireToPay(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
//			PaymentItemData paymentItem) {
//		throw new UnsupportedOperationException(String.format("%s尚未实现%s()方法", this.getClass().getName(), "requireToPay"));
//	}
	
	
}

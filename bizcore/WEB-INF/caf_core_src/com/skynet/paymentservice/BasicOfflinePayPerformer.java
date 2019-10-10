package com.skynet.paymentservice;

import com.skynet.paymentservice.terms.HistoryCheckResult;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentHistory;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.skynet.paymentservice.terms.PaymentItemHistory;
import com.skynet.paymentservice.terms.PaymentServiceContext;
import com.skynet.paymentservice.terms.ActionResultCompareResult;

public class BasicOfflinePayPerformer  extends BasePaymentPerformerImpl{

	@Override
	public HistoryCheckResult checkHistoryResult(PaymentServiceContext ctx,
			PaymentItemHistory lastPaymentItemHistory) throws PaymentServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentActionResult redoPaymentAction(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation historyPayment, PaymentItemData item, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) throws PaymentServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean closePaymentAsFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation historyPayment,
			PaymentItemData item, PaymentItemHistory lastPaymentItemHistory, PaymentActionResult lastTimeActionResult)
			throws PaymentServiceException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PaymentActionResult requireToPay(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem) throws PaymentServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PaymentActionResult queryPaymentStatusByHistoryRecord(PaymentServiceContext ctx,
			PaymentActionResult historyResult) throws PaymentServiceException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionResultCompareResult compareAndUpdatePaymentItemStatus(PaymentServiceContext ctx, OrderData order,
			PaymentInfomation payment, PaymentHistory historyPaymentRecord, PaymentActionResult historyResult,
			PaymentActionResult newResult) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void commitWhenSuccess(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentItemData paymentItem, PaymentItemHistory lastPaymentItemHistory,
			PaymentActionResult lastTimeActionResult) {
		// TODO Auto-generated method stub
		
	}

}

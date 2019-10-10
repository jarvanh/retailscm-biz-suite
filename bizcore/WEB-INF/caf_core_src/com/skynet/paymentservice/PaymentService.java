package com.skynet.paymentservice;

import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentServiceContext;

public interface PaymentService {
	// 用于异常中的代码
	public static final String CODE_SUCCKESS = "success";
	public static final String CODE_CHECKING_FAILED = "checking_failed";
	public static final String CODE_INPUT_ERROR = "input_error";
	public static final String CODE_DB_ERROR = "db_error";
	public static final String CODE_CONFIG_ERROR = "config_error";
	public static final String CODE_SYSTEM_ERROR = "system_error";
	public static final String CODE_PAYING = "paying";
	public static final String CODE_NOT_SUPPORT = "not_support";
	public static final String CODE_WECHAT = "wechat_pay";
	public static final String CODE_BALANCE = "balance_pay";
	
	// 用于response中的代码
	public static final String RESPONSE_SUCCESS = "SUCCESS";
	public static final String RESPONSE_FAILED = "FAILED";
	public static final String RESPONSE_NO_CHANGE = "NO_CHANGE";
	public static final String RESPONSE_WAITING = "WAITING";
	public static final String RESPONSE_REQUIRE_TO_PAY_FAILED = "REQUIRE_TO_PAY_FAILED";
	public static final String RESPONSE_RETRY_PAYING_FAILED = "RETRY_PAYING_FAILED";
	public static final String RESPONSE_MANUAL_HANDLING = "MANUAL_HANDLING";
	
	
	
	
	/**
	public static final String SURE_SUCCESS = "succeed";
	public static final String SURE_FAIL = "failed";
	public static final String WAITING = "waiting";
	public static final String MANUAL_HANDLING = "manual_handling";
	public static final String NO_CHANGE = "no_change";
	public static final String CONTINUEE = "continue";
	 */
	enum ResultCode {
		SURE_SUCCESS, SURE_FAIL, WAITING, MANUAL_HANDLING, NO_CHANGE, CONTINUE, NOT_START
	}

	/**
	 * 当有相关的事件发生, 需要检查支付状态的时候, 调用此接口. 例如 定时时间到, 前台宣称支付交互完成等.
	 * 
	 * @param context
	 * @param order
	 * @param payment
	 * @return
	 * @throws PaymentServiceException 
	 */
	PaymentRequestResponse handleCheckPaymentStatusEvent(PaymentServiceContext context, OrderData order,
			PaymentInfomation payment) throws PaymentServiceException;

	/**
	 * 开始支付时调用此接口. 包括了重新支付的场景.
	 * @param ctx
	 * @param order
	 * @param payment
	 * @return
	 * @throws PaymentServiceException
	 */
	PaymentRequestResponse handleRequireToPay(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment)
			throws PaymentServiceException;

	/**
	 * 根据支付选项, 获取合适的支付执行者
	 * @param ctx
	 * @param paymentOptionCode
	 * @return
	 * @throws PaymentServiceException
	 */
	PaymentPerformer getPaymentPerformer(PaymentServiceContext ctx, String paymentOptionCode)
			throws PaymentServiceException;

	/**
	 * 获得业务代理. 当进行和业务相关的操作时, 需要调用此方法.
	 * @return
	 */
	BusinessServiceProxy getBusinessServiceProxy();


}

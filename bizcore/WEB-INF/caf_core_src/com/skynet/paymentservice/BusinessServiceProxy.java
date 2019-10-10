package com.skynet.paymentservice;

import java.util.List;

import com.skynet.paymentservice.BasicPaymentPollingWorker.Task;
import com.skynet.paymentservice.terms.OrderData;
import com.skynet.paymentservice.terms.PaymentHistory;
import com.skynet.paymentservice.terms.PaymentInfomation;
import com.skynet.paymentservice.terms.PaymentServiceContext;

public interface BusinessServiceProxy {

	/**
	 * 校验订单是否有效.
	 * 
	 * 校验通过, 表示订单本身和支付选项没有问题, 验证了支付选项对应的账户中有足够的额度来完成支付.
	 * 如果有错误信息, 通过 ctx.getMessage() 取得.
	 * 
	 * 检查内容至少包括:<ol>
	 * <li>订单本身是有效的, 不违反业务规则, 不违反相关法律法规,没有禁止交易的物品</li>
	 * <li>支付本身是有效的, 包含有效的支付金额和必要的支付参数</li>
	 * <li>支付行为是有效的, 支付参数中给定的账号和身份信息具有合适的权限</li>
	 * </ol>
	 * @param ctx
	 * @param order 主订单
	 * @param payment 本次支付的详情
	 * @return 校验通过与否. 
	 */

	boolean checkMainOrderPayIsValid(PaymentServiceContext context, OrderData order, PaymentInfomation payment);

	/**
	 * 通知业务, 支付失败
	 * @param ctx
	 * @param order
	 * @param payment
	 * @param result
	 */
	void onPaymentFailed(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentRequestResponse result);

	/**
	 * 通知业务, 支付成功
	 * @param ctx
	 * @param order
	 * @param payment
	 * @param paymentRecord 
	 * @param result
	 */
	void onPaymentSuccess(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment,
			PaymentHistory paymentRecord, PaymentRequestResponse result);

	/**
	 * 从数据库里查询需要轮询的任务. 没有默认实现. 默认实现是在内存里
	 * @param paymentServiceContext
	 * @param i
	 * @param lastTask
	 * @return
	 */
	List<Task> getPaymentPollingTasks(PaymentServiceContext paymentServiceContext, int maxSize, Task lastTask);

	/**
	 * 定时轮询任务开始检查每笔支付是否有状态更新前的回调. 主要的作用是插入"source event"
	 * @param ctx
	 * @param order
	 * @param payment
	 */
	void beforeCheckPaymentStatus(PaymentServiceContext ctx, OrderData order, PaymentInfomation payment);
	/**
	 * 定时轮询任务开始检查支付是否有状态更新前的回调. 主要的作用是插入"source event"
	 * @param ctx
	 * @param order
	 * @param payment
	 */
	void beforeStartToCheckPaymentStatus(PaymentServiceContext paymentServiceContext);


}

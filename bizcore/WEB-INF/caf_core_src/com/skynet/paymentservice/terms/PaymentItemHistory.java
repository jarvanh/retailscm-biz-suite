package com.skynet.paymentservice.terms;

import java.math.BigDecimal;

import com.skynet.paymentservice.PaymentActionResult;

public class PaymentItemHistory {
	protected String id;	// 对应数据库里的记录ID, 不是支付的ID
	protected String paymentOptionCode;
	protected BigDecimal amount;
	protected PaymentActionResult result;	// 当时进行支付, 得到的结果
	protected String statusName;	// 该支付选项对应的状态机中定义的名称
	protected String statusCode;
	protected PaymentItemData data;
	
	public PaymentItemData getData() {
		return data;
	}
	public void setData(PaymentItemData data) {
		this.data = data;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPaymentOptionCode() {
		return paymentOptionCode;
	}
	public void setPaymentOptionCode(String paymentOptionCode) {
		this.paymentOptionCode = paymentOptionCode;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public PaymentActionResult getResult() {
		return result;
	}
	public void setResult(PaymentActionResult result) {
		this.result = result;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	
	
}

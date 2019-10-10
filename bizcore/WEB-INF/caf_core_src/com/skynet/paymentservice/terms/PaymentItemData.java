package com.skynet.paymentservice.terms;

import java.math.BigDecimal;

public class PaymentItemData {
	protected String paymentOptionCode;
	protected String paymentOptionName;
	protected BigDecimal amount;
	
	public String getPaymentOptionCode() {
		return paymentOptionCode;
	}
	public void setPaymentOptionCode(String paymentOptionCode) {
		this.paymentOptionCode = paymentOptionCode;
	}
	public String getPaymentOptionName() {
		return paymentOptionName;
	}
	public void setPaymentOptionName(String paymentOptionName) {
		this.paymentOptionName = paymentOptionName;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
	
}

package com.skynet.paymentservice.terms;

public class BalancePaymentItemData extends PaymentItemData {
	protected String payFromAccountId;
	protected String freezeIntoAccountId;
	protected String userInfoId;
	
	public String getPayFromAccountId() {
		return payFromAccountId;
	}
	public void setPayFromAccountId(String payFromAccountId) {
		this.payFromAccountId = payFromAccountId;
	}
	public String getFreezeIntoAccountId() {
		return freezeIntoAccountId;
	}
	public void setFreezeIntoAccountId(String freezeIntoAccountId) {
		this.freezeIntoAccountId = freezeIntoAccountId;
	}
	public String getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(String userInfoId) {
		this.userInfoId = userInfoId;
	}
	
	
}

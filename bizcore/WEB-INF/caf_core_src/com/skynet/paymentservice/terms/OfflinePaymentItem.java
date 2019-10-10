package com.skynet.paymentservice.terms;

public class OfflinePaymentItem extends PaymentItemData {
	protected String payFromAccountId;
	protected String userInfoId;
	
	public String getPayFromAccountId() {
		return payFromAccountId;
	}
	public void setPayFromAccountId(String payFromAccountId) {
		this.payFromAccountId = payFromAccountId;
	}
	public String getUserInfoId() {
		return userInfoId;
	}
	public void setUserInfoId(String userInfoId) {
		this.userInfoId = userInfoId;
	}
	
	
}

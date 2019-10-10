package com.skynet.paymentservice.terms;

public class WechatPaymentItem extends PaymentItemData {
	protected String openId;
	protected String remoteIP;

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getRemoteIP() {
		return remoteIP;
	}

	public void setRemoteIP(String remoteIP) {
		this.remoteIP = remoteIP;
	}
	
}

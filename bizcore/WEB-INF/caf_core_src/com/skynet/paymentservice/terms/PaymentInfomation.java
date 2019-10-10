package com.skynet.paymentservice.terms;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class PaymentInfomation {
	protected String title;
	protected String id;
	protected BigDecimal amount;
	protected String summary;
	
	protected List<PaymentItemData> paymentItemList;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public List<PaymentItemData> getPaymentItemList() {
		return paymentItemList;
	}
	public void setPaymentItemList(List<PaymentItemData> paymentItemList) {
		this.paymentItemList = paymentItemList;
	}
	public void addPaymentItemData(PaymentItemData svcItem) {
		ensureItemList();
		paymentItemList.add(svcItem);
	}
	protected void ensureItemList() {
		if (paymentItemList != null) {
			return;
		}
		paymentItemList = new ArrayList<>();
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	
}

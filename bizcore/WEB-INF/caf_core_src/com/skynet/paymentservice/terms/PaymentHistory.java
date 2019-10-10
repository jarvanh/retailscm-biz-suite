package com.skynet.paymentservice.terms;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


public class PaymentHistory {
	protected String recordId;
	protected String paymentDetailId;
	protected String paymentTitle;
	protected BigDecimal amount;
	protected String summary;
	protected List<PaymentItemHistory> itemRecordList;
	public String getPaymentDetailId() {
		return paymentDetailId;
	}
	public void setPaymentDetailId(String paymentDetailId) {
		this.paymentDetailId = paymentDetailId;
	}
	public String getPaymentTitle() {
		return paymentTitle;
	}
	public void setPaymentTitle(String paymentTitle) {
		this.paymentTitle = paymentTitle;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public List<PaymentItemHistory> getItemRecordList() {
		return itemRecordList;
	}
	public void setItemRecordList(List<PaymentItemHistory> itemRecordList) {
		this.itemRecordList = itemRecordList;
	}
	public String getRecordId() {
		return recordId;
	}
	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	public void addItemHistory(PaymentItemHistory itemHistory) {
		ensureItemRecordList();
		itemRecordList.add(itemHistory);
	}
	private void ensureItemRecordList() {
		if (itemRecordList != null) {
			return;
		}
		itemRecordList = new ArrayList<>();
	}
	
	
}

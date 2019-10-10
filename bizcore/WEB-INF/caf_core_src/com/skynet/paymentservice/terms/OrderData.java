package com.skynet.paymentservice.terms;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


public class OrderData {
	protected String title;			// 是什么订单
	protected BigDecimal amount;	// 要多少钱
	protected String id;			// 怎么找到它. id 是 identifier, 常见的MO000001可以, /some/type/with/id_value 这样的URI 也可以
	protected List<OrderItemData> lineItemList;
	protected PaymentInfomation payment;
	protected Object additionalInfo;	// 附加信息. 优荣目前没用
	
	public Object getAdditionalInfo() {
		return additionalInfo;
	}
	public void setAdditionalInfo(Object additionalInfo) {
		this.additionalInfo = additionalInfo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<OrderItemData> getLineItemList() {
		return lineItemList;
	}
	public void setLineItemList(List<OrderItemData> lineItemList) {
		this.lineItemList = lineItemList;
	}
	public PaymentInfomation getPayment() {
		return payment;
	}
	public void setPayment(PaymentInfomation payment) {
		this.payment = payment;
	}
	public void addItem(OrderItemData orderItem) {
		ensureLineItemList();
		lineItemList.add(orderItem);
	}
	protected void ensureLineItemList() {
		if (lineItemList != null) {
			return;
		}
		lineItemList = new ArrayList<>();
	}
	
	
}

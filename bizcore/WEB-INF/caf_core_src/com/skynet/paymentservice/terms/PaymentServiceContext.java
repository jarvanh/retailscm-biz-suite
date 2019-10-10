package com.skynet.paymentservice.terms;

import java.util.Date;

public interface PaymentServiceContext {

	String getReasonMessage();

	void setReasonMessage(String string);

	Object getOriginalContext();

	boolean isProductEnvironment();
	
	Date now();
}

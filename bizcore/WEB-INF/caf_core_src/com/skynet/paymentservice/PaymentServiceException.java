package com.skynet.paymentservice;

public class PaymentServiceException extends Exception {
	
	private static final long serialVersionUID = -1L;
	protected String errorCode;
	

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public PaymentServiceException(String errorCode) {
		super();
		setErrorCode(errorCode);
	}

	public PaymentServiceException(String errorCode, String message, Throwable cause) {
		super(message, cause);
		setErrorCode(errorCode);
	}

	public PaymentServiceException(String errorCode, String message) {
		super(message);
		setErrorCode(errorCode);
	}

	public PaymentServiceException(String errorCode, Throwable cause) {
		super(cause);
		setErrorCode(errorCode);
	}
	

}

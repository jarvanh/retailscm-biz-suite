package com.skynet.paymentservice;

import java.util.HashMap;
import java.util.Map;

import com.skynet.paymentservice.PaymentService.ResultCode;
import com.skynet.paymentservice.terms.PaymentItemData;
import com.terapico.utils.MapUtil;
import com.terapico.utils.TextUtil;

public class PaymentRequestResponse {
	
	protected boolean success = true;
	/** 整个支付是否可以按照'成功'来对待了 */
	protected boolean canFinish = true;
	/** 本次请求是否正常完成的代码  SUCCESS 表示没意外 */
	protected String responseCode;
	protected String responseMessage;
	protected Map<String, PaymentActionResult> detailResponse;
	protected String paymentId;
	/**
	 * 处理的结果.
	 * <pre>
	 * 1. 确定成功
	 * 2. 确定失败
	 * 3. 需要等待
	 * 4. 需要人工处理
	 * 5. 什么也没有发生
	 * 6. 继续处理
	 * </pre>
	 */
	protected ResultCode resultCode;
	/**
	 * 处理的结果.
	 * <pre>
	 * 1. 确定成功
	 * 2. 确定失败
	 * 3. 需要等待
	 * 4. 需要人工处理
	 * 5. 什么也没有发生
	 * 6. 继续处理
	 * </pre>
	 */
	public ResultCode getResultCode() {
		return resultCode;
	}
	public void setResultCode(ResultCode resultCode) {
		this.resultCode = resultCode;
	}
	public String getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}
	/** 本次请求是否正常完成了, 没有什么幺蛾子 */
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	/** 本次请求是否正常完成的代码  SUCCESS 表示没意外 */
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
	public void appendResult(PaymentItemData item, PaymentActionResult result) {
		String key = item.getPaymentOptionCode();
		ensureDetailResponse();
		detailResponse.put(key, result);
		success = detailResponse.values().stream().allMatch(it->it.isSuccess());
		canFinish = detailResponse.values().stream().allMatch(it->it.isCanFinish());
		if (!TextUtil.isBlank(result.getMessage())) {
			if (TextUtil.isBlank(getResponseMessage())) {
				this.setResponseMessage(result.getPaymentMethodCode()+":"+result.getMessage());
			}else {
				this.setResponseMessage(this.getResponseMessage()+"\r\n" + result.getPaymentMethodCode()+":"+result.getMessage());
			}
		}
	}
	protected void ensureDetailResponse() {
		if (detailResponse == null) {
			detailResponse = new HashMap<>();
		}
	}
	public Map<String, PaymentActionResult> getDetailResponse() {
		return detailResponse;
	}
	public void setDetailResponse(Map<String, PaymentActionResult> detailResponse) {
		this.detailResponse = detailResponse;
	}
	/** 整个支付是否可以按照'成功'来对待了 */
	public boolean isCanFinish() {
		return canFinish;
	}

	public void setCanFinish(boolean canFinish) {
		this.canFinish = canFinish;
	}
	
	public Map<String, Object> toMap() {
		Map<String, Object> result = MapUtil.put("success", this.isSuccess())
				.put("responseCode", this.getResponseCode())
				.put("resultCode", this.getResultCode())
				.putIf(!TextUtil.isBlank(this.getResponseMessage()), "responseMessage", this.getResponseMessage())
				.into_map();
		if (getDetailResponse() == null || getDetailResponse().isEmpty()) {
			return result;
		}
		Map<String, Map<String, Object>> details = new HashMap<>();
		for (String optionCode: getDetailResponse().keySet()) {
			PaymentActionResult actionResult = getDetailResponse().get(optionCode);
			details.put(optionCode, actionResult.toMap());
		}
		result.put("details", details);
		return result;
	}
	
	
	
}

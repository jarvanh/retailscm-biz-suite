package com.skynet.paymentservice;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.terapico.utils.MapUtil;
import com.terapico.utils.TextUtil;

public class PaymentActionResult {
	/**
	 * 是否使用微信的标准名称 package
	 *  因为 package 是java关键字, 所以SDK中提供的支付信息里以"packageValue" 替代了微信支付接口文档中的 "package".
	 *  false 表示直接使用 SDK 中的字段名; true 则表示需要把packageValue转换成package
	 */
	protected static boolean USE_NAME_WECHAT_PACKAGE = false;
	
	/** 本次操作是否已服务器成功交互 不是支付是否成功了 */
	protected boolean success;
	/** 当前支付选项是否可以当场"已完成"处理了 */
	protected boolean canFinish;
	/** 支付选项对应的细节状态名称 */
	protected String status;
	protected String paymentMethodCode;
	/** 支付选项对应的细节状态码 */
	protected String code;
	protected BigDecimal amount;
	protected String message;
	protected Map<String, Object> detail;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getDetail() {
		return detail;
	}
	public void setDetail(Map<String, Object> detail) {
		this.detail = detail;
	}
	public String getPaymentMethodCode() {
		if (paymentMethodCode == null) {
			throw new RuntimeException("NULLLLLLLL");
		}
		return paymentMethodCode;
	}
	public void setPaymentMethodCode(String paymentMethodCode) {
		this.paymentMethodCode = paymentMethodCode;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public boolean isCanFinish() {
		return canFinish;
	}
	public void setCanFinish(boolean canFinish) {
		this.canFinish = canFinish;
	}
	public Map<String, Object> toMap() {
		Map<String, Object> result = MapUtil.put("success", this.isSuccess())
				.put("statusName", this.getStatus())
				.put("statusCode", this.getCode())
				.put("amount", amount)
				.putIf(!TextUtil.isBlank(getMessage()), "message", getMessage())
				.into_map();
		if (detail != null) {
			if (USE_NAME_WECHAT_PACKAGE) {
				String packageValue = (String) MapUtil.getByPath(detail, "payInfo.packageValue");
				if (packageValue != null) {
					@SuppressWarnings("unchecked")
					Map<String, Object> map1 = (Map<String, Object>) detail.get("payInfo");
					map1.remove("packageValue");
					map1.put("package", packageValue);
				}
			}
			result.putAll(detail);
		}
		return result;
	}
	
	public void initWith(PaymentActionResult another) {
		if (another == null) {
			return;
		}
		this.setAmount(another.getAmount());
		this.setCode(another.getCode());
		if (another.getDetail() != null) {
			this.setDetail(new HashMap<>(another.getDetail()));
		}
		// this.setPaymentMethodCode(another.getPaymentMethodCode());
		this.setStatus(another.getStatus());
	}
	
	
}

package com.skynet.paymentservice.terms;

public interface HistoryCheckResult {
	// 检查结果显示, 上次的支付内容仍然有效
	boolean isStillValid();
	// 检查结果显示, 上次的支付结果已经失效, 需要重新进行支付交互
	boolean isShouldRedo();
	// 检查结果显示, 上次的支付结果如果要继续使用,有无法自动处理的矛盾, 需要人工参与,协商解决
	boolean isNeedManualHanding();
	// 暂时无法获取检查结果,需要再等一等
	boolean isNotSure();
	// 检查结果显示, 上次的支付可能可以关闭. 但是不保证可以关闭
	boolean isMayCancell();
	// 检查结果显示, 上次的支付已经成功
	boolean isFinishedSuccess();
	
	void setNotSure(boolean notSure);
	void setCanClose(boolean canClose);
	void setNeedManualHanding(boolean needManualHanding);
	void setShouldRedo(boolean shouldRedo);
	void setStillValid(boolean stillValid);
	void setFinishedSuccess(boolean finishedSuccess);
	void setFinishedFailed(boolean finishedFailed);

}

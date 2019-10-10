package com.skynet.paymentservice.terms;

public class BasicHistoryCheckResult implements HistoryCheckResult {
	protected boolean stillValid = false;
	protected boolean shouldRedo = false;
	protected boolean needManualHanding = false;
	protected boolean canClose = false;
	protected boolean notSure = false;
	protected boolean finishedSuccess = false;
	protected boolean finishedFailed = false;
	
	public boolean isFinishedFailed() {
		return finishedFailed;
	}
	@Override
	public void setFinishedFailed(boolean finishedFailed) {
		this.finishedFailed = finishedFailed;
	}
	public boolean isFinishedSuccess() {
		return finishedSuccess;
	}
	@Override
	public void setFinishedSuccess(boolean finishedSuccess) {
		this.finishedSuccess = finishedSuccess;
	}
	public boolean isStillValid() {
		return stillValid;
	}
	@Override
	public void setStillValid(boolean stillValid) {
		this.stillValid = stillValid;
	}
	public boolean isShouldRedo() {
		return shouldRedo;
	}
	@Override
	public void setShouldRedo(boolean shouldRedo) {
		this.shouldRedo = shouldRedo;
	}
	public boolean isNeedManualHanding() {
		return needManualHanding;
	}
	@Override
	public void setNeedManualHanding(boolean needManualHanding) {
		this.needManualHanding = needManualHanding;
	}
	public boolean isMayCancell() {
		return canClose;
	}
	@Override
	public void setCanClose(boolean canClose) {
		this.canClose = canClose;
	}
	public boolean isNotSure() {
		return notSure;
	}
	@Override
	public void setNotSure(boolean notSure) {
		this.notSure = notSure;
	}
	

}

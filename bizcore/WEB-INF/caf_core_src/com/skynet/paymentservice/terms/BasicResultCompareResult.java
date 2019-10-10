package com.skynet.paymentservice.terms;

public class BasicResultCompareResult implements ActionResultCompareResult {
	protected boolean changed = false;
	protected boolean needManualHanding = false;
	protected boolean treatAsSuccess = false;
	protected boolean treatAsFail = false;
	protected boolean needWait = false;
	protected boolean needContinue = false;
	@Override
	public boolean isChanged() {
		return changed;
	}
	@Override
	public void setChanged(boolean changed) {
		this.changed = changed;
	}
	@Override
	public boolean isNeedManualHanding() {
		return needManualHanding;
	}
	@Override
	public void setNeedManualHanding(boolean needManualHanding) {
		this.needManualHanding = needManualHanding;
	}
	@Override
	public boolean isTreatAsSuccess() {
		return treatAsSuccess;
	}
	@Override
	public void setTreatAsSuccess(boolean treatAsSuccess) {
		this.treatAsSuccess = treatAsSuccess;
	}
	@Override
	public boolean isTreatAsFail() {
		return treatAsFail;
	}
	@Override
	public void setTreatAsFail(boolean treatAsFail) {
		this.treatAsFail = treatAsFail;
	}
	@Override
	public boolean isNeedWait() {
		return needWait;
	}
	@Override
	public void setNeedWait(boolean needWait) {
		this.needWait = needWait;
	}
	@Override
	public boolean isNeedContinue() {
		return needContinue;
	}
	@Override
	public void setNeedContinue(boolean needContinue) {
		this.needContinue = needContinue;
	}
	
	
}

package com.skynet.paymentservice.terms;

/**
 * 两次支付交互结果的比较.
 * @author clariones
 *
 */
public interface ActionResultCompareResult {

	void setNeedWait(boolean needWait);

	boolean isNeedWait();

	void setTreatAsFail(boolean treatAsFail);

	boolean isTreatAsFail();

	void setTreatAsSuccess(boolean treatAsSuccess);

	boolean isTreatAsSuccess();

	void setNeedManualHanding(boolean needManualHanding);

	boolean isNeedManualHanding();

	void setChanged(boolean changed);

	boolean isChanged();

	void setNeedContinue(boolean needContinue);

	boolean isNeedContinue();

}

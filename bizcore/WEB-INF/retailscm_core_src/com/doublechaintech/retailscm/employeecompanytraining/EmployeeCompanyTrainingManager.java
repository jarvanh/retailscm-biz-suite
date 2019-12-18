
package com.doublechaintech.retailscm.employeecompanytraining;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import com.terapico.caf.DateTime;
import com.doublechaintech.retailscm.RetailscmUserContext;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.BaseManager;
import com.doublechaintech.retailscm.SmartList;

public interface EmployeeCompanyTrainingManager extends BaseManager{

		

	public EmployeeCompanyTraining createEmployeeCompanyTraining(RetailscmUserContext userContext, String employeeId,String trainingId,String scoringId) throws Exception;	
	public EmployeeCompanyTraining updateEmployeeCompanyTraining(RetailscmUserContext userContext,String employeeCompanyTrainingId, int employeeCompanyTrainingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception;
	public EmployeeCompanyTraining loadEmployeeCompanyTraining(RetailscmUserContext userContext, String employeeCompanyTrainingId, String [] tokensExpr) throws Exception;
	public EmployeeCompanyTraining internalSaveEmployeeCompanyTraining(RetailscmUserContext userContext, EmployeeCompanyTraining employeeCompanyTraining) throws Exception;
	public EmployeeCompanyTraining internalSaveEmployeeCompanyTraining(RetailscmUserContext userContext, EmployeeCompanyTraining employeeCompanyTraining,Map<String,Object>option) throws Exception;
	
	public EmployeeCompanyTraining transferToAnotherEmployee(RetailscmUserContext userContext, String employeeCompanyTrainingId, String anotherEmployeeId)  throws Exception;
 	public EmployeeCompanyTraining transferToAnotherTraining(RetailscmUserContext userContext, String employeeCompanyTrainingId, String anotherTrainingId)  throws Exception;
 	public EmployeeCompanyTraining transferToAnotherScoring(RetailscmUserContext userContext, String employeeCompanyTrainingId, String anotherScoringId)  throws Exception;
 

	public void delete(RetailscmUserContext userContext, String employeeCompanyTrainingId, int version) throws Exception;
	public int deleteAll(RetailscmUserContext userContext, String secureCode ) throws Exception;
	public void onNewInstanceCreated(RetailscmUserContext userContext, EmployeeCompanyTraining newCreated)throws Exception;

	/*======================================================DATA MAINTENANCE===========================================================*/
	



}



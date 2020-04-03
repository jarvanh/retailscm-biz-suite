
package com.doublechaintech.retailscm.employeesalarysheet;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.employee.Employee;
import com.doublechaintech.retailscm.payingoff.PayingOff;
import com.doublechaintech.retailscm.salarygrade.SalaryGrade;

import com.doublechaintech.retailscm.employee.CandidateEmployee;
import com.doublechaintech.retailscm.payingoff.CandidatePayingOff;
import com.doublechaintech.retailscm.salarygrade.CandidateSalaryGrade;







public class EmployeeSalarySheetManagerImpl extends CustomRetailscmCheckerManager implements EmployeeSalarySheetManager {

  


	private static final String SERVICE_TYPE = "EmployeeSalarySheet";
	@Override
	public EmployeeSalarySheetDAO daoOf(RetailscmUserContext userContext) {
		return employeeSalarySheetDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws EmployeeSalarySheetManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new EmployeeSalarySheetManagerException(message);

	}



 	protected EmployeeSalarySheet saveEmployeeSalarySheet(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, String [] tokensExpr) throws Exception{	
 		//return getEmployeeSalarySheetDAO().save(employeeSalarySheet, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveEmployeeSalarySheet(userContext, employeeSalarySheet, tokens);
 	}
 	
 	protected EmployeeSalarySheet saveEmployeeSalarySheetDetail(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet) throws Exception{	

 		
 		return saveEmployeeSalarySheet(userContext, employeeSalarySheet, allTokens());
 	}
 	
 	public EmployeeSalarySheet loadEmployeeSalarySheet(RetailscmUserContext userContext, String employeeSalarySheetId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeSalarySheetManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet( userContext, employeeSalarySheetId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeSalarySheet, tokens);
 	}
 	
 	
 	 public EmployeeSalarySheet searchEmployeeSalarySheet(RetailscmUserContext userContext, String employeeSalarySheetId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeSalarySheetManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet( userContext, employeeSalarySheetId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeSalarySheet, tokens);
 	}
 	
 	

 	protected EmployeeSalarySheet present(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,employeeSalarySheet,tokens);
		
		
		EmployeeSalarySheet  employeeSalarySheetToPresent = employeeSalarySheetDaoOf(userContext).present(employeeSalarySheet, tokens);
		
		List<BaseEntity> entityListToNaming = employeeSalarySheetToPresent.collectRefercencesFromLists();
		employeeSalarySheetDaoOf(userContext).alias(entityListToNaming);
		
		return  employeeSalarySheetToPresent;
		
		
	}
 
 	
 	
 	public EmployeeSalarySheet loadEmployeeSalarySheetDetail(RetailscmUserContext userContext, String employeeSalarySheetId) throws Exception{	
 		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet( userContext, employeeSalarySheetId, allTokens());
 		return present(userContext,employeeSalarySheet, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String employeeSalarySheetId) throws Exception{	
 		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet( userContext, employeeSalarySheetId, viewTokens());
 		return present(userContext,employeeSalarySheet, allTokens());
		
 	}
 	protected EmployeeSalarySheet saveEmployeeSalarySheet(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, Map<String,Object>tokens) throws Exception{	
 		return employeeSalarySheetDaoOf(userContext).save(employeeSalarySheet, tokens);
 	}
 	protected EmployeeSalarySheet loadEmployeeSalarySheet(RetailscmUserContext userContext, String employeeSalarySheetId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeSalarySheetManagerException.class);

 
 		return employeeSalarySheetDaoOf(userContext).load(employeeSalarySheetId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, Map<String, Object> tokens){
		super.addActions(userContext, employeeSalarySheet, tokens);
		
		addAction(userContext, employeeSalarySheet, tokens,"@create","createEmployeeSalarySheet","createEmployeeSalarySheet/","main","primary");
		addAction(userContext, employeeSalarySheet, tokens,"@update","updateEmployeeSalarySheet","updateEmployeeSalarySheet/"+employeeSalarySheet.getId()+"/","main","primary");
		addAction(userContext, employeeSalarySheet, tokens,"@copy","cloneEmployeeSalarySheet","cloneEmployeeSalarySheet/"+employeeSalarySheet.getId()+"/","main","primary");
		
		addAction(userContext, employeeSalarySheet, tokens,"employee_salary_sheet.transfer_to_employee","transferToAnotherEmployee","transferToAnotherEmployee/"+employeeSalarySheet.getId()+"/","main","primary");
		addAction(userContext, employeeSalarySheet, tokens,"employee_salary_sheet.transfer_to_current_salary_grade","transferToAnotherCurrentSalaryGrade","transferToAnotherCurrentSalaryGrade/"+employeeSalarySheet.getId()+"/","main","primary");
		addAction(userContext, employeeSalarySheet, tokens,"employee_salary_sheet.transfer_to_paying_off","transferToAnotherPayingOff","transferToAnotherPayingOff/"+employeeSalarySheet.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public EmployeeSalarySheet createEmployeeSalarySheet(RetailscmUserContext userContext, String employeeId,String currentSalaryGradeId,BigDecimal baseSalary,BigDecimal bonus,BigDecimal reward,BigDecimal personalTax,BigDecimal socialSecurity,BigDecimal housingFound,BigDecimal jobInsurance,String payingOffId) throws Exception
	//public EmployeeSalarySheet createEmployeeSalarySheet(RetailscmUserContext userContext,String employeeId, String currentSalaryGradeId, BigDecimal baseSalary, BigDecimal bonus, BigDecimal reward, BigDecimal personalTax, BigDecimal socialSecurity, BigDecimal housingFound, BigDecimal jobInsurance, String payingOffId) throws Exception
	{

		

		

		checkerOf(userContext).checkBaseSalaryOfEmployeeSalarySheet(baseSalary);
		checkerOf(userContext).checkBonusOfEmployeeSalarySheet(bonus);
		checkerOf(userContext).checkRewardOfEmployeeSalarySheet(reward);
		checkerOf(userContext).checkPersonalTaxOfEmployeeSalarySheet(personalTax);
		checkerOf(userContext).checkSocialSecurityOfEmployeeSalarySheet(socialSecurity);
		checkerOf(userContext).checkHousingFoundOfEmployeeSalarySheet(housingFound);
		checkerOf(userContext).checkJobInsuranceOfEmployeeSalarySheet(jobInsurance);
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeSalarySheetManagerException.class);


		EmployeeSalarySheet employeeSalarySheet=createNewEmployeeSalarySheet();	

			
		Employee employee = loadEmployee(userContext, employeeId,emptyOptions());
		employeeSalarySheet.setEmployee(employee);
		
		
			
		SalaryGrade currentSalaryGrade = loadSalaryGrade(userContext, currentSalaryGradeId,emptyOptions());
		employeeSalarySheet.setCurrentSalaryGrade(currentSalaryGrade);
		
		
		employeeSalarySheet.setBaseSalary(baseSalary);
		employeeSalarySheet.setBonus(bonus);
		employeeSalarySheet.setReward(reward);
		employeeSalarySheet.setPersonalTax(personalTax);
		employeeSalarySheet.setSocialSecurity(socialSecurity);
		employeeSalarySheet.setHousingFound(housingFound);
		employeeSalarySheet.setJobInsurance(jobInsurance);
			
		PayingOff payingOff = loadPayingOff(userContext, payingOffId,emptyOptions());
		employeeSalarySheet.setPayingOff(payingOff);
		
		

		employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, emptyOptions());
		
		onNewInstanceCreated(userContext, employeeSalarySheet);
		return employeeSalarySheet;


	}
	protected EmployeeSalarySheet createNewEmployeeSalarySheet()
	{

		return new EmployeeSalarySheet();
	}

	protected void checkParamsForUpdatingEmployeeSalarySheet(RetailscmUserContext userContext,String employeeSalarySheetId, int employeeSalarySheetVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
		checkerOf(userContext).checkVersionOfEmployeeSalarySheet( employeeSalarySheetVersion);
		
		

				

		
		if(EmployeeSalarySheet.BASE_SALARY_PROPERTY.equals(property)){
			checkerOf(userContext).checkBaseSalaryOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.BONUS_PROPERTY.equals(property)){
			checkerOf(userContext).checkBonusOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.REWARD_PROPERTY.equals(property)){
			checkerOf(userContext).checkRewardOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.PERSONAL_TAX_PROPERTY.equals(property)){
			checkerOf(userContext).checkPersonalTaxOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.SOCIAL_SECURITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkSocialSecurityOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.HOUSING_FOUND_PROPERTY.equals(property)){
			checkerOf(userContext).checkHousingFoundOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}
		if(EmployeeSalarySheet.JOB_INSURANCE_PROPERTY.equals(property)){
			checkerOf(userContext).checkJobInsuranceOfEmployeeSalarySheet(parseBigDecimal(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeSalarySheetManagerException.class);


	}



	public EmployeeSalarySheet clone(RetailscmUserContext userContext, String fromEmployeeSalarySheetId) throws Exception{

		return employeeSalarySheetDaoOf(userContext).clone(fromEmployeeSalarySheetId, this.allTokens());
	}

	public EmployeeSalarySheet internalSaveEmployeeSalarySheet(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet) throws Exception
	{
		return internalSaveEmployeeSalarySheet(userContext, employeeSalarySheet, allTokens());

	}
	public EmployeeSalarySheet internalSaveEmployeeSalarySheet(RetailscmUserContext userContext, EmployeeSalarySheet employeeSalarySheet, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingEmployeeSalarySheet(userContext, employeeSalarySheetId, employeeSalarySheetVersion, property, newValueExpr, tokensExpr);


		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeSalarySheet.
			if (employeeSalarySheet.isChanged()){
			
			}
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, options);
			return employeeSalarySheet;

		}

	}

	public EmployeeSalarySheet updateEmployeeSalarySheet(RetailscmUserContext userContext,String employeeSalarySheetId, int employeeSalarySheetVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeSalarySheet(userContext, employeeSalarySheetId, employeeSalarySheetVersion, property, newValueExpr, tokensExpr);



		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet(userContext, employeeSalarySheetId, allTokens());
		if(employeeSalarySheet.getVersion() != employeeSalarySheetVersion){
			String message = "The target version("+employeeSalarySheet.getVersion()+") is not equals to version("+employeeSalarySheetVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeSalarySheet.
			
			employeeSalarySheet.changeProperty(property, newValueExpr);
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, tokens().done());
			return present(userContext,employeeSalarySheet, mergedAllTokens(tokensExpr));
			//return saveEmployeeSalarySheet(userContext, employeeSalarySheet, tokens().done());
		}

	}

	public EmployeeSalarySheet updateEmployeeSalarySheetProperty(RetailscmUserContext userContext,String employeeSalarySheetId, int employeeSalarySheetVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeSalarySheet(userContext, employeeSalarySheetId, employeeSalarySheetVersion, property, newValueExpr, tokensExpr);

		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet(userContext, employeeSalarySheetId, allTokens());
		if(employeeSalarySheet.getVersion() != employeeSalarySheetVersion){
			String message = "The target version("+employeeSalarySheet.getVersion()+") is not equals to version("+employeeSalarySheetVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeSalarySheet.

			employeeSalarySheet.changeProperty(property, newValueExpr);
			
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, tokens().done());
			return present(userContext,employeeSalarySheet, mergedAllTokens(tokensExpr));
			//return saveEmployeeSalarySheet(userContext, employeeSalarySheet, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected EmployeeSalarySheetTokens tokens(){
		return EmployeeSalarySheetTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return EmployeeSalarySheetTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return EmployeeSalarySheetTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherEmployee(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherEmployeeId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
 		checkerOf(userContext).checkIdOfEmployee(anotherEmployeeId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeSalarySheetManagerException.class);

 	}
 	public EmployeeSalarySheet transferToAnotherEmployee(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherEmployeeId) throws Exception
 	{
 		checkParamsForTransferingAnotherEmployee(userContext, employeeSalarySheetId,anotherEmployeeId);
 
		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet(userContext, employeeSalarySheetId, allTokens());	
		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Employee employee = loadEmployee(userContext, anotherEmployeeId, emptyOptions());		
			employeeSalarySheet.updateEmployee(employee);		
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, emptyOptions());
			
			return present(userContext,employeeSalarySheet, allTokens());
			
		}

 	}

	


	public CandidateEmployee requestCandidateEmployee(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateEmployee result = new CandidateEmployee();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("company");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<Employee> candidateList = employeeDaoOf(userContext).requestCandidateEmployeeForEmployeeSalarySheet(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherCurrentSalaryGrade(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherCurrentSalaryGradeId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
 		checkerOf(userContext).checkIdOfSalaryGrade(anotherCurrentSalaryGradeId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeSalarySheetManagerException.class);

 	}
 	public EmployeeSalarySheet transferToAnotherCurrentSalaryGrade(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherCurrentSalaryGradeId) throws Exception
 	{
 		checkParamsForTransferingAnotherCurrentSalaryGrade(userContext, employeeSalarySheetId,anotherCurrentSalaryGradeId);
 
		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet(userContext, employeeSalarySheetId, allTokens());	
		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			SalaryGrade currentSalaryGrade = loadSalaryGrade(userContext, anotherCurrentSalaryGradeId, emptyOptions());		
			employeeSalarySheet.updateCurrentSalaryGrade(currentSalaryGrade);		
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, emptyOptions());
			
			return present(userContext,employeeSalarySheet, allTokens());
			
		}

 	}

	


	public CandidateSalaryGrade requestCandidateCurrentSalaryGrade(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateSalaryGrade result = new CandidateSalaryGrade();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("code");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<SalaryGrade> candidateList = salaryGradeDaoOf(userContext).requestCandidateSalaryGradeForEmployeeSalarySheet(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherPayingOff(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherPayingOffId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEmployeeSalarySheet(employeeSalarySheetId);
 		checkerOf(userContext).checkIdOfPayingOff(anotherPayingOffId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeSalarySheetManagerException.class);

 	}
 	public EmployeeSalarySheet transferToAnotherPayingOff(RetailscmUserContext userContext, String employeeSalarySheetId, String anotherPayingOffId) throws Exception
 	{
 		checkParamsForTransferingAnotherPayingOff(userContext, employeeSalarySheetId,anotherPayingOffId);
 
		EmployeeSalarySheet employeeSalarySheet = loadEmployeeSalarySheet(userContext, employeeSalarySheetId, allTokens());	
		synchronized(employeeSalarySheet){
			//will be good when the employeeSalarySheet loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			PayingOff payingOff = loadPayingOff(userContext, anotherPayingOffId, emptyOptions());		
			employeeSalarySheet.updatePayingOff(payingOff);		
			employeeSalarySheet = saveEmployeeSalarySheet(userContext, employeeSalarySheet, emptyOptions());
			
			return present(userContext,employeeSalarySheet, allTokens());
			
		}

 	}

	


	public CandidatePayingOff requestCandidatePayingOff(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidatePayingOff result = new CandidatePayingOff();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("who");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<PayingOff> candidateList = payingOffDaoOf(userContext).requestCandidatePayingOffForEmployeeSalarySheet(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected Employee loadEmployee(RetailscmUserContext userContext, String newEmployeeId, Map<String,Object> options) throws Exception
 	{

 		return employeeDaoOf(userContext).load(newEmployeeId, options);
 	}
 	


	

 	protected SalaryGrade loadSalaryGrade(RetailscmUserContext userContext, String newCurrentSalaryGradeId, Map<String,Object> options) throws Exception
 	{

 		return salaryGradeDaoOf(userContext).load(newCurrentSalaryGradeId, options);
 	}
 	


	

 	protected PayingOff loadPayingOff(RetailscmUserContext userContext, String newPayingOffId, Map<String,Object> options) throws Exception
 	{

 		return payingOffDaoOf(userContext).load(newPayingOffId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String employeeSalarySheetId, int employeeSalarySheetVersion) throws Exception {
		//deleteInternal(userContext, employeeSalarySheetId, employeeSalarySheetVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String employeeSalarySheetId, int employeeSalarySheetVersion) throws Exception{

		employeeSalarySheetDaoOf(userContext).delete(employeeSalarySheetId, employeeSalarySheetVersion);
	}

	public EmployeeSalarySheet forgetByAll(RetailscmUserContext userContext, String employeeSalarySheetId, int employeeSalarySheetVersion) throws Exception {
		return forgetByAllInternal(userContext, employeeSalarySheetId, employeeSalarySheetVersion);
	}
	protected EmployeeSalarySheet forgetByAllInternal(RetailscmUserContext userContext,
			String employeeSalarySheetId, int employeeSalarySheetVersion) throws Exception{

		return employeeSalarySheetDaoOf(userContext).disconnectFromAll(employeeSalarySheetId, employeeSalarySheetVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new EmployeeSalarySheetManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return employeeSalarySheetDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, EmployeeSalarySheet newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}




package com.doublechaintech.retailscm.employeeworkexperience;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.employee.Employee;

import com.doublechaintech.retailscm.employee.CandidateEmployee;







public class EmployeeWorkExperienceManagerImpl extends CustomRetailscmCheckerManager implements EmployeeWorkExperienceManager {

  


	private static final String SERVICE_TYPE = "EmployeeWorkExperience";
	@Override
	public EmployeeWorkExperienceDAO daoOf(RetailscmUserContext userContext) {
		return employeeWorkExperienceDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws EmployeeWorkExperienceManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new EmployeeWorkExperienceManagerException(message);

	}



 	protected EmployeeWorkExperience saveEmployeeWorkExperience(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, String [] tokensExpr) throws Exception{	
 		//return getEmployeeWorkExperienceDAO().save(employeeWorkExperience, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveEmployeeWorkExperience(userContext, employeeWorkExperience, tokens);
 	}
 	
 	protected EmployeeWorkExperience saveEmployeeWorkExperienceDetail(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience) throws Exception{	

 		
 		return saveEmployeeWorkExperience(userContext, employeeWorkExperience, allTokens());
 	}
 	
 	public EmployeeWorkExperience loadEmployeeWorkExperience(RetailscmUserContext userContext, String employeeWorkExperienceId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeWorkExperience(employeeWorkExperienceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeWorkExperienceManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience( userContext, employeeWorkExperienceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeWorkExperience, tokens);
 	}
 	
 	
 	 public EmployeeWorkExperience searchEmployeeWorkExperience(RetailscmUserContext userContext, String employeeWorkExperienceId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeWorkExperience(employeeWorkExperienceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeWorkExperienceManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience( userContext, employeeWorkExperienceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeWorkExperience, tokens);
 	}
 	
 	

 	protected EmployeeWorkExperience present(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,employeeWorkExperience,tokens);
		
		
		EmployeeWorkExperience  employeeWorkExperienceToPresent = employeeWorkExperienceDaoOf(userContext).present(employeeWorkExperience, tokens);
		
		List<BaseEntity> entityListToNaming = employeeWorkExperienceToPresent.collectRefercencesFromLists();
		employeeWorkExperienceDaoOf(userContext).alias(entityListToNaming);
		
		return  employeeWorkExperienceToPresent;
		
		
	}
 
 	
 	
 	public EmployeeWorkExperience loadEmployeeWorkExperienceDetail(RetailscmUserContext userContext, String employeeWorkExperienceId) throws Exception{	
 		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience( userContext, employeeWorkExperienceId, allTokens());
 		return present(userContext,employeeWorkExperience, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String employeeWorkExperienceId) throws Exception{	
 		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience( userContext, employeeWorkExperienceId, viewTokens());
 		return present(userContext,employeeWorkExperience, allTokens());
		
 	}
 	protected EmployeeWorkExperience saveEmployeeWorkExperience(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, Map<String,Object>tokens) throws Exception{	
 		return employeeWorkExperienceDaoOf(userContext).save(employeeWorkExperience, tokens);
 	}
 	protected EmployeeWorkExperience loadEmployeeWorkExperience(RetailscmUserContext userContext, String employeeWorkExperienceId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfEmployeeWorkExperience(employeeWorkExperienceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeWorkExperienceManagerException.class);

 
 		return employeeWorkExperienceDaoOf(userContext).load(employeeWorkExperienceId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, Map<String, Object> tokens){
		super.addActions(userContext, employeeWorkExperience, tokens);
		
		addAction(userContext, employeeWorkExperience, tokens,"@create","createEmployeeWorkExperience","createEmployeeWorkExperience/","main","primary");
		addAction(userContext, employeeWorkExperience, tokens,"@update","updateEmployeeWorkExperience","updateEmployeeWorkExperience/"+employeeWorkExperience.getId()+"/","main","primary");
		addAction(userContext, employeeWorkExperience, tokens,"@copy","cloneEmployeeWorkExperience","cloneEmployeeWorkExperience/"+employeeWorkExperience.getId()+"/","main","primary");
		
		addAction(userContext, employeeWorkExperience, tokens,"employee_work_experience.transfer_to_employee","transferToAnotherEmployee","transferToAnotherEmployee/"+employeeWorkExperience.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public EmployeeWorkExperience createEmployeeWorkExperience(RetailscmUserContext userContext, String employeeId,Date start,Date end,String company,String description) throws Exception
	//public EmployeeWorkExperience createEmployeeWorkExperience(RetailscmUserContext userContext,String employeeId, Date start, Date end, String company, String description) throws Exception
	{

		

		

		checkerOf(userContext).checkStartOfEmployeeWorkExperience(start);
		checkerOf(userContext).checkEndOfEmployeeWorkExperience(end);
		checkerOf(userContext).checkCompanyOfEmployeeWorkExperience(company);
		checkerOf(userContext).checkDescriptionOfEmployeeWorkExperience(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeWorkExperienceManagerException.class);


		EmployeeWorkExperience employeeWorkExperience=createNewEmployeeWorkExperience();	

			
		Employee employee = loadEmployee(userContext, employeeId,emptyOptions());
		employeeWorkExperience.setEmployee(employee);
		
		
		employeeWorkExperience.setStart(start);
		employeeWorkExperience.setEnd(end);
		employeeWorkExperience.setCompany(company);
		employeeWorkExperience.setDescription(description);

		employeeWorkExperience = saveEmployeeWorkExperience(userContext, employeeWorkExperience, emptyOptions());
		
		onNewInstanceCreated(userContext, employeeWorkExperience);
		return employeeWorkExperience;


	}
	protected EmployeeWorkExperience createNewEmployeeWorkExperience()
	{

		return new EmployeeWorkExperience();
	}

	protected void checkParamsForUpdatingEmployeeWorkExperience(RetailscmUserContext userContext,String employeeWorkExperienceId, int employeeWorkExperienceVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfEmployeeWorkExperience(employeeWorkExperienceId);
		checkerOf(userContext).checkVersionOfEmployeeWorkExperience( employeeWorkExperienceVersion);
		
		

		
		if(EmployeeWorkExperience.START_PROPERTY.equals(property)){
			checkerOf(userContext).checkStartOfEmployeeWorkExperience(parseDate(newValueExpr));
		}
		if(EmployeeWorkExperience.END_PROPERTY.equals(property)){
			checkerOf(userContext).checkEndOfEmployeeWorkExperience(parseDate(newValueExpr));
		}
		if(EmployeeWorkExperience.COMPANY_PROPERTY.equals(property)){
			checkerOf(userContext).checkCompanyOfEmployeeWorkExperience(parseString(newValueExpr));
		}
		if(EmployeeWorkExperience.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfEmployeeWorkExperience(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeWorkExperienceManagerException.class);


	}



	public EmployeeWorkExperience clone(RetailscmUserContext userContext, String fromEmployeeWorkExperienceId) throws Exception{

		return employeeWorkExperienceDaoOf(userContext).clone(fromEmployeeWorkExperienceId, this.allTokens());
	}

	public EmployeeWorkExperience internalSaveEmployeeWorkExperience(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience) throws Exception
	{
		return internalSaveEmployeeWorkExperience(userContext, employeeWorkExperience, allTokens());

	}
	public EmployeeWorkExperience internalSaveEmployeeWorkExperience(RetailscmUserContext userContext, EmployeeWorkExperience employeeWorkExperience, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingEmployeeWorkExperience(userContext, employeeWorkExperienceId, employeeWorkExperienceVersion, property, newValueExpr, tokensExpr);


		synchronized(employeeWorkExperience){
			//will be good when the employeeWorkExperience loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeWorkExperience.
			if (employeeWorkExperience.isChanged()){
			
			}
			employeeWorkExperience = saveEmployeeWorkExperience(userContext, employeeWorkExperience, options);
			return employeeWorkExperience;

		}

	}

	public EmployeeWorkExperience updateEmployeeWorkExperience(RetailscmUserContext userContext,String employeeWorkExperienceId, int employeeWorkExperienceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeWorkExperience(userContext, employeeWorkExperienceId, employeeWorkExperienceVersion, property, newValueExpr, tokensExpr);



		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience(userContext, employeeWorkExperienceId, allTokens());
		if(employeeWorkExperience.getVersion() != employeeWorkExperienceVersion){
			String message = "The target version("+employeeWorkExperience.getVersion()+") is not equals to version("+employeeWorkExperienceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeWorkExperience){
			//will be good when the employeeWorkExperience loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeWorkExperience.
			
			employeeWorkExperience.changeProperty(property, newValueExpr);
			employeeWorkExperience = saveEmployeeWorkExperience(userContext, employeeWorkExperience, tokens().done());
			return present(userContext,employeeWorkExperience, mergedAllTokens(tokensExpr));
			//return saveEmployeeWorkExperience(userContext, employeeWorkExperience, tokens().done());
		}

	}

	public EmployeeWorkExperience updateEmployeeWorkExperienceProperty(RetailscmUserContext userContext,String employeeWorkExperienceId, int employeeWorkExperienceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeWorkExperience(userContext, employeeWorkExperienceId, employeeWorkExperienceVersion, property, newValueExpr, tokensExpr);

		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience(userContext, employeeWorkExperienceId, allTokens());
		if(employeeWorkExperience.getVersion() != employeeWorkExperienceVersion){
			String message = "The target version("+employeeWorkExperience.getVersion()+") is not equals to version("+employeeWorkExperienceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeWorkExperience){
			//will be good when the employeeWorkExperience loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeWorkExperience.

			employeeWorkExperience.changeProperty(property, newValueExpr);
			
			employeeWorkExperience = saveEmployeeWorkExperience(userContext, employeeWorkExperience, tokens().done());
			return present(userContext,employeeWorkExperience, mergedAllTokens(tokensExpr));
			//return saveEmployeeWorkExperience(userContext, employeeWorkExperience, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected EmployeeWorkExperienceTokens tokens(){
		return EmployeeWorkExperienceTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return EmployeeWorkExperienceTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return EmployeeWorkExperienceTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherEmployee(RetailscmUserContext userContext, String employeeWorkExperienceId, String anotherEmployeeId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEmployeeWorkExperience(employeeWorkExperienceId);
 		checkerOf(userContext).checkIdOfEmployee(anotherEmployeeId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeWorkExperienceManagerException.class);

 	}
 	public EmployeeWorkExperience transferToAnotherEmployee(RetailscmUserContext userContext, String employeeWorkExperienceId, String anotherEmployeeId) throws Exception
 	{
 		checkParamsForTransferingAnotherEmployee(userContext, employeeWorkExperienceId,anotherEmployeeId);
 
		EmployeeWorkExperience employeeWorkExperience = loadEmployeeWorkExperience(userContext, employeeWorkExperienceId, allTokens());	
		synchronized(employeeWorkExperience){
			//will be good when the employeeWorkExperience loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Employee employee = loadEmployee(userContext, anotherEmployeeId, emptyOptions());		
			employeeWorkExperience.updateEmployee(employee);		
			employeeWorkExperience = saveEmployeeWorkExperience(userContext, employeeWorkExperience, emptyOptions());
			
			return present(userContext,employeeWorkExperience, allTokens());
			
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
		SmartList<Employee> candidateList = employeeDaoOf(userContext).requestCandidateEmployeeForEmployeeWorkExperience(userContext,ownerClass, id, filterKey, pageNo, pageSize);
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
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String employeeWorkExperienceId, int employeeWorkExperienceVersion) throws Exception {
		//deleteInternal(userContext, employeeWorkExperienceId, employeeWorkExperienceVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String employeeWorkExperienceId, int employeeWorkExperienceVersion) throws Exception{

		employeeWorkExperienceDaoOf(userContext).delete(employeeWorkExperienceId, employeeWorkExperienceVersion);
	}

	public EmployeeWorkExperience forgetByAll(RetailscmUserContext userContext, String employeeWorkExperienceId, int employeeWorkExperienceVersion) throws Exception {
		return forgetByAllInternal(userContext, employeeWorkExperienceId, employeeWorkExperienceVersion);
	}
	protected EmployeeWorkExperience forgetByAllInternal(RetailscmUserContext userContext,
			String employeeWorkExperienceId, int employeeWorkExperienceVersion) throws Exception{

		return employeeWorkExperienceDaoOf(userContext).disconnectFromAll(employeeWorkExperienceId, employeeWorkExperienceVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new EmployeeWorkExperienceManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return employeeWorkExperienceDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, EmployeeWorkExperience newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}




package com.doublechaintech.retailscm.employeequalifier;

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







public class EmployeeQualifierManagerImpl extends CustomRetailscmCheckerManager implements EmployeeQualifierManager {

  


	private static final String SERVICE_TYPE = "EmployeeQualifier";
	@Override
	public EmployeeQualifierDAO daoOf(RetailscmUserContext userContext) {
		return employeeQualifierDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws EmployeeQualifierManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new EmployeeQualifierManagerException(message);

	}



 	protected EmployeeQualifier saveEmployeeQualifier(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, String [] tokensExpr) throws Exception{	
 		//return getEmployeeQualifierDAO().save(employeeQualifier, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveEmployeeQualifier(userContext, employeeQualifier, tokens);
 	}
 	
 	protected EmployeeQualifier saveEmployeeQualifierDetail(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier) throws Exception{	

 		
 		return saveEmployeeQualifier(userContext, employeeQualifier, allTokens());
 	}
 	
 	public EmployeeQualifier loadEmployeeQualifier(RetailscmUserContext userContext, String employeeQualifierId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeQualifier(employeeQualifierId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeQualifierManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		EmployeeQualifier employeeQualifier = loadEmployeeQualifier( userContext, employeeQualifierId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeQualifier, tokens);
 	}
 	
 	
 	 public EmployeeQualifier searchEmployeeQualifier(RetailscmUserContext userContext, String employeeQualifierId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEmployeeQualifier(employeeQualifierId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeQualifierManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		EmployeeQualifier employeeQualifier = loadEmployeeQualifier( userContext, employeeQualifierId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,employeeQualifier, tokens);
 	}
 	
 	

 	protected EmployeeQualifier present(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,employeeQualifier,tokens);
		
		
		EmployeeQualifier  employeeQualifierToPresent = employeeQualifierDaoOf(userContext).present(employeeQualifier, tokens);
		
		List<BaseEntity> entityListToNaming = employeeQualifierToPresent.collectRefercencesFromLists();
		employeeQualifierDaoOf(userContext).alias(entityListToNaming);
		
		return  employeeQualifierToPresent;
		
		
	}
 
 	
 	
 	public EmployeeQualifier loadEmployeeQualifierDetail(RetailscmUserContext userContext, String employeeQualifierId) throws Exception{	
 		EmployeeQualifier employeeQualifier = loadEmployeeQualifier( userContext, employeeQualifierId, allTokens());
 		return present(userContext,employeeQualifier, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String employeeQualifierId) throws Exception{	
 		EmployeeQualifier employeeQualifier = loadEmployeeQualifier( userContext, employeeQualifierId, viewTokens());
 		return present(userContext,employeeQualifier, allTokens());
		
 	}
 	protected EmployeeQualifier saveEmployeeQualifier(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, Map<String,Object>tokens) throws Exception{	
 		return employeeQualifierDaoOf(userContext).save(employeeQualifier, tokens);
 	}
 	protected EmployeeQualifier loadEmployeeQualifier(RetailscmUserContext userContext, String employeeQualifierId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfEmployeeQualifier(employeeQualifierId);
		checkerOf(userContext).throwExceptionIfHasErrors( EmployeeQualifierManagerException.class);

 
 		return employeeQualifierDaoOf(userContext).load(employeeQualifierId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, Map<String, Object> tokens){
		super.addActions(userContext, employeeQualifier, tokens);
		
		addAction(userContext, employeeQualifier, tokens,"@create","createEmployeeQualifier","createEmployeeQualifier/","main","primary");
		addAction(userContext, employeeQualifier, tokens,"@update","updateEmployeeQualifier","updateEmployeeQualifier/"+employeeQualifier.getId()+"/","main","primary");
		addAction(userContext, employeeQualifier, tokens,"@copy","cloneEmployeeQualifier","cloneEmployeeQualifier/"+employeeQualifier.getId()+"/","main","primary");
		
		addAction(userContext, employeeQualifier, tokens,"employee_qualifier.transfer_to_employee","transferToAnotherEmployee","transferToAnotherEmployee/"+employeeQualifier.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public EmployeeQualifier createEmployeeQualifier(RetailscmUserContext userContext, String employeeId,Date qualifiedTime,String type,String level,String remark) throws Exception
	//public EmployeeQualifier createEmployeeQualifier(RetailscmUserContext userContext,String employeeId, Date qualifiedTime, String type, String level, String remark) throws Exception
	{

		

		

		checkerOf(userContext).checkQualifiedTimeOfEmployeeQualifier(qualifiedTime);
		checkerOf(userContext).checkTypeOfEmployeeQualifier(type);
		checkerOf(userContext).checkLevelOfEmployeeQualifier(level);
		checkerOf(userContext).checkRemarkOfEmployeeQualifier(remark);
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeQualifierManagerException.class);


		EmployeeQualifier employeeQualifier=createNewEmployeeQualifier();	

			
		Employee employee = loadEmployee(userContext, employeeId,emptyOptions());
		employeeQualifier.setEmployee(employee);
		
		
		employeeQualifier.setQualifiedTime(qualifiedTime);
		employeeQualifier.setType(type);
		employeeQualifier.setLevel(level);
		employeeQualifier.setRemark(remark);

		employeeQualifier = saveEmployeeQualifier(userContext, employeeQualifier, emptyOptions());
		
		onNewInstanceCreated(userContext, employeeQualifier);
		return employeeQualifier;


	}
	protected EmployeeQualifier createNewEmployeeQualifier()
	{

		return new EmployeeQualifier();
	}

	protected void checkParamsForUpdatingEmployeeQualifier(RetailscmUserContext userContext,String employeeQualifierId, int employeeQualifierVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfEmployeeQualifier(employeeQualifierId);
		checkerOf(userContext).checkVersionOfEmployeeQualifier( employeeQualifierVersion);
		
		

		
		if(EmployeeQualifier.QUALIFIED_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkQualifiedTimeOfEmployeeQualifier(parseDate(newValueExpr));
		}
		if(EmployeeQualifier.TYPE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTypeOfEmployeeQualifier(parseString(newValueExpr));
		}
		if(EmployeeQualifier.LEVEL_PROPERTY.equals(property)){
			checkerOf(userContext).checkLevelOfEmployeeQualifier(parseString(newValueExpr));
		}
		if(EmployeeQualifier.REMARK_PROPERTY.equals(property)){
			checkerOf(userContext).checkRemarkOfEmployeeQualifier(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeQualifierManagerException.class);


	}



	public EmployeeQualifier clone(RetailscmUserContext userContext, String fromEmployeeQualifierId) throws Exception{

		return employeeQualifierDaoOf(userContext).clone(fromEmployeeQualifierId, this.allTokens());
	}

	public EmployeeQualifier internalSaveEmployeeQualifier(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier) throws Exception
	{
		return internalSaveEmployeeQualifier(userContext, employeeQualifier, allTokens());

	}
	public EmployeeQualifier internalSaveEmployeeQualifier(RetailscmUserContext userContext, EmployeeQualifier employeeQualifier, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingEmployeeQualifier(userContext, employeeQualifierId, employeeQualifierVersion, property, newValueExpr, tokensExpr);


		synchronized(employeeQualifier){
			//will be good when the employeeQualifier loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeQualifier.
			if (employeeQualifier.isChanged()){
			
			}
			employeeQualifier = saveEmployeeQualifier(userContext, employeeQualifier, options);
			return employeeQualifier;

		}

	}

	public EmployeeQualifier updateEmployeeQualifier(RetailscmUserContext userContext,String employeeQualifierId, int employeeQualifierVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeQualifier(userContext, employeeQualifierId, employeeQualifierVersion, property, newValueExpr, tokensExpr);



		EmployeeQualifier employeeQualifier = loadEmployeeQualifier(userContext, employeeQualifierId, allTokens());
		if(employeeQualifier.getVersion() != employeeQualifierVersion){
			String message = "The target version("+employeeQualifier.getVersion()+") is not equals to version("+employeeQualifierVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeQualifier){
			//will be good when the employeeQualifier loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeQualifier.
			
			employeeQualifier.changeProperty(property, newValueExpr);
			employeeQualifier = saveEmployeeQualifier(userContext, employeeQualifier, tokens().done());
			return present(userContext,employeeQualifier, mergedAllTokens(tokensExpr));
			//return saveEmployeeQualifier(userContext, employeeQualifier, tokens().done());
		}

	}

	public EmployeeQualifier updateEmployeeQualifierProperty(RetailscmUserContext userContext,String employeeQualifierId, int employeeQualifierVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEmployeeQualifier(userContext, employeeQualifierId, employeeQualifierVersion, property, newValueExpr, tokensExpr);

		EmployeeQualifier employeeQualifier = loadEmployeeQualifier(userContext, employeeQualifierId, allTokens());
		if(employeeQualifier.getVersion() != employeeQualifierVersion){
			String message = "The target version("+employeeQualifier.getVersion()+") is not equals to version("+employeeQualifierVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(employeeQualifier){
			//will be good when the employeeQualifier loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EmployeeQualifier.

			employeeQualifier.changeProperty(property, newValueExpr);
			
			employeeQualifier = saveEmployeeQualifier(userContext, employeeQualifier, tokens().done());
			return present(userContext,employeeQualifier, mergedAllTokens(tokensExpr));
			//return saveEmployeeQualifier(userContext, employeeQualifier, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected EmployeeQualifierTokens tokens(){
		return EmployeeQualifierTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return EmployeeQualifierTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return EmployeeQualifierTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherEmployee(RetailscmUserContext userContext, String employeeQualifierId, String anotherEmployeeId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEmployeeQualifier(employeeQualifierId);
 		checkerOf(userContext).checkIdOfEmployee(anotherEmployeeId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EmployeeQualifierManagerException.class);

 	}
 	public EmployeeQualifier transferToAnotherEmployee(RetailscmUserContext userContext, String employeeQualifierId, String anotherEmployeeId) throws Exception
 	{
 		checkParamsForTransferingAnotherEmployee(userContext, employeeQualifierId,anotherEmployeeId);
 
		EmployeeQualifier employeeQualifier = loadEmployeeQualifier(userContext, employeeQualifierId, allTokens());	
		synchronized(employeeQualifier){
			//will be good when the employeeQualifier loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Employee employee = loadEmployee(userContext, anotherEmployeeId, emptyOptions());		
			employeeQualifier.updateEmployee(employee);		
			employeeQualifier = saveEmployeeQualifier(userContext, employeeQualifier, emptyOptions());
			
			return present(userContext,employeeQualifier, allTokens());
			
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
		SmartList<Employee> candidateList = employeeDaoOf(userContext).requestCandidateEmployeeForEmployeeQualifier(userContext,ownerClass, id, filterKey, pageNo, pageSize);
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

	public void delete(RetailscmUserContext userContext, String employeeQualifierId, int employeeQualifierVersion) throws Exception {
		//deleteInternal(userContext, employeeQualifierId, employeeQualifierVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String employeeQualifierId, int employeeQualifierVersion) throws Exception{

		employeeQualifierDaoOf(userContext).delete(employeeQualifierId, employeeQualifierVersion);
	}

	public EmployeeQualifier forgetByAll(RetailscmUserContext userContext, String employeeQualifierId, int employeeQualifierVersion) throws Exception {
		return forgetByAllInternal(userContext, employeeQualifierId, employeeQualifierVersion);
	}
	protected EmployeeQualifier forgetByAllInternal(RetailscmUserContext userContext,
			String employeeQualifierId, int employeeQualifierVersion) throws Exception{

		return employeeQualifierDaoOf(userContext).disconnectFromAll(employeeQualifierId, employeeQualifierVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new EmployeeQualifierManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return employeeQualifierDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, EmployeeQualifier newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



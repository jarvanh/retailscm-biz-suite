
package com.doublechaintech.retailscm.responsibilitytype;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;
import com.doublechaintech.retailscm.BaseEntity;


import com.doublechaintech.retailscm.Message;
import com.doublechaintech.retailscm.SmartList;
import com.doublechaintech.retailscm.MultipleAccessKey;

import com.doublechaintech.retailscm.RetailscmUserContext;
//import com.doublechaintech.retailscm.BaseManagerImpl;
import com.doublechaintech.retailscm.RetailscmCheckerManager;
import com.doublechaintech.retailscm.CustomRetailscmCheckerManager;

import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.employee.Employee;

import com.doublechaintech.retailscm.retailstorecountrycenter.CandidateRetailStoreCountryCenter;

import com.doublechaintech.retailscm.hrinterview.HrInterview;
import com.doublechaintech.retailscm.termination.Termination;
import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.jobapplication.JobApplication;
import com.doublechaintech.retailscm.professioninterview.ProfessionInterview;
import com.doublechaintech.retailscm.offeracceptance.OfferAcceptance;
import com.doublechaintech.retailscm.employeeboarding.EmployeeBoarding;
import com.doublechaintech.retailscm.levelthreedepartment.LevelThreeDepartment;
import com.doublechaintech.retailscm.responsibilitytype.ResponsibilityType;
import com.doublechaintech.retailscm.occupationtype.OccupationType;
import com.doublechaintech.retailscm.salarygrade.SalaryGrade;
import com.doublechaintech.retailscm.offerapproval.OfferApproval;






public class ResponsibilityTypeManagerImpl extends CustomRetailscmCheckerManager implements ResponsibilityTypeManager {
	
	private static final String SERVICE_TYPE = "ResponsibilityType";
	@Override
	public ResponsibilityTypeDAO daoOf(RetailscmUserContext userContext) {
		return responsibilityTypeDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws ResponsibilityTypeManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new ResponsibilityTypeManagerException(message);

	}
	
	

 	protected ResponsibilityType saveResponsibilityType(RetailscmUserContext userContext, ResponsibilityType responsibilityType, String [] tokensExpr) throws Exception{	
 		//return getResponsibilityTypeDAO().save(responsibilityType, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveResponsibilityType(userContext, responsibilityType, tokens);
 	}
 	
 	protected ResponsibilityType saveResponsibilityTypeDetail(RetailscmUserContext userContext, ResponsibilityType responsibilityType) throws Exception{	

 		
 		return saveResponsibilityType(userContext, responsibilityType, allTokens());
 	}
 	
 	public ResponsibilityType loadResponsibilityType(RetailscmUserContext userContext, String responsibilityTypeId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( ResponsibilityTypeManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		ResponsibilityType responsibilityType = loadResponsibilityType( userContext, responsibilityTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,responsibilityType, tokens);
 	}
 	
 	
 	 public ResponsibilityType searchResponsibilityType(RetailscmUserContext userContext, String responsibilityTypeId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( ResponsibilityTypeManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		ResponsibilityType responsibilityType = loadResponsibilityType( userContext, responsibilityTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,responsibilityType, tokens);
 	}
 	
 	

 	protected ResponsibilityType present(RetailscmUserContext userContext, ResponsibilityType responsibilityType, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,responsibilityType,tokens);
		
		
		ResponsibilityType  responsibilityTypeToPresent = responsibilityTypeDaoOf(userContext).present(responsibilityType, tokens);
		
		List<BaseEntity> entityListToNaming = responsibilityTypeToPresent.collectRefercencesFromLists();
		responsibilityTypeDaoOf(userContext).alias(entityListToNaming);
		
		return  responsibilityTypeToPresent;
		
		
	}
 
 	
 	
 	public ResponsibilityType loadResponsibilityTypeDetail(RetailscmUserContext userContext, String responsibilityTypeId) throws Exception{	
 		ResponsibilityType responsibilityType = loadResponsibilityType( userContext, responsibilityTypeId, allTokens());
 		return present(userContext,responsibilityType, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String responsibilityTypeId) throws Exception{	
 		ResponsibilityType responsibilityType = loadResponsibilityType( userContext, responsibilityTypeId, viewTokens());
 		return present(userContext,responsibilityType, allTokens());
		
 	}
 	protected ResponsibilityType saveResponsibilityType(RetailscmUserContext userContext, ResponsibilityType responsibilityType, Map<String,Object>tokens) throws Exception{	
 		return responsibilityTypeDaoOf(userContext).save(responsibilityType, tokens);
 	}
 	protected ResponsibilityType loadResponsibilityType(RetailscmUserContext userContext, String responsibilityTypeId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( ResponsibilityTypeManagerException.class);

 
 		return responsibilityTypeDaoOf(userContext).load(responsibilityTypeId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, ResponsibilityType responsibilityType, Map<String, Object> tokens){
		super.addActions(userContext, responsibilityType, tokens);
		
		addAction(userContext, responsibilityType, tokens,"@create","createResponsibilityType","createResponsibilityType/","main","primary");
		addAction(userContext, responsibilityType, tokens,"@update","updateResponsibilityType","updateResponsibilityType/"+responsibilityType.getId()+"/","main","primary");
		addAction(userContext, responsibilityType, tokens,"@copy","cloneResponsibilityType","cloneResponsibilityType/"+responsibilityType.getId()+"/","main","primary");
		
		addAction(userContext, responsibilityType, tokens,"responsibility_type.transfer_to_company","transferToAnotherCompany","transferToAnotherCompany/"+responsibilityType.getId()+"/","main","primary");
		addAction(userContext, responsibilityType, tokens,"responsibility_type.addEmployee","addEmployee","addEmployee/"+responsibilityType.getId()+"/","employeeList","primary");
		addAction(userContext, responsibilityType, tokens,"responsibility_type.removeEmployee","removeEmployee","removeEmployee/"+responsibilityType.getId()+"/","employeeList","primary");
		addAction(userContext, responsibilityType, tokens,"responsibility_type.updateEmployee","updateEmployee","updateEmployee/"+responsibilityType.getId()+"/","employeeList","primary");
		addAction(userContext, responsibilityType, tokens,"responsibility_type.copyEmployeeFrom","copyEmployeeFrom","copyEmployeeFrom/"+responsibilityType.getId()+"/","employeeList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, ResponsibilityType responsibilityType, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public ResponsibilityType createResponsibilityType(RetailscmUserContext userContext, String code,String companyId,String baseDescription,String detailDescription) throws Exception
	//public ResponsibilityType createResponsibilityType(RetailscmUserContext userContext,String code, String companyId, String baseDescription, String detailDescription) throws Exception
	{
		
		

		

		checkerOf(userContext).checkCodeOfResponsibilityType(code);
		checkerOf(userContext).checkBaseDescriptionOfResponsibilityType(baseDescription);
		checkerOf(userContext).checkDetailDescriptionOfResponsibilityType(detailDescription);
	
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);


		ResponsibilityType responsibilityType=createNewResponsibilityType();	

		responsibilityType.setCode(code);
			
		RetailStoreCountryCenter company = loadRetailStoreCountryCenter(userContext, companyId,emptyOptions());
		responsibilityType.setCompany(company);
		
		
		responsibilityType.setBaseDescription(baseDescription);
		responsibilityType.setDetailDescription(detailDescription);

		responsibilityType = saveResponsibilityType(userContext, responsibilityType, emptyOptions());
		
		onNewInstanceCreated(userContext, responsibilityType);
		return responsibilityType;

		
	}
	protected ResponsibilityType createNewResponsibilityType() 
	{
		
		return new ResponsibilityType();		
	}
	
	protected void checkParamsForUpdatingResponsibilityType(RetailscmUserContext userContext,String responsibilityTypeId, int responsibilityTypeVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).checkVersionOfResponsibilityType( responsibilityTypeVersion);
		

		if(ResponsibilityType.CODE_PROPERTY.equals(property)){
			checkerOf(userContext).checkCodeOfResponsibilityType(parseString(newValueExpr));
		}		

		
		if(ResponsibilityType.BASE_DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkBaseDescriptionOfResponsibilityType(parseString(newValueExpr));
		}
		if(ResponsibilityType.DETAIL_DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDetailDescriptionOfResponsibilityType(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
	
		
	}
	
	
	
	public ResponsibilityType clone(RetailscmUserContext userContext, String fromResponsibilityTypeId) throws Exception{
		
		return responsibilityTypeDaoOf(userContext).clone(fromResponsibilityTypeId, this.allTokens());
	}
	
	public ResponsibilityType internalSaveResponsibilityType(RetailscmUserContext userContext, ResponsibilityType responsibilityType) throws Exception 
	{
		return internalSaveResponsibilityType(userContext, responsibilityType, allTokens());

	}
	public ResponsibilityType internalSaveResponsibilityType(RetailscmUserContext userContext, ResponsibilityType responsibilityType, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingResponsibilityType(userContext, responsibilityTypeId, responsibilityTypeVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(responsibilityType){ 
			//will be good when the responsibilityType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ResponsibilityType.
			if (responsibilityType.isChanged()){
			
			}
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, options);
			return responsibilityType;
			
		}

	}
	
	public ResponsibilityType updateResponsibilityType(RetailscmUserContext userContext,String responsibilityTypeId, int responsibilityTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingResponsibilityType(userContext, responsibilityTypeId, responsibilityTypeVersion, property, newValueExpr, tokensExpr);
		
		
		
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
		if(responsibilityType.getVersion() != responsibilityTypeVersion){
			String message = "The target version("+responsibilityType.getVersion()+") is not equals to version("+responsibilityTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(responsibilityType){ 
			//will be good when the responsibilityType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ResponsibilityType.
			
			responsibilityType.changeProperty(property, newValueExpr);
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().done());
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
			//return saveResponsibilityType(userContext, responsibilityType, tokens().done());
		}

	}
	
	public ResponsibilityType updateResponsibilityTypeProperty(RetailscmUserContext userContext,String responsibilityTypeId, int responsibilityTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingResponsibilityType(userContext, responsibilityTypeId, responsibilityTypeVersion, property, newValueExpr, tokensExpr);
		
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
		if(responsibilityType.getVersion() != responsibilityTypeVersion){
			String message = "The target version("+responsibilityType.getVersion()+") is not equals to version("+responsibilityTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(responsibilityType){ 
			//will be good when the responsibilityType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ResponsibilityType.
			
			responsibilityType.changeProperty(property, newValueExpr);
			
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().done());
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
			//return saveResponsibilityType(userContext, responsibilityType, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected ResponsibilityTypeTokens tokens(){
		return ResponsibilityTypeTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return ResponsibilityTypeTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortEmployeeListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return ResponsibilityTypeTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherCompany(RetailscmUserContext userContext, String responsibilityTypeId, String anotherCompanyId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
 		checkerOf(userContext).checkIdOfRetailStoreCountryCenter(anotherCompanyId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
 		
 	}
 	public ResponsibilityType transferToAnotherCompany(RetailscmUserContext userContext, String responsibilityTypeId, String anotherCompanyId) throws Exception
 	{
 		checkParamsForTransferingAnotherCompany(userContext, responsibilityTypeId,anotherCompanyId);
 
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());	
		synchronized(responsibilityType){
			//will be good when the responsibilityType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreCountryCenter company = loadRetailStoreCountryCenter(userContext, anotherCompanyId, emptyOptions());		
			responsibilityType.updateCompany(company);		
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, emptyOptions());
			
			return present(userContext,responsibilityType, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateRetailStoreCountryCenter requestCandidateCompany(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreCountryCenter result = new CandidateRetailStoreCountryCenter();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreCountryCenter> candidateList = retailStoreCountryCenterDaoOf(userContext).requestCandidateRetailStoreCountryCenterForResponsibilityType(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected RetailStoreCountryCenter loadRetailStoreCountryCenter(RetailscmUserContext userContext, String newCompanyId, Map<String,Object> options) throws Exception
 	{
		
 		return retailStoreCountryCenterDaoOf(userContext).load(newCompanyId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String responsibilityTypeId, int responsibilityTypeVersion) throws Exception {
		//deleteInternal(userContext, responsibilityTypeId, responsibilityTypeVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String responsibilityTypeId, int responsibilityTypeVersion) throws Exception{
			
		responsibilityTypeDaoOf(userContext).delete(responsibilityTypeId, responsibilityTypeVersion);
	}
	
	public ResponsibilityType forgetByAll(RetailscmUserContext userContext, String responsibilityTypeId, int responsibilityTypeVersion) throws Exception {
		return forgetByAllInternal(userContext, responsibilityTypeId, responsibilityTypeVersion);		
	}
	protected ResponsibilityType forgetByAllInternal(RetailscmUserContext userContext,
			String responsibilityTypeId, int responsibilityTypeVersion) throws Exception{
			
		return responsibilityTypeDaoOf(userContext).disconnectFromAll(responsibilityTypeId, responsibilityTypeVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new ResponsibilityTypeManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return responsibilityTypeDaoOf(userContext).deleteAll();
	}


	//disconnect ResponsibilityType with company in Employee
	protected ResponsibilityType breakWithEmployeeByCompany(RetailscmUserContext userContext, String responsibilityTypeId, String companyId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithCompany(responsibilityType, companyId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with department in Employee
	protected ResponsibilityType breakWithEmployeeByDepartment(RetailscmUserContext userContext, String responsibilityTypeId, String departmentId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithDepartment(responsibilityType, departmentId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with occupation in Employee
	protected ResponsibilityType breakWithEmployeeByOccupation(RetailscmUserContext userContext, String responsibilityTypeId, String occupationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithOccupation(responsibilityType, occupationId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with current_salary_grade in Employee
	protected ResponsibilityType breakWithEmployeeByCurrentSalaryGrade(RetailscmUserContext userContext, String responsibilityTypeId, String currentSalaryGradeId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithCurrentSalaryGrade(responsibilityType, currentSalaryGradeId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with job_application in Employee
	protected ResponsibilityType breakWithEmployeeByJobApplication(RetailscmUserContext userContext, String responsibilityTypeId, String jobApplicationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithJobApplication(responsibilityType, jobApplicationId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with profession_interview in Employee
	protected ResponsibilityType breakWithEmployeeByProfessionInterview(RetailscmUserContext userContext, String responsibilityTypeId, String professionInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithProfessionInterview(responsibilityType, professionInterviewId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with hr_interview in Employee
	protected ResponsibilityType breakWithEmployeeByHrInterview(RetailscmUserContext userContext, String responsibilityTypeId, String hrInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithHrInterview(responsibilityType, hrInterviewId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with offer_approval in Employee
	protected ResponsibilityType breakWithEmployeeByOfferApproval(RetailscmUserContext userContext, String responsibilityTypeId, String offerApprovalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithOfferApproval(responsibilityType, offerApprovalId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with offer_acceptance in Employee
	protected ResponsibilityType breakWithEmployeeByOfferAcceptance(RetailscmUserContext userContext, String responsibilityTypeId, String offerAcceptanceId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithOfferAcceptance(responsibilityType, offerAcceptanceId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with employee_boarding in Employee
	protected ResponsibilityType breakWithEmployeeByEmployeeBoarding(RetailscmUserContext userContext, String responsibilityTypeId, String employeeBoardingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithEmployeeBoarding(responsibilityType, employeeBoardingId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	//disconnect ResponsibilityType with termination in Employee
	protected ResponsibilityType breakWithEmployeeByTermination(RetailscmUserContext userContext, String responsibilityTypeId, String terminationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());

			synchronized(responsibilityType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeListWithTermination(responsibilityType, terminationId, this.emptyOptions());

				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				return responsibilityType;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingEmployee(RetailscmUserContext userContext, String responsibilityTypeId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);

		
		checkerOf(userContext).checkCompanyIdOfEmployee(companyId);
		
		checkerOf(userContext).checkTitleOfEmployee(title);
		
		checkerOf(userContext).checkDepartmentIdOfEmployee(departmentId);
		
		checkerOf(userContext).checkFamilyNameOfEmployee(familyName);
		
		checkerOf(userContext).checkGivenNameOfEmployee(givenName);
		
		checkerOf(userContext).checkEmailOfEmployee(email);
		
		checkerOf(userContext).checkCityOfEmployee(city);
		
		checkerOf(userContext).checkAddressOfEmployee(address);
		
		checkerOf(userContext).checkCellPhoneOfEmployee(cellPhone);
		
		checkerOf(userContext).checkOccupationIdOfEmployee(occupationId);
		
		checkerOf(userContext).checkCurrentSalaryGradeIdOfEmployee(currentSalaryGradeId);
		
		checkerOf(userContext).checkSalaryAccountOfEmployee(salaryAccount);
		
		checkerOf(userContext).checkJobApplicationIdOfEmployee(jobApplicationId);
		
		checkerOf(userContext).checkProfessionInterviewIdOfEmployee(professionInterviewId);
		
		checkerOf(userContext).checkHrInterviewIdOfEmployee(hrInterviewId);
		
		checkerOf(userContext).checkOfferApprovalIdOfEmployee(offerApprovalId);
		
		checkerOf(userContext).checkOfferAcceptanceIdOfEmployee(offerAcceptanceId);
		
		checkerOf(userContext).checkEmployeeBoardingIdOfEmployee(employeeBoardingId);
		
		checkerOf(userContext).checkTerminationIdOfEmployee(terminationId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);

	
	}
	public  ResponsibilityType addEmployee(RetailscmUserContext userContext, String responsibilityTypeId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingEmployee(userContext,responsibilityTypeId,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, occupationId, currentSalaryGradeId, salaryAccount, jobApplicationId, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId,tokensExpr);
		
		Employee employee = createEmployee(userContext,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, occupationId, currentSalaryGradeId, salaryAccount, jobApplicationId, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId);
		
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
		synchronized(responsibilityType){ 
			//Will be good when the responsibilityType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			responsibilityType.addEmployee( employee );		
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, employee);
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingEmployeeProperties(RetailscmUserContext userContext, String responsibilityTypeId,String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).checkIdOfEmployee(id);
		
		checkerOf(userContext).checkTitleOfEmployee( title);
		checkerOf(userContext).checkFamilyNameOfEmployee( familyName);
		checkerOf(userContext).checkGivenNameOfEmployee( givenName);
		checkerOf(userContext).checkEmailOfEmployee( email);
		checkerOf(userContext).checkCityOfEmployee( city);
		checkerOf(userContext).checkAddressOfEmployee( address);
		checkerOf(userContext).checkCellPhoneOfEmployee( cellPhone);
		checkerOf(userContext).checkSalaryAccountOfEmployee( salaryAccount);

		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
		
	}
	public  ResponsibilityType updateEmployeeProperties(RetailscmUserContext userContext, String responsibilityTypeId, String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingEmployeeProperties(userContext,responsibilityTypeId,id,title,familyName,givenName,email,city,address,cellPhone,salaryAccount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withEmployeeListList()
				.searchEmployeeListWith(Employee.ID_PROPERTY, "is", id).done();
		
		ResponsibilityType responsibilityTypeToUpdate = loadResponsibilityType(userContext, responsibilityTypeId, options);
		
		if(responsibilityTypeToUpdate.getEmployeeList().isEmpty()){
			throw new ResponsibilityTypeManagerException("Employee is NOT FOUND with id: '"+id+"'");
		}
		
		Employee item = responsibilityTypeToUpdate.getEmployeeList().first();
		
		item.updateTitle( title );
		item.updateFamilyName( familyName );
		item.updateGivenName( givenName );
		item.updateEmail( email );
		item.updateCity( city );
		item.updateAddress( address );
		item.updateCellPhone( cellPhone );
		item.updateSalaryAccount( salaryAccount );

		
		//checkParamsForAddingEmployee(userContext,responsibilityTypeId,name, code, used,tokensExpr);
		ResponsibilityType responsibilityType = saveResponsibilityType(userContext, responsibilityTypeToUpdate, tokens().withEmployeeList().done());
		synchronized(responsibilityType){ 
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected Employee createEmployee(RetailscmUserContext userContext, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId) throws Exception{

		Employee employee = new Employee();
		
		
		RetailStoreCountryCenter  company = new RetailStoreCountryCenter();
		company.setId(companyId);		
		employee.setCompany(company);		
		employee.setTitle(title);		
		LevelThreeDepartment  department = new LevelThreeDepartment();
		department.setId(departmentId);		
		employee.setDepartment(department);		
		employee.setFamilyName(familyName);		
		employee.setGivenName(givenName);		
		employee.setEmail(email);		
		employee.setCity(city);		
		employee.setAddress(address);		
		employee.setCellPhone(cellPhone);		
		OccupationType  occupation = new OccupationType();
		occupation.setId(occupationId);		
		employee.setOccupation(occupation);		
		SalaryGrade  currentSalaryGrade = new SalaryGrade();
		currentSalaryGrade.setId(currentSalaryGradeId);		
		employee.setCurrentSalaryGrade(currentSalaryGrade);		
		employee.setSalaryAccount(salaryAccount);		
		JobApplication  jobApplication = new JobApplication();
		jobApplication.setId(jobApplicationId);		
		employee.setJobApplication(jobApplication);		
		ProfessionInterview  professionInterview = new ProfessionInterview();
		professionInterview.setId(professionInterviewId);		
		employee.setProfessionInterview(professionInterview);		
		HrInterview  hrInterview = new HrInterview();
		hrInterview.setId(hrInterviewId);		
		employee.setHrInterview(hrInterview);		
		OfferApproval  offerApproval = new OfferApproval();
		offerApproval.setId(offerApprovalId);		
		employee.setOfferApproval(offerApproval);		
		OfferAcceptance  offerAcceptance = new OfferAcceptance();
		offerAcceptance.setId(offerAcceptanceId);		
		employee.setOfferAcceptance(offerAcceptance);		
		EmployeeBoarding  employeeBoarding = new EmployeeBoarding();
		employeeBoarding.setId(employeeBoardingId);		
		employee.setEmployeeBoarding(employeeBoarding);		
		Termination  termination = new Termination();
		termination.setId(terminationId);		
		employee.setTermination(termination);		
		employee.setLastUpdateTime(userContext.now());
	
		
		return employee;
	
		
	}
	
	protected Employee createIndexedEmployee(String id, int version){

		Employee employee = new Employee();
		employee.setId(id);
		employee.setVersion(version);
		return employee;			
		
	}
	
	protected void checkParamsForRemovingEmployeeList(RetailscmUserContext userContext, String responsibilityTypeId, 
			String employeeIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		for(String employeeIdItem: employeeIds){
			checkerOf(userContext).checkIdOfEmployee(employeeIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
		
	}
	public  ResponsibilityType removeEmployeeList(RetailscmUserContext userContext, String responsibilityTypeId, 
			String employeeIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingEmployeeList(userContext, responsibilityTypeId,  employeeIds, tokensExpr);
			
			
			ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
			synchronized(responsibilityType){ 
				//Will be good when the responsibilityType loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				responsibilityTypeDaoOf(userContext).planToRemoveEmployeeList(responsibilityType, employeeIds, allTokens());
				responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
				deleteRelationListInGraph(userContext, responsibilityType.getEmployeeList());
				return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingEmployee(RetailscmUserContext userContext, String responsibilityTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfResponsibilityType( responsibilityTypeId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
	
	}
	public  ResponsibilityType removeEmployee(RetailscmUserContext userContext, String responsibilityTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingEmployee(userContext,responsibilityTypeId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
		synchronized(responsibilityType){ 
			//Will be good when the responsibilityType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			responsibilityType.removeEmployee( employee );		
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
			deleteRelationInGraph(userContext, employee);
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingEmployee(RetailscmUserContext userContext, String responsibilityTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfResponsibilityType( responsibilityTypeId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
	
	}
	public  ResponsibilityType copyEmployeeFrom(RetailscmUserContext userContext, String responsibilityTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingEmployee(userContext,responsibilityTypeId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, allTokens());
		synchronized(responsibilityType){ 
			//Will be good when the responsibilityType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			employee.updateLastUpdateTime(userContext.now());
			
			responsibilityType.copyEmployeeFrom( employee );		
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, (Employee)responsibilityType.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingEmployee(RetailscmUserContext userContext, String responsibilityTypeId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfResponsibilityType(responsibilityTypeId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		

		if(Employee.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.FAMILY_NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkFamilyNameOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.GIVEN_NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkGivenNameOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.EMAIL_PROPERTY.equals(property)){
			checkerOf(userContext).checkEmailOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.CITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkCityOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.ADDRESS_PROPERTY.equals(property)){
			checkerOf(userContext).checkAddressOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.CELL_PHONE_PROPERTY.equals(property)){
			checkerOf(userContext).checkCellPhoneOfEmployee(parseString(newValueExpr));
		}
		
		if(Employee.SALARY_ACCOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkSalaryAccountOfEmployee(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(ResponsibilityTypeManagerException.class);
	
	}
	
	public  ResponsibilityType updateEmployee(RetailscmUserContext userContext, String responsibilityTypeId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingEmployee(userContext, responsibilityTypeId, employeeId, employeeVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withEmployeeList().searchEmployeeListWith(Employee.ID_PROPERTY, "eq", employeeId).done();
		
		
		
		ResponsibilityType responsibilityType = loadResponsibilityType(userContext, responsibilityTypeId, loadTokens);
		
		synchronized(responsibilityType){ 
			//Will be good when the responsibilityType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//responsibilityType.removeEmployee( employee );	
			//make changes to AcceleraterAccount.
			Employee employeeIndex = createIndexedEmployee(employeeId, employeeVersion);
		
			Employee employee = responsibilityType.findTheEmployee(employeeIndex);
			if(employee == null){
				throw new ResponsibilityTypeManagerException(employee+" is NOT FOUND" );
			}
			
			employee.changeProperty(property, newValueExpr);
			employee.updateLastUpdateTime(userContext.now());
			responsibilityType = saveResponsibilityType(userContext, responsibilityType, tokens().withEmployeeList().done());
			return present(userContext,responsibilityType, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, ResponsibilityType newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



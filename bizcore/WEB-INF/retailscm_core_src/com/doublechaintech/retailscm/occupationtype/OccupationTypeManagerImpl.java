
package com.doublechaintech.retailscm.occupationtype;

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






public class OccupationTypeManagerImpl extends CustomRetailscmCheckerManager implements OccupationTypeManager {
	
	private static final String SERVICE_TYPE = "OccupationType";
	@Override
	public OccupationTypeDAO daoOf(RetailscmUserContext userContext) {
		return occupationTypeDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws OccupationTypeManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new OccupationTypeManagerException(message);

	}
	
	

 	protected OccupationType saveOccupationType(RetailscmUserContext userContext, OccupationType occupationType, String [] tokensExpr) throws Exception{	
 		//return getOccupationTypeDAO().save(occupationType, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveOccupationType(userContext, occupationType, tokens);
 	}
 	
 	protected OccupationType saveOccupationTypeDetail(RetailscmUserContext userContext, OccupationType occupationType) throws Exception{	

 		
 		return saveOccupationType(userContext, occupationType, allTokens());
 	}
 	
 	public OccupationType loadOccupationType(RetailscmUserContext userContext, String occupationTypeId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( OccupationTypeManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		OccupationType occupationType = loadOccupationType( userContext, occupationTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,occupationType, tokens);
 	}
 	
 	
 	 public OccupationType searchOccupationType(RetailscmUserContext userContext, String occupationTypeId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( OccupationTypeManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		OccupationType occupationType = loadOccupationType( userContext, occupationTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,occupationType, tokens);
 	}
 	
 	

 	protected OccupationType present(RetailscmUserContext userContext, OccupationType occupationType, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,occupationType,tokens);
		
		
		OccupationType  occupationTypeToPresent = occupationTypeDaoOf(userContext).present(occupationType, tokens);
		
		List<BaseEntity> entityListToNaming = occupationTypeToPresent.collectRefercencesFromLists();
		occupationTypeDaoOf(userContext).alias(entityListToNaming);
		
		return  occupationTypeToPresent;
		
		
	}
 
 	
 	
 	public OccupationType loadOccupationTypeDetail(RetailscmUserContext userContext, String occupationTypeId) throws Exception{	
 		OccupationType occupationType = loadOccupationType( userContext, occupationTypeId, allTokens());
 		return present(userContext,occupationType, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String occupationTypeId) throws Exception{	
 		OccupationType occupationType = loadOccupationType( userContext, occupationTypeId, viewTokens());
 		return present(userContext,occupationType, allTokens());
		
 	}
 	protected OccupationType saveOccupationType(RetailscmUserContext userContext, OccupationType occupationType, Map<String,Object>tokens) throws Exception{	
 		return occupationTypeDaoOf(userContext).save(occupationType, tokens);
 	}
 	protected OccupationType loadOccupationType(RetailscmUserContext userContext, String occupationTypeId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( OccupationTypeManagerException.class);

 
 		return occupationTypeDaoOf(userContext).load(occupationTypeId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OccupationType occupationType, Map<String, Object> tokens){
		super.addActions(userContext, occupationType, tokens);
		
		addAction(userContext, occupationType, tokens,"@create","createOccupationType","createOccupationType/","main","primary");
		addAction(userContext, occupationType, tokens,"@update","updateOccupationType","updateOccupationType/"+occupationType.getId()+"/","main","primary");
		addAction(userContext, occupationType, tokens,"@copy","cloneOccupationType","cloneOccupationType/"+occupationType.getId()+"/","main","primary");
		
		addAction(userContext, occupationType, tokens,"occupation_type.transfer_to_company","transferToAnotherCompany","transferToAnotherCompany/"+occupationType.getId()+"/","main","primary");
		addAction(userContext, occupationType, tokens,"occupation_type.addEmployee","addEmployee","addEmployee/"+occupationType.getId()+"/","employeeList","primary");
		addAction(userContext, occupationType, tokens,"occupation_type.removeEmployee","removeEmployee","removeEmployee/"+occupationType.getId()+"/","employeeList","primary");
		addAction(userContext, occupationType, tokens,"occupation_type.updateEmployee","updateEmployee","updateEmployee/"+occupationType.getId()+"/","employeeList","primary");
		addAction(userContext, occupationType, tokens,"occupation_type.copyEmployeeFrom","copyEmployeeFrom","copyEmployeeFrom/"+occupationType.getId()+"/","employeeList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OccupationType occupationType, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public OccupationType createOccupationType(RetailscmUserContext userContext, String code,String companyId,String description,String detailDescription) throws Exception
	//public OccupationType createOccupationType(RetailscmUserContext userContext,String code, String companyId, String description, String detailDescription) throws Exception
	{
		
		

		

		checkerOf(userContext).checkCodeOfOccupationType(code);
		checkerOf(userContext).checkDescriptionOfOccupationType(description);
		checkerOf(userContext).checkDetailDescriptionOfOccupationType(detailDescription);
	
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);


		OccupationType occupationType=createNewOccupationType();	

		occupationType.setCode(code);
			
		RetailStoreCountryCenter company = loadRetailStoreCountryCenter(userContext, companyId,emptyOptions());
		occupationType.setCompany(company);
		
		
		occupationType.setDescription(description);
		occupationType.setDetailDescription(detailDescription);

		occupationType = saveOccupationType(userContext, occupationType, emptyOptions());
		
		onNewInstanceCreated(userContext, occupationType);
		return occupationType;

		
	}
	protected OccupationType createNewOccupationType() 
	{
		
		return new OccupationType();		
	}
	
	protected void checkParamsForUpdatingOccupationType(RetailscmUserContext userContext,String occupationTypeId, int occupationTypeVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		checkerOf(userContext).checkVersionOfOccupationType( occupationTypeVersion);
		

		if(OccupationType.CODE_PROPERTY.equals(property)){
			checkerOf(userContext).checkCodeOfOccupationType(parseString(newValueExpr));
		}		

		
		if(OccupationType.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfOccupationType(parseString(newValueExpr));
		}
		if(OccupationType.DETAIL_DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDetailDescriptionOfOccupationType(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
	
		
	}
	
	
	
	public OccupationType clone(RetailscmUserContext userContext, String fromOccupationTypeId) throws Exception{
		
		return occupationTypeDaoOf(userContext).clone(fromOccupationTypeId, this.allTokens());
	}
	
	public OccupationType internalSaveOccupationType(RetailscmUserContext userContext, OccupationType occupationType) throws Exception 
	{
		return internalSaveOccupationType(userContext, occupationType, allTokens());

	}
	public OccupationType internalSaveOccupationType(RetailscmUserContext userContext, OccupationType occupationType, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingOccupationType(userContext, occupationTypeId, occupationTypeVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(occupationType){ 
			//will be good when the occupationType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OccupationType.
			if (occupationType.isChanged()){
			
			}
			occupationType = saveOccupationType(userContext, occupationType, options);
			return occupationType;
			
		}

	}
	
	public OccupationType updateOccupationType(RetailscmUserContext userContext,String occupationTypeId, int occupationTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingOccupationType(userContext, occupationTypeId, occupationTypeVersion, property, newValueExpr, tokensExpr);
		
		
		
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
		if(occupationType.getVersion() != occupationTypeVersion){
			String message = "The target version("+occupationType.getVersion()+") is not equals to version("+occupationTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(occupationType){ 
			//will be good when the occupationType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OccupationType.
			
			occupationType.changeProperty(property, newValueExpr);
			occupationType = saveOccupationType(userContext, occupationType, tokens().done());
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
			//return saveOccupationType(userContext, occupationType, tokens().done());
		}

	}
	
	public OccupationType updateOccupationTypeProperty(RetailscmUserContext userContext,String occupationTypeId, int occupationTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingOccupationType(userContext, occupationTypeId, occupationTypeVersion, property, newValueExpr, tokensExpr);
		
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
		if(occupationType.getVersion() != occupationTypeVersion){
			String message = "The target version("+occupationType.getVersion()+") is not equals to version("+occupationTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(occupationType){ 
			//will be good when the occupationType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OccupationType.
			
			occupationType.changeProperty(property, newValueExpr);
			
			occupationType = saveOccupationType(userContext, occupationType, tokens().done());
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
			//return saveOccupationType(userContext, occupationType, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected OccupationTypeTokens tokens(){
		return OccupationTypeTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return OccupationTypeTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortEmployeeListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return OccupationTypeTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherCompany(RetailscmUserContext userContext, String occupationTypeId, String anotherCompanyId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
 		checkerOf(userContext).checkIdOfRetailStoreCountryCenter(anotherCompanyId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
 		
 	}
 	public OccupationType transferToAnotherCompany(RetailscmUserContext userContext, String occupationTypeId, String anotherCompanyId) throws Exception
 	{
 		checkParamsForTransferingAnotherCompany(userContext, occupationTypeId,anotherCompanyId);
 
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());	
		synchronized(occupationType){
			//will be good when the occupationType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreCountryCenter company = loadRetailStoreCountryCenter(userContext, anotherCompanyId, emptyOptions());		
			occupationType.updateCompany(company);		
			occupationType = saveOccupationType(userContext, occupationType, emptyOptions());
			
			return present(userContext,occupationType, allTokens());
			
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
		SmartList<RetailStoreCountryCenter> candidateList = retailStoreCountryCenterDaoOf(userContext).requestCandidateRetailStoreCountryCenterForOccupationType(userContext,ownerClass, id, filterKey, pageNo, pageSize);
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

	public void delete(RetailscmUserContext userContext, String occupationTypeId, int occupationTypeVersion) throws Exception {
		//deleteInternal(userContext, occupationTypeId, occupationTypeVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String occupationTypeId, int occupationTypeVersion) throws Exception{
			
		occupationTypeDaoOf(userContext).delete(occupationTypeId, occupationTypeVersion);
	}
	
	public OccupationType forgetByAll(RetailscmUserContext userContext, String occupationTypeId, int occupationTypeVersion) throws Exception {
		return forgetByAllInternal(userContext, occupationTypeId, occupationTypeVersion);		
	}
	protected OccupationType forgetByAllInternal(RetailscmUserContext userContext,
			String occupationTypeId, int occupationTypeVersion) throws Exception{
			
		return occupationTypeDaoOf(userContext).disconnectFromAll(occupationTypeId, occupationTypeVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new OccupationTypeManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return occupationTypeDaoOf(userContext).deleteAll();
	}


	//disconnect OccupationType with company in Employee
	protected OccupationType breakWithEmployeeByCompany(RetailscmUserContext userContext, String occupationTypeId, String companyId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithCompany(occupationType, companyId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with department in Employee
	protected OccupationType breakWithEmployeeByDepartment(RetailscmUserContext userContext, String occupationTypeId, String departmentId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithDepartment(occupationType, departmentId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with responsible_for in Employee
	protected OccupationType breakWithEmployeeByResponsibleFor(RetailscmUserContext userContext, String occupationTypeId, String responsibleForId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithResponsibleFor(occupationType, responsibleForId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with current_salary_grade in Employee
	protected OccupationType breakWithEmployeeByCurrentSalaryGrade(RetailscmUserContext userContext, String occupationTypeId, String currentSalaryGradeId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithCurrentSalaryGrade(occupationType, currentSalaryGradeId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with job_application in Employee
	protected OccupationType breakWithEmployeeByJobApplication(RetailscmUserContext userContext, String occupationTypeId, String jobApplicationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithJobApplication(occupationType, jobApplicationId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with profession_interview in Employee
	protected OccupationType breakWithEmployeeByProfessionInterview(RetailscmUserContext userContext, String occupationTypeId, String professionInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithProfessionInterview(occupationType, professionInterviewId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with hr_interview in Employee
	protected OccupationType breakWithEmployeeByHrInterview(RetailscmUserContext userContext, String occupationTypeId, String hrInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithHrInterview(occupationType, hrInterviewId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with offer_approval in Employee
	protected OccupationType breakWithEmployeeByOfferApproval(RetailscmUserContext userContext, String occupationTypeId, String offerApprovalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithOfferApproval(occupationType, offerApprovalId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with offer_acceptance in Employee
	protected OccupationType breakWithEmployeeByOfferAcceptance(RetailscmUserContext userContext, String occupationTypeId, String offerAcceptanceId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithOfferAcceptance(occupationType, offerAcceptanceId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with employee_boarding in Employee
	protected OccupationType breakWithEmployeeByEmployeeBoarding(RetailscmUserContext userContext, String occupationTypeId, String employeeBoardingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithEmployeeBoarding(occupationType, employeeBoardingId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	//disconnect OccupationType with termination in Employee
	protected OccupationType breakWithEmployeeByTermination(RetailscmUserContext userContext, String occupationTypeId, String terminationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());

			synchronized(occupationType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				occupationTypeDaoOf(userContext).planToRemoveEmployeeListWithTermination(occupationType, terminationId, this.emptyOptions());

				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				return occupationType;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingEmployee(RetailscmUserContext userContext, String occupationTypeId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);

		
		checkerOf(userContext).checkCompanyIdOfEmployee(companyId);
		
		checkerOf(userContext).checkTitleOfEmployee(title);
		
		checkerOf(userContext).checkDepartmentIdOfEmployee(departmentId);
		
		checkerOf(userContext).checkFamilyNameOfEmployee(familyName);
		
		checkerOf(userContext).checkGivenNameOfEmployee(givenName);
		
		checkerOf(userContext).checkEmailOfEmployee(email);
		
		checkerOf(userContext).checkCityOfEmployee(city);
		
		checkerOf(userContext).checkAddressOfEmployee(address);
		
		checkerOf(userContext).checkCellPhoneOfEmployee(cellPhone);
		
		checkerOf(userContext).checkResponsibleForIdOfEmployee(responsibleForId);
		
		checkerOf(userContext).checkCurrentSalaryGradeIdOfEmployee(currentSalaryGradeId);
		
		checkerOf(userContext).checkSalaryAccountOfEmployee(salaryAccount);
		
		checkerOf(userContext).checkJobApplicationIdOfEmployee(jobApplicationId);
		
		checkerOf(userContext).checkProfessionInterviewIdOfEmployee(professionInterviewId);
		
		checkerOf(userContext).checkHrInterviewIdOfEmployee(hrInterviewId);
		
		checkerOf(userContext).checkOfferApprovalIdOfEmployee(offerApprovalId);
		
		checkerOf(userContext).checkOfferAcceptanceIdOfEmployee(offerAcceptanceId);
		
		checkerOf(userContext).checkEmployeeBoardingIdOfEmployee(employeeBoardingId);
		
		checkerOf(userContext).checkTerminationIdOfEmployee(terminationId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);

	
	}
	public  OccupationType addEmployee(RetailscmUserContext userContext, String occupationTypeId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingEmployee(userContext,occupationTypeId,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, responsibleForId, currentSalaryGradeId, salaryAccount, jobApplicationId, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId,tokensExpr);
		
		Employee employee = createEmployee(userContext,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, responsibleForId, currentSalaryGradeId, salaryAccount, jobApplicationId, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId);
		
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
		synchronized(occupationType){ 
			//Will be good when the occupationType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			occupationType.addEmployee( employee );		
			occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, employee);
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingEmployeeProperties(RetailscmUserContext userContext, String occupationTypeId,String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		checkerOf(userContext).checkIdOfEmployee(id);
		
		checkerOf(userContext).checkTitleOfEmployee( title);
		checkerOf(userContext).checkFamilyNameOfEmployee( familyName);
		checkerOf(userContext).checkGivenNameOfEmployee( givenName);
		checkerOf(userContext).checkEmailOfEmployee( email);
		checkerOf(userContext).checkCityOfEmployee( city);
		checkerOf(userContext).checkAddressOfEmployee( address);
		checkerOf(userContext).checkCellPhoneOfEmployee( cellPhone);
		checkerOf(userContext).checkSalaryAccountOfEmployee( salaryAccount);

		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
		
	}
	public  OccupationType updateEmployeeProperties(RetailscmUserContext userContext, String occupationTypeId, String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingEmployeeProperties(userContext,occupationTypeId,id,title,familyName,givenName,email,city,address,cellPhone,salaryAccount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withEmployeeListList()
				.searchEmployeeListWith(Employee.ID_PROPERTY, "is", id).done();
		
		OccupationType occupationTypeToUpdate = loadOccupationType(userContext, occupationTypeId, options);
		
		if(occupationTypeToUpdate.getEmployeeList().isEmpty()){
			throw new OccupationTypeManagerException("Employee is NOT FOUND with id: '"+id+"'");
		}
		
		Employee item = occupationTypeToUpdate.getEmployeeList().first();
		
		item.updateTitle( title );
		item.updateFamilyName( familyName );
		item.updateGivenName( givenName );
		item.updateEmail( email );
		item.updateCity( city );
		item.updateAddress( address );
		item.updateCellPhone( cellPhone );
		item.updateSalaryAccount( salaryAccount );

		
		//checkParamsForAddingEmployee(userContext,occupationTypeId,name, code, used,tokensExpr);
		OccupationType occupationType = saveOccupationType(userContext, occupationTypeToUpdate, tokens().withEmployeeList().done());
		synchronized(occupationType){ 
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected Employee createEmployee(RetailscmUserContext userContext, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String jobApplicationId, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId) throws Exception{

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
		ResponsibilityType  responsibleFor = new ResponsibilityType();
		responsibleFor.setId(responsibleForId);		
		employee.setResponsibleFor(responsibleFor);		
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
	
	protected void checkParamsForRemovingEmployeeList(RetailscmUserContext userContext, String occupationTypeId, 
			String employeeIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfOccupationType(occupationTypeId);
		for(String employeeIdItem: employeeIds){
			userContext.getChecker().checkIdOfEmployee(employeeIdItem);
=======
		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
		for(String employeeIdItem: employeeIds){
			checkerOf(userContext).checkIdOfEmployee(employeeIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
		
	}
	public  OccupationType removeEmployeeList(RetailscmUserContext userContext, String occupationTypeId, 
			String employeeIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingEmployeeList(userContext, occupationTypeId,  employeeIds, tokensExpr);
			
			
			OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
			synchronized(occupationType){ 
				//Will be good when the occupationType loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				occupationTypeDaoOf(userContext).planToRemoveEmployeeList(occupationType, employeeIds, allTokens());
				occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
				deleteRelationListInGraph(userContext, occupationType.getEmployeeList());
				return present(userContext,occupationType, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingEmployee(RetailscmUserContext userContext, String occupationTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfOccupationType( occupationTypeId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
	
	}
	public  OccupationType removeEmployee(RetailscmUserContext userContext, String occupationTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingEmployee(userContext,occupationTypeId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
		synchronized(occupationType){ 
			//Will be good when the occupationType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			occupationType.removeEmployee( employee );		
			occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
			deleteRelationInGraph(userContext, employee);
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingEmployee(RetailscmUserContext userContext, String occupationTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfOccupationType( occupationTypeId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
	
	}
	public  OccupationType copyEmployeeFrom(RetailscmUserContext userContext, String occupationTypeId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingEmployee(userContext,occupationTypeId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, allTokens());
		synchronized(occupationType){ 
			//Will be good when the occupationType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			employee.updateLastUpdateTime(userContext.now());
			
			occupationType.copyEmployeeFrom( employee );		
			occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, (Employee)occupationType.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingEmployee(RetailscmUserContext userContext, String occupationTypeId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfOccupationType(occupationTypeId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(OccupationTypeManagerException.class);
	
	}
	
	public  OccupationType updateEmployee(RetailscmUserContext userContext, String occupationTypeId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingEmployee(userContext, occupationTypeId, employeeId, employeeVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withEmployeeList().searchEmployeeListWith(Employee.ID_PROPERTY, "eq", employeeId).done();
		
		
		
		OccupationType occupationType = loadOccupationType(userContext, occupationTypeId, loadTokens);
		
		synchronized(occupationType){ 
			//Will be good when the occupationType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//occupationType.removeEmployee( employee );	
			//make changes to AcceleraterAccount.
			Employee employeeIndex = createIndexedEmployee(employeeId, employeeVersion);
		
			Employee employee = occupationType.findTheEmployee(employeeIndex);
			if(employee == null){
				throw new OccupationTypeManagerException(employee+" is NOT FOUND" );
			}
			
			employee.changeProperty(property, newValueExpr);
			employee.updateLastUpdateTime(userContext.now());
			occupationType = saveOccupationType(userContext, occupationType, tokens().withEmployeeList().done());
			return present(userContext,occupationType, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, OccupationType newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



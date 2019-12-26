
package com.doublechaintech.retailscm.jobapplication;

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

import com.doublechaintech.retailscm.employee.Employee;


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






public class JobApplicationManagerImpl extends CustomRetailscmCheckerManager implements JobApplicationManager {
	
	private static final String SERVICE_TYPE = "JobApplication";
	@Override
	public JobApplicationDAO daoOf(RetailscmUserContext userContext) {
		return jobApplicationDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws JobApplicationManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new JobApplicationManagerException(message);

	}
	
	

 	protected JobApplication saveJobApplication(RetailscmUserContext userContext, JobApplication jobApplication, String [] tokensExpr) throws Exception{	
 		//return getJobApplicationDAO().save(jobApplication, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveJobApplication(userContext, jobApplication, tokens);
 	}
 	
 	protected JobApplication saveJobApplicationDetail(RetailscmUserContext userContext, JobApplication jobApplication) throws Exception{	

 		
 		return saveJobApplication(userContext, jobApplication, allTokens());
 	}
 	
 	public JobApplication loadJobApplication(RetailscmUserContext userContext, String jobApplicationId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		checkerOf(userContext).throwExceptionIfHasErrors( JobApplicationManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		JobApplication jobApplication = loadJobApplication( userContext, jobApplicationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,jobApplication, tokens);
 	}
 	
 	
 	 public JobApplication searchJobApplication(RetailscmUserContext userContext, String jobApplicationId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		checkerOf(userContext).throwExceptionIfHasErrors( JobApplicationManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		JobApplication jobApplication = loadJobApplication( userContext, jobApplicationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,jobApplication, tokens);
 	}
 	
 	

 	protected JobApplication present(RetailscmUserContext userContext, JobApplication jobApplication, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,jobApplication,tokens);
		
		
		JobApplication  jobApplicationToPresent = jobApplicationDaoOf(userContext).present(jobApplication, tokens);
		
		List<BaseEntity> entityListToNaming = jobApplicationToPresent.collectRefercencesFromLists();
		jobApplicationDaoOf(userContext).alias(entityListToNaming);
		
		return  jobApplicationToPresent;
		
		
	}
 
 	
 	
 	public JobApplication loadJobApplicationDetail(RetailscmUserContext userContext, String jobApplicationId) throws Exception{	
 		JobApplication jobApplication = loadJobApplication( userContext, jobApplicationId, allTokens());
 		return present(userContext,jobApplication, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String jobApplicationId) throws Exception{	
 		JobApplication jobApplication = loadJobApplication( userContext, jobApplicationId, viewTokens());
 		return present(userContext,jobApplication, allTokens());
		
 	}
 	protected JobApplication saveJobApplication(RetailscmUserContext userContext, JobApplication jobApplication, Map<String,Object>tokens) throws Exception{	
 		return jobApplicationDaoOf(userContext).save(jobApplication, tokens);
 	}
 	protected JobApplication loadJobApplication(RetailscmUserContext userContext, String jobApplicationId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		checkerOf(userContext).throwExceptionIfHasErrors( JobApplicationManagerException.class);

 
 		return jobApplicationDaoOf(userContext).load(jobApplicationId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, JobApplication jobApplication, Map<String, Object> tokens){
		super.addActions(userContext, jobApplication, tokens);
		
		addAction(userContext, jobApplication, tokens,"@create","createJobApplication","createJobApplication/","main","primary");
		addAction(userContext, jobApplication, tokens,"@update","updateJobApplication","updateJobApplication/"+jobApplication.getId()+"/","main","primary");
		addAction(userContext, jobApplication, tokens,"@copy","cloneJobApplication","cloneJobApplication/"+jobApplication.getId()+"/","main","primary");
		
		addAction(userContext, jobApplication, tokens,"job_application.addEmployee","addEmployee","addEmployee/"+jobApplication.getId()+"/","employeeList","primary");
		addAction(userContext, jobApplication, tokens,"job_application.removeEmployee","removeEmployee","removeEmployee/"+jobApplication.getId()+"/","employeeList","primary");
		addAction(userContext, jobApplication, tokens,"job_application.updateEmployee","updateEmployee","updateEmployee/"+jobApplication.getId()+"/","employeeList","primary");
		addAction(userContext, jobApplication, tokens,"job_application.copyEmployeeFrom","copyEmployeeFrom","copyEmployeeFrom/"+jobApplication.getId()+"/","employeeList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, JobApplication jobApplication, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public JobApplication createJobApplication(RetailscmUserContext userContext, Date applicationTime,String who,String comments) throws Exception
	//public JobApplication createJobApplication(RetailscmUserContext userContext,Date applicationTime, String who, String comments) throws Exception
	{
		
		

		

		checkerOf(userContext).checkApplicationTimeOfJobApplication(applicationTime);
		checkerOf(userContext).checkWhoOfJobApplication(who);
		checkerOf(userContext).checkCommentsOfJobApplication(comments);
	
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);


		JobApplication jobApplication=createNewJobApplication();	

		jobApplication.setApplicationTime(applicationTime);
		jobApplication.setWho(who);
		jobApplication.setComments(comments);

		jobApplication = saveJobApplication(userContext, jobApplication, emptyOptions());
		
		onNewInstanceCreated(userContext, jobApplication);
		return jobApplication;

		
	}
	protected JobApplication createNewJobApplication() 
	{
		
		return new JobApplication();		
	}
	
	protected void checkParamsForUpdatingJobApplication(RetailscmUserContext userContext,String jobApplicationId, int jobApplicationVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		checkerOf(userContext).checkVersionOfJobApplication( jobApplicationVersion);
		

		if(JobApplication.APPLICATION_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkApplicationTimeOfJobApplication(parseDate(newValueExpr));
		}
		if(JobApplication.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfJobApplication(parseString(newValueExpr));
		}
		if(JobApplication.COMMENTS_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentsOfJobApplication(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
	
		
	}
	
	
	
	public JobApplication clone(RetailscmUserContext userContext, String fromJobApplicationId) throws Exception{
		
		return jobApplicationDaoOf(userContext).clone(fromJobApplicationId, this.allTokens());
	}
	
	public JobApplication internalSaveJobApplication(RetailscmUserContext userContext, JobApplication jobApplication) throws Exception 
	{
		return internalSaveJobApplication(userContext, jobApplication, allTokens());

	}
	public JobApplication internalSaveJobApplication(RetailscmUserContext userContext, JobApplication jobApplication, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingJobApplication(userContext, jobApplicationId, jobApplicationVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(jobApplication){ 
			//will be good when the jobApplication loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to JobApplication.
			if (jobApplication.isChanged()){
			
			}
			jobApplication = saveJobApplication(userContext, jobApplication, options);
			return jobApplication;
			
		}

	}
	
	public JobApplication updateJobApplication(RetailscmUserContext userContext,String jobApplicationId, int jobApplicationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingJobApplication(userContext, jobApplicationId, jobApplicationVersion, property, newValueExpr, tokensExpr);
		
		
		
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
		if(jobApplication.getVersion() != jobApplicationVersion){
			String message = "The target version("+jobApplication.getVersion()+") is not equals to version("+jobApplicationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(jobApplication){ 
			//will be good when the jobApplication loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to JobApplication.
			
			jobApplication.changeProperty(property, newValueExpr);
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().done());
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
			//return saveJobApplication(userContext, jobApplication, tokens().done());
		}

	}
	
	public JobApplication updateJobApplicationProperty(RetailscmUserContext userContext,String jobApplicationId, int jobApplicationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingJobApplication(userContext, jobApplicationId, jobApplicationVersion, property, newValueExpr, tokensExpr);
		
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
		if(jobApplication.getVersion() != jobApplicationVersion){
			String message = "The target version("+jobApplication.getVersion()+") is not equals to version("+jobApplicationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(jobApplication){ 
			//will be good when the jobApplication loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to JobApplication.
			
			jobApplication.changeProperty(property, newValueExpr);
			
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().done());
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
			//return saveJobApplication(userContext, jobApplication, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected JobApplicationTokens tokens(){
		return JobApplicationTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return JobApplicationTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortEmployeeListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return JobApplicationTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String jobApplicationId, int jobApplicationVersion) throws Exception {
		//deleteInternal(userContext, jobApplicationId, jobApplicationVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String jobApplicationId, int jobApplicationVersion) throws Exception{
			
		jobApplicationDaoOf(userContext).delete(jobApplicationId, jobApplicationVersion);
	}
	
	public JobApplication forgetByAll(RetailscmUserContext userContext, String jobApplicationId, int jobApplicationVersion) throws Exception {
		return forgetByAllInternal(userContext, jobApplicationId, jobApplicationVersion);		
	}
	protected JobApplication forgetByAllInternal(RetailscmUserContext userContext,
			String jobApplicationId, int jobApplicationVersion) throws Exception{
			
		return jobApplicationDaoOf(userContext).disconnectFromAll(jobApplicationId, jobApplicationVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new JobApplicationManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return jobApplicationDaoOf(userContext).deleteAll();
	}


	//disconnect JobApplication with company in Employee
	protected JobApplication breakWithEmployeeByCompany(RetailscmUserContext userContext, String jobApplicationId, String companyId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithCompany(jobApplication, companyId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with department in Employee
	protected JobApplication breakWithEmployeeByDepartment(RetailscmUserContext userContext, String jobApplicationId, String departmentId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithDepartment(jobApplication, departmentId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with occupation in Employee
	protected JobApplication breakWithEmployeeByOccupation(RetailscmUserContext userContext, String jobApplicationId, String occupationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithOccupation(jobApplication, occupationId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with responsible_for in Employee
	protected JobApplication breakWithEmployeeByResponsibleFor(RetailscmUserContext userContext, String jobApplicationId, String responsibleForId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithResponsibleFor(jobApplication, responsibleForId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with current_salary_grade in Employee
	protected JobApplication breakWithEmployeeByCurrentSalaryGrade(RetailscmUserContext userContext, String jobApplicationId, String currentSalaryGradeId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithCurrentSalaryGrade(jobApplication, currentSalaryGradeId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with profession_interview in Employee
	protected JobApplication breakWithEmployeeByProfessionInterview(RetailscmUserContext userContext, String jobApplicationId, String professionInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithProfessionInterview(jobApplication, professionInterviewId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with hr_interview in Employee
	protected JobApplication breakWithEmployeeByHrInterview(RetailscmUserContext userContext, String jobApplicationId, String hrInterviewId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithHrInterview(jobApplication, hrInterviewId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with offer_approval in Employee
	protected JobApplication breakWithEmployeeByOfferApproval(RetailscmUserContext userContext, String jobApplicationId, String offerApprovalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithOfferApproval(jobApplication, offerApprovalId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with offer_acceptance in Employee
	protected JobApplication breakWithEmployeeByOfferAcceptance(RetailscmUserContext userContext, String jobApplicationId, String offerAcceptanceId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithOfferAcceptance(jobApplication, offerAcceptanceId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with employee_boarding in Employee
	protected JobApplication breakWithEmployeeByEmployeeBoarding(RetailscmUserContext userContext, String jobApplicationId, String employeeBoardingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithEmployeeBoarding(jobApplication, employeeBoardingId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	//disconnect JobApplication with termination in Employee
	protected JobApplication breakWithEmployeeByTermination(RetailscmUserContext userContext, String jobApplicationId, String terminationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());

			synchronized(jobApplication){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				jobApplicationDaoOf(userContext).planToRemoveEmployeeListWithTermination(jobApplication, terminationId, this.emptyOptions());

				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				return jobApplication;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingEmployee(RetailscmUserContext userContext, String jobApplicationId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);

		
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
		
		checkerOf(userContext).checkResponsibleForIdOfEmployee(responsibleForId);
		
		checkerOf(userContext).checkCurrentSalaryGradeIdOfEmployee(currentSalaryGradeId);
		
		checkerOf(userContext).checkSalaryAccountOfEmployee(salaryAccount);
		
		checkerOf(userContext).checkProfessionInterviewIdOfEmployee(professionInterviewId);
		
		checkerOf(userContext).checkHrInterviewIdOfEmployee(hrInterviewId);
		
		checkerOf(userContext).checkOfferApprovalIdOfEmployee(offerApprovalId);
		
		checkerOf(userContext).checkOfferAcceptanceIdOfEmployee(offerAcceptanceId);
		
		checkerOf(userContext).checkEmployeeBoardingIdOfEmployee(employeeBoardingId);
		
		checkerOf(userContext).checkTerminationIdOfEmployee(terminationId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);

	
	}
	public  JobApplication addEmployee(RetailscmUserContext userContext, String jobApplicationId, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingEmployee(userContext,jobApplicationId,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, occupationId, responsibleForId, currentSalaryGradeId, salaryAccount, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId,tokensExpr);
		
		Employee employee = createEmployee(userContext,companyId, title, departmentId, familyName, givenName, email, city, address, cellPhone, occupationId, responsibleForId, currentSalaryGradeId, salaryAccount, professionInterviewId, hrInterviewId, offerApprovalId, offerAcceptanceId, employeeBoardingId, terminationId);
		
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
		synchronized(jobApplication){ 
			//Will be good when the jobApplication loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			jobApplication.addEmployee( employee );		
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, employee);
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingEmployeeProperties(RetailscmUserContext userContext, String jobApplicationId,String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		checkerOf(userContext).checkIdOfEmployee(id);
		
		checkerOf(userContext).checkTitleOfEmployee( title);
		checkerOf(userContext).checkFamilyNameOfEmployee( familyName);
		checkerOf(userContext).checkGivenNameOfEmployee( givenName);
		checkerOf(userContext).checkEmailOfEmployee( email);
		checkerOf(userContext).checkCityOfEmployee( city);
		checkerOf(userContext).checkAddressOfEmployee( address);
		checkerOf(userContext).checkCellPhoneOfEmployee( cellPhone);
		checkerOf(userContext).checkSalaryAccountOfEmployee( salaryAccount);

		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
		
	}
	public  JobApplication updateEmployeeProperties(RetailscmUserContext userContext, String jobApplicationId, String id,String title,String familyName,String givenName,String email,String city,String address,String cellPhone,String salaryAccount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingEmployeeProperties(userContext,jobApplicationId,id,title,familyName,givenName,email,city,address,cellPhone,salaryAccount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withEmployeeListList()
				.searchEmployeeListWith(Employee.ID_PROPERTY, "is", id).done();
		
		JobApplication jobApplicationToUpdate = loadJobApplication(userContext, jobApplicationId, options);
		
		if(jobApplicationToUpdate.getEmployeeList().isEmpty()){
			throw new JobApplicationManagerException("Employee is NOT FOUND with id: '"+id+"'");
		}
		
		Employee item = jobApplicationToUpdate.getEmployeeList().first();
		
		item.updateTitle( title );
		item.updateFamilyName( familyName );
		item.updateGivenName( givenName );
		item.updateEmail( email );
		item.updateCity( city );
		item.updateAddress( address );
		item.updateCellPhone( cellPhone );
		item.updateSalaryAccount( salaryAccount );

		
		//checkParamsForAddingEmployee(userContext,jobApplicationId,name, code, used,tokensExpr);
		JobApplication jobApplication = saveJobApplication(userContext, jobApplicationToUpdate, tokens().withEmployeeList().done());
		synchronized(jobApplication){ 
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected Employee createEmployee(RetailscmUserContext userContext, String companyId, String title, String departmentId, String familyName, String givenName, String email, String city, String address, String cellPhone, String occupationId, String responsibleForId, String currentSalaryGradeId, String salaryAccount, String professionInterviewId, String hrInterviewId, String offerApprovalId, String offerAcceptanceId, String employeeBoardingId, String terminationId) throws Exception{

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
		ResponsibilityType  responsibleFor = new ResponsibilityType();
		responsibleFor.setId(responsibleForId);		
		employee.setResponsibleFor(responsibleFor);		
		SalaryGrade  currentSalaryGrade = new SalaryGrade();
		currentSalaryGrade.setId(currentSalaryGradeId);		
		employee.setCurrentSalaryGrade(currentSalaryGrade);		
		employee.setSalaryAccount(salaryAccount);		
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
	
	protected void checkParamsForRemovingEmployeeList(RetailscmUserContext userContext, String jobApplicationId, 
			String employeeIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfJobApplication(jobApplicationId);
		for(String employeeIdItem: employeeIds){
			userContext.getChecker().checkIdOfEmployee(employeeIdItem);
=======
		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
		for(String employeeIdItem: employeeIds){
			checkerOf(userContext).checkIdOfEmployee(employeeIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
		
	}
	public  JobApplication removeEmployeeList(RetailscmUserContext userContext, String jobApplicationId, 
			String employeeIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingEmployeeList(userContext, jobApplicationId,  employeeIds, tokensExpr);
			
			
			JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
			synchronized(jobApplication){ 
				//Will be good when the jobApplication loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				jobApplicationDaoOf(userContext).planToRemoveEmployeeList(jobApplication, employeeIds, allTokens());
				jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
				deleteRelationListInGraph(userContext, jobApplication.getEmployeeList());
				return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingEmployee(RetailscmUserContext userContext, String jobApplicationId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfJobApplication( jobApplicationId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
	
	}
	public  JobApplication removeEmployee(RetailscmUserContext userContext, String jobApplicationId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingEmployee(userContext,jobApplicationId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
		synchronized(jobApplication){ 
			//Will be good when the jobApplication loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			jobApplication.removeEmployee( employee );		
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
			deleteRelationInGraph(userContext, employee);
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingEmployee(RetailscmUserContext userContext, String jobApplicationId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfJobApplication( jobApplicationId);
		checkerOf(userContext).checkIdOfEmployee(employeeId);
		checkerOf(userContext).checkVersionOfEmployee(employeeVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
	
	}
	public  JobApplication copyEmployeeFrom(RetailscmUserContext userContext, String jobApplicationId, 
		String employeeId, int employeeVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingEmployee(userContext,jobApplicationId, employeeId, employeeVersion,tokensExpr);
		
		Employee employee = createIndexedEmployee(employeeId, employeeVersion);
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, allTokens());
		synchronized(jobApplication){ 
			//Will be good when the jobApplication loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			employee.updateLastUpdateTime(userContext.now());
			
			jobApplication.copyEmployeeFrom( employee );		
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
			
			userContext.getManagerGroup().getEmployeeManager().onNewInstanceCreated(userContext, (Employee)jobApplication.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingEmployee(RetailscmUserContext userContext, String jobApplicationId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfJobApplication(jobApplicationId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(JobApplicationManagerException.class);
	
	}
	
	public  JobApplication updateEmployee(RetailscmUserContext userContext, String jobApplicationId, String employeeId, int employeeVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingEmployee(userContext, jobApplicationId, employeeId, employeeVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withEmployeeList().searchEmployeeListWith(Employee.ID_PROPERTY, "eq", employeeId).done();
		
		
		
		JobApplication jobApplication = loadJobApplication(userContext, jobApplicationId, loadTokens);
		
		synchronized(jobApplication){ 
			//Will be good when the jobApplication loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//jobApplication.removeEmployee( employee );	
			//make changes to AcceleraterAccount.
			Employee employeeIndex = createIndexedEmployee(employeeId, employeeVersion);
		
			Employee employee = jobApplication.findTheEmployee(employeeIndex);
			if(employee == null){
				throw new JobApplicationManagerException(employee+" is NOT FOUND" );
			}
			
			employee.changeProperty(property, newValueExpr);
			employee.updateLastUpdateTime(userContext.now());
			jobApplication = saveJobApplication(userContext, jobApplication, tokens().withEmployeeList().done());
			return present(userContext,jobApplication, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, JobApplication newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}




package com.doublechaintech.retailscm.potentialcustomer;

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

import com.doublechaintech.retailscm.eventattendance.EventAttendance;
import com.doublechaintech.retailscm.potentialcustomercontact.PotentialCustomerContact;
import com.doublechaintech.retailscm.citypartner.CityPartner;
import com.doublechaintech.retailscm.retailstorecityservicecenter.RetailStoreCityServiceCenter;
import com.doublechaintech.retailscm.potentialcustomercontactperson.PotentialCustomerContactPerson;

import com.doublechaintech.retailscm.citypartner.CandidateCityPartner;
import com.doublechaintech.retailscm.retailstorecityservicecenter.CandidateRetailStoreCityServiceCenter;

import com.doublechaintech.retailscm.potentialcustomer.PotentialCustomer;
import com.doublechaintech.retailscm.cityevent.CityEvent;
import com.doublechaintech.retailscm.citypartner.CityPartner;
import com.doublechaintech.retailscm.potentialcustomercontactperson.PotentialCustomerContactPerson;






public class PotentialCustomerManagerImpl extends CustomRetailscmCheckerManager implements PotentialCustomerManager {
	
	private static final String SERVICE_TYPE = "PotentialCustomer";
	@Override
	public PotentialCustomerDAO daoOf(RetailscmUserContext userContext) {
		return potentialCustomerDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws PotentialCustomerManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new PotentialCustomerManagerException(message);

	}
	
	

 	protected PotentialCustomer savePotentialCustomer(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, String [] tokensExpr) throws Exception{	
 		//return getPotentialCustomerDAO().save(potentialCustomer, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return savePotentialCustomer(userContext, potentialCustomer, tokens);
 	}
 	
 	protected PotentialCustomer savePotentialCustomerDetail(RetailscmUserContext userContext, PotentialCustomer potentialCustomer) throws Exception{	

 		
 		return savePotentialCustomer(userContext, potentialCustomer, allTokens());
 	}
 	
 	public PotentialCustomer loadPotentialCustomer(RetailscmUserContext userContext, String potentialCustomerId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		PotentialCustomer potentialCustomer = loadPotentialCustomer( userContext, potentialCustomerId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,potentialCustomer, tokens);
 	}
 	
 	
 	 public PotentialCustomer searchPotentialCustomer(RetailscmUserContext userContext, String potentialCustomerId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		PotentialCustomer potentialCustomer = loadPotentialCustomer( userContext, potentialCustomerId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,potentialCustomer, tokens);
 	}
 	
 	

 	protected PotentialCustomer present(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,potentialCustomer,tokens);
		
		
		PotentialCustomer  potentialCustomerToPresent = potentialCustomerDaoOf(userContext).present(potentialCustomer, tokens);
		
		List<BaseEntity> entityListToNaming = potentialCustomerToPresent.collectRefercencesFromLists();
		potentialCustomerDaoOf(userContext).alias(entityListToNaming);
		
		return  potentialCustomerToPresent;
		
		
	}
 
 	
 	
 	public PotentialCustomer loadPotentialCustomerDetail(RetailscmUserContext userContext, String potentialCustomerId) throws Exception{	
 		PotentialCustomer potentialCustomer = loadPotentialCustomer( userContext, potentialCustomerId, allTokens());
 		return present(userContext,potentialCustomer, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String potentialCustomerId) throws Exception{	
 		PotentialCustomer potentialCustomer = loadPotentialCustomer( userContext, potentialCustomerId, viewTokens());
 		return present(userContext,potentialCustomer, allTokens());
		
 	}
 	protected PotentialCustomer savePotentialCustomer(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, Map<String,Object>tokens) throws Exception{	
 		return potentialCustomerDaoOf(userContext).save(potentialCustomer, tokens);
 	}
 	protected PotentialCustomer loadPotentialCustomer(RetailscmUserContext userContext, String potentialCustomerId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerManagerException.class);

 
 		return potentialCustomerDaoOf(userContext).load(potentialCustomerId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, Map<String, Object> tokens){
		super.addActions(userContext, potentialCustomer, tokens);
		
		addAction(userContext, potentialCustomer, tokens,"@create","createPotentialCustomer","createPotentialCustomer/","main","primary");
		addAction(userContext, potentialCustomer, tokens,"@update","updatePotentialCustomer","updatePotentialCustomer/"+potentialCustomer.getId()+"/","main","primary");
		addAction(userContext, potentialCustomer, tokens,"@copy","clonePotentialCustomer","clonePotentialCustomer/"+potentialCustomer.getId()+"/","main","primary");
		
		addAction(userContext, potentialCustomer, tokens,"potential_customer.transfer_to_city_service_center","transferToAnotherCityServiceCenter","transferToAnotherCityServiceCenter/"+potentialCustomer.getId()+"/","main","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.transfer_to_city_partner","transferToAnotherCityPartner","transferToAnotherCityPartner/"+potentialCustomer.getId()+"/","main","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.addPotentialCustomerContactPerson","addPotentialCustomerContactPerson","addPotentialCustomerContactPerson/"+potentialCustomer.getId()+"/","potentialCustomerContactPersonList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.removePotentialCustomerContactPerson","removePotentialCustomerContactPerson","removePotentialCustomerContactPerson/"+potentialCustomer.getId()+"/","potentialCustomerContactPersonList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.updatePotentialCustomerContactPerson","updatePotentialCustomerContactPerson","updatePotentialCustomerContactPerson/"+potentialCustomer.getId()+"/","potentialCustomerContactPersonList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.copyPotentialCustomerContactPersonFrom","copyPotentialCustomerContactPersonFrom","copyPotentialCustomerContactPersonFrom/"+potentialCustomer.getId()+"/","potentialCustomerContactPersonList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.addPotentialCustomerContact","addPotentialCustomerContact","addPotentialCustomerContact/"+potentialCustomer.getId()+"/","potentialCustomerContactList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.removePotentialCustomerContact","removePotentialCustomerContact","removePotentialCustomerContact/"+potentialCustomer.getId()+"/","potentialCustomerContactList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.updatePotentialCustomerContact","updatePotentialCustomerContact","updatePotentialCustomerContact/"+potentialCustomer.getId()+"/","potentialCustomerContactList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.copyPotentialCustomerContactFrom","copyPotentialCustomerContactFrom","copyPotentialCustomerContactFrom/"+potentialCustomer.getId()+"/","potentialCustomerContactList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.addEventAttendance","addEventAttendance","addEventAttendance/"+potentialCustomer.getId()+"/","eventAttendanceList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.removeEventAttendance","removeEventAttendance","removeEventAttendance/"+potentialCustomer.getId()+"/","eventAttendanceList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.updateEventAttendance","updateEventAttendance","updateEventAttendance/"+potentialCustomer.getId()+"/","eventAttendanceList","primary");
		addAction(userContext, potentialCustomer, tokens,"potential_customer.copyEventAttendanceFrom","copyEventAttendanceFrom","copyEventAttendanceFrom/"+potentialCustomer.getId()+"/","eventAttendanceList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public PotentialCustomer createPotentialCustomer(RetailscmUserContext userContext, String name,String mobile,String cityServiceCenterId,String cityPartnerId,String description) throws Exception
	//public PotentialCustomer createPotentialCustomer(RetailscmUserContext userContext,String name, String mobile, String cityServiceCenterId, String cityPartnerId, String description) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfPotentialCustomer(name);
		checkerOf(userContext).checkMobileOfPotentialCustomer(mobile);
		checkerOf(userContext).checkDescriptionOfPotentialCustomer(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);


		PotentialCustomer potentialCustomer=createNewPotentialCustomer();	

		potentialCustomer.setName(name);
		potentialCustomer.setMobile(mobile);
			
		RetailStoreCityServiceCenter cityServiceCenter = loadRetailStoreCityServiceCenter(userContext, cityServiceCenterId,emptyOptions());
		potentialCustomer.setCityServiceCenter(cityServiceCenter);
		
		
			
		CityPartner cityPartner = loadCityPartner(userContext, cityPartnerId,emptyOptions());
		potentialCustomer.setCityPartner(cityPartner);
		
		
		potentialCustomer.setDescription(description);
		potentialCustomer.setLastUpdateTime(userContext.now());

		potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, emptyOptions());
		
		onNewInstanceCreated(userContext, potentialCustomer);
		return potentialCustomer;

		
	}
	protected PotentialCustomer createNewPotentialCustomer() 
	{
		
		return new PotentialCustomer();		
	}
	
	protected void checkParamsForUpdatingPotentialCustomer(RetailscmUserContext userContext,String potentialCustomerId, int potentialCustomerVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkVersionOfPotentialCustomer( potentialCustomerVersion);
		

		if(PotentialCustomer.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfPotentialCustomer(parseString(newValueExpr));
		}
		if(PotentialCustomer.MOBILE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobileOfPotentialCustomer(parseString(newValueExpr));
		}		

				

		
		if(PotentialCustomer.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfPotentialCustomer(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
		
	}
	
	
	
	public PotentialCustomer clone(RetailscmUserContext userContext, String fromPotentialCustomerId) throws Exception{
		
		return potentialCustomerDaoOf(userContext).clone(fromPotentialCustomerId, this.allTokens());
	}
	
	public PotentialCustomer internalSavePotentialCustomer(RetailscmUserContext userContext, PotentialCustomer potentialCustomer) throws Exception 
	{
		return internalSavePotentialCustomer(userContext, potentialCustomer, allTokens());

	}
	public PotentialCustomer internalSavePotentialCustomer(RetailscmUserContext userContext, PotentialCustomer potentialCustomer, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingPotentialCustomer(userContext, potentialCustomerId, potentialCustomerVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(potentialCustomer){ 
			//will be good when the potentialCustomer loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomer.
			if (potentialCustomer.isChanged()){
			potentialCustomer.updateLastUpdateTime(userContext.now());
			}
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, options);
			return potentialCustomer;
			
		}

	}
	
	public PotentialCustomer updatePotentialCustomer(RetailscmUserContext userContext,String potentialCustomerId, int potentialCustomerVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingPotentialCustomer(userContext, potentialCustomerId, potentialCustomerVersion, property, newValueExpr, tokensExpr);
		
		
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		if(potentialCustomer.getVersion() != potentialCustomerVersion){
			String message = "The target version("+potentialCustomer.getVersion()+") is not equals to version("+potentialCustomerVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(potentialCustomer){ 
			//will be good when the potentialCustomer loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomer.
			potentialCustomer.updateLastUpdateTime(userContext.now());
			potentialCustomer.changeProperty(property, newValueExpr);
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().done());
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
			//return savePotentialCustomer(userContext, potentialCustomer, tokens().done());
		}

	}
	
	public PotentialCustomer updatePotentialCustomerProperty(RetailscmUserContext userContext,String potentialCustomerId, int potentialCustomerVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingPotentialCustomer(userContext, potentialCustomerId, potentialCustomerVersion, property, newValueExpr, tokensExpr);
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		if(potentialCustomer.getVersion() != potentialCustomerVersion){
			String message = "The target version("+potentialCustomer.getVersion()+") is not equals to version("+potentialCustomerVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(potentialCustomer){ 
			//will be good when the potentialCustomer loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomer.
			
			potentialCustomer.changeProperty(property, newValueExpr);
			potentialCustomer.updateLastUpdateTime(userContext.now());
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().done());
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
			//return savePotentialCustomer(userContext, potentialCustomer, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected PotentialCustomerTokens tokens(){
		return PotentialCustomerTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return PotentialCustomerTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortPotentialCustomerContactPersonListWith("id","desc")
		.sortPotentialCustomerContactListWith("id","desc")
		.sortEventAttendanceListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return PotentialCustomerTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherCityServiceCenter(RetailscmUserContext userContext, String potentialCustomerId, String anotherCityServiceCenterId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
 		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(anotherCityServiceCenterId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
 		
 	}
 	public PotentialCustomer transferToAnotherCityServiceCenter(RetailscmUserContext userContext, String potentialCustomerId, String anotherCityServiceCenterId) throws Exception
 	{
 		checkParamsForTransferingAnotherCityServiceCenter(userContext, potentialCustomerId,anotherCityServiceCenterId);
 
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());	
		synchronized(potentialCustomer){
			//will be good when the potentialCustomer loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreCityServiceCenter cityServiceCenter = loadRetailStoreCityServiceCenter(userContext, anotherCityServiceCenterId, emptyOptions());		
			potentialCustomer.updateCityServiceCenter(cityServiceCenter);		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, emptyOptions());
			
			return present(userContext,potentialCustomer, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateRetailStoreCityServiceCenter requestCandidateCityServiceCenter(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreCityServiceCenter result = new CandidateRetailStoreCityServiceCenter();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreCityServiceCenter> candidateList = retailStoreCityServiceCenterDaoOf(userContext).requestCandidateRetailStoreCityServiceCenterForPotentialCustomer(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherCityPartner(RetailscmUserContext userContext, String potentialCustomerId, String anotherCityPartnerId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
 		checkerOf(userContext).checkIdOfCityPartner(anotherCityPartnerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
 		
 	}
 	public PotentialCustomer transferToAnotherCityPartner(RetailscmUserContext userContext, String potentialCustomerId, String anotherCityPartnerId) throws Exception
 	{
 		checkParamsForTransferingAnotherCityPartner(userContext, potentialCustomerId,anotherCityPartnerId);
 
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());	
		synchronized(potentialCustomer){
			//will be good when the potentialCustomer loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			CityPartner cityPartner = loadCityPartner(userContext, anotherCityPartnerId, emptyOptions());		
			potentialCustomer.updateCityPartner(cityPartner);		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, emptyOptions());
			
			return present(userContext,potentialCustomer, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateCityPartner requestCandidateCityPartner(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateCityPartner result = new CandidateCityPartner();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<CityPartner> candidateList = cityPartnerDaoOf(userContext).requestCandidateCityPartnerForPotentialCustomer(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected CityPartner loadCityPartner(RetailscmUserContext userContext, String newCityPartnerId, Map<String,Object> options) throws Exception
 	{
		
 		return cityPartnerDaoOf(userContext).load(newCityPartnerId, options);
 	}
 	
 	
 	
	
	 	
 	protected RetailStoreCityServiceCenter loadRetailStoreCityServiceCenter(RetailscmUserContext userContext, String newCityServiceCenterId, Map<String,Object> options) throws Exception
 	{
		
 		return retailStoreCityServiceCenterDaoOf(userContext).load(newCityServiceCenterId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String potentialCustomerId, int potentialCustomerVersion) throws Exception {
		//deleteInternal(userContext, potentialCustomerId, potentialCustomerVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String potentialCustomerId, int potentialCustomerVersion) throws Exception{
			
		potentialCustomerDaoOf(userContext).delete(potentialCustomerId, potentialCustomerVersion);
	}
	
	public PotentialCustomer forgetByAll(RetailscmUserContext userContext, String potentialCustomerId, int potentialCustomerVersion) throws Exception {
		return forgetByAllInternal(userContext, potentialCustomerId, potentialCustomerVersion);		
	}
	protected PotentialCustomer forgetByAllInternal(RetailscmUserContext userContext,
			String potentialCustomerId, int potentialCustomerVersion) throws Exception{
			
		return potentialCustomerDaoOf(userContext).disconnectFromAll(potentialCustomerId, potentialCustomerVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new PotentialCustomerManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return potentialCustomerDaoOf(userContext).deleteAll();
	}


	//disconnect PotentialCustomer with city_partner in PotentialCustomerContact
	protected PotentialCustomer breakWithPotentialCustomerContactByCityPartner(RetailscmUserContext userContext, String potentialCustomerId, String cityPartnerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());

			synchronized(potentialCustomer){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				potentialCustomerDaoOf(userContext).planToRemovePotentialCustomerContactListWithCityPartner(potentialCustomer, cityPartnerId, this.emptyOptions());

				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
				return potentialCustomer;
			}
	}
	//disconnect PotentialCustomer with contact_to in PotentialCustomerContact
	protected PotentialCustomer breakWithPotentialCustomerContactByContactTo(RetailscmUserContext userContext, String potentialCustomerId, String contactToId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());

			synchronized(potentialCustomer){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				potentialCustomerDaoOf(userContext).planToRemovePotentialCustomerContactListWithContactTo(potentialCustomer, contactToId, this.emptyOptions());

				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
				return potentialCustomer;
			}
	}
	//disconnect PotentialCustomer with city_event in EventAttendance
	protected PotentialCustomer breakWithEventAttendanceByCityEvent(RetailscmUserContext userContext, String potentialCustomerId, String cityEventId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());

			synchronized(potentialCustomer){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				potentialCustomerDaoOf(userContext).planToRemoveEventAttendanceListWithCityEvent(potentialCustomer, cityEventId, this.emptyOptions());

				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
				return potentialCustomer;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingPotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, String name, String mobile, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);

		
		checkerOf(userContext).checkNameOfPotentialCustomerContactPerson(name);
		
		checkerOf(userContext).checkMobileOfPotentialCustomerContactPerson(mobile);
		
		checkerOf(userContext).checkDescriptionOfPotentialCustomerContactPerson(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);

	
	}
	public  PotentialCustomer addPotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, String name, String mobile, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingPotentialCustomerContactPerson(userContext,potentialCustomerId,name, mobile, description,tokensExpr);
		
		PotentialCustomerContactPerson potentialCustomerContactPerson = createPotentialCustomerContactPerson(userContext,name, mobile, description);
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.addPotentialCustomerContactPerson( potentialCustomerContactPerson );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactPersonList().done());
			
			userContext.getManagerGroup().getPotentialCustomerContactPersonManager().onNewInstanceCreated(userContext, potentialCustomerContactPerson);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingPotentialCustomerContactPersonProperties(RetailscmUserContext userContext, String potentialCustomerId,String id,String name,String mobile,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(id);
		
		checkerOf(userContext).checkNameOfPotentialCustomerContactPerson( name);
		checkerOf(userContext).checkMobileOfPotentialCustomerContactPerson( mobile);
		checkerOf(userContext).checkDescriptionOfPotentialCustomerContactPerson( description);

		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer updatePotentialCustomerContactPersonProperties(RetailscmUserContext userContext, String potentialCustomerId, String id,String name,String mobile,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingPotentialCustomerContactPersonProperties(userContext,potentialCustomerId,id,name,mobile,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withPotentialCustomerContactPersonListList()
				.searchPotentialCustomerContactPersonListWith(PotentialCustomerContactPerson.ID_PROPERTY, "is", id).done();
		
		PotentialCustomer potentialCustomerToUpdate = loadPotentialCustomer(userContext, potentialCustomerId, options);
		
		if(potentialCustomerToUpdate.getPotentialCustomerContactPersonList().isEmpty()){
			throw new PotentialCustomerManagerException("PotentialCustomerContactPerson is NOT FOUND with id: '"+id+"'");
		}
		
		PotentialCustomerContactPerson item = potentialCustomerToUpdate.getPotentialCustomerContactPersonList().first();
		
		item.updateName( name );
		item.updateMobile( mobile );
		item.updateDescription( description );

		
		//checkParamsForAddingPotentialCustomerContactPerson(userContext,potentialCustomerId,name, code, used,tokensExpr);
		PotentialCustomer potentialCustomer = savePotentialCustomer(userContext, potentialCustomerToUpdate, tokens().withPotentialCustomerContactPersonList().done());
		synchronized(potentialCustomer){ 
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected PotentialCustomerContactPerson createPotentialCustomerContactPerson(RetailscmUserContext userContext, String name, String mobile, String description) throws Exception{

		PotentialCustomerContactPerson potentialCustomerContactPerson = new PotentialCustomerContactPerson();
		
		
		potentialCustomerContactPerson.setName(name);		
		potentialCustomerContactPerson.setMobile(mobile);		
		potentialCustomerContactPerson.setDescription(description);
	
		
		return potentialCustomerContactPerson;
	
		
	}
	
	protected PotentialCustomerContactPerson createIndexedPotentialCustomerContactPerson(String id, int version){

		PotentialCustomerContactPerson potentialCustomerContactPerson = new PotentialCustomerContactPerson();
		potentialCustomerContactPerson.setId(id);
		potentialCustomerContactPerson.setVersion(version);
		return potentialCustomerContactPerson;			
		
	}
	
	protected void checkParamsForRemovingPotentialCustomerContactPersonList(RetailscmUserContext userContext, String potentialCustomerId, 
			String potentialCustomerContactPersonIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfPotentialCustomer(potentialCustomerId);
		for(String potentialCustomerContactPersonIdItem: potentialCustomerContactPersonIds){
			userContext.getChecker().checkIdOfPotentialCustomerContactPerson(potentialCustomerContactPersonIdItem);
=======
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		for(String potentialCustomerContactPersonIdItem: potentialCustomerContactPersonIds){
			checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(potentialCustomerContactPersonIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer removePotentialCustomerContactPersonList(RetailscmUserContext userContext, String potentialCustomerId, 
			String potentialCustomerContactPersonIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingPotentialCustomerContactPersonList(userContext, potentialCustomerId,  potentialCustomerContactPersonIds, tokensExpr);
			
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
			synchronized(potentialCustomer){ 
				//Will be good when the potentialCustomer loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				potentialCustomerDaoOf(userContext).planToRemovePotentialCustomerContactPersonList(potentialCustomer, potentialCustomerContactPersonIds, allTokens());
				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactPersonList().done());
				deleteRelationListInGraph(userContext, potentialCustomer.getPotentialCustomerContactPersonList());
				return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingPotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(potentialCustomerContactPersonId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContactPerson(potentialCustomerContactPersonVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer removePotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingPotentialCustomerContactPerson(userContext,potentialCustomerId, potentialCustomerContactPersonId, potentialCustomerContactPersonVersion,tokensExpr);
		
		PotentialCustomerContactPerson potentialCustomerContactPerson = createIndexedPotentialCustomerContactPerson(potentialCustomerContactPersonId, potentialCustomerContactPersonVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.removePotentialCustomerContactPerson( potentialCustomerContactPerson );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactPersonList().done());
			deleteRelationInGraph(userContext, potentialCustomerContactPerson);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingPotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(potentialCustomerContactPersonId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContactPerson(potentialCustomerContactPersonVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer copyPotentialCustomerContactPersonFrom(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingPotentialCustomerContactPerson(userContext,potentialCustomerId, potentialCustomerContactPersonId, potentialCustomerContactPersonVersion,tokensExpr);
		
		PotentialCustomerContactPerson potentialCustomerContactPerson = createIndexedPotentialCustomerContactPerson(potentialCustomerContactPersonId, potentialCustomerContactPersonVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			potentialCustomer.copyPotentialCustomerContactPersonFrom( potentialCustomerContactPerson );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactPersonList().done());
			
			userContext.getManagerGroup().getPotentialCustomerContactPersonManager().onNewInstanceCreated(userContext, (PotentialCustomerContactPerson)potentialCustomer.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingPotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(potentialCustomerContactPersonId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContactPerson(potentialCustomerContactPersonVersion);
		

		if(PotentialCustomerContactPerson.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfPotentialCustomerContactPerson(parseString(newValueExpr));
		}
		
		if(PotentialCustomerContactPerson.MOBILE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobileOfPotentialCustomerContactPerson(parseString(newValueExpr));
		}
		
		if(PotentialCustomerContactPerson.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfPotentialCustomerContactPerson(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	
	public  PotentialCustomer updatePotentialCustomerContactPerson(RetailscmUserContext userContext, String potentialCustomerId, String potentialCustomerContactPersonId, int potentialCustomerContactPersonVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingPotentialCustomerContactPerson(userContext, potentialCustomerId, potentialCustomerContactPersonId, potentialCustomerContactPersonVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withPotentialCustomerContactPersonList().searchPotentialCustomerContactPersonListWith(PotentialCustomerContactPerson.ID_PROPERTY, "eq", potentialCustomerContactPersonId).done();
		
		
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, loadTokens);
		
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//potentialCustomer.removePotentialCustomerContactPerson( potentialCustomerContactPerson );	
			//make changes to AcceleraterAccount.
			PotentialCustomerContactPerson potentialCustomerContactPersonIndex = createIndexedPotentialCustomerContactPerson(potentialCustomerContactPersonId, potentialCustomerContactPersonVersion);
		
			PotentialCustomerContactPerson potentialCustomerContactPerson = potentialCustomer.findThePotentialCustomerContactPerson(potentialCustomerContactPersonIndex);
			if(potentialCustomerContactPerson == null){
				throw new PotentialCustomerManagerException(potentialCustomerContactPerson+" is NOT FOUND" );
			}
			
			potentialCustomerContactPerson.changeProperty(property, newValueExpr);
			
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactPersonList().done());
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	protected void checkParamsForAddingPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, String name, Date contactDate, String contactMethod, String cityPartnerId, String contactToId, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);

		
		checkerOf(userContext).checkNameOfPotentialCustomerContact(name);
		
		checkerOf(userContext).checkContactDateOfPotentialCustomerContact(contactDate);
		
		checkerOf(userContext).checkContactMethodOfPotentialCustomerContact(contactMethod);
		
		checkerOf(userContext).checkCityPartnerIdOfPotentialCustomerContact(cityPartnerId);
		
		checkerOf(userContext).checkContactToIdOfPotentialCustomerContact(contactToId);
		
		checkerOf(userContext).checkDescriptionOfPotentialCustomerContact(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);

	
	}
	public  PotentialCustomer addPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, String name, Date contactDate, String contactMethod, String cityPartnerId, String contactToId, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingPotentialCustomerContact(userContext,potentialCustomerId,name, contactDate, contactMethod, cityPartnerId, contactToId, description,tokensExpr);
		
		PotentialCustomerContact potentialCustomerContact = createPotentialCustomerContact(userContext,name, contactDate, contactMethod, cityPartnerId, contactToId, description);
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.addPotentialCustomerContact( potentialCustomerContact );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
			
			userContext.getManagerGroup().getPotentialCustomerContactManager().onNewInstanceCreated(userContext, potentialCustomerContact);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingPotentialCustomerContactProperties(RetailscmUserContext userContext, String potentialCustomerId,String id,String name,Date contactDate,String contactMethod,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContact(id);
		
		checkerOf(userContext).checkNameOfPotentialCustomerContact( name);
		checkerOf(userContext).checkContactDateOfPotentialCustomerContact( contactDate);
		checkerOf(userContext).checkContactMethodOfPotentialCustomerContact( contactMethod);
		checkerOf(userContext).checkDescriptionOfPotentialCustomerContact( description);

		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer updatePotentialCustomerContactProperties(RetailscmUserContext userContext, String potentialCustomerId, String id,String name,Date contactDate,String contactMethod,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingPotentialCustomerContactProperties(userContext,potentialCustomerId,id,name,contactDate,contactMethod,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withPotentialCustomerContactListList()
				.searchPotentialCustomerContactListWith(PotentialCustomerContact.ID_PROPERTY, "is", id).done();
		
		PotentialCustomer potentialCustomerToUpdate = loadPotentialCustomer(userContext, potentialCustomerId, options);
		
		if(potentialCustomerToUpdate.getPotentialCustomerContactList().isEmpty()){
			throw new PotentialCustomerManagerException("PotentialCustomerContact is NOT FOUND with id: '"+id+"'");
		}
		
		PotentialCustomerContact item = potentialCustomerToUpdate.getPotentialCustomerContactList().first();
		
		item.updateName( name );
		item.updateContactDate( contactDate );
		item.updateContactMethod( contactMethod );
		item.updateDescription( description );

		
		//checkParamsForAddingPotentialCustomerContact(userContext,potentialCustomerId,name, code, used,tokensExpr);
		PotentialCustomer potentialCustomer = savePotentialCustomer(userContext, potentialCustomerToUpdate, tokens().withPotentialCustomerContactList().done());
		synchronized(potentialCustomer){ 
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected PotentialCustomerContact createPotentialCustomerContact(RetailscmUserContext userContext, String name, Date contactDate, String contactMethod, String cityPartnerId, String contactToId, String description) throws Exception{

		PotentialCustomerContact potentialCustomerContact = new PotentialCustomerContact();
		
		
		potentialCustomerContact.setName(name);		
		potentialCustomerContact.setContactDate(contactDate);		
		potentialCustomerContact.setContactMethod(contactMethod);		
		CityPartner  cityPartner = new CityPartner();
		cityPartner.setId(cityPartnerId);		
		potentialCustomerContact.setCityPartner(cityPartner);		
		PotentialCustomerContactPerson  contactTo = new PotentialCustomerContactPerson();
		contactTo.setId(contactToId);		
		potentialCustomerContact.setContactTo(contactTo);		
		potentialCustomerContact.setDescription(description);		
		potentialCustomerContact.setLastUpdateTime(userContext.now());
	
		
		return potentialCustomerContact;
	
		
	}
	
	protected PotentialCustomerContact createIndexedPotentialCustomerContact(String id, int version){

		PotentialCustomerContact potentialCustomerContact = new PotentialCustomerContact();
		potentialCustomerContact.setId(id);
		potentialCustomerContact.setVersion(version);
		return potentialCustomerContact;			
		
	}
	
	protected void checkParamsForRemovingPotentialCustomerContactList(RetailscmUserContext userContext, String potentialCustomerId, 
			String potentialCustomerContactIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfPotentialCustomer(potentialCustomerId);
		for(String potentialCustomerContactIdItem: potentialCustomerContactIds){
			userContext.getChecker().checkIdOfPotentialCustomerContact(potentialCustomerContactIdItem);
=======
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		for(String potentialCustomerContactIdItem: potentialCustomerContactIds){
			checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer removePotentialCustomerContactList(RetailscmUserContext userContext, String potentialCustomerId, 
			String potentialCustomerContactIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingPotentialCustomerContactList(userContext, potentialCustomerId,  potentialCustomerContactIds, tokensExpr);
			
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
			synchronized(potentialCustomer){ 
				//Will be good when the potentialCustomer loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				potentialCustomerDaoOf(userContext).planToRemovePotentialCustomerContactList(potentialCustomer, potentialCustomerContactIds, allTokens());
				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
				deleteRelationListInGraph(userContext, potentialCustomer.getPotentialCustomerContactList());
				return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactId, int potentialCustomerContactVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContact(potentialCustomerContactVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer removePotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactId, int potentialCustomerContactVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingPotentialCustomerContact(userContext,potentialCustomerId, potentialCustomerContactId, potentialCustomerContactVersion,tokensExpr);
		
		PotentialCustomerContact potentialCustomerContact = createIndexedPotentialCustomerContact(potentialCustomerContactId, potentialCustomerContactVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.removePotentialCustomerContact( potentialCustomerContact );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
			deleteRelationInGraph(userContext, potentialCustomerContact);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactId, int potentialCustomerContactVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContact(potentialCustomerContactVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer copyPotentialCustomerContactFrom(RetailscmUserContext userContext, String potentialCustomerId, 
		String potentialCustomerContactId, int potentialCustomerContactVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingPotentialCustomerContact(userContext,potentialCustomerId, potentialCustomerContactId, potentialCustomerContactVersion,tokensExpr);
		
		PotentialCustomerContact potentialCustomerContact = createIndexedPotentialCustomerContact(potentialCustomerContactId, potentialCustomerContactVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			potentialCustomerContact.updateLastUpdateTime(userContext.now());
			
			potentialCustomer.copyPotentialCustomerContactFrom( potentialCustomerContact );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
			
			userContext.getManagerGroup().getPotentialCustomerContactManager().onNewInstanceCreated(userContext, (PotentialCustomerContact)potentialCustomer.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, String potentialCustomerContactId, int potentialCustomerContactVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContact(potentialCustomerContactVersion);
		

		if(PotentialCustomerContact.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfPotentialCustomerContact(parseString(newValueExpr));
		}
		
		if(PotentialCustomerContact.CONTACT_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkContactDateOfPotentialCustomerContact(parseDate(newValueExpr));
		}
		
		if(PotentialCustomerContact.CONTACT_METHOD_PROPERTY.equals(property)){
			checkerOf(userContext).checkContactMethodOfPotentialCustomerContact(parseString(newValueExpr));
		}
		
		if(PotentialCustomerContact.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfPotentialCustomerContact(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	
	public  PotentialCustomer updatePotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerId, String potentialCustomerContactId, int potentialCustomerContactVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingPotentialCustomerContact(userContext, potentialCustomerId, potentialCustomerContactId, potentialCustomerContactVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withPotentialCustomerContactList().searchPotentialCustomerContactListWith(PotentialCustomerContact.ID_PROPERTY, "eq", potentialCustomerContactId).done();
		
		
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, loadTokens);
		
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//potentialCustomer.removePotentialCustomerContact( potentialCustomerContact );	
			//make changes to AcceleraterAccount.
			PotentialCustomerContact potentialCustomerContactIndex = createIndexedPotentialCustomerContact(potentialCustomerContactId, potentialCustomerContactVersion);
		
			PotentialCustomerContact potentialCustomerContact = potentialCustomer.findThePotentialCustomerContact(potentialCustomerContactIndex);
			if(potentialCustomerContact == null){
				throw new PotentialCustomerManagerException(potentialCustomerContact+" is NOT FOUND" );
			}
			
			potentialCustomerContact.changeProperty(property, newValueExpr);
			potentialCustomerContact.updateLastUpdateTime(userContext.now());
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withPotentialCustomerContactList().done());
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	protected void checkParamsForAddingEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, String name, String cityEventId, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);

		
		checkerOf(userContext).checkNameOfEventAttendance(name);
		
		checkerOf(userContext).checkCityEventIdOfEventAttendance(cityEventId);
		
		checkerOf(userContext).checkDescriptionOfEventAttendance(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);

	
	}
	public  PotentialCustomer addEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, String name, String cityEventId, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingEventAttendance(userContext,potentialCustomerId,name, cityEventId, description,tokensExpr);
		
		EventAttendance eventAttendance = createEventAttendance(userContext,name, cityEventId, description);
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.addEventAttendance( eventAttendance );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
			
			userContext.getManagerGroup().getEventAttendanceManager().onNewInstanceCreated(userContext, eventAttendance);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingEventAttendanceProperties(RetailscmUserContext userContext, String potentialCustomerId,String id,String name,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfEventAttendance(id);
		
		checkerOf(userContext).checkNameOfEventAttendance( name);
		checkerOf(userContext).checkDescriptionOfEventAttendance( description);

		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer updateEventAttendanceProperties(RetailscmUserContext userContext, String potentialCustomerId, String id,String name,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingEventAttendanceProperties(userContext,potentialCustomerId,id,name,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withEventAttendanceListList()
				.searchEventAttendanceListWith(EventAttendance.ID_PROPERTY, "is", id).done();
		
		PotentialCustomer potentialCustomerToUpdate = loadPotentialCustomer(userContext, potentialCustomerId, options);
		
		if(potentialCustomerToUpdate.getEventAttendanceList().isEmpty()){
			throw new PotentialCustomerManagerException("EventAttendance is NOT FOUND with id: '"+id+"'");
		}
		
		EventAttendance item = potentialCustomerToUpdate.getEventAttendanceList().first();
		
		item.updateName( name );
		item.updateDescription( description );

		
		//checkParamsForAddingEventAttendance(userContext,potentialCustomerId,name, code, used,tokensExpr);
		PotentialCustomer potentialCustomer = savePotentialCustomer(userContext, potentialCustomerToUpdate, tokens().withEventAttendanceList().done());
		synchronized(potentialCustomer){ 
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected EventAttendance createEventAttendance(RetailscmUserContext userContext, String name, String cityEventId, String description) throws Exception{

		EventAttendance eventAttendance = new EventAttendance();
		
		
		eventAttendance.setName(name);		
		CityEvent  cityEvent = new CityEvent();
		cityEvent.setId(cityEventId);		
		eventAttendance.setCityEvent(cityEvent);		
		eventAttendance.setDescription(description);
	
		
		return eventAttendance;
	
		
	}
	
	protected EventAttendance createIndexedEventAttendance(String id, int version){

		EventAttendance eventAttendance = new EventAttendance();
		eventAttendance.setId(id);
		eventAttendance.setVersion(version);
		return eventAttendance;			
		
	}
	
	protected void checkParamsForRemovingEventAttendanceList(RetailscmUserContext userContext, String potentialCustomerId, 
			String eventAttendanceIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfPotentialCustomer(potentialCustomerId);
		for(String eventAttendanceIdItem: eventAttendanceIds){
			userContext.getChecker().checkIdOfEventAttendance(eventAttendanceIdItem);
=======
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		for(String eventAttendanceIdItem: eventAttendanceIds){
			checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
		
	}
	public  PotentialCustomer removeEventAttendanceList(RetailscmUserContext userContext, String potentialCustomerId, 
			String eventAttendanceIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingEventAttendanceList(userContext, potentialCustomerId,  eventAttendanceIds, tokensExpr);
			
			
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
			synchronized(potentialCustomer){ 
				//Will be good when the potentialCustomer loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				potentialCustomerDaoOf(userContext).planToRemoveEventAttendanceList(potentialCustomer, eventAttendanceIds, allTokens());
				potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
				deleteRelationListInGraph(userContext, potentialCustomer.getEventAttendanceList());
				return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, 
		String eventAttendanceId, int eventAttendanceVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).checkVersionOfEventAttendance(eventAttendanceVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer removeEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, 
		String eventAttendanceId, int eventAttendanceVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingEventAttendance(userContext,potentialCustomerId, eventAttendanceId, eventAttendanceVersion,tokensExpr);
		
		EventAttendance eventAttendance = createIndexedEventAttendance(eventAttendanceId, eventAttendanceVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			potentialCustomer.removeEventAttendance( eventAttendance );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
			deleteRelationInGraph(userContext, eventAttendance);
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, 
		String eventAttendanceId, int eventAttendanceVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfPotentialCustomer( potentialCustomerId);
		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).checkVersionOfEventAttendance(eventAttendanceVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	public  PotentialCustomer copyEventAttendanceFrom(RetailscmUserContext userContext, String potentialCustomerId, 
		String eventAttendanceId, int eventAttendanceVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingEventAttendance(userContext,potentialCustomerId, eventAttendanceId, eventAttendanceVersion,tokensExpr);
		
		EventAttendance eventAttendance = createIndexedEventAttendance(eventAttendanceId, eventAttendanceVersion);
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, allTokens());
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			potentialCustomer.copyEventAttendanceFrom( eventAttendance );		
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
			
			userContext.getManagerGroup().getEventAttendanceManager().onNewInstanceCreated(userContext, (EventAttendance)potentialCustomer.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).checkVersionOfEventAttendance(eventAttendanceVersion);
		

		if(EventAttendance.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfEventAttendance(parseString(newValueExpr));
		}
		
		if(EventAttendance.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfEventAttendance(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerManagerException.class);
	
	}
	
	public  PotentialCustomer updateEventAttendance(RetailscmUserContext userContext, String potentialCustomerId, String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingEventAttendance(userContext, potentialCustomerId, eventAttendanceId, eventAttendanceVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withEventAttendanceList().searchEventAttendanceListWith(EventAttendance.ID_PROPERTY, "eq", eventAttendanceId).done();
		
		
		
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId, loadTokens);
		
		synchronized(potentialCustomer){ 
			//Will be good when the potentialCustomer loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//potentialCustomer.removeEventAttendance( eventAttendance );	
			//make changes to AcceleraterAccount.
			EventAttendance eventAttendanceIndex = createIndexedEventAttendance(eventAttendanceId, eventAttendanceVersion);
		
			EventAttendance eventAttendance = potentialCustomer.findTheEventAttendance(eventAttendanceIndex);
			if(eventAttendance == null){
				throw new PotentialCustomerManagerException(eventAttendance+" is NOT FOUND" );
			}
			
			eventAttendance.changeProperty(property, newValueExpr);
			
			potentialCustomer = savePotentialCustomer(userContext, potentialCustomer, tokens().withEventAttendanceList().done());
			return present(userContext,potentialCustomer, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, PotentialCustomer newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



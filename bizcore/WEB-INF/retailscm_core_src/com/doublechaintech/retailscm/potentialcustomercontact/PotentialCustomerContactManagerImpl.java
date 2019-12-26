
package com.doublechaintech.retailscm.potentialcustomercontact;

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

import com.doublechaintech.retailscm.potentialcustomer.PotentialCustomer;
import com.doublechaintech.retailscm.citypartner.CityPartner;
import com.doublechaintech.retailscm.potentialcustomercontactperson.PotentialCustomerContactPerson;

import com.doublechaintech.retailscm.potentialcustomer.CandidatePotentialCustomer;
import com.doublechaintech.retailscm.citypartner.CandidateCityPartner;
import com.doublechaintech.retailscm.potentialcustomercontactperson.CandidatePotentialCustomerContactPerson;







public class PotentialCustomerContactManagerImpl extends CustomRetailscmCheckerManager implements PotentialCustomerContactManager {
	
	private static final String SERVICE_TYPE = "PotentialCustomerContact";
	@Override
	public PotentialCustomerContactDAO daoOf(RetailscmUserContext userContext) {
		return potentialCustomerContactDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws PotentialCustomerContactManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new PotentialCustomerContactManagerException(message);

	}
	
	

 	protected PotentialCustomerContact savePotentialCustomerContact(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, String [] tokensExpr) throws Exception{	
 		//return getPotentialCustomerContactDAO().save(potentialCustomerContact, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return savePotentialCustomerContact(userContext, potentialCustomerContact, tokens);
 	}
 	
 	protected PotentialCustomerContact savePotentialCustomerContactDetail(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact) throws Exception{	

 		
 		return savePotentialCustomerContact(userContext, potentialCustomerContact, allTokens());
 	}
 	
 	public PotentialCustomerContact loadPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerContactId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerContactManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact( userContext, potentialCustomerContactId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,potentialCustomerContact, tokens);
 	}
 	
 	
 	 public PotentialCustomerContact searchPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerContactId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerContactManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact( userContext, potentialCustomerContactId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,potentialCustomerContact, tokens);
 	}
 	
 	

 	protected PotentialCustomerContact present(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,potentialCustomerContact,tokens);
		
		
		PotentialCustomerContact  potentialCustomerContactToPresent = potentialCustomerContactDaoOf(userContext).present(potentialCustomerContact, tokens);
		
		List<BaseEntity> entityListToNaming = potentialCustomerContactToPresent.collectRefercencesFromLists();
		potentialCustomerContactDaoOf(userContext).alias(entityListToNaming);
		
		return  potentialCustomerContactToPresent;
		
		
	}
 
 	
 	
 	public PotentialCustomerContact loadPotentialCustomerContactDetail(RetailscmUserContext userContext, String potentialCustomerContactId) throws Exception{	
 		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact( userContext, potentialCustomerContactId, allTokens());
 		return present(userContext,potentialCustomerContact, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String potentialCustomerContactId) throws Exception{	
 		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact( userContext, potentialCustomerContactId, viewTokens());
 		return present(userContext,potentialCustomerContact, allTokens());
		
 	}
 	protected PotentialCustomerContact savePotentialCustomerContact(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, Map<String,Object>tokens) throws Exception{	
 		return potentialCustomerContactDaoOf(userContext).save(potentialCustomerContact, tokens);
 	}
 	protected PotentialCustomerContact loadPotentialCustomerContact(RetailscmUserContext userContext, String potentialCustomerContactId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).throwExceptionIfHasErrors( PotentialCustomerContactManagerException.class);

 
 		return potentialCustomerContactDaoOf(userContext).load(potentialCustomerContactId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, Map<String, Object> tokens){
		super.addActions(userContext, potentialCustomerContact, tokens);
		
		addAction(userContext, potentialCustomerContact, tokens,"@create","createPotentialCustomerContact","createPotentialCustomerContact/","main","primary");
		addAction(userContext, potentialCustomerContact, tokens,"@update","updatePotentialCustomerContact","updatePotentialCustomerContact/"+potentialCustomerContact.getId()+"/","main","primary");
		addAction(userContext, potentialCustomerContact, tokens,"@copy","clonePotentialCustomerContact","clonePotentialCustomerContact/"+potentialCustomerContact.getId()+"/","main","primary");
		
		addAction(userContext, potentialCustomerContact, tokens,"potential_customer_contact.transfer_to_potential_customer","transferToAnotherPotentialCustomer","transferToAnotherPotentialCustomer/"+potentialCustomerContact.getId()+"/","main","primary");
		addAction(userContext, potentialCustomerContact, tokens,"potential_customer_contact.transfer_to_city_partner","transferToAnotherCityPartner","transferToAnotherCityPartner/"+potentialCustomerContact.getId()+"/","main","primary");
		addAction(userContext, potentialCustomerContact, tokens,"potential_customer_contact.transfer_to_contact_to","transferToAnotherContactTo","transferToAnotherContactTo/"+potentialCustomerContact.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public PotentialCustomerContact createPotentialCustomerContact(RetailscmUserContext userContext, String name,Date contactDate,String contactMethod,String potentialCustomerId,String cityPartnerId,String contactToId,String description) throws Exception
	//public PotentialCustomerContact createPotentialCustomerContact(RetailscmUserContext userContext,String name, Date contactDate, String contactMethod, String potentialCustomerId, String cityPartnerId, String contactToId, String description) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfPotentialCustomerContact(name);
		checkerOf(userContext).checkContactDateOfPotentialCustomerContact(contactDate);
		checkerOf(userContext).checkContactMethodOfPotentialCustomerContact(contactMethod);
		checkerOf(userContext).checkDescriptionOfPotentialCustomerContact(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerContactManagerException.class);


		PotentialCustomerContact potentialCustomerContact=createNewPotentialCustomerContact();	

		potentialCustomerContact.setName(name);
		potentialCustomerContact.setContactDate(contactDate);
		potentialCustomerContact.setContactMethod(contactMethod);
			
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId,emptyOptions());
		potentialCustomerContact.setPotentialCustomer(potentialCustomer);
		
		
			
		CityPartner cityPartner = loadCityPartner(userContext, cityPartnerId,emptyOptions());
		potentialCustomerContact.setCityPartner(cityPartner);
		
		
			
		PotentialCustomerContactPerson contactTo = loadPotentialCustomerContactPerson(userContext, contactToId,emptyOptions());
		potentialCustomerContact.setContactTo(contactTo);
		
		
		potentialCustomerContact.setDescription(description);
		potentialCustomerContact.setLastUpdateTime(userContext.now());

		potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, emptyOptions());
		
		onNewInstanceCreated(userContext, potentialCustomerContact);
		return potentialCustomerContact;

		
	}
	protected PotentialCustomerContact createNewPotentialCustomerContact() 
	{
		
		return new PotentialCustomerContact();		
	}
	
	protected void checkParamsForUpdatingPotentialCustomerContact(RetailscmUserContext userContext,String potentialCustomerContactId, int potentialCustomerContactVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
		checkerOf(userContext).checkVersionOfPotentialCustomerContact( potentialCustomerContactVersion);
		

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
	
		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerContactManagerException.class);
	
		
	}
	
	
	
	public PotentialCustomerContact clone(RetailscmUserContext userContext, String fromPotentialCustomerContactId) throws Exception{
		
		return potentialCustomerContactDaoOf(userContext).clone(fromPotentialCustomerContactId, this.allTokens());
	}
	
	public PotentialCustomerContact internalSavePotentialCustomerContact(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact) throws Exception 
	{
		return internalSavePotentialCustomerContact(userContext, potentialCustomerContact, allTokens());

	}
	public PotentialCustomerContact internalSavePotentialCustomerContact(RetailscmUserContext userContext, PotentialCustomerContact potentialCustomerContact, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingPotentialCustomerContact(userContext, potentialCustomerContactId, potentialCustomerContactVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(potentialCustomerContact){ 
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomerContact.
			if (potentialCustomerContact.isChanged()){
			potentialCustomerContact.updateLastUpdateTime(userContext.now());
			}
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, options);
			return potentialCustomerContact;
			
		}

	}
	
	public PotentialCustomerContact updatePotentialCustomerContact(RetailscmUserContext userContext,String potentialCustomerContactId, int potentialCustomerContactVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingPotentialCustomerContact(userContext, potentialCustomerContactId, potentialCustomerContactVersion, property, newValueExpr, tokensExpr);
		
		
		
		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact(userContext, potentialCustomerContactId, allTokens());
		if(potentialCustomerContact.getVersion() != potentialCustomerContactVersion){
			String message = "The target version("+potentialCustomerContact.getVersion()+") is not equals to version("+potentialCustomerContactVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(potentialCustomerContact){ 
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomerContact.
			potentialCustomerContact.updateLastUpdateTime(userContext.now());
			potentialCustomerContact.changeProperty(property, newValueExpr);
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, tokens().done());
			return present(userContext,potentialCustomerContact, mergedAllTokens(tokensExpr));
			//return savePotentialCustomerContact(userContext, potentialCustomerContact, tokens().done());
		}

	}
	
	public PotentialCustomerContact updatePotentialCustomerContactProperty(RetailscmUserContext userContext,String potentialCustomerContactId, int potentialCustomerContactVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingPotentialCustomerContact(userContext, potentialCustomerContactId, potentialCustomerContactVersion, property, newValueExpr, tokensExpr);
		
		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact(userContext, potentialCustomerContactId, allTokens());
		if(potentialCustomerContact.getVersion() != potentialCustomerContactVersion){
			String message = "The target version("+potentialCustomerContact.getVersion()+") is not equals to version("+potentialCustomerContactVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(potentialCustomerContact){ 
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to PotentialCustomerContact.
			
			potentialCustomerContact.changeProperty(property, newValueExpr);
			potentialCustomerContact.updateLastUpdateTime(userContext.now());
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, tokens().done());
			return present(userContext,potentialCustomerContact, mergedAllTokens(tokensExpr));
			//return savePotentialCustomerContact(userContext, potentialCustomerContact, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected PotentialCustomerContactTokens tokens(){
		return PotentialCustomerContactTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return PotentialCustomerContactTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return PotentialCustomerContactTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherPotentialCustomer(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherPotentialCustomerId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
 		checkerOf(userContext).checkIdOfPotentialCustomer(anotherPotentialCustomerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerContactManagerException.class);
 		
 	}
 	public PotentialCustomerContact transferToAnotherPotentialCustomer(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherPotentialCustomerId) throws Exception
 	{
 		checkParamsForTransferingAnotherPotentialCustomer(userContext, potentialCustomerContactId,anotherPotentialCustomerId);
 
		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact(userContext, potentialCustomerContactId, allTokens());	
		synchronized(potentialCustomerContact){
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, anotherPotentialCustomerId, emptyOptions());		
			potentialCustomerContact.updatePotentialCustomer(potentialCustomer);		
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, emptyOptions());
			
			return present(userContext,potentialCustomerContact, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidatePotentialCustomer requestCandidatePotentialCustomer(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidatePotentialCustomer result = new CandidatePotentialCustomer();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<PotentialCustomer> candidateList = potentialCustomerDaoOf(userContext).requestCandidatePotentialCustomerForPotentialCustomerContact(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherCityPartner(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherCityPartnerId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
 		checkerOf(userContext).checkIdOfCityPartner(anotherCityPartnerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerContactManagerException.class);
 		
 	}
 	public PotentialCustomerContact transferToAnotherCityPartner(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherCityPartnerId) throws Exception
 	{
 		checkParamsForTransferingAnotherCityPartner(userContext, potentialCustomerContactId,anotherCityPartnerId);
 
		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact(userContext, potentialCustomerContactId, allTokens());	
		synchronized(potentialCustomerContact){
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			CityPartner cityPartner = loadCityPartner(userContext, anotherCityPartnerId, emptyOptions());		
			potentialCustomerContact.updateCityPartner(cityPartner);		
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, emptyOptions());
			
			return present(userContext,potentialCustomerContact, allTokens());
			
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
		SmartList<CityPartner> candidateList = cityPartnerDaoOf(userContext).requestCandidateCityPartnerForPotentialCustomerContact(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherContactTo(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherContactToId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfPotentialCustomerContact(potentialCustomerContactId);
 		checkerOf(userContext).checkIdOfPotentialCustomerContactPerson(anotherContactToId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(PotentialCustomerContactManagerException.class);
 		
 	}
 	public PotentialCustomerContact transferToAnotherContactTo(RetailscmUserContext userContext, String potentialCustomerContactId, String anotherContactToId) throws Exception
 	{
 		checkParamsForTransferingAnotherContactTo(userContext, potentialCustomerContactId,anotherContactToId);
 
		PotentialCustomerContact potentialCustomerContact = loadPotentialCustomerContact(userContext, potentialCustomerContactId, allTokens());	
		synchronized(potentialCustomerContact){
			//will be good when the potentialCustomerContact loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			PotentialCustomerContactPerson contactTo = loadPotentialCustomerContactPerson(userContext, anotherContactToId, emptyOptions());		
			potentialCustomerContact.updateContactTo(contactTo);		
			potentialCustomerContact = savePotentialCustomerContact(userContext, potentialCustomerContact, emptyOptions());
			
			return present(userContext,potentialCustomerContact, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidatePotentialCustomerContactPerson requestCandidateContactTo(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidatePotentialCustomerContactPerson result = new CandidatePotentialCustomerContactPerson();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<PotentialCustomerContactPerson> candidateList = potentialCustomerContactPersonDaoOf(userContext).requestCandidatePotentialCustomerContactPersonForPotentialCustomerContact(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected PotentialCustomer loadPotentialCustomer(RetailscmUserContext userContext, String newPotentialCustomerId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getPotentialCustomerDAO().load(newPotentialCustomerId, options);
=======
 		return potentialCustomerDaoOf(userContext).load(newPotentialCustomerId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	 	
 	protected CityPartner loadCityPartner(RetailscmUserContext userContext, String newCityPartnerId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getCityPartnerDAO().load(newCityPartnerId, options);
=======
 		return cityPartnerDaoOf(userContext).load(newCityPartnerId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	 	
 	protected PotentialCustomerContactPerson loadPotentialCustomerContactPerson(RetailscmUserContext userContext, String newContactToId, Map<String,Object> options) throws Exception
 	{
		
 		return potentialCustomerContactPersonDaoOf(userContext).load(newContactToId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String potentialCustomerContactId, int potentialCustomerContactVersion) throws Exception {
		//deleteInternal(userContext, potentialCustomerContactId, potentialCustomerContactVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String potentialCustomerContactId, int potentialCustomerContactVersion) throws Exception{
			
		potentialCustomerContactDaoOf(userContext).delete(potentialCustomerContactId, potentialCustomerContactVersion);
	}
	
	public PotentialCustomerContact forgetByAll(RetailscmUserContext userContext, String potentialCustomerContactId, int potentialCustomerContactVersion) throws Exception {
		return forgetByAllInternal(userContext, potentialCustomerContactId, potentialCustomerContactVersion);		
	}
	protected PotentialCustomerContact forgetByAllInternal(RetailscmUserContext userContext,
			String potentialCustomerContactId, int potentialCustomerContactVersion) throws Exception{
			
		return potentialCustomerContactDaoOf(userContext).disconnectFromAll(potentialCustomerContactId, potentialCustomerContactVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new PotentialCustomerContactManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return potentialCustomerContactDaoOf(userContext).deleteAll();
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, PotentialCustomerContact newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



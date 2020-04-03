
package com.doublechaintech.retailscm.eventattendance;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.potentialcustomer.PotentialCustomer;
import com.doublechaintech.retailscm.cityevent.CityEvent;

import com.doublechaintech.retailscm.potentialcustomer.CandidatePotentialCustomer;
import com.doublechaintech.retailscm.cityevent.CandidateCityEvent;







public class EventAttendanceManagerImpl extends CustomRetailscmCheckerManager implements EventAttendanceManager {

  


	private static final String SERVICE_TYPE = "EventAttendance";
	@Override
	public EventAttendanceDAO daoOf(RetailscmUserContext userContext) {
		return eventAttendanceDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws EventAttendanceManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new EventAttendanceManagerException(message);

	}



 	protected EventAttendance saveEventAttendance(RetailscmUserContext userContext, EventAttendance eventAttendance, String [] tokensExpr) throws Exception{	
 		//return getEventAttendanceDAO().save(eventAttendance, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveEventAttendance(userContext, eventAttendance, tokens);
 	}
 	
 	protected EventAttendance saveEventAttendanceDetail(RetailscmUserContext userContext, EventAttendance eventAttendance) throws Exception{	

 		
 		return saveEventAttendance(userContext, eventAttendance, allTokens());
 	}
 	
 	public EventAttendance loadEventAttendance(RetailscmUserContext userContext, String eventAttendanceId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EventAttendanceManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		EventAttendance eventAttendance = loadEventAttendance( userContext, eventAttendanceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,eventAttendance, tokens);
 	}
 	
 	
 	 public EventAttendance searchEventAttendance(RetailscmUserContext userContext, String eventAttendanceId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EventAttendanceManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		EventAttendance eventAttendance = loadEventAttendance( userContext, eventAttendanceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,eventAttendance, tokens);
 	}
 	
 	

 	protected EventAttendance present(RetailscmUserContext userContext, EventAttendance eventAttendance, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,eventAttendance,tokens);
		
		
		EventAttendance  eventAttendanceToPresent = eventAttendanceDaoOf(userContext).present(eventAttendance, tokens);
		
		List<BaseEntity> entityListToNaming = eventAttendanceToPresent.collectRefercencesFromLists();
		eventAttendanceDaoOf(userContext).alias(entityListToNaming);
		
		return  eventAttendanceToPresent;
		
		
	}
 
 	
 	
 	public EventAttendance loadEventAttendanceDetail(RetailscmUserContext userContext, String eventAttendanceId) throws Exception{	
 		EventAttendance eventAttendance = loadEventAttendance( userContext, eventAttendanceId, allTokens());
 		return present(userContext,eventAttendance, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String eventAttendanceId) throws Exception{	
 		EventAttendance eventAttendance = loadEventAttendance( userContext, eventAttendanceId, viewTokens());
 		return present(userContext,eventAttendance, allTokens());
		
 	}
 	protected EventAttendance saveEventAttendance(RetailscmUserContext userContext, EventAttendance eventAttendance, Map<String,Object>tokens) throws Exception{	
 		return eventAttendanceDaoOf(userContext).save(eventAttendance, tokens);
 	}
 	protected EventAttendance loadEventAttendance(RetailscmUserContext userContext, String eventAttendanceId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).throwExceptionIfHasErrors( EventAttendanceManagerException.class);

 
 		return eventAttendanceDaoOf(userContext).load(eventAttendanceId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EventAttendance eventAttendance, Map<String, Object> tokens){
		super.addActions(userContext, eventAttendance, tokens);
		
		addAction(userContext, eventAttendance, tokens,"@create","createEventAttendance","createEventAttendance/","main","primary");
		addAction(userContext, eventAttendance, tokens,"@update","updateEventAttendance","updateEventAttendance/"+eventAttendance.getId()+"/","main","primary");
		addAction(userContext, eventAttendance, tokens,"@copy","cloneEventAttendance","cloneEventAttendance/"+eventAttendance.getId()+"/","main","primary");
		
		addAction(userContext, eventAttendance, tokens,"event_attendance.transfer_to_potential_customer","transferToAnotherPotentialCustomer","transferToAnotherPotentialCustomer/"+eventAttendance.getId()+"/","main","primary");
		addAction(userContext, eventAttendance, tokens,"event_attendance.transfer_to_city_event","transferToAnotherCityEvent","transferToAnotherCityEvent/"+eventAttendance.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, EventAttendance eventAttendance, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public EventAttendance createEventAttendance(RetailscmUserContext userContext, String name,String potentialCustomerId,String cityEventId,String description) throws Exception
	//public EventAttendance createEventAttendance(RetailscmUserContext userContext,String name, String potentialCustomerId, String cityEventId, String description) throws Exception
	{

		

		

		checkerOf(userContext).checkNameOfEventAttendance(name);
		checkerOf(userContext).checkDescriptionOfEventAttendance(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(EventAttendanceManagerException.class);


		EventAttendance eventAttendance=createNewEventAttendance();	

		eventAttendance.setName(name);
			
		PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, potentialCustomerId,emptyOptions());
		eventAttendance.setPotentialCustomer(potentialCustomer);
		
		
			
		CityEvent cityEvent = loadCityEvent(userContext, cityEventId,emptyOptions());
		eventAttendance.setCityEvent(cityEvent);
		
		
		eventAttendance.setDescription(description);

		eventAttendance = saveEventAttendance(userContext, eventAttendance, emptyOptions());
		
		onNewInstanceCreated(userContext, eventAttendance);
		return eventAttendance;


	}
	protected EventAttendance createNewEventAttendance()
	{

		return new EventAttendance();
	}

	protected void checkParamsForUpdatingEventAttendance(RetailscmUserContext userContext,String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
		checkerOf(userContext).checkVersionOfEventAttendance( eventAttendanceVersion);
		

		if(EventAttendance.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfEventAttendance(parseString(newValueExpr));
		}		

				

		
		if(EventAttendance.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfEventAttendance(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(EventAttendanceManagerException.class);


	}



	public EventAttendance clone(RetailscmUserContext userContext, String fromEventAttendanceId) throws Exception{

		return eventAttendanceDaoOf(userContext).clone(fromEventAttendanceId, this.allTokens());
	}

	public EventAttendance internalSaveEventAttendance(RetailscmUserContext userContext, EventAttendance eventAttendance) throws Exception
	{
		return internalSaveEventAttendance(userContext, eventAttendance, allTokens());

	}
	public EventAttendance internalSaveEventAttendance(RetailscmUserContext userContext, EventAttendance eventAttendance, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingEventAttendance(userContext, eventAttendanceId, eventAttendanceVersion, property, newValueExpr, tokensExpr);


		synchronized(eventAttendance){
			//will be good when the eventAttendance loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EventAttendance.
			if (eventAttendance.isChanged()){
			
			}
			eventAttendance = saveEventAttendance(userContext, eventAttendance, options);
			return eventAttendance;

		}

	}

	public EventAttendance updateEventAttendance(RetailscmUserContext userContext,String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEventAttendance(userContext, eventAttendanceId, eventAttendanceVersion, property, newValueExpr, tokensExpr);



		EventAttendance eventAttendance = loadEventAttendance(userContext, eventAttendanceId, allTokens());
		if(eventAttendance.getVersion() != eventAttendanceVersion){
			String message = "The target version("+eventAttendance.getVersion()+") is not equals to version("+eventAttendanceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(eventAttendance){
			//will be good when the eventAttendance loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EventAttendance.
			
			eventAttendance.changeProperty(property, newValueExpr);
			eventAttendance = saveEventAttendance(userContext, eventAttendance, tokens().done());
			return present(userContext,eventAttendance, mergedAllTokens(tokensExpr));
			//return saveEventAttendance(userContext, eventAttendance, tokens().done());
		}

	}

	public EventAttendance updateEventAttendanceProperty(RetailscmUserContext userContext,String eventAttendanceId, int eventAttendanceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingEventAttendance(userContext, eventAttendanceId, eventAttendanceVersion, property, newValueExpr, tokensExpr);

		EventAttendance eventAttendance = loadEventAttendance(userContext, eventAttendanceId, allTokens());
		if(eventAttendance.getVersion() != eventAttendanceVersion){
			String message = "The target version("+eventAttendance.getVersion()+") is not equals to version("+eventAttendanceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(eventAttendance){
			//will be good when the eventAttendance loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to EventAttendance.

			eventAttendance.changeProperty(property, newValueExpr);
			
			eventAttendance = saveEventAttendance(userContext, eventAttendance, tokens().done());
			return present(userContext,eventAttendance, mergedAllTokens(tokensExpr));
			//return saveEventAttendance(userContext, eventAttendance, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected EventAttendanceTokens tokens(){
		return EventAttendanceTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return EventAttendanceTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return EventAttendanceTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherPotentialCustomer(RetailscmUserContext userContext, String eventAttendanceId, String anotherPotentialCustomerId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
 		checkerOf(userContext).checkIdOfPotentialCustomer(anotherPotentialCustomerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EventAttendanceManagerException.class);

 	}
 	public EventAttendance transferToAnotherPotentialCustomer(RetailscmUserContext userContext, String eventAttendanceId, String anotherPotentialCustomerId) throws Exception
 	{
 		checkParamsForTransferingAnotherPotentialCustomer(userContext, eventAttendanceId,anotherPotentialCustomerId);
 
		EventAttendance eventAttendance = loadEventAttendance(userContext, eventAttendanceId, allTokens());	
		synchronized(eventAttendance){
			//will be good when the eventAttendance loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			PotentialCustomer potentialCustomer = loadPotentialCustomer(userContext, anotherPotentialCustomerId, emptyOptions());		
			eventAttendance.updatePotentialCustomer(potentialCustomer);		
			eventAttendance = saveEventAttendance(userContext, eventAttendance, emptyOptions());
			
			return present(userContext,eventAttendance, allTokens());
			
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
		SmartList<PotentialCustomer> candidateList = potentialCustomerDaoOf(userContext).requestCandidatePotentialCustomerForEventAttendance(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherCityEvent(RetailscmUserContext userContext, String eventAttendanceId, String anotherCityEventId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfEventAttendance(eventAttendanceId);
 		checkerOf(userContext).checkIdOfCityEvent(anotherCityEventId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(EventAttendanceManagerException.class);

 	}
 	public EventAttendance transferToAnotherCityEvent(RetailscmUserContext userContext, String eventAttendanceId, String anotherCityEventId) throws Exception
 	{
 		checkParamsForTransferingAnotherCityEvent(userContext, eventAttendanceId,anotherCityEventId);
 
		EventAttendance eventAttendance = loadEventAttendance(userContext, eventAttendanceId, allTokens());	
		synchronized(eventAttendance){
			//will be good when the eventAttendance loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			CityEvent cityEvent = loadCityEvent(userContext, anotherCityEventId, emptyOptions());		
			eventAttendance.updateCityEvent(cityEvent);		
			eventAttendance = saveEventAttendance(userContext, eventAttendance, emptyOptions());
			
			return present(userContext,eventAttendance, allTokens());
			
		}

 	}

	


	public CandidateCityEvent requestCandidateCityEvent(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateCityEvent result = new CandidateCityEvent();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<CityEvent> candidateList = cityEventDaoOf(userContext).requestCandidateCityEventForEventAttendance(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected PotentialCustomer loadPotentialCustomer(RetailscmUserContext userContext, String newPotentialCustomerId, Map<String,Object> options) throws Exception
 	{

 		return potentialCustomerDaoOf(userContext).load(newPotentialCustomerId, options);
 	}
 	


	

 	protected CityEvent loadCityEvent(RetailscmUserContext userContext, String newCityEventId, Map<String,Object> options) throws Exception
 	{

 		return cityEventDaoOf(userContext).load(newCityEventId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String eventAttendanceId, int eventAttendanceVersion) throws Exception {
		//deleteInternal(userContext, eventAttendanceId, eventAttendanceVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String eventAttendanceId, int eventAttendanceVersion) throws Exception{

		eventAttendanceDaoOf(userContext).delete(eventAttendanceId, eventAttendanceVersion);
	}

	public EventAttendance forgetByAll(RetailscmUserContext userContext, String eventAttendanceId, int eventAttendanceVersion) throws Exception {
		return forgetByAllInternal(userContext, eventAttendanceId, eventAttendanceVersion);
	}
	protected EventAttendance forgetByAllInternal(RetailscmUserContext userContext,
			String eventAttendanceId, int eventAttendanceVersion) throws Exception{

		return eventAttendanceDaoOf(userContext).disconnectFromAll(eventAttendanceId, eventAttendanceVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new EventAttendanceManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return eventAttendanceDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, EventAttendance newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



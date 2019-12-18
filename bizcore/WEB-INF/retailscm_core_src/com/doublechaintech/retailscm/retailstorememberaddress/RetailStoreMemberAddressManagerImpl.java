
package com.doublechaintech.retailscm.retailstorememberaddress;

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

import com.doublechaintech.retailscm.retailstoremember.RetailStoreMember;

import com.doublechaintech.retailscm.retailstoremember.CandidateRetailStoreMember;







public class RetailStoreMemberAddressManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreMemberAddressManager {
	
	private static final String SERVICE_TYPE = "RetailStoreMemberAddress";
	@Override
	public RetailStoreMemberAddressDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreMemberAddressDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreMemberAddressManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreMemberAddressManagerException(message);

	}
	
	

 	protected RetailStoreMemberAddress saveRetailStoreMemberAddress(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreMemberAddressDAO().save(retailStoreMemberAddress, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, tokens);
 	}
 	
 	protected RetailStoreMemberAddress saveRetailStoreMemberAddressDetail(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress) throws Exception{	

 		
 		return saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, allTokens());
 	}
 	
 	public RetailStoreMemberAddress loadRetailStoreMemberAddress(RetailscmUserContext userContext, String retailStoreMemberAddressId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreMemberAddress(retailStoreMemberAddressId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreMemberAddressManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress( userContext, retailStoreMemberAddressId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreMemberAddress, tokens);
 	}
 	
 	
 	 public RetailStoreMemberAddress searchRetailStoreMemberAddress(RetailscmUserContext userContext, String retailStoreMemberAddressId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreMemberAddress(retailStoreMemberAddressId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreMemberAddressManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress( userContext, retailStoreMemberAddressId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreMemberAddress, tokens);
 	}
 	
 	

 	protected RetailStoreMemberAddress present(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreMemberAddress,tokens);
		
		
		RetailStoreMemberAddress  retailStoreMemberAddressToPresent = retailStoreMemberAddressDaoOf(userContext).present(retailStoreMemberAddress, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreMemberAddressToPresent.collectRefercencesFromLists();
		retailStoreMemberAddressDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreMemberAddressToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreMemberAddress loadRetailStoreMemberAddressDetail(RetailscmUserContext userContext, String retailStoreMemberAddressId) throws Exception{	
 		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress( userContext, retailStoreMemberAddressId, allTokens());
 		return present(userContext,retailStoreMemberAddress, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreMemberAddressId) throws Exception{	
 		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress( userContext, retailStoreMemberAddressId, viewTokens());
 		return present(userContext,retailStoreMemberAddress, allTokens());
		
 	}
 	protected RetailStoreMemberAddress saveRetailStoreMemberAddress(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, Map<String,Object>tokens) throws Exception{	
 		return retailStoreMemberAddressDaoOf(userContext).save(retailStoreMemberAddress, tokens);
 	}
 	protected RetailStoreMemberAddress loadRetailStoreMemberAddress(RetailscmUserContext userContext, String retailStoreMemberAddressId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreMemberAddress(retailStoreMemberAddressId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreMemberAddressManagerException.class);

 
 		return retailStoreMemberAddressDaoOf(userContext).load(retailStoreMemberAddressId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreMemberAddress, tokens);
		
		addAction(userContext, retailStoreMemberAddress, tokens,"@create","createRetailStoreMemberAddress","createRetailStoreMemberAddress/","main","primary");
		addAction(userContext, retailStoreMemberAddress, tokens,"@update","updateRetailStoreMemberAddress","updateRetailStoreMemberAddress/"+retailStoreMemberAddress.getId()+"/","main","primary");
		addAction(userContext, retailStoreMemberAddress, tokens,"@copy","cloneRetailStoreMemberAddress","cloneRetailStoreMemberAddress/"+retailStoreMemberAddress.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreMemberAddress, tokens,"retail_store_member_address.transfer_to_owner","transferToAnotherOwner","transferToAnotherOwner/"+retailStoreMemberAddress.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreMemberAddress createRetailStoreMemberAddress(RetailscmUserContext userContext, String name,String ownerId,String mobilePhone,String address) throws Exception
	//public RetailStoreMemberAddress createRetailStoreMemberAddress(RetailscmUserContext userContext,String name, String ownerId, String mobilePhone, String address) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfRetailStoreMemberAddress(name);
		checkerOf(userContext).checkMobilePhoneOfRetailStoreMemberAddress(mobilePhone);
		checkerOf(userContext).checkAddressOfRetailStoreMemberAddress(address);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreMemberAddressManagerException.class);


		RetailStoreMemberAddress retailStoreMemberAddress=createNewRetailStoreMemberAddress();	

		retailStoreMemberAddress.setName(name);
			
		RetailStoreMember owner = loadRetailStoreMember(userContext, ownerId,emptyOptions());
		retailStoreMemberAddress.setOwner(owner);
		
		
		retailStoreMemberAddress.setMobilePhone(mobilePhone);
		retailStoreMemberAddress.setAddress(address);

		retailStoreMemberAddress = saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreMemberAddress);
		return retailStoreMemberAddress;

		
	}
	protected RetailStoreMemberAddress createNewRetailStoreMemberAddress() 
	{
		
		return new RetailStoreMemberAddress();		
	}
	
	protected void checkParamsForUpdatingRetailStoreMemberAddress(RetailscmUserContext userContext,String retailStoreMemberAddressId, int retailStoreMemberAddressVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreMemberAddress(retailStoreMemberAddressId);
		checkerOf(userContext).checkVersionOfRetailStoreMemberAddress( retailStoreMemberAddressVersion);
		

		if(RetailStoreMemberAddress.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStoreMemberAddress(parseString(newValueExpr));
		}		

		
		if(RetailStoreMemberAddress.MOBILE_PHONE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobilePhoneOfRetailStoreMemberAddress(parseString(newValueExpr));
		}
		if(RetailStoreMemberAddress.ADDRESS_PROPERTY.equals(property)){
			checkerOf(userContext).checkAddressOfRetailStoreMemberAddress(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreMemberAddressManagerException.class);
	
		
	}
	
	
	
	public RetailStoreMemberAddress clone(RetailscmUserContext userContext, String fromRetailStoreMemberAddressId) throws Exception{
		
		return retailStoreMemberAddressDaoOf(userContext).clone(fromRetailStoreMemberAddressId, this.allTokens());
	}
	
	public RetailStoreMemberAddress internalSaveRetailStoreMemberAddress(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress) throws Exception 
	{
		return internalSaveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, allTokens());

	}
	public RetailStoreMemberAddress internalSaveRetailStoreMemberAddress(RetailscmUserContext userContext, RetailStoreMemberAddress retailStoreMemberAddress, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, retailStoreMemberAddressVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreMemberAddress){ 
			//will be good when the retailStoreMemberAddress loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreMemberAddress.
			if (retailStoreMemberAddress.isChanged()){
			
			}
			retailStoreMemberAddress = saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, options);
			return retailStoreMemberAddress;
			
		}

	}
	
	public RetailStoreMemberAddress updateRetailStoreMemberAddress(RetailscmUserContext userContext,String retailStoreMemberAddressId, int retailStoreMemberAddressVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, retailStoreMemberAddressVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, allTokens());
		if(retailStoreMemberAddress.getVersion() != retailStoreMemberAddressVersion){
			String message = "The target version("+retailStoreMemberAddress.getVersion()+") is not equals to version("+retailStoreMemberAddressVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreMemberAddress){ 
			//will be good when the retailStoreMemberAddress loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreMemberAddress.
			
			retailStoreMemberAddress.changeProperty(property, newValueExpr);
			retailStoreMemberAddress = saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, tokens().done());
			return present(userContext,retailStoreMemberAddress, mergedAllTokens(tokensExpr));
			//return saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, tokens().done());
		}

	}
	
	public RetailStoreMemberAddress updateRetailStoreMemberAddressProperty(RetailscmUserContext userContext,String retailStoreMemberAddressId, int retailStoreMemberAddressVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, retailStoreMemberAddressVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, allTokens());
		if(retailStoreMemberAddress.getVersion() != retailStoreMemberAddressVersion){
			String message = "The target version("+retailStoreMemberAddress.getVersion()+") is not equals to version("+retailStoreMemberAddressVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreMemberAddress){ 
			//will be good when the retailStoreMemberAddress loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreMemberAddress.
			
			retailStoreMemberAddress.changeProperty(property, newValueExpr);
			
			retailStoreMemberAddress = saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, tokens().done());
			return present(userContext,retailStoreMemberAddress, mergedAllTokens(tokensExpr));
			//return saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreMemberAddressTokens tokens(){
		return RetailStoreMemberAddressTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreMemberAddressTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreMemberAddressTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherOwner(RetailscmUserContext userContext, String retailStoreMemberAddressId, String anotherOwnerId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfRetailStoreMemberAddress(retailStoreMemberAddressId);
 		checkerOf(userContext).checkIdOfRetailStoreMember(anotherOwnerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreMemberAddressManagerException.class);
 		
 	}
 	public RetailStoreMemberAddress transferToAnotherOwner(RetailscmUserContext userContext, String retailStoreMemberAddressId, String anotherOwnerId) throws Exception
 	{
 		checkParamsForTransferingAnotherOwner(userContext, retailStoreMemberAddressId,anotherOwnerId);
 
		RetailStoreMemberAddress retailStoreMemberAddress = loadRetailStoreMemberAddress(userContext, retailStoreMemberAddressId, allTokens());	
		synchronized(retailStoreMemberAddress){
			//will be good when the retailStoreMemberAddress loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreMember owner = loadRetailStoreMember(userContext, anotherOwnerId, emptyOptions());		
			retailStoreMemberAddress.updateOwner(owner);		
			retailStoreMemberAddress = saveRetailStoreMemberAddress(userContext, retailStoreMemberAddress, emptyOptions());
			
			return present(userContext,retailStoreMemberAddress, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateRetailStoreMember requestCandidateOwner(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreMember result = new CandidateRetailStoreMember();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreMember> candidateList = retailStoreMemberDaoOf(userContext).requestCandidateRetailStoreMemberForRetailStoreMemberAddress(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected RetailStoreMember loadRetailStoreMember(RetailscmUserContext userContext, String newOwnerId, Map<String,Object> options) throws Exception
 	{
		
 		return retailStoreMemberDaoOf(userContext).load(newOwnerId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreMemberAddressId, int retailStoreMemberAddressVersion) throws Exception {
		//deleteInternal(userContext, retailStoreMemberAddressId, retailStoreMemberAddressVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreMemberAddressId, int retailStoreMemberAddressVersion) throws Exception{
			
		retailStoreMemberAddressDaoOf(userContext).delete(retailStoreMemberAddressId, retailStoreMemberAddressVersion);
	}
	
	public RetailStoreMemberAddress forgetByAll(RetailscmUserContext userContext, String retailStoreMemberAddressId, int retailStoreMemberAddressVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreMemberAddressId, retailStoreMemberAddressVersion);		
	}
	protected RetailStoreMemberAddress forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreMemberAddressId, int retailStoreMemberAddressVersion) throws Exception{
			
		return retailStoreMemberAddressDaoOf(userContext).disconnectFromAll(retailStoreMemberAddressId, retailStoreMemberAddressVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreMemberAddressManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreMemberAddressDaoOf(userContext).deleteAll();
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreMemberAddress newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



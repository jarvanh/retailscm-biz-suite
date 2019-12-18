
package com.doublechaintech.retailscm.userwhitelist;

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

import com.doublechaintech.retailscm.userdomain.UserDomain;

import com.doublechaintech.retailscm.userdomain.CandidateUserDomain;







public class UserWhiteListManagerImpl extends CustomRetailscmCheckerManager implements UserWhiteListManager {
	
	private static final String SERVICE_TYPE = "UserWhiteList";
	@Override
	public UserWhiteListDAO daoOf(RetailscmUserContext userContext) {
		return userWhiteListDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws UserWhiteListManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new UserWhiteListManagerException(message);

	}
	
	

 	protected UserWhiteList saveUserWhiteList(RetailscmUserContext userContext, UserWhiteList userWhiteList, String [] tokensExpr) throws Exception{	
 		//return getUserWhiteListDAO().save(userWhiteList, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveUserWhiteList(userContext, userWhiteList, tokens);
 	}
 	
 	protected UserWhiteList saveUserWhiteListDetail(RetailscmUserContext userContext, UserWhiteList userWhiteList) throws Exception{	

 		
 		return saveUserWhiteList(userContext, userWhiteList, allTokens());
 	}
 	
 	public UserWhiteList loadUserWhiteList(RetailscmUserContext userContext, String userWhiteListId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfUserWhiteList(userWhiteListId);
		checkerOf(userContext).throwExceptionIfHasErrors( UserWhiteListManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		UserWhiteList userWhiteList = loadUserWhiteList( userContext, userWhiteListId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,userWhiteList, tokens);
 	}
 	
 	
 	 public UserWhiteList searchUserWhiteList(RetailscmUserContext userContext, String userWhiteListId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfUserWhiteList(userWhiteListId);
		checkerOf(userContext).throwExceptionIfHasErrors( UserWhiteListManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		UserWhiteList userWhiteList = loadUserWhiteList( userContext, userWhiteListId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,userWhiteList, tokens);
 	}
 	
 	

 	protected UserWhiteList present(RetailscmUserContext userContext, UserWhiteList userWhiteList, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,userWhiteList,tokens);
		
		
		UserWhiteList  userWhiteListToPresent = userWhiteListDaoOf(userContext).present(userWhiteList, tokens);
		
		List<BaseEntity> entityListToNaming = userWhiteListToPresent.collectRefercencesFromLists();
		userWhiteListDaoOf(userContext).alias(entityListToNaming);
		
		return  userWhiteListToPresent;
		
		
	}
 
 	
 	
 	public UserWhiteList loadUserWhiteListDetail(RetailscmUserContext userContext, String userWhiteListId) throws Exception{	
 		UserWhiteList userWhiteList = loadUserWhiteList( userContext, userWhiteListId, allTokens());
 		return present(userContext,userWhiteList, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String userWhiteListId) throws Exception{	
 		UserWhiteList userWhiteList = loadUserWhiteList( userContext, userWhiteListId, viewTokens());
 		return present(userContext,userWhiteList, allTokens());
		
 	}
 	protected UserWhiteList saveUserWhiteList(RetailscmUserContext userContext, UserWhiteList userWhiteList, Map<String,Object>tokens) throws Exception{	
 		return userWhiteListDaoOf(userContext).save(userWhiteList, tokens);
 	}
 	protected UserWhiteList loadUserWhiteList(RetailscmUserContext userContext, String userWhiteListId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfUserWhiteList(userWhiteListId);
		checkerOf(userContext).throwExceptionIfHasErrors( UserWhiteListManagerException.class);

 
 		return userWhiteListDaoOf(userContext).load(userWhiteListId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, UserWhiteList userWhiteList, Map<String, Object> tokens){
		super.addActions(userContext, userWhiteList, tokens);
		
		addAction(userContext, userWhiteList, tokens,"@create","createUserWhiteList","createUserWhiteList/","main","primary");
		addAction(userContext, userWhiteList, tokens,"@update","updateUserWhiteList","updateUserWhiteList/"+userWhiteList.getId()+"/","main","primary");
		addAction(userContext, userWhiteList, tokens,"@copy","cloneUserWhiteList","cloneUserWhiteList/"+userWhiteList.getId()+"/","main","primary");
		
		addAction(userContext, userWhiteList, tokens,"user_white_list.transfer_to_domain","transferToAnotherDomain","transferToAnotherDomain/"+userWhiteList.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, UserWhiteList userWhiteList, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public UserWhiteList createUserWhiteList(RetailscmUserContext userContext, String userIdentity,String userSpecialFunctions,String domainId) throws Exception
	//public UserWhiteList createUserWhiteList(RetailscmUserContext userContext,String userIdentity, String userSpecialFunctions, String domainId) throws Exception
	{
		
		

		

		checkerOf(userContext).checkUserIdentityOfUserWhiteList(userIdentity);
		checkerOf(userContext).checkUserSpecialFunctionsOfUserWhiteList(userSpecialFunctions);
	
		checkerOf(userContext).throwExceptionIfHasErrors(UserWhiteListManagerException.class);


		UserWhiteList userWhiteList=createNewUserWhiteList();	

		userWhiteList.setUserIdentity(userIdentity);
		userWhiteList.setUserSpecialFunctions(userSpecialFunctions);
			
		UserDomain domain = loadUserDomain(userContext, domainId,emptyOptions());
		userWhiteList.setDomain(domain);
		
		

		userWhiteList = saveUserWhiteList(userContext, userWhiteList, emptyOptions());
		
		onNewInstanceCreated(userContext, userWhiteList);
		return userWhiteList;

		
	}
	protected UserWhiteList createNewUserWhiteList() 
	{
		
		return new UserWhiteList();		
	}
	
	protected void checkParamsForUpdatingUserWhiteList(RetailscmUserContext userContext,String userWhiteListId, int userWhiteListVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfUserWhiteList(userWhiteListId);
		checkerOf(userContext).checkVersionOfUserWhiteList( userWhiteListVersion);
		

		if(UserWhiteList.USER_IDENTITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkUserIdentityOfUserWhiteList(parseString(newValueExpr));
		}
		if(UserWhiteList.USER_SPECIAL_FUNCTIONS_PROPERTY.equals(property)){
			checkerOf(userContext).checkUserSpecialFunctionsOfUserWhiteList(parseString(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(UserWhiteListManagerException.class);
	
		
	}
	
	
	
	public UserWhiteList clone(RetailscmUserContext userContext, String fromUserWhiteListId) throws Exception{
		
		return userWhiteListDaoOf(userContext).clone(fromUserWhiteListId, this.allTokens());
	}
	
	public UserWhiteList internalSaveUserWhiteList(RetailscmUserContext userContext, UserWhiteList userWhiteList) throws Exception 
	{
		return internalSaveUserWhiteList(userContext, userWhiteList, allTokens());

	}
	public UserWhiteList internalSaveUserWhiteList(RetailscmUserContext userContext, UserWhiteList userWhiteList, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingUserWhiteList(userContext, userWhiteListId, userWhiteListVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(userWhiteList){ 
			//will be good when the userWhiteList loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UserWhiteList.
			if (userWhiteList.isChanged()){
			
			}
			userWhiteList = saveUserWhiteList(userContext, userWhiteList, options);
			return userWhiteList;
			
		}

	}
	
	public UserWhiteList updateUserWhiteList(RetailscmUserContext userContext,String userWhiteListId, int userWhiteListVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingUserWhiteList(userContext, userWhiteListId, userWhiteListVersion, property, newValueExpr, tokensExpr);
		
		
		
		UserWhiteList userWhiteList = loadUserWhiteList(userContext, userWhiteListId, allTokens());
		if(userWhiteList.getVersion() != userWhiteListVersion){
			String message = "The target version("+userWhiteList.getVersion()+") is not equals to version("+userWhiteListVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(userWhiteList){ 
			//will be good when the userWhiteList loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UserWhiteList.
			
			userWhiteList.changeProperty(property, newValueExpr);
			userWhiteList = saveUserWhiteList(userContext, userWhiteList, tokens().done());
			return present(userContext,userWhiteList, mergedAllTokens(tokensExpr));
			//return saveUserWhiteList(userContext, userWhiteList, tokens().done());
		}

	}
	
	public UserWhiteList updateUserWhiteListProperty(RetailscmUserContext userContext,String userWhiteListId, int userWhiteListVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingUserWhiteList(userContext, userWhiteListId, userWhiteListVersion, property, newValueExpr, tokensExpr);
		
		UserWhiteList userWhiteList = loadUserWhiteList(userContext, userWhiteListId, allTokens());
		if(userWhiteList.getVersion() != userWhiteListVersion){
			String message = "The target version("+userWhiteList.getVersion()+") is not equals to version("+userWhiteListVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(userWhiteList){ 
			//will be good when the userWhiteList loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UserWhiteList.
			
			userWhiteList.changeProperty(property, newValueExpr);
			
			userWhiteList = saveUserWhiteList(userContext, userWhiteList, tokens().done());
			return present(userContext,userWhiteList, mergedAllTokens(tokensExpr));
			//return saveUserWhiteList(userContext, userWhiteList, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected UserWhiteListTokens tokens(){
		return UserWhiteListTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return UserWhiteListTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return UserWhiteListTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherDomain(RetailscmUserContext userContext, String userWhiteListId, String anotherDomainId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfUserWhiteList(userWhiteListId);
 		checkerOf(userContext).checkIdOfUserDomain(anotherDomainId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(UserWhiteListManagerException.class);
 		
 	}
 	public UserWhiteList transferToAnotherDomain(RetailscmUserContext userContext, String userWhiteListId, String anotherDomainId) throws Exception
 	{
 		checkParamsForTransferingAnotherDomain(userContext, userWhiteListId,anotherDomainId);
 
		UserWhiteList userWhiteList = loadUserWhiteList(userContext, userWhiteListId, allTokens());	
		synchronized(userWhiteList){
			//will be good when the userWhiteList loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			UserDomain domain = loadUserDomain(userContext, anotherDomainId, emptyOptions());		
			userWhiteList.updateDomain(domain);		
			userWhiteList = saveUserWhiteList(userContext, userWhiteList, emptyOptions());
			
			return present(userContext,userWhiteList, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateUserDomain requestCandidateDomain(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateUserDomain result = new CandidateUserDomain();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<UserDomain> candidateList = userDomainDaoOf(userContext).requestCandidateUserDomainForUserWhiteList(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected UserDomain loadUserDomain(RetailscmUserContext userContext, String newDomainId, Map<String,Object> options) throws Exception
 	{
		
 		return userDomainDaoOf(userContext).load(newDomainId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String userWhiteListId, int userWhiteListVersion) throws Exception {
		//deleteInternal(userContext, userWhiteListId, userWhiteListVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String userWhiteListId, int userWhiteListVersion) throws Exception{
			
		userWhiteListDaoOf(userContext).delete(userWhiteListId, userWhiteListVersion);
	}
	
	public UserWhiteList forgetByAll(RetailscmUserContext userContext, String userWhiteListId, int userWhiteListVersion) throws Exception {
		return forgetByAllInternal(userContext, userWhiteListId, userWhiteListVersion);		
	}
	protected UserWhiteList forgetByAllInternal(RetailscmUserContext userContext,
			String userWhiteListId, int userWhiteListVersion) throws Exception{
			
		return userWhiteListDaoOf(userContext).disconnectFromAll(userWhiteListId, userWhiteListVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new UserWhiteListManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return userWhiteListDaoOf(userContext).deleteAll();
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, UserWhiteList newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



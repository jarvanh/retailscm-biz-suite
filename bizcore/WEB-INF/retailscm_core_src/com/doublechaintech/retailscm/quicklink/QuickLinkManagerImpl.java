
package com.doublechaintech.retailscm.quicklink;

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

import com.doublechaintech.retailscm.userapp.UserApp;

import com.doublechaintech.retailscm.userapp.CandidateUserApp;







public class QuickLinkManagerImpl extends CustomRetailscmCheckerManager implements QuickLinkManager {
	
	private static final String SERVICE_TYPE = "QuickLink";
<<<<<<< HEAD
=======
	@Override
	public QuickLinkDAO daoOf(RetailscmUserContext userContext) {
		return quickLinkDaoOf(userContext);
	}
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws QuickLinkManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new QuickLinkManagerException(message);

	}
	
	

 	protected QuickLink saveQuickLink(RetailscmUserContext userContext, QuickLink quickLink, String [] tokensExpr) throws Exception{	
 		//return getQuickLinkDAO().save(quickLink, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveQuickLink(userContext, quickLink, tokens);
 	}
 	
 	protected QuickLink saveQuickLinkDetail(RetailscmUserContext userContext, QuickLink quickLink) throws Exception{	

 		
 		return saveQuickLink(userContext, quickLink, allTokens());
 	}
 	
 	public QuickLink loadQuickLink(RetailscmUserContext userContext, String quickLinkId, String [] tokensExpr) throws Exception{				
 
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfQuickLink(quickLinkId);
		userContext.getChecker().throwExceptionIfHasErrors( QuickLinkManagerException.class);
=======
 		checkerOf(userContext).checkIdOfQuickLink(quickLinkId);
		checkerOf(userContext).throwExceptionIfHasErrors( QuickLinkManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		QuickLink quickLink = loadQuickLink( userContext, quickLinkId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,quickLink, tokens);
 	}
 	
 	
 	 public QuickLink searchQuickLink(RetailscmUserContext userContext, String quickLinkId, String textToSearch,String [] tokensExpr) throws Exception{				
 
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfQuickLink(quickLinkId);
		userContext.getChecker().throwExceptionIfHasErrors( QuickLinkManagerException.class);
=======
 		checkerOf(userContext).checkIdOfQuickLink(quickLinkId);
		checkerOf(userContext).throwExceptionIfHasErrors( QuickLinkManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		QuickLink quickLink = loadQuickLink( userContext, quickLinkId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,quickLink, tokens);
 	}
 	
 	

 	protected QuickLink present(RetailscmUserContext userContext, QuickLink quickLink, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,quickLink,tokens);
		
		
<<<<<<< HEAD
		QuickLink  quickLinkToPresent = userContext.getDAOGroup().getQuickLinkDAO().present(quickLink, tokens);
		
		List<BaseEntity> entityListToNaming = quickLinkToPresent.collectRefercencesFromLists();
		userContext.getDAOGroup().getQuickLinkDAO().alias(entityListToNaming);
=======
		QuickLink  quickLinkToPresent = quickLinkDaoOf(userContext).present(quickLink, tokens);
		
		List<BaseEntity> entityListToNaming = quickLinkToPresent.collectRefercencesFromLists();
		quickLinkDaoOf(userContext).alias(entityListToNaming);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		
		return  quickLinkToPresent;
		
		
	}
 
 	
 	
 	public QuickLink loadQuickLinkDetail(RetailscmUserContext userContext, String quickLinkId) throws Exception{	
 		QuickLink quickLink = loadQuickLink( userContext, quickLinkId, allTokens());
 		return present(userContext,quickLink, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String quickLinkId) throws Exception{	
 		QuickLink quickLink = loadQuickLink( userContext, quickLinkId, viewTokens());
 		return present(userContext,quickLink, allTokens());
		
 	}
 	protected QuickLink saveQuickLink(RetailscmUserContext userContext, QuickLink quickLink, Map<String,Object>tokens) throws Exception{	
<<<<<<< HEAD
 		return userContext.getDAOGroup().getQuickLinkDAO().save(quickLink, tokens);
 	}
 	protected QuickLink loadQuickLink(RetailscmUserContext userContext, String quickLinkId, Map<String,Object>tokens) throws Exception{	
		userContext.getChecker().checkIdOfQuickLink(quickLinkId);
		userContext.getChecker().throwExceptionIfHasErrors( QuickLinkManagerException.class);

 
 		return userContext.getDAOGroup().getQuickLinkDAO().load(quickLinkId, tokens);
=======
 		return quickLinkDaoOf(userContext).save(quickLink, tokens);
 	}
 	protected QuickLink loadQuickLink(RetailscmUserContext userContext, String quickLinkId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfQuickLink(quickLinkId);
		checkerOf(userContext).throwExceptionIfHasErrors( QuickLinkManagerException.class);

 
 		return quickLinkDaoOf(userContext).load(quickLinkId, tokens);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, QuickLink quickLink, Map<String, Object> tokens){
		super.addActions(userContext, quickLink, tokens);
		
		addAction(userContext, quickLink, tokens,"@create","createQuickLink","createQuickLink/","main","primary");
		addAction(userContext, quickLink, tokens,"@update","updateQuickLink","updateQuickLink/"+quickLink.getId()+"/","main","primary");
		addAction(userContext, quickLink, tokens,"@copy","cloneQuickLink","cloneQuickLink/"+quickLink.getId()+"/","main","primary");
		
		addAction(userContext, quickLink, tokens,"quick_link.transfer_to_app","transferToAnotherApp","transferToAnotherApp/"+quickLink.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, QuickLink quickLink, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

<<<<<<< HEAD

	public QuickLink createQuickLink(RetailscmUserContext userContext,String name, String icon, String imagePath, String linkTarget, String appId) throws Exception
=======
	public QuickLink createQuickLink(RetailscmUserContext userContext, String name,String icon,String imagePath,String linkTarget,String appId) throws Exception
	//public QuickLink createQuickLink(RetailscmUserContext userContext,String name, String icon, String imagePath, String linkTarget, String appId) throws Exception
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	{
		
		

		

<<<<<<< HEAD
		userContext.getChecker().checkNameOfQuickLink(name);
		userContext.getChecker().checkIconOfQuickLink(icon);
		userContext.getChecker().checkImagePathOfQuickLink(imagePath);
		userContext.getChecker().checkLinkTargetOfQuickLink(linkTarget);
	
		userContext.getChecker().throwExceptionIfHasErrors(QuickLinkManagerException.class);
=======
		checkerOf(userContext).checkNameOfQuickLink(name);
		checkerOf(userContext).checkIconOfQuickLink(icon);
		checkerOf(userContext).checkImagePathOfQuickLink(imagePath);
		checkerOf(userContext).checkLinkTargetOfQuickLink(linkTarget);
	
		checkerOf(userContext).throwExceptionIfHasErrors(QuickLinkManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe


		QuickLink quickLink=createNewQuickLink();	

		quickLink.setName(name);
		quickLink.setIcon(icon);
		quickLink.setImagePath(imagePath);
		quickLink.setLinkTarget(linkTarget);
		quickLink.setCreateTime(userContext.now());
			
		UserApp app = loadUserApp(userContext, appId,emptyOptions());
		quickLink.setApp(app);
		
		

		quickLink = saveQuickLink(userContext, quickLink, emptyOptions());
		
		onNewInstanceCreated(userContext, quickLink);
		return quickLink;

		
	}
	protected QuickLink createNewQuickLink() 
	{
		
		return new QuickLink();		
	}
	
	protected void checkParamsForUpdatingQuickLink(RetailscmUserContext userContext,String quickLinkId, int quickLinkVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfQuickLink(quickLinkId);
		userContext.getChecker().checkVersionOfQuickLink( quickLinkVersion);
		

		if(QuickLink.NAME_PROPERTY.equals(property)){
			userContext.getChecker().checkNameOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.ICON_PROPERTY.equals(property)){
			userContext.getChecker().checkIconOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.IMAGE_PATH_PROPERTY.equals(property)){
			userContext.getChecker().checkImagePathOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.LINK_TARGET_PROPERTY.equals(property)){
			userContext.getChecker().checkLinkTargetOfQuickLink(parseString(newValueExpr));
=======
		checkerOf(userContext).checkIdOfQuickLink(quickLinkId);
		checkerOf(userContext).checkVersionOfQuickLink( quickLinkVersion);
		

		if(QuickLink.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.ICON_PROPERTY.equals(property)){
			checkerOf(userContext).checkIconOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.IMAGE_PATH_PROPERTY.equals(property)){
			checkerOf(userContext).checkImagePathOfQuickLink(parseString(newValueExpr));
		}
		if(QuickLink.LINK_TARGET_PROPERTY.equals(property)){
			checkerOf(userContext).checkLinkTargetOfQuickLink(parseString(newValueExpr));
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}		

		
	
<<<<<<< HEAD
		userContext.getChecker().throwExceptionIfHasErrors(QuickLinkManagerException.class);
=======
		checkerOf(userContext).throwExceptionIfHasErrors(QuickLinkManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	
		
	}
	
	
	
	public QuickLink clone(RetailscmUserContext userContext, String fromQuickLinkId) throws Exception{
		
<<<<<<< HEAD
		return userContext.getDAOGroup().getQuickLinkDAO().clone(fromQuickLinkId, this.allTokens());
=======
		return quickLinkDaoOf(userContext).clone(fromQuickLinkId, this.allTokens());
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}
	
	public QuickLink internalSaveQuickLink(RetailscmUserContext userContext, QuickLink quickLink) throws Exception 
	{
		return internalSaveQuickLink(userContext, quickLink, allTokens());

	}
	public QuickLink internalSaveQuickLink(RetailscmUserContext userContext, QuickLink quickLink, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingQuickLink(userContext, quickLinkId, quickLinkVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(quickLink){ 
			//will be good when the quickLink loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to QuickLink.
			if (quickLink.isChanged()){
			
			}
			quickLink = saveQuickLink(userContext, quickLink, options);
			return quickLink;
			
		}

	}
	
	public QuickLink updateQuickLink(RetailscmUserContext userContext,String quickLinkId, int quickLinkVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingQuickLink(userContext, quickLinkId, quickLinkVersion, property, newValueExpr, tokensExpr);
		
		
		
		QuickLink quickLink = loadQuickLink(userContext, quickLinkId, allTokens());
		if(quickLink.getVersion() != quickLinkVersion){
			String message = "The target version("+quickLink.getVersion()+") is not equals to version("+quickLinkVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(quickLink){ 
			//will be good when the quickLink loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to QuickLink.
			
			quickLink.changeProperty(property, newValueExpr);
			quickLink = saveQuickLink(userContext, quickLink, tokens().done());
			return present(userContext,quickLink, mergedAllTokens(tokensExpr));
			//return saveQuickLink(userContext, quickLink, tokens().done());
		}

	}
	
	public QuickLink updateQuickLinkProperty(RetailscmUserContext userContext,String quickLinkId, int quickLinkVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingQuickLink(userContext, quickLinkId, quickLinkVersion, property, newValueExpr, tokensExpr);
		
		QuickLink quickLink = loadQuickLink(userContext, quickLinkId, allTokens());
		if(quickLink.getVersion() != quickLinkVersion){
			String message = "The target version("+quickLink.getVersion()+") is not equals to version("+quickLinkVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(quickLink){ 
			//will be good when the quickLink loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to QuickLink.
			
			quickLink.changeProperty(property, newValueExpr);
			
			quickLink = saveQuickLink(userContext, quickLink, tokens().done());
			return present(userContext,quickLink, mergedAllTokens(tokensExpr));
			//return saveQuickLink(userContext, quickLink, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected QuickLinkTokens tokens(){
		return QuickLinkTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return QuickLinkTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return QuickLinkTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherApp(RetailscmUserContext userContext, String quickLinkId, String anotherAppId) throws Exception
 	{
 		
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfQuickLink(quickLinkId);
 		userContext.getChecker().checkIdOfUserApp(anotherAppId);//check for optional reference
 		userContext.getChecker().throwExceptionIfHasErrors(QuickLinkManagerException.class);
=======
 		checkerOf(userContext).checkIdOfQuickLink(quickLinkId);
 		checkerOf(userContext).checkIdOfUserApp(anotherAppId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(QuickLinkManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 		
 	}
 	public QuickLink transferToAnotherApp(RetailscmUserContext userContext, String quickLinkId, String anotherAppId) throws Exception
 	{
 		checkParamsForTransferingAnotherApp(userContext, quickLinkId,anotherAppId);
 
		QuickLink quickLink = loadQuickLink(userContext, quickLinkId, allTokens());	
		synchronized(quickLink){
			//will be good when the quickLink loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			UserApp app = loadUserApp(userContext, anotherAppId, emptyOptions());		
			quickLink.updateApp(app);		
			quickLink = saveQuickLink(userContext, quickLink, emptyOptions());
			
			return present(userContext,quickLink, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateUserApp requestCandidateApp(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateUserApp result = new CandidateUserApp();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("title");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
<<<<<<< HEAD
		SmartList<UserApp> candidateList = userContext.getDAOGroup().getUserAppDAO().requestCandidateUserAppForQuickLink(userContext,ownerClass, id, filterKey, pageNo, pageSize);
=======
		SmartList<UserApp> candidateList = userAppDaoOf(userContext).requestCandidateUserAppForQuickLink(userContext,ownerClass, id, filterKey, pageNo, pageSize);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected UserApp loadUserApp(RetailscmUserContext userContext, String newAppId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getUserAppDAO().load(newAppId, options);
=======
 		return userAppDaoOf(userContext).load(newAppId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String quickLinkId, int quickLinkVersion) throws Exception {
		//deleteInternal(userContext, quickLinkId, quickLinkVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String quickLinkId, int quickLinkVersion) throws Exception{
			
<<<<<<< HEAD
		userContext.getDAOGroup().getQuickLinkDAO().delete(quickLinkId, quickLinkVersion);
=======
		quickLinkDaoOf(userContext).delete(quickLinkId, quickLinkVersion);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}
	
	public QuickLink forgetByAll(RetailscmUserContext userContext, String quickLinkId, int quickLinkVersion) throws Exception {
		return forgetByAllInternal(userContext, quickLinkId, quickLinkVersion);		
	}
	protected QuickLink forgetByAllInternal(RetailscmUserContext userContext,
			String quickLinkId, int quickLinkVersion) throws Exception{
			
<<<<<<< HEAD
		return userContext.getDAOGroup().getQuickLinkDAO().disconnectFromAll(quickLinkId, quickLinkVersion);
	}
	
=======
		return quickLinkDaoOf(userContext).disconnectFromAll(quickLinkId, quickLinkVersion);
	}
	
	
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new QuickLinkManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
<<<<<<< HEAD
		return userContext.getDAOGroup().getQuickLinkDAO().deleteAll();
=======
		return quickLinkDaoOf(userContext).deleteAll();
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, QuickLink newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



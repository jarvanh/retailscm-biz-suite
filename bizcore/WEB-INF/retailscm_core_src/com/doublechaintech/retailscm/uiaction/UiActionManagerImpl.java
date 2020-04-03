
package com.doublechaintech.retailscm.uiaction;

import java.util.Date;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;
import com.terapico.caf.Images;
import com.terapico.caf.Password;

import com.doublechaintech.retailscm.*;
import com.doublechaintech.retailscm.tree.*;
import com.doublechaintech.retailscm.treenode.*;
import com.doublechaintech.retailscm.RetailscmUserContextImpl;
import com.doublechaintech.retailscm.iamservice.*;
import com.doublechaintech.retailscm.services.IamService;
import com.doublechaintech.retailscm.secuser.SecUser;
import com.doublechaintech.retailscm.userapp.UserApp;
import com.terapico.uccaf.BaseUserContext;


import com.doublechaintech.retailscm.page.Page;

import com.doublechaintech.retailscm.page.CandidatePage;







public class UiActionManagerImpl extends CustomRetailscmCheckerManager implements UiActionManager, BusinessHandler{

  


	private static final String SERVICE_TYPE = "UiAction";
	@Override
	public UiActionDAO daoOf(RetailscmUserContext userContext) {
		return uiActionDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws UiActionManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new UiActionManagerException(message);

	}



 	protected UiAction saveUiAction(RetailscmUserContext userContext, UiAction uiAction, String [] tokensExpr) throws Exception{	
 		//return getUiActionDAO().save(uiAction, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveUiAction(userContext, uiAction, tokens);
 	}
 	
 	protected UiAction saveUiActionDetail(RetailscmUserContext userContext, UiAction uiAction) throws Exception{	

 		
 		return saveUiAction(userContext, uiAction, allTokens());
 	}
 	
 	public UiAction loadUiAction(RetailscmUserContext userContext, String uiActionId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfUiAction(uiActionId);
		checkerOf(userContext).throwExceptionIfHasErrors( UiActionManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		UiAction uiAction = loadUiAction( userContext, uiActionId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,uiAction, tokens);
 	}
 	
 	
 	 public UiAction searchUiAction(RetailscmUserContext userContext, String uiActionId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfUiAction(uiActionId);
		checkerOf(userContext).throwExceptionIfHasErrors( UiActionManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		UiAction uiAction = loadUiAction( userContext, uiActionId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,uiAction, tokens);
 	}
 	
 	

 	protected UiAction present(RetailscmUserContext userContext, UiAction uiAction, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,uiAction,tokens);
		
		
		UiAction  uiActionToPresent = uiActionDaoOf(userContext).present(uiAction, tokens);
		
		List<BaseEntity> entityListToNaming = uiActionToPresent.collectRefercencesFromLists();
		uiActionDaoOf(userContext).alias(entityListToNaming);
		
		return  uiActionToPresent;
		
		
	}
 
 	
 	
 	public UiAction loadUiActionDetail(RetailscmUserContext userContext, String uiActionId) throws Exception{	
 		UiAction uiAction = loadUiAction( userContext, uiActionId, allTokens());
 		return present(userContext,uiAction, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String uiActionId) throws Exception{	
 		UiAction uiAction = loadUiAction( userContext, uiActionId, viewTokens());
 		return present(userContext,uiAction, allTokens());
		
 	}
 	protected UiAction saveUiAction(RetailscmUserContext userContext, UiAction uiAction, Map<String,Object>tokens) throws Exception{	
 		return uiActionDaoOf(userContext).save(uiAction, tokens);
 	}
 	protected UiAction loadUiAction(RetailscmUserContext userContext, String uiActionId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfUiAction(uiActionId);
		checkerOf(userContext).throwExceptionIfHasErrors( UiActionManagerException.class);

 
 		return uiActionDaoOf(userContext).load(uiActionId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, UiAction uiAction, Map<String, Object> tokens){
		super.addActions(userContext, uiAction, tokens);
		
		addAction(userContext, uiAction, tokens,"@create","createUiAction","createUiAction/","main","primary");
		addAction(userContext, uiAction, tokens,"@update","updateUiAction","updateUiAction/"+uiAction.getId()+"/","main","primary");
		addAction(userContext, uiAction, tokens,"@copy","cloneUiAction","cloneUiAction/"+uiAction.getId()+"/","main","primary");
		
		addAction(userContext, uiAction, tokens,"ui_action.transfer_to_page","transferToAnotherPage","transferToAnotherPage/"+uiAction.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, UiAction uiAction, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public UiAction createUiAction(RetailscmUserContext userContext, String code,String icon,String title,String brief,String imageUrl,String linkToUrl,String extraData,String pageId) throws Exception
	//public UiAction createUiAction(RetailscmUserContext userContext,String code, String icon, String title, String brief, String imageUrl, String linkToUrl, String extraData, String pageId) throws Exception
	{

		

		

		checkerOf(userContext).checkCodeOfUiAction(code);
		checkerOf(userContext).checkIconOfUiAction(icon);
		checkerOf(userContext).checkTitleOfUiAction(title);
		checkerOf(userContext).checkBriefOfUiAction(brief);
		checkerOf(userContext).checkImageUrlOfUiAction(imageUrl);
		checkerOf(userContext).checkLinkToUrlOfUiAction(linkToUrl);
		checkerOf(userContext).checkExtraDataOfUiAction(extraData);
	
		checkerOf(userContext).throwExceptionIfHasErrors(UiActionManagerException.class);


		UiAction uiAction=createNewUiAction();	

		uiAction.setCode(code);
		uiAction.setIcon(icon);
		uiAction.setTitle(title);
		uiAction.setBrief(brief);
		uiAction.setImageUrl(imageUrl);
		uiAction.setLinkToUrl(linkToUrl);
		uiAction.setExtraData(extraData);
			
		Page page = loadPage(userContext, pageId,emptyOptions());
		uiAction.setPage(page);
		
		

		uiAction = saveUiAction(userContext, uiAction, emptyOptions());
		
		onNewInstanceCreated(userContext, uiAction);
		return uiAction;


	}
	protected UiAction createNewUiAction()
	{

		return new UiAction();
	}

	protected void checkParamsForUpdatingUiAction(RetailscmUserContext userContext,String uiActionId, int uiActionVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfUiAction(uiActionId);
		checkerOf(userContext).checkVersionOfUiAction( uiActionVersion);
		

		if(UiAction.CODE_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkCodeOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.ICON_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkIconOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.TITLE_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkTitleOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.BRIEF_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkBriefOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.IMAGE_URL_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkImageUrlOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.LINK_TO_URL_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkLinkToUrlOfUiAction(parseString(newValueExpr));
		
			
		}
		if(UiAction.EXTRA_DATA_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkExtraDataOfUiAction(parseString(newValueExpr));
		
			
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(UiActionManagerException.class);


	}



	public UiAction clone(RetailscmUserContext userContext, String fromUiActionId) throws Exception{

		return uiActionDaoOf(userContext).clone(fromUiActionId, this.allTokens());
	}

	public UiAction internalSaveUiAction(RetailscmUserContext userContext, UiAction uiAction) throws Exception
	{
		return internalSaveUiAction(userContext, uiAction, allTokens());

	}
	public UiAction internalSaveUiAction(RetailscmUserContext userContext, UiAction uiAction, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingUiAction(userContext, uiActionId, uiActionVersion, property, newValueExpr, tokensExpr);


		synchronized(uiAction){
			//will be good when the uiAction loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UiAction.
			if (uiAction.isChanged()){
			
			}
			uiAction = saveUiAction(userContext, uiAction, options);
			return uiAction;

		}

	}

	public UiAction updateUiAction(RetailscmUserContext userContext,String uiActionId, int uiActionVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingUiAction(userContext, uiActionId, uiActionVersion, property, newValueExpr, tokensExpr);



		UiAction uiAction = loadUiAction(userContext, uiActionId, allTokens());
		if(uiAction.getVersion() != uiActionVersion){
			String message = "The target version("+uiAction.getVersion()+") is not equals to version("+uiActionVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(uiAction){
			//will be good when the uiAction loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UiAction.
			
			uiAction.changeProperty(property, newValueExpr);
			uiAction = saveUiAction(userContext, uiAction, tokens().done());
			return present(userContext,uiAction, mergedAllTokens(tokensExpr));
			//return saveUiAction(userContext, uiAction, tokens().done());
		}

	}

	public UiAction updateUiActionProperty(RetailscmUserContext userContext,String uiActionId, int uiActionVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingUiAction(userContext, uiActionId, uiActionVersion, property, newValueExpr, tokensExpr);

		UiAction uiAction = loadUiAction(userContext, uiActionId, allTokens());
		if(uiAction.getVersion() != uiActionVersion){
			String message = "The target version("+uiAction.getVersion()+") is not equals to version("+uiActionVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(uiAction){
			//will be good when the uiAction loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to UiAction.

			uiAction.changeProperty(property, newValueExpr);
			
			uiAction = saveUiAction(userContext, uiAction, tokens().done());
			return present(userContext,uiAction, mergedAllTokens(tokensExpr));
			//return saveUiAction(userContext, uiAction, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected UiActionTokens tokens(){
		return UiActionTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return UiActionTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return UiActionTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherPage(RetailscmUserContext userContext, String uiActionId, String anotherPageId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfUiAction(uiActionId);
 		checkerOf(userContext).checkIdOfPage(anotherPageId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(UiActionManagerException.class);

 	}
 	public UiAction transferToAnotherPage(RetailscmUserContext userContext, String uiActionId, String anotherPageId) throws Exception
 	{
 		checkParamsForTransferingAnotherPage(userContext, uiActionId,anotherPageId);
 
		UiAction uiAction = loadUiAction(userContext, uiActionId, allTokens());	
		synchronized(uiAction){
			//will be good when the uiAction loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Page page = loadPage(userContext, anotherPageId, emptyOptions());		
			uiAction.updatePage(page);		
			uiAction = saveUiAction(userContext, uiAction, emptyOptions());
			
			return present(userContext,uiAction, allTokens());
			
		}

 	}

	


	public CandidatePage requestCandidatePage(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidatePage result = new CandidatePage();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("pageTitle");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<Page> candidateList = pageDaoOf(userContext).requestCandidatePageForUiAction(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected Page loadPage(RetailscmUserContext userContext, String newPageId, Map<String,Object> options) throws Exception
 	{

 		return pageDaoOf(userContext).load(newPageId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String uiActionId, int uiActionVersion) throws Exception {
		//deleteInternal(userContext, uiActionId, uiActionVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String uiActionId, int uiActionVersion) throws Exception{

		uiActionDaoOf(userContext).delete(uiActionId, uiActionVersion);
	}

	public UiAction forgetByAll(RetailscmUserContext userContext, String uiActionId, int uiActionVersion) throws Exception {
		return forgetByAllInternal(userContext, uiActionId, uiActionVersion);
	}
	protected UiAction forgetByAllInternal(RetailscmUserContext userContext,
			String uiActionId, int uiActionVersion) throws Exception{

		return uiActionDaoOf(userContext).disconnectFromAll(uiActionId, uiActionVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new UiActionManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return uiActionDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, UiAction newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  

	// -----------------------------------//  登录部分处理 \\-----------------------------------
	// 手机号+短信验证码 登录
	public Object loginByMobile(RetailscmUserContextImpl userContext, String mobile, String verifyCode) throws Exception {
		LoginChannel loginChannel = LoginChannel.of(RetailscmBaseUtils.getRequestAppType(userContext), this.getBeanName(),
				"loginByMobile");
		LoginData loginData = new LoginData();
		loginData.setMobile(mobile);
		loginData.setVerifyCode(verifyCode);

		LoginContext loginContext = LoginContext.of(LoginMethod.MOBILE, loginChannel, loginData);
		return processLoginRequest(userContext, loginContext);
	}
	// 账号+密码登录
	public Object loginByPassword(RetailscmUserContextImpl userContext, String loginId, Password password) throws Exception {
		LoginChannel loginChannel = LoginChannel.of(RetailscmBaseUtils.getRequestAppType(userContext), this.getBeanName(), "loginByPassword");
		LoginData loginData = new LoginData();
		loginData.setLoginId(loginId);
		loginData.setPassword(password.getClearTextPassword());

		LoginContext loginContext = LoginContext.of(LoginMethod.PASSWORD, loginChannel, loginData);
		return processLoginRequest(userContext, loginContext);
	}
	// 微信小程序登录
	public Object loginByWechatMiniProgram(RetailscmUserContextImpl userContext, String code) throws Exception {
		LoginChannel loginChannel = LoginChannel.of(RetailscmBaseUtils.getRequestAppType(userContext), this.getBeanName(),
				"loginByWechatMiniProgram");
		LoginData loginData = new LoginData();
		loginData.setCode(code);

		LoginContext loginContext = LoginContext.of(LoginMethod.WECHAT_MINIPROGRAM, loginChannel, loginData);
		return processLoginRequest(userContext, loginContext);
	}
	// 企业微信小程序登录
	public Object loginByWechatWorkMiniProgram(RetailscmUserContextImpl userContext, String code) throws Exception {
		LoginChannel loginChannel = LoginChannel.of(RetailscmBaseUtils.getRequestAppType(userContext), this.getBeanName(),
				"loginByWechatWorkMiniProgram");
		LoginData loginData = new LoginData();
		loginData.setCode(code);

		LoginContext loginContext = LoginContext.of(LoginMethod.WECHAT_WORK_MINIPROGRAM, loginChannel, loginData);
		return processLoginRequest(userContext, loginContext);
	}
	// 调用登录处理
	protected Object processLoginRequest(RetailscmUserContextImpl userContext, LoginContext loginContext) throws Exception {
		IamService iamService = (IamService) userContext.getBean("iamService");
		LoginResult loginResult = iamService.doLogin(userContext, loginContext, this);
		// 根据登录结果
		if (!loginResult.isAuthenticated()) {
			throw new Exception(loginResult.getMessage());
		}
		if (loginResult.isSuccess()) {
			return onLoginSuccess(userContext, loginResult);
		}
		if (loginResult.isNewUser()) {
			throw new Exception("请联系你的上级,先为你创建账号,然后再来登录.");
		}
		return new LoginForm();
	}

	@Override
	public Object checkAccess(BaseUserContext baseUserContext, String methodName, Object[] parameters)
			throws IllegalAccessException {
		RetailscmUserContextImpl userContext = (RetailscmUserContextImpl)baseUserContext;
		IamService iamService = (IamService) userContext.getBean("iamService");
		Map<String, Object> loginInfo = iamService.getCachedLoginInfo(userContext);

		SecUser secUser = iamService.tryToLoadSecUser(userContext, loginInfo);
		UserApp userApp = iamService.tryToLoadUserApp(userContext, loginInfo);
		if (userApp != null) {
			userApp.setSecUser(secUser);
		}
		afterSecUserAppLoadedWhenCheckAccess(userContext, loginInfo, secUser, userApp);
		if (!isMethodNeedLogin(userContext, methodName, parameters)) {
			return accessOK();
		}

		return super.checkAccess(baseUserContext, methodName, parameters);
	}

	// 判断哪些接口需要登录后才能执行. 默认除了loginBy开头的,其他都要登录
	protected boolean isMethodNeedLogin(RetailscmUserContextImpl userContext, String methodName, Object[] parameters) {
		if (methodName.startsWith("loginBy")) {
			return false;
		}
		if (methodName.startsWith("logout")) {
			return false;
		}
		return true;
	}

	// 在checkAccess中加载了secUser和userApp后会调用此方法,用于定制化的用户数据加载. 默认什么也不做
	protected void afterSecUserAppLoadedWhenCheckAccess(RetailscmUserContextImpl userContext, Map<String, Object> loginInfo,
			SecUser secUser, UserApp userApp) throws IllegalAccessException{
	}



	protected Object onLoginSuccess(RetailscmUserContext userContext, LoginResult loginResult) throws Exception {
		// by default, return the view of this object
		UserApp userApp = loginResult.getLoginContext().getLoginTarget().getUserApp();
		return this.view(userContext, userApp.getObjectId());
	}

	public void onAuthenticationFailed(RetailscmUserContext userContext, LoginContext loginContext,
			LoginResult loginResult, IdentificationHandler idHandler, BusinessHandler bizHandler)
			throws Exception {
		// by default, failed is failed, nothing can do
	}
	public void onAuthenticateNewUserLogged(RetailscmUserContext userContext, LoginContext loginContext,
			LoginResult loginResult, IdentificationHandler idHandler, BusinessHandler bizHandler)
			throws Exception {
		// by default, should create a account and bind with sec user, BUT, I don't know how to
		// create new object as of generate this method. It depends on business logical. So,
		throw new Exception("请重载函数onAuthenticateNewUserLogged()以处理新用户登录");
	}
	public void onAuthenticateUserLogged(RetailscmUserContext userContext, LoginContext loginContext,
			LoginResult loginResult, IdentificationHandler idHandler, BusinessHandler bizHandler)
			throws Exception {
		// by default, find the correct user-app
		SecUser secUser = loginResult.getLoginContext().getLoginTarget().getSecUser();
		MultipleAccessKey key = new MultipleAccessKey();
		key.put(UserApp.SEC_USER_PROPERTY, secUser.getId());
		key.put(UserApp.OBJECT_TYPE_PROPERTY, UiAction.INTERNAL_TYPE);
		SmartList<UserApp> userApps = userContext.getDAOGroup().getUserAppDAO().findUserAppWithKey(key, EO);
		if (userApps == null || userApps.isEmpty()) {
			throw new Exception("您的账号未关联销售人员,请联系客服处理账号异常.");
		}
		UserApp userApp = userApps.first();
		userApp.setSecUser(secUser);
		loginResult.getLoginContext().getLoginTarget().setUserApp(userApp);
	}
	// -----------------------------------\\  登录部分处理 //-----------------------------------


	// -----------------------------------// list-of-view 处理 \\-----------------------------------
    protected void enhanceForListOfView(RetailscmUserContext userContext,SmartList<UiAction> list) throws Exception {
    	if (list == null || list.isEmpty()){
    		return;
    	}
		List<Page> pageList = RetailscmBaseUtils.collectReferencedObjectWithType(userContext, list, Page.class);
		userContext.getDAOGroup().enhanceList(pageList, Page.class);


    }
	
	public Object listByPage(RetailscmUserContext userContext,String pageId) throws Exception {
		return listPageByPage(userContext, pageId, 0, 20);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Object listPageByPage(RetailscmUserContext userContext,String pageId, int start, int count) throws Exception {
		SmartList<UiAction> list = uiActionDaoOf(userContext).findUiActionByPage(pageId, start, count, new HashMap<>());
		enhanceForListOfView(userContext, list);
		RetailscmCommonListOfViewPage page = new RetailscmCommonListOfViewPage();
		page.setClassOfList(UiAction.class);
		page.setContainerObject(Page.withId(pageId));
		page.setRequestBeanName(this.getBeanName());
		page.setDataList((SmartList)list);
		page.setPageTitle("页面列表");
		page.setRequestName("listByPage");
		page.setRequestOffset(start);
		page.setRequestLimit(count);
		page.setDisplayMode("auto");

		page.assemblerContent(userContext, "listByPage");
		return page.doRender(userContext);
	}
  
  // -----------------------------------\\ list-of-view 处理 //-----------------------------------
}



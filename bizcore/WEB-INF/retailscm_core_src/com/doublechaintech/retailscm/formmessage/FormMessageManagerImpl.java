
package com.doublechaintech.retailscm.formmessage;

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
import com.terapico.utils.MapUtil;
import com.terapico.utils.ListofUtils;
import com.terapico.utils.TextUtil;
import com.terapico.caf.viewpage.SerializeScope;

import com.doublechaintech.retailscm.*;
import com.doublechaintech.retailscm.tree.*;
import com.doublechaintech.retailscm.treenode.*;
import com.doublechaintech.retailscm.RetailscmUserContextImpl;
import com.doublechaintech.retailscm.iamservice.*;
import com.doublechaintech.retailscm.services.IamService;
import com.doublechaintech.retailscm.secuser.SecUser;
import com.doublechaintech.retailscm.userapp.UserApp;
import com.doublechaintech.retailscm.BaseViewPage;
import com.terapico.uccaf.BaseUserContext;


import com.doublechaintech.retailscm.genericform.GenericForm;

import com.doublechaintech.retailscm.genericform.CandidateGenericForm;







public class FormMessageManagerImpl extends CustomRetailscmCheckerManager implements FormMessageManager, BusinessHandler{

  


	private static final String SERVICE_TYPE = "FormMessage";
	@Override
	public FormMessageDAO daoOf(RetailscmUserContext userContext) {
		return formMessageDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws FormMessageManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new FormMessageManagerException(message);

	}



 	protected FormMessage saveFormMessage(RetailscmUserContext userContext, FormMessage formMessage, String [] tokensExpr) throws Exception{	
 		//return getFormMessageDAO().save(formMessage, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveFormMessage(userContext, formMessage, tokens);
 	}
 	
 	protected FormMessage saveFormMessageDetail(RetailscmUserContext userContext, FormMessage formMessage) throws Exception{	

 		
 		return saveFormMessage(userContext, formMessage, allTokens());
 	}
 	
 	public FormMessage loadFormMessage(RetailscmUserContext userContext, String formMessageId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfFormMessage(formMessageId);
		checkerOf(userContext).throwExceptionIfHasErrors( FormMessageManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		FormMessage formMessage = loadFormMessage( userContext, formMessageId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,formMessage, tokens);
 	}
 	
 	
 	 public FormMessage searchFormMessage(RetailscmUserContext userContext, String formMessageId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfFormMessage(formMessageId);
		checkerOf(userContext).throwExceptionIfHasErrors( FormMessageManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		FormMessage formMessage = loadFormMessage( userContext, formMessageId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,formMessage, tokens);
 	}
 	
 	

 	protected FormMessage present(RetailscmUserContext userContext, FormMessage formMessage, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,formMessage,tokens);
		
		
		FormMessage  formMessageToPresent = formMessageDaoOf(userContext).present(formMessage, tokens);
		
		List<BaseEntity> entityListToNaming = formMessageToPresent.collectRefercencesFromLists();
		formMessageDaoOf(userContext).alias(entityListToNaming);
		
		return  formMessageToPresent;
		
		
	}
 
 	
 	
 	public FormMessage loadFormMessageDetail(RetailscmUserContext userContext, String formMessageId) throws Exception{	
 		FormMessage formMessage = loadFormMessage( userContext, formMessageId, allTokens());
 		return present(userContext,formMessage, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String formMessageId) throws Exception{	
 		FormMessage formMessage = loadFormMessage( userContext, formMessageId, viewTokens());
 		return present(userContext,formMessage, allTokens());
		
 	}
 	protected FormMessage saveFormMessage(RetailscmUserContext userContext, FormMessage formMessage, Map<String,Object>tokens) throws Exception{	
 		return formMessageDaoOf(userContext).save(formMessage, tokens);
 	}
 	protected FormMessage loadFormMessage(RetailscmUserContext userContext, String formMessageId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfFormMessage(formMessageId);
		checkerOf(userContext).throwExceptionIfHasErrors( FormMessageManagerException.class);

 
 		return formMessageDaoOf(userContext).load(formMessageId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, FormMessage formMessage, Map<String, Object> tokens){
		super.addActions(userContext, formMessage, tokens);
		
		addAction(userContext, formMessage, tokens,"@create","createFormMessage","createFormMessage/","main","primary");
		addAction(userContext, formMessage, tokens,"@update","updateFormMessage","updateFormMessage/"+formMessage.getId()+"/","main","primary");
		addAction(userContext, formMessage, tokens,"@copy","cloneFormMessage","cloneFormMessage/"+formMessage.getId()+"/","main","primary");
		
		addAction(userContext, formMessage, tokens,"form_message.transfer_to_form","transferToAnotherForm","transferToAnotherForm/"+formMessage.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, FormMessage formMessage, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public FormMessage createFormMessage(RetailscmUserContext userContext, String title,String formId,String level) throws Exception
	//public FormMessage createFormMessage(RetailscmUserContext userContext,String title, String formId, String level) throws Exception
	{

		

		

		checkerOf(userContext).checkTitleOfFormMessage(title);
		checkerOf(userContext).checkLevelOfFormMessage(level);
	
		checkerOf(userContext).throwExceptionIfHasErrors(FormMessageManagerException.class);


		FormMessage formMessage=createNewFormMessage();	

		formMessage.setTitle(title);
			
		GenericForm form = loadGenericForm(userContext, formId,emptyOptions());
		formMessage.setForm(form);
		
		
		formMessage.setLevel(level);

		formMessage = saveFormMessage(userContext, formMessage, emptyOptions());
		
		onNewInstanceCreated(userContext, formMessage);
		return formMessage;


	}
	protected FormMessage createNewFormMessage()
	{

		return new FormMessage();
	}

	protected void checkParamsForUpdatingFormMessage(RetailscmUserContext userContext,String formMessageId, int formMessageVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfFormMessage(formMessageId);
		checkerOf(userContext).checkVersionOfFormMessage( formMessageVersion);
		

		if(FormMessage.TITLE_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkTitleOfFormMessage(parseString(newValueExpr));
		
			
		}		

		
		if(FormMessage.LEVEL_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkLevelOfFormMessage(parseString(newValueExpr));
		
			
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(FormMessageManagerException.class);


	}



	public FormMessage clone(RetailscmUserContext userContext, String fromFormMessageId) throws Exception{

		return formMessageDaoOf(userContext).clone(fromFormMessageId, this.allTokens());
	}

	public FormMessage internalSaveFormMessage(RetailscmUserContext userContext, FormMessage formMessage) throws Exception
	{
		return internalSaveFormMessage(userContext, formMessage, allTokens());

	}
	public FormMessage internalSaveFormMessage(RetailscmUserContext userContext, FormMessage formMessage, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingFormMessage(userContext, formMessageId, formMessageVersion, property, newValueExpr, tokensExpr);


		synchronized(formMessage){
			//will be good when the formMessage loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to FormMessage.
			if (formMessage.isChanged()){
			
			}
			formMessage = saveFormMessage(userContext, formMessage, options);
			return formMessage;

		}

	}

	public FormMessage updateFormMessage(RetailscmUserContext userContext,String formMessageId, int formMessageVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingFormMessage(userContext, formMessageId, formMessageVersion, property, newValueExpr, tokensExpr);



		FormMessage formMessage = loadFormMessage(userContext, formMessageId, allTokens());
		if(formMessage.getVersion() != formMessageVersion){
			String message = "The target version("+formMessage.getVersion()+") is not equals to version("+formMessageVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(formMessage){
			//will be good when the formMessage loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to FormMessage.
			
			formMessage.changeProperty(property, newValueExpr);
			formMessage = saveFormMessage(userContext, formMessage, tokens().done());
			return present(userContext,formMessage, mergedAllTokens(tokensExpr));
			//return saveFormMessage(userContext, formMessage, tokens().done());
		}

	}

	public FormMessage updateFormMessageProperty(RetailscmUserContext userContext,String formMessageId, int formMessageVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingFormMessage(userContext, formMessageId, formMessageVersion, property, newValueExpr, tokensExpr);

		FormMessage formMessage = loadFormMessage(userContext, formMessageId, allTokens());
		if(formMessage.getVersion() != formMessageVersion){
			String message = "The target version("+formMessage.getVersion()+") is not equals to version("+formMessageVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(formMessage){
			//will be good when the formMessage loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to FormMessage.

			formMessage.changeProperty(property, newValueExpr);
			
			formMessage = saveFormMessage(userContext, formMessage, tokens().done());
			return present(userContext,formMessage, mergedAllTokens(tokensExpr));
			//return saveFormMessage(userContext, formMessage, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected FormMessageTokens tokens(){
		return FormMessageTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return FormMessageTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return FormMessageTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherForm(RetailscmUserContext userContext, String formMessageId, String anotherFormId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfFormMessage(formMessageId);
 		checkerOf(userContext).checkIdOfGenericForm(anotherFormId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(FormMessageManagerException.class);

 	}
 	public FormMessage transferToAnotherForm(RetailscmUserContext userContext, String formMessageId, String anotherFormId) throws Exception
 	{
 		checkParamsForTransferingAnotherForm(userContext, formMessageId,anotherFormId);
 
		FormMessage formMessage = loadFormMessage(userContext, formMessageId, allTokens());	
		synchronized(formMessage){
			//will be good when the formMessage loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			GenericForm form = loadGenericForm(userContext, anotherFormId, emptyOptions());		
			formMessage.updateForm(form);		
			formMessage = saveFormMessage(userContext, formMessage, emptyOptions());
			
			return present(userContext,formMessage, allTokens());
			
		}

 	}

	


	public CandidateGenericForm requestCandidateForm(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateGenericForm result = new CandidateGenericForm();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("title");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<GenericForm> candidateList = genericFormDaoOf(userContext).requestCandidateGenericFormForFormMessage(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected GenericForm loadGenericForm(RetailscmUserContext userContext, String newFormId, Map<String,Object> options) throws Exception
 	{

 		return genericFormDaoOf(userContext).load(newFormId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String formMessageId, int formMessageVersion) throws Exception {
		//deleteInternal(userContext, formMessageId, formMessageVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String formMessageId, int formMessageVersion) throws Exception{

		formMessageDaoOf(userContext).delete(formMessageId, formMessageVersion);
	}

	public FormMessage forgetByAll(RetailscmUserContext userContext, String formMessageId, int formMessageVersion) throws Exception {
		return forgetByAllInternal(userContext, formMessageId, formMessageVersion);
	}
	protected FormMessage forgetByAllInternal(RetailscmUserContext userContext,
			String formMessageId, int formMessageVersion) throws Exception{

		return formMessageDaoOf(userContext).disconnectFromAll(formMessageId, formMessageVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new FormMessageManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return formMessageDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, FormMessage newCreated) throws Exception{
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
		if (secUser == null) {
			iamService.onCheckAccessWhenAnonymousFound(userContext, loginInfo);
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
	// when user authenticated success, but no sec_user related, this maybe a new user login from 3-rd party service.
	public void onAuthenticateNewUserLogged(RetailscmUserContext userContext, LoginContext loginContext,
			LoginResult loginResult, IdentificationHandler idHandler, BusinessHandler bizHandler)
			throws Exception {
		// Generally speaking, when authenticated user logined, we will create a new account for him/her.
		// you need do it like :
		// First, you should create new data such as:
		//   FormMessage newFormMessage = this.createFormMessage(userContext, ...
		// Next, create a sec-user in your business way:
		//   SecUser secUser = secUserManagerOf(userContext).createSecUser(userContext, login, mobile ...
		// And set it into loginContext:
		//   loginContext.getLoginTarget().setSecUser(secUser);
		// Next, create an user-app to connect secUser and newFormMessage
		//   UserApp uerApp = userAppManagerOf(userContext).createUserApp(userContext, secUser.getId(), ...
		// Also, set it into loginContext:
		//   loginContext.getLoginTarget().setUserApp(userApp);
		// Since many of detailed info were depending business requirement, So,
		throw new Exception("请重载函数onAuthenticateNewUserLogged()以处理新用户登录");
	}
	public void onAuthenticateUserLogged(RetailscmUserContext userContext, LoginContext loginContext,
			LoginResult loginResult, IdentificationHandler idHandler, BusinessHandler bizHandler)
			throws Exception {
		// by default, find the correct user-app
		SecUser secUser = loginResult.getLoginContext().getLoginTarget().getSecUser();
		MultipleAccessKey key = new MultipleAccessKey();
		key.put(UserApp.SEC_USER_PROPERTY, secUser.getId());
		key.put(UserApp.OBJECT_TYPE_PROPERTY, FormMessage.INTERNAL_TYPE);
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
    protected void enhanceForListOfView(RetailscmUserContext userContext,SmartList<FormMessage> list) throws Exception {
    	if (list == null || list.isEmpty()){
    		return;
    	}
		List<GenericForm> formList = RetailscmBaseUtils.collectReferencedObjectWithType(userContext, list, GenericForm.class);
		userContext.getDAOGroup().enhanceList(formList, GenericForm.class);


    }
	
	public Object listByForm(RetailscmUserContext userContext,String formId) throws Exception {
		return listPageByForm(userContext, formId, 0, 20);
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Object listPageByForm(RetailscmUserContext userContext,String formId, int start, int count) throws Exception {
		SmartList<FormMessage> list = formMessageDaoOf(userContext).findFormMessageByForm(formId, start, count, new HashMap<>());
		enhanceForListOfView(userContext, list);
		RetailscmCommonListOfViewPage page = new RetailscmCommonListOfViewPage();
		page.setClassOfList(FormMessage.class);
		page.setContainerObject(GenericForm.withId(formId));
		page.setRequestBeanName(this.getBeanName());
		page.setDataList((SmartList)list);
		page.setPageTitle("表单信息列表");
		page.setRequestName("listByForm");
		page.setRequestOffset(start);
		page.setRequestLimit(count);
		page.setDisplayMode("auto");
		page.setLinkToUrl(TextUtil.encodeUrl(String.format("%s/listByForm/%s/",  getBeanName(), formId)));

		page.assemblerContent(userContext, "listByForm");
		return page.doRender(userContext);
	}
  
  // -----------------------------------\\ list-of-view 处理 //-----------------------------------v
  
 	/**
	 * miniprogram调用返回固定的detail class
	 *
	 * @return
	 * @throws Exception
	 */
 	public Object wxappview(RetailscmUserContext userContext, String formMessageId) throws Exception{
	  SerializeScope vscope = RetailscmViewScope.getInstance().getFormMessageDetailScope().clone();
		FormMessage merchantObj = (FormMessage) this.view(userContext, formMessageId);
    String merchantObjId = formMessageId;
    String linkToUrl =	"formMessageManager/wxappview/" + merchantObjId + "/";
    String pageTitle = "表单信息"+"详情";
		Map result = new HashMap();
		List propList = new ArrayList();
		List sections = new ArrayList();
 
		propList.add(
				MapUtil.put("id", "1-id")
				    .put("fieldName", "id")
				    .put("label", "序号")
				    .put("type", "text")
				    .put("displayField", "")
				    .put("linkToUrl", "")
				    .into_map()
		);
		result.put("id", merchantObj.getId());

		propList.add(
				MapUtil.put("id", "2-title")
				    .put("fieldName", "title")
				    .put("label", "头衔")
				    .put("type", "text")
				    .put("displayField", "")
				    .put("linkToUrl", "")
				    .into_map()
		);
		result.put("title", merchantObj.getTitle());

		propList.add(
				MapUtil.put("id", "3-form")
				    .put("fieldName", "form")
				    .put("label", "形式")
				    .put("type", "object")
				    .put("displayField", "title")
				    .put("linkToUrl", "genericFormManager/wxappview/:id/")
				    .into_map()
		);
		result.put("form", merchantObj.getForm());

		propList.add(
				MapUtil.put("id", "4-level")
				    .put("fieldName", "level")
				    .put("label", "水平")
				    .put("type", "text")
				    .put("displayField", "")
				    .put("linkToUrl", "")
				    .into_map()
		);
		result.put("level", merchantObj.getLevel());

		//处理 sectionList

		result.put("propList", propList);
		result.put("sectionList", sections);
		result.put("pageTitle", pageTitle);
		result.put("linkToUrl", linkToUrl);

		vscope.field("propList", SerializeScope.EXCLUDE())
				.field("sectionList", SerializeScope.EXCLUDE())
				.field("pageTitle", SerializeScope.EXCLUDE())
				.field("linkToUrl", SerializeScope.EXCLUDE());
		userContext.forceResponseXClassHeader("com.terapico.appview.DetailPage");
		return BaseViewPage.serialize(result, vscope);
	}

}



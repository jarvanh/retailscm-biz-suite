
package com.doublechaintech.retailscm.section;

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










public class SectionManagerImpl extends CustomRetailscmCheckerManager implements SectionManager, BusinessHandler{

  


	private static final String SERVICE_TYPE = "Section";
	@Override
	public SectionDAO daoOf(RetailscmUserContext userContext) {
		return sectionDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws SectionManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new SectionManagerException(message);

	}



 	protected Section saveSection(RetailscmUserContext userContext, Section section, String [] tokensExpr) throws Exception{	
 		//return getSectionDAO().save(section, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveSection(userContext, section, tokens);
 	}
 	
 	protected Section saveSectionDetail(RetailscmUserContext userContext, Section section) throws Exception{	

 		
 		return saveSection(userContext, section, allTokens());
 	}
 	
 	public Section loadSection(RetailscmUserContext userContext, String sectionId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSection(sectionId);
		checkerOf(userContext).throwExceptionIfHasErrors( SectionManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		Section section = loadSection( userContext, sectionId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,section, tokens);
 	}
 	
 	
 	 public Section searchSection(RetailscmUserContext userContext, String sectionId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSection(sectionId);
		checkerOf(userContext).throwExceptionIfHasErrors( SectionManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		Section section = loadSection( userContext, sectionId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,section, tokens);
 	}
 	
 	

 	protected Section present(RetailscmUserContext userContext, Section section, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,section,tokens);
		
		
		Section  sectionToPresent = sectionDaoOf(userContext).present(section, tokens);
		
		List<BaseEntity> entityListToNaming = sectionToPresent.collectRefercencesFromLists();
		sectionDaoOf(userContext).alias(entityListToNaming);
		
		return  sectionToPresent;
		
		
	}
 
 	
 	
 	public Section loadSectionDetail(RetailscmUserContext userContext, String sectionId) throws Exception{	
 		Section section = loadSection( userContext, sectionId, allTokens());
 		return present(userContext,section, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String sectionId) throws Exception{	
 		Section section = loadSection( userContext, sectionId, viewTokens());
 		return present(userContext,section, allTokens());
		
 	}
 	protected Section saveSection(RetailscmUserContext userContext, Section section, Map<String,Object>tokens) throws Exception{	
 		return sectionDaoOf(userContext).save(section, tokens);
 	}
 	protected Section loadSection(RetailscmUserContext userContext, String sectionId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfSection(sectionId);
		checkerOf(userContext).throwExceptionIfHasErrors( SectionManagerException.class);

 
 		return sectionDaoOf(userContext).load(sectionId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, Section section, Map<String, Object> tokens){
		super.addActions(userContext, section, tokens);
		
		addAction(userContext, section, tokens,"@create","createSection","createSection/","main","primary");
		addAction(userContext, section, tokens,"@update","updateSection","updateSection/"+section.getId()+"/","main","primary");
		addAction(userContext, section, tokens,"@copy","cloneSection","cloneSection/"+section.getId()+"/","main","primary");
		
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, Section section, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public Section createSection(RetailscmUserContext userContext, String title,String brief,String linkToUrl,String page) throws Exception
	//public Section createSection(RetailscmUserContext userContext,String title, String brief, String linkToUrl, String page) throws Exception
	{

		

		

		checkerOf(userContext).checkTitleOfSection(title);
		checkerOf(userContext).checkBriefOfSection(brief);
		checkerOf(userContext).checkLinkToUrlOfSection(linkToUrl);
		checkerOf(userContext).checkPageOfSection(page);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SectionManagerException.class);


		Section section=createNewSection();	

		section.setTitle(title);
		section.setBrief(brief);
		section.setLinkToUrl(linkToUrl);
		section.setPage(page);

		section = saveSection(userContext, section, emptyOptions());
		
		onNewInstanceCreated(userContext, section);
		return section;


	}
	protected Section createNewSection()
	{

		return new Section();
	}

	protected void checkParamsForUpdatingSection(RetailscmUserContext userContext,String sectionId, int sectionVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfSection(sectionId);
		checkerOf(userContext).checkVersionOfSection( sectionVersion);
		

		if(Section.TITLE_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkTitleOfSection(parseString(newValueExpr));
		
			
		}
		if(Section.BRIEF_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkBriefOfSection(parseString(newValueExpr));
		
			
		}
		if(Section.LINK_TO_URL_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkLinkToUrlOfSection(parseString(newValueExpr));
		
			
		}
		if(Section.PAGE_PROPERTY.equals(property)){
		
			checkerOf(userContext).checkPageOfSection(parseString(newValueExpr));
		
			
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(SectionManagerException.class);


	}



	public Section clone(RetailscmUserContext userContext, String fromSectionId) throws Exception{

		return sectionDaoOf(userContext).clone(fromSectionId, this.allTokens());
	}

	public Section internalSaveSection(RetailscmUserContext userContext, Section section) throws Exception
	{
		return internalSaveSection(userContext, section, allTokens());

	}
	public Section internalSaveSection(RetailscmUserContext userContext, Section section, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingSection(userContext, sectionId, sectionVersion, property, newValueExpr, tokensExpr);


		synchronized(section){
			//will be good when the section loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to Section.
			if (section.isChanged()){
			
			}
			section = saveSection(userContext, section, options);
			return section;

		}

	}

	public Section updateSection(RetailscmUserContext userContext,String sectionId, int sectionVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSection(userContext, sectionId, sectionVersion, property, newValueExpr, tokensExpr);



		Section section = loadSection(userContext, sectionId, allTokens());
		if(section.getVersion() != sectionVersion){
			String message = "The target version("+section.getVersion()+") is not equals to version("+sectionVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(section){
			//will be good when the section loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to Section.
			
			section.changeProperty(property, newValueExpr);
			section = saveSection(userContext, section, tokens().done());
			return present(userContext,section, mergedAllTokens(tokensExpr));
			//return saveSection(userContext, section, tokens().done());
		}

	}

	public Section updateSectionProperty(RetailscmUserContext userContext,String sectionId, int sectionVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSection(userContext, sectionId, sectionVersion, property, newValueExpr, tokensExpr);

		Section section = loadSection(userContext, sectionId, allTokens());
		if(section.getVersion() != sectionVersion){
			String message = "The target version("+section.getVersion()+") is not equals to version("+sectionVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(section){
			//will be good when the section loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to Section.

			section.changeProperty(property, newValueExpr);
			
			section = saveSection(userContext, section, tokens().done());
			return present(userContext,section, mergedAllTokens(tokensExpr));
			//return saveSection(userContext, section, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected SectionTokens tokens(){
		return SectionTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return SectionTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return SectionTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String sectionId, int sectionVersion) throws Exception {
		//deleteInternal(userContext, sectionId, sectionVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String sectionId, int sectionVersion) throws Exception{

		sectionDaoOf(userContext).delete(sectionId, sectionVersion);
	}

	public Section forgetByAll(RetailscmUserContext userContext, String sectionId, int sectionVersion) throws Exception {
		return forgetByAllInternal(userContext, sectionId, sectionVersion);
	}
	protected Section forgetByAllInternal(RetailscmUserContext userContext,
			String sectionId, int sectionVersion) throws Exception{

		return sectionDaoOf(userContext).disconnectFromAll(sectionId, sectionVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new SectionManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return sectionDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, Section newCreated) throws Exception{
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
		key.put(UserApp.OBJECT_TYPE_PROPERTY, Section.INTERNAL_TYPE);
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
    protected void enhanceForListOfView(RetailscmUserContext userContext,SmartList<Section> list) throws Exception {
    	if (list == null || list.isEmpty()){
    		return;
    	}


    }
	
  // -----------------------------------\\ list-of-view 处理 //-----------------------------------
}



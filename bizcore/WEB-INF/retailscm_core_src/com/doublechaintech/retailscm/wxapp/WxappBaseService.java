package com.doublechaintech.retailscm.wxapp;
import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.BaseViewPage;
import com.doublechaintech.retailscm.CustomRetailscmCheckerManager;
import com.doublechaintech.retailscm.CustomRetailscmUserContextImpl;
import com.doublechaintech.retailscm.RetailscmUserContextImpl;
import com.doublechaintech.retailscm.RetailscmViewScope;
import com.doublechaintech.retailscm.page.PageManagerImpl;
import com.doublechaintech.retailscm.secuser.SecUser;
import com.doublechaintech.retailscm.secuser.SecUserManagerImpl;
import com.doublechaintech.retailscm.services.IamService;
import com.doublechaintech.retailscm.userapp.UserApp;

import com.doublechaintech.retailscm.page.Page;



import com.terapico.caf.Password;
import com.terapico.caf.baseelement.LoginParam;
import com.terapico.caf.viewpage.SerializeScope;
import com.terapico.uccaf.BaseUserContext;

public class WxappBaseService extends CustomRetailscmCheckerManager{

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

	protected boolean isMethodNeedLogin(RetailscmUserContextImpl userContext, String methodName, Object[] parameters) {
		if (methodName.startsWith("customer")) {
			return true;
		}
		return false;
	}

	protected void afterSecUserAppLoadedWhenCheckAccess(RetailscmUserContextImpl ctx, Map<String, Object> loginInfo,
			SecUser secUser, UserApp userApp) {
		// 默认加载userApp指定的对象到 currentUserInfo里. 这个逻辑不一定正确,项目上需要自己处理
		if (userApp == null) {
			return;
		}
		BaseEntity app = ctx.getDAOGroup().loadBasicData(userApp.getObjectType(), userApp.getObjectId());
		((CustomRetailscmUserContextImpl)ctx).setCurrentUserInfo(app);
	}

	public Object clientLogin(RetailscmUserContextImpl ctx, LoginParam param) throws Exception {

		SecUserManagerImpl mng = (SecUserManagerImpl) ctx.getManagerGroup().getSecUserManager();

		if (param.getLoginMethod().equals(LoginParam.MOBILE_VCODE)) {
			return mng.loginByMobile(ctx, param.getMobile(), param.getVerifyCode());
		}

		if (param.getLoginMethod().equals(LoginParam.WECHAT_APP)) {
			return mng.loginByWechatMiniProgram(ctx, param.getCode());
		}

		if (param.getLoginMethod().equals(LoginParam.WECHAT_WORK_APP)) {
			return mng.loginByWechatWorkMiniProgram(ctx, param.getCode());
		}

		if (param.getLoginMethod().equals(LoginParam.ACCOUNT_PASSWORD)) {
			return mng.loginByPassword(ctx, param.getLogin(), new Password(param.getPassword()));
		}

		throw new Exception("自动生成的登录尚不支持"+param.getLoginMethod()+"方式登录");
	}

	public Object viewHomePage(CustomRetailscmUserContextImpl ctx) throws Exception {
		PageManagerImpl pageManager = (PageManagerImpl) pageManagerOf(ctx);
		SerializeScope vscope = RetailscmViewScope.getInstance().getPageDetailScope();

		Map result = new HashMap();
		Map section=new HashMap();


		Page pageData = (Page) pageManager.view(ctx, "P000001");
		result.put( "id", pageData.getId() );
		result.put( "pageTitle", pageData.getPageTitle() );
		result.put( "linkToUrl", pageData.getLinkToUrl() );
		result.put( "pageType", pageData.getPageType() );
		result.put( "slideList", pageData.getSlideList() );
		result.put( "actionList", pageData.getUiActionList() );
		result.put( "sectionList", sectionList );

		ctx.forceResponseXClassHeader("com.terapico.appview.HomePage");
		return BaseViewPage.serialize(result, vscope);
	}

	public Object viewMePage(CustomRetailscmUserContextImpl ctx)throws Exception {
		PageManagerImpl mng = (PageManagerImpl) pageManagerOf(ctx);
		SerializeScope vscope = RetailscmViewScope.getInstance().getPageDetailScope();
		ctx.forceResponseXClassHeader("com.terapico.appview.MePage");
		return BaseViewPage.serialize(mng.view(ctx, "P000002"), vscope);
	}

	public Object viewServiceCenterPage(CustomRetailscmUserContextImpl ctx) throws Exception {
		PageManagerImpl mng = (PageManagerImpl) pageManagerOf(ctx);
		SerializeScope vscope = RetailscmViewScope.getInstance().getPageDetailScope();
		ctx.forceResponseXClassHeader("com.terapico.appview.ServiceCenterPage");
		return BaseViewPage.serialize(mng.view(ctx, "P000003"), vscope);
	}
}








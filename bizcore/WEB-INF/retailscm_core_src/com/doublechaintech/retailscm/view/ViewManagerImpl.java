
package com.doublechaintech.retailscm.view;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;









public class ViewManagerImpl extends CustomRetailscmCheckerManager implements ViewManager {

  


	private static final String SERVICE_TYPE = "View";
	@Override
	public ViewDAO daoOf(RetailscmUserContext userContext) {
		return viewDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws ViewManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new ViewManagerException(message);

	}



 	protected View saveView(RetailscmUserContext userContext, View view, String [] tokensExpr) throws Exception{	
 		//return getViewDAO().save(view, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveView(userContext, view, tokens);
 	}
 	
 	protected View saveViewDetail(RetailscmUserContext userContext, View view) throws Exception{	

 		
 		return saveView(userContext, view, allTokens());
 	}
 	
 	public View loadView(RetailscmUserContext userContext, String viewId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfView(viewId);
		checkerOf(userContext).throwExceptionIfHasErrors( ViewManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		View view = loadView( userContext, viewId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,view, tokens);
 	}
 	
 	
 	 public View searchView(RetailscmUserContext userContext, String viewId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfView(viewId);
		checkerOf(userContext).throwExceptionIfHasErrors( ViewManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		View view = loadView( userContext, viewId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,view, tokens);
 	}
 	
 	

 	protected View present(RetailscmUserContext userContext, View view, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,view,tokens);
		
		
		View  viewToPresent = viewDaoOf(userContext).present(view, tokens);
		
		List<BaseEntity> entityListToNaming = viewToPresent.collectRefercencesFromLists();
		viewDaoOf(userContext).alias(entityListToNaming);
		
		return  viewToPresent;
		
		
	}
 
 	
 	
 	public View loadViewDetail(RetailscmUserContext userContext, String viewId) throws Exception{	
 		View view = loadView( userContext, viewId, allTokens());
 		return present(userContext,view, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String viewId) throws Exception{	
 		View view = loadView( userContext, viewId, viewTokens());
 		return present(userContext,view, allTokens());
		
 	}
 	protected View saveView(RetailscmUserContext userContext, View view, Map<String,Object>tokens) throws Exception{	
 		return viewDaoOf(userContext).save(view, tokens);
 	}
 	protected View loadView(RetailscmUserContext userContext, String viewId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfView(viewId);
		checkerOf(userContext).throwExceptionIfHasErrors( ViewManagerException.class);

 
 		return viewDaoOf(userContext).load(viewId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, View view, Map<String, Object> tokens){
		super.addActions(userContext, view, tokens);
		
		addAction(userContext, view, tokens,"@create","createView","createView/","main","primary");
		addAction(userContext, view, tokens,"@update","updateView","updateView/"+view.getId()+"/","main","primary");
		addAction(userContext, view, tokens,"@copy","cloneView","cloneView/"+view.getId()+"/","main","primary");
		
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, View view, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public View createView(RetailscmUserContext userContext, String who,String assessment,Date interviewTime) throws Exception
	//public View createView(RetailscmUserContext userContext,String who, String assessment, Date interviewTime) throws Exception
	{

		

		

		checkerOf(userContext).checkWhoOfView(who);
		checkerOf(userContext).checkAssessmentOfView(assessment);
		checkerOf(userContext).checkInterviewTimeOfView(interviewTime);
	
		checkerOf(userContext).throwExceptionIfHasErrors(ViewManagerException.class);


		View view=createNewView();	

		view.setWho(who);
		view.setAssessment(assessment);
		view.setInterviewTime(interviewTime);

		view = saveView(userContext, view, emptyOptions());
		
		onNewInstanceCreated(userContext, view);
		return view;


	}
	protected View createNewView()
	{

		return new View();
	}

	protected void checkParamsForUpdatingView(RetailscmUserContext userContext,String viewId, int viewVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfView(viewId);
		checkerOf(userContext).checkVersionOfView( viewVersion);
		

		if(View.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfView(parseString(newValueExpr));
		}
		if(View.ASSESSMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAssessmentOfView(parseString(newValueExpr));
		}
		if(View.INTERVIEW_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkInterviewTimeOfView(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(ViewManagerException.class);


	}



	public View clone(RetailscmUserContext userContext, String fromViewId) throws Exception{

		return viewDaoOf(userContext).clone(fromViewId, this.allTokens());
	}

	public View internalSaveView(RetailscmUserContext userContext, View view) throws Exception
	{
		return internalSaveView(userContext, view, allTokens());

	}
	public View internalSaveView(RetailscmUserContext userContext, View view, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingView(userContext, viewId, viewVersion, property, newValueExpr, tokensExpr);


		synchronized(view){
			//will be good when the view loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to View.
			if (view.isChanged()){
			
			}
			view = saveView(userContext, view, options);
			return view;

		}

	}

	public View updateView(RetailscmUserContext userContext,String viewId, int viewVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingView(userContext, viewId, viewVersion, property, newValueExpr, tokensExpr);



		View view = loadView(userContext, viewId, allTokens());
		if(view.getVersion() != viewVersion){
			String message = "The target version("+view.getVersion()+") is not equals to version("+viewVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(view){
			//will be good when the view loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to View.
			
			view.changeProperty(property, newValueExpr);
			view = saveView(userContext, view, tokens().done());
			return present(userContext,view, mergedAllTokens(tokensExpr));
			//return saveView(userContext, view, tokens().done());
		}

	}

	public View updateViewProperty(RetailscmUserContext userContext,String viewId, int viewVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingView(userContext, viewId, viewVersion, property, newValueExpr, tokensExpr);

		View view = loadView(userContext, viewId, allTokens());
		if(view.getVersion() != viewVersion){
			String message = "The target version("+view.getVersion()+") is not equals to version("+viewVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(view){
			//will be good when the view loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to View.

			view.changeProperty(property, newValueExpr);
			
			view = saveView(userContext, view, tokens().done());
			return present(userContext,view, mergedAllTokens(tokensExpr));
			//return saveView(userContext, view, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected ViewTokens tokens(){
		return ViewTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return ViewTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return ViewTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String viewId, int viewVersion) throws Exception {
		//deleteInternal(userContext, viewId, viewVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String viewId, int viewVersion) throws Exception{

		viewDaoOf(userContext).delete(viewId, viewVersion);
	}

	public View forgetByAll(RetailscmUserContext userContext, String viewId, int viewVersion) throws Exception {
		return forgetByAllInternal(userContext, viewId, viewVersion);
	}
	protected View forgetByAllInternal(RetailscmUserContext userContext,
			String viewId, int viewVersion) throws Exception{

		return viewDaoOf(userContext).disconnectFromAll(viewId, viewVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new ViewManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return viewDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, View newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



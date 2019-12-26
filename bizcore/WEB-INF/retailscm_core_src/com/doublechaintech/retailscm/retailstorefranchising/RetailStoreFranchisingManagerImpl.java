
package com.doublechaintech.retailscm.retailstorefranchising;

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

import com.doublechaintech.retailscm.retailstore.RetailStore;


import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstoreclosing.RetailStoreClosing;
import com.doublechaintech.retailscm.retailstoreinvestmentinvitation.RetailStoreInvestmentInvitation;
import com.doublechaintech.retailscm.retailstoredecoration.RetailStoreDecoration;
import com.doublechaintech.retailscm.retailstorecreation.RetailStoreCreation;
import com.doublechaintech.retailscm.retailstoreopening.RetailStoreOpening;
import com.doublechaintech.retailscm.retailstorecityservicecenter.RetailStoreCityServiceCenter;
import com.doublechaintech.retailscm.retailstorefranchising.RetailStoreFranchising;






public class RetailStoreFranchisingManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreFranchisingManager {
	
	private static final String SERVICE_TYPE = "RetailStoreFranchising";
	@Override
	public RetailStoreFranchisingDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreFranchisingDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreFranchisingManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreFranchisingManagerException(message);

	}
	
	

 	protected RetailStoreFranchising saveRetailStoreFranchising(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreFranchisingDAO().save(retailStoreFranchising, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens);
 	}
 	
 	protected RetailStoreFranchising saveRetailStoreFranchisingDetail(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising) throws Exception{	

 		
 		return saveRetailStoreFranchising(userContext, retailStoreFranchising, allTokens());
 	}
 	
 	public RetailStoreFranchising loadRetailStoreFranchising(RetailscmUserContext userContext, String retailStoreFranchisingId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreFranchisingManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising( userContext, retailStoreFranchisingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreFranchising, tokens);
 	}
 	
 	
 	 public RetailStoreFranchising searchRetailStoreFranchising(RetailscmUserContext userContext, String retailStoreFranchisingId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreFranchisingManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising( userContext, retailStoreFranchisingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreFranchising, tokens);
 	}
 	
 	

 	protected RetailStoreFranchising present(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreFranchising,tokens);
		
		
		RetailStoreFranchising  retailStoreFranchisingToPresent = retailStoreFranchisingDaoOf(userContext).present(retailStoreFranchising, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreFranchisingToPresent.collectRefercencesFromLists();
		retailStoreFranchisingDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreFranchisingToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreFranchising loadRetailStoreFranchisingDetail(RetailscmUserContext userContext, String retailStoreFranchisingId) throws Exception{	
 		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising( userContext, retailStoreFranchisingId, allTokens());
 		return present(userContext,retailStoreFranchising, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreFranchisingId) throws Exception{	
 		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising( userContext, retailStoreFranchisingId, viewTokens());
 		return present(userContext,retailStoreFranchising, allTokens());
		
 	}
 	protected RetailStoreFranchising saveRetailStoreFranchising(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, Map<String,Object>tokens) throws Exception{	
 		return retailStoreFranchisingDaoOf(userContext).save(retailStoreFranchising, tokens);
 	}
 	protected RetailStoreFranchising loadRetailStoreFranchising(RetailscmUserContext userContext, String retailStoreFranchisingId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreFranchisingManagerException.class);

 
 		return retailStoreFranchisingDaoOf(userContext).load(retailStoreFranchisingId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreFranchising, tokens);
		
		addAction(userContext, retailStoreFranchising, tokens,"@create","createRetailStoreFranchising","createRetailStoreFranchising/","main","primary");
		addAction(userContext, retailStoreFranchising, tokens,"@update","updateRetailStoreFranchising","updateRetailStoreFranchising/"+retailStoreFranchising.getId()+"/","main","primary");
		addAction(userContext, retailStoreFranchising, tokens,"@copy","cloneRetailStoreFranchising","cloneRetailStoreFranchising/"+retailStoreFranchising.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreFranchising, tokens,"retail_store_franchising.addRetailStore","addRetailStore","addRetailStore/"+retailStoreFranchising.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreFranchising, tokens,"retail_store_franchising.removeRetailStore","removeRetailStore","removeRetailStore/"+retailStoreFranchising.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreFranchising, tokens,"retail_store_franchising.updateRetailStore","updateRetailStore","updateRetailStore/"+retailStoreFranchising.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreFranchising, tokens,"retail_store_franchising.copyRetailStoreFrom","copyRetailStoreFrom","copyRetailStoreFrom/"+retailStoreFranchising.getId()+"/","retailStoreList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreFranchising createRetailStoreFranchising(RetailscmUserContext userContext, String comment) throws Exception
	//public RetailStoreFranchising createRetailStoreFranchising(RetailscmUserContext userContext,String comment) throws Exception
	{
		
		

		

		checkerOf(userContext).checkCommentOfRetailStoreFranchising(comment);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);


		RetailStoreFranchising retailStoreFranchising=createNewRetailStoreFranchising();	

		retailStoreFranchising.setComment(comment);

		retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreFranchising);
		return retailStoreFranchising;

		
	}
	protected RetailStoreFranchising createNewRetailStoreFranchising() 
	{
		
		return new RetailStoreFranchising();		
	}
	
	protected void checkParamsForUpdatingRetailStoreFranchising(RetailscmUserContext userContext,String retailStoreFranchisingId, int retailStoreFranchisingVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).checkVersionOfRetailStoreFranchising( retailStoreFranchisingVersion);
		

		if(RetailStoreFranchising.COMMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentOfRetailStoreFranchising(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
	
		
	}
	
	
	
	public RetailStoreFranchising clone(RetailscmUserContext userContext, String fromRetailStoreFranchisingId) throws Exception{
		
		return retailStoreFranchisingDaoOf(userContext).clone(fromRetailStoreFranchisingId, this.allTokens());
	}
	
	public RetailStoreFranchising internalSaveRetailStoreFranchising(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising) throws Exception 
	{
		return internalSaveRetailStoreFranchising(userContext, retailStoreFranchising, allTokens());

	}
	public RetailStoreFranchising internalSaveRetailStoreFranchising(RetailscmUserContext userContext, RetailStoreFranchising retailStoreFranchising, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreFranchising(userContext, retailStoreFranchisingId, retailStoreFranchisingVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreFranchising){ 
			//will be good when the retailStoreFranchising loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreFranchising.
			if (retailStoreFranchising.isChanged()){
			
			}
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, options);
			return retailStoreFranchising;
			
		}

	}
	
	public RetailStoreFranchising updateRetailStoreFranchising(RetailscmUserContext userContext,String retailStoreFranchisingId, int retailStoreFranchisingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreFranchising(userContext, retailStoreFranchisingId, retailStoreFranchisingVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
		if(retailStoreFranchising.getVersion() != retailStoreFranchisingVersion){
			String message = "The target version("+retailStoreFranchising.getVersion()+") is not equals to version("+retailStoreFranchisingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreFranchising){ 
			//will be good when the retailStoreFranchising loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreFranchising.
			
			retailStoreFranchising.changeProperty(property, newValueExpr);
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().done());
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
			//return saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().done());
		}

	}
	
	public RetailStoreFranchising updateRetailStoreFranchisingProperty(RetailscmUserContext userContext,String retailStoreFranchisingId, int retailStoreFranchisingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreFranchising(userContext, retailStoreFranchisingId, retailStoreFranchisingVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
		if(retailStoreFranchising.getVersion() != retailStoreFranchisingVersion){
			String message = "The target version("+retailStoreFranchising.getVersion()+") is not equals to version("+retailStoreFranchisingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreFranchising){ 
			//will be good when the retailStoreFranchising loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreFranchising.
			
			retailStoreFranchising.changeProperty(property, newValueExpr);
			
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().done());
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
			//return saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreFranchisingTokens tokens(){
		return RetailStoreFranchisingTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreFranchisingTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreFranchisingTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreFranchisingId, int retailStoreFranchisingVersion) throws Exception {
		//deleteInternal(userContext, retailStoreFranchisingId, retailStoreFranchisingVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreFranchisingId, int retailStoreFranchisingVersion) throws Exception{
			
		retailStoreFranchisingDaoOf(userContext).delete(retailStoreFranchisingId, retailStoreFranchisingVersion);
	}
	
	public RetailStoreFranchising forgetByAll(RetailscmUserContext userContext, String retailStoreFranchisingId, int retailStoreFranchisingVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreFranchisingId, retailStoreFranchisingVersion);		
	}
	protected RetailStoreFranchising forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreFranchisingId, int retailStoreFranchisingVersion) throws Exception{
			
		return retailStoreFranchisingDaoOf(userContext).disconnectFromAll(retailStoreFranchisingId, retailStoreFranchisingVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreFranchisingManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreFranchisingDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreFranchising with retail_store_country_center in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByRetailStoreCountryCenter(RetailscmUserContext userContext, String retailStoreFranchisingId, String retailStoreCountryCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithRetailStoreCountryCenter(retailStoreFranchising, retailStoreCountryCenterId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with city_service_center in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByCityServiceCenter(RetailscmUserContext userContext, String retailStoreFranchisingId, String cityServiceCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithCityServiceCenter(retailStoreFranchising, cityServiceCenterId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with creation in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByCreation(RetailscmUserContext userContext, String retailStoreFranchisingId, String creationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithCreation(retailStoreFranchising, creationId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with investment_invitation in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByInvestmentInvitation(RetailscmUserContext userContext, String retailStoreFranchisingId, String investmentInvitationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithInvestmentInvitation(retailStoreFranchising, investmentInvitationId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with decoration in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByDecoration(RetailscmUserContext userContext, String retailStoreFranchisingId, String decorationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithDecoration(retailStoreFranchising, decorationId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with opening in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByOpening(RetailscmUserContext userContext, String retailStoreFranchisingId, String openingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithOpening(retailStoreFranchising, openingId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	//disconnect RetailStoreFranchising with closing in RetailStore
	protected RetailStoreFranchising breakWithRetailStoreByClosing(RetailscmUserContext userContext, String retailStoreFranchisingId, String closingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());

			synchronized(retailStoreFranchising){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreListWithClosing(retailStoreFranchising, closingId, this.emptyOptions());

				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				return retailStoreFranchising;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);

		
		checkerOf(userContext).checkNameOfRetailStore(name);
		
		checkerOf(userContext).checkTelephoneOfRetailStore(telephone);
		
		checkerOf(userContext).checkOwnerOfRetailStore(owner);
		
		checkerOf(userContext).checkRetailStoreCountryCenterIdOfRetailStore(retailStoreCountryCenterId);
		
		checkerOf(userContext).checkCityServiceCenterIdOfRetailStore(cityServiceCenterId);
		
		checkerOf(userContext).checkCreationIdOfRetailStore(creationId);
		
		checkerOf(userContext).checkInvestmentInvitationIdOfRetailStore(investmentInvitationId);
		
		checkerOf(userContext).checkDecorationIdOfRetailStore(decorationId);
		
		checkerOf(userContext).checkOpeningIdOfRetailStore(openingId);
		
		checkerOf(userContext).checkClosingIdOfRetailStore(closingId);
		
		checkerOf(userContext).checkFoundedOfRetailStore(founded);
		
		checkerOf(userContext).checkLatitudeOfRetailStore(latitude);
		
		checkerOf(userContext).checkLongitudeOfRetailStore(longitude);
		
		checkerOf(userContext).checkDescriptionOfRetailStore(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);

	
	}
	public  RetailStoreFranchising addRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStore(userContext,retailStoreFranchisingId,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, decorationId, openingId, closingId, founded, latitude, longitude, description,tokensExpr);
		
		RetailStore retailStore = createRetailStore(userContext,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, decorationId, openingId, closingId, founded, latitude, longitude, description);
		
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
		synchronized(retailStoreFranchising){ 
			//Will be good when the retailStoreFranchising loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreFranchising.addRetailStore( retailStore );		
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, retailStore);
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreProperties(RetailscmUserContext userContext, String retailStoreFranchisingId,String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).checkIdOfRetailStore(id);
		
		checkerOf(userContext).checkNameOfRetailStore( name);
		checkerOf(userContext).checkTelephoneOfRetailStore( telephone);
		checkerOf(userContext).checkOwnerOfRetailStore( owner);
		checkerOf(userContext).checkFoundedOfRetailStore( founded);
		checkerOf(userContext).checkLatitudeOfRetailStore( latitude);
		checkerOf(userContext).checkLongitudeOfRetailStore( longitude);
		checkerOf(userContext).checkDescriptionOfRetailStore( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
		
	}
	public  RetailStoreFranchising updateRetailStoreProperties(RetailscmUserContext userContext, String retailStoreFranchisingId, String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreProperties(userContext,retailStoreFranchisingId,id,name,telephone,owner,founded,latitude,longitude,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreListList()
				.searchRetailStoreListWith(RetailStore.ID_PROPERTY, "is", id).done();
		
		RetailStoreFranchising retailStoreFranchisingToUpdate = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, options);
		
		if(retailStoreFranchisingToUpdate.getRetailStoreList().isEmpty()){
			throw new RetailStoreFranchisingManagerException("RetailStore is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStore item = retailStoreFranchisingToUpdate.getRetailStoreList().first();
		
		item.updateName( name );
		item.updateTelephone( telephone );
		item.updateOwner( owner );
		item.updateFounded( founded );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );
		item.updateDescription( description );

		
		//checkParamsForAddingRetailStore(userContext,retailStoreFranchisingId,name, code, used,tokensExpr);
		RetailStoreFranchising retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchisingToUpdate, tokens().withRetailStoreList().done());
		synchronized(retailStoreFranchising){ 
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStore createRetailStore(RetailscmUserContext userContext, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description) throws Exception{

		RetailStore retailStore = new RetailStore();
		
		
		retailStore.setName(name);		
		retailStore.setTelephone(telephone);		
		retailStore.setOwner(owner);		
		RetailStoreCountryCenter  retailStoreCountryCenter = new RetailStoreCountryCenter();
		retailStoreCountryCenter.setId(retailStoreCountryCenterId);		
		retailStore.setRetailStoreCountryCenter(retailStoreCountryCenter);		
		RetailStoreCityServiceCenter  cityServiceCenter = new RetailStoreCityServiceCenter();
		cityServiceCenter.setId(cityServiceCenterId);		
		retailStore.setCityServiceCenter(cityServiceCenter);		
		RetailStoreCreation  creation = new RetailStoreCreation();
		creation.setId(creationId);		
		retailStore.setCreation(creation);		
		RetailStoreInvestmentInvitation  investmentInvitation = new RetailStoreInvestmentInvitation();
		investmentInvitation.setId(investmentInvitationId);		
		retailStore.setInvestmentInvitation(investmentInvitation);		
		RetailStoreDecoration  decoration = new RetailStoreDecoration();
		decoration.setId(decorationId);		
		retailStore.setDecoration(decoration);		
		RetailStoreOpening  opening = new RetailStoreOpening();
		opening.setId(openingId);		
		retailStore.setOpening(opening);		
		RetailStoreClosing  closing = new RetailStoreClosing();
		closing.setId(closingId);		
		retailStore.setClosing(closing);		
		retailStore.setFounded(founded);		
		retailStore.setLatitude(latitude);		
		retailStore.setLongitude(longitude);		
		retailStore.setDescription(description);		
		retailStore.setLastUpdateTime(userContext.now());
	
		
		return retailStore;
	
		
	}
	
	protected RetailStore createIndexedRetailStore(String id, int version){

		RetailStore retailStore = new RetailStore();
		retailStore.setId(id);
		retailStore.setVersion(version);
		return retailStore;			
		
	}
	
	protected void checkParamsForRemovingRetailStoreList(RetailscmUserContext userContext, String retailStoreFranchisingId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		for(String retailStoreIdItem: retailStoreIds){
			userContext.getChecker().checkIdOfRetailStore(retailStoreIdItem);
=======
		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		for(String retailStoreIdItem: retailStoreIds){
			checkerOf(userContext).checkIdOfRetailStore(retailStoreIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
		
	}
	public  RetailStoreFranchising removeRetailStoreList(RetailscmUserContext userContext, String retailStoreFranchisingId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreList(userContext, retailStoreFranchisingId,  retailStoreIds, tokensExpr);
			
			
			RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
			synchronized(retailStoreFranchising){ 
				//Will be good when the retailStoreFranchising loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreFranchisingDaoOf(userContext).planToRemoveRetailStoreList(retailStoreFranchising, retailStoreIds, allTokens());
				retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
				deleteRelationListInGraph(userContext, retailStoreFranchising.getRetailStoreList());
				return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreFranchising( retailStoreFranchisingId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
	
	}
	public  RetailStoreFranchising removeRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStore(userContext,retailStoreFranchisingId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
		synchronized(retailStoreFranchising){ 
			//Will be good when the retailStoreFranchising loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreFranchising.removeRetailStore( retailStore );		
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
			deleteRelationInGraph(userContext, retailStore);
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreFranchising( retailStoreFranchisingId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
	
	}
	public  RetailStoreFranchising copyRetailStoreFrom(RetailscmUserContext userContext, String retailStoreFranchisingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStore(userContext,retailStoreFranchisingId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, allTokens());
		synchronized(retailStoreFranchising){ 
			//Will be good when the retailStoreFranchising loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStore.updateLastUpdateTime(userContext.now());
			
			retailStoreFranchising.copyRetailStoreFrom( retailStore );		
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, (RetailStore)retailStoreFranchising.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreFranchising(retailStoreFranchisingId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		

		if(RetailStore.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.TELEPHONE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTelephoneOfRetailStore(parseLong(newValueExpr));
		}
		
		if(RetailStore.OWNER_PROPERTY.equals(property)){
			checkerOf(userContext).checkOwnerOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.FOUNDED_PROPERTY.equals(property)){
			checkerOf(userContext).checkFoundedOfRetailStore(parseDate(newValueExpr));
		}
		
		if(RetailStore.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfRetailStore(parseBigDecimal(newValueExpr));
		}
		
		if(RetailStore.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfRetailStore(parseBigDecimal(newValueExpr));
		}
		
		if(RetailStore.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfRetailStore(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreFranchisingManagerException.class);
	
	}
	
	public  RetailStoreFranchising updateRetailStore(RetailscmUserContext userContext, String retailStoreFranchisingId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStore(userContext, retailStoreFranchisingId, retailStoreId, retailStoreVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreList().searchRetailStoreListWith(RetailStore.ID_PROPERTY, "eq", retailStoreId).done();
		
		
		
		RetailStoreFranchising retailStoreFranchising = loadRetailStoreFranchising(userContext, retailStoreFranchisingId, loadTokens);
		
		synchronized(retailStoreFranchising){ 
			//Will be good when the retailStoreFranchising loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreFranchising.removeRetailStore( retailStore );	
			//make changes to AcceleraterAccount.
			RetailStore retailStoreIndex = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		
			RetailStore retailStore = retailStoreFranchising.findTheRetailStore(retailStoreIndex);
			if(retailStore == null){
				throw new RetailStoreFranchisingManagerException(retailStore+" is NOT FOUND" );
			}
			
			retailStore.changeProperty(property, newValueExpr);
			retailStore.updateLastUpdateTime(userContext.now());
			retailStoreFranchising = saveRetailStoreFranchising(userContext, retailStoreFranchising, tokens().withRetailStoreList().done());
			return present(userContext,retailStoreFranchising, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreFranchising newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



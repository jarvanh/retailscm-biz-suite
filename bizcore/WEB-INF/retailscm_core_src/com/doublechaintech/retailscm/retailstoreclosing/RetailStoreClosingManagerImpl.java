
package com.doublechaintech.retailscm.retailstoreclosing;

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






public class RetailStoreClosingManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreClosingManager {
	
	private static final String SERVICE_TYPE = "RetailStoreClosing";
	@Override
	public RetailStoreClosingDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreClosingDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreClosingManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreClosingManagerException(message);

	}
	
	

 	protected RetailStoreClosing saveRetailStoreClosing(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreClosingDAO().save(retailStoreClosing, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreClosing(userContext, retailStoreClosing, tokens);
 	}
 	
 	protected RetailStoreClosing saveRetailStoreClosingDetail(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing) throws Exception{	

 		
 		return saveRetailStoreClosing(userContext, retailStoreClosing, allTokens());
 	}
 	
 	public RetailStoreClosing loadRetailStoreClosing(RetailscmUserContext userContext, String retailStoreClosingId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreClosingManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing( userContext, retailStoreClosingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreClosing, tokens);
 	}
 	
 	
 	 public RetailStoreClosing searchRetailStoreClosing(RetailscmUserContext userContext, String retailStoreClosingId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreClosingManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing( userContext, retailStoreClosingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreClosing, tokens);
 	}
 	
 	

 	protected RetailStoreClosing present(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreClosing,tokens);
		
		
		RetailStoreClosing  retailStoreClosingToPresent = retailStoreClosingDaoOf(userContext).present(retailStoreClosing, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreClosingToPresent.collectRefercencesFromLists();
		retailStoreClosingDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreClosingToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreClosing loadRetailStoreClosingDetail(RetailscmUserContext userContext, String retailStoreClosingId) throws Exception{	
 		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing( userContext, retailStoreClosingId, allTokens());
 		return present(userContext,retailStoreClosing, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreClosingId) throws Exception{	
 		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing( userContext, retailStoreClosingId, viewTokens());
 		return present(userContext,retailStoreClosing, allTokens());
		
 	}
 	protected RetailStoreClosing saveRetailStoreClosing(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, Map<String,Object>tokens) throws Exception{	
 		return retailStoreClosingDaoOf(userContext).save(retailStoreClosing, tokens);
 	}
 	protected RetailStoreClosing loadRetailStoreClosing(RetailscmUserContext userContext, String retailStoreClosingId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreClosingManagerException.class);

 
 		return retailStoreClosingDaoOf(userContext).load(retailStoreClosingId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreClosing, tokens);
		
		addAction(userContext, retailStoreClosing, tokens,"@create","createRetailStoreClosing","createRetailStoreClosing/","main","primary");
		addAction(userContext, retailStoreClosing, tokens,"@update","updateRetailStoreClosing","updateRetailStoreClosing/"+retailStoreClosing.getId()+"/","main","primary");
		addAction(userContext, retailStoreClosing, tokens,"@copy","cloneRetailStoreClosing","cloneRetailStoreClosing/"+retailStoreClosing.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreClosing, tokens,"retail_store_closing.addRetailStore","addRetailStore","addRetailStore/"+retailStoreClosing.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreClosing, tokens,"retail_store_closing.removeRetailStore","removeRetailStore","removeRetailStore/"+retailStoreClosing.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreClosing, tokens,"retail_store_closing.updateRetailStore","updateRetailStore","updateRetailStore/"+retailStoreClosing.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreClosing, tokens,"retail_store_closing.copyRetailStoreFrom","copyRetailStoreFrom","copyRetailStoreFrom/"+retailStoreClosing.getId()+"/","retailStoreList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreClosing createRetailStoreClosing(RetailscmUserContext userContext, String comment) throws Exception
	//public RetailStoreClosing createRetailStoreClosing(RetailscmUserContext userContext,String comment) throws Exception
	{
		
		

		

		checkerOf(userContext).checkCommentOfRetailStoreClosing(comment);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);


		RetailStoreClosing retailStoreClosing=createNewRetailStoreClosing();	

		retailStoreClosing.setComment(comment);

		retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreClosing);
		return retailStoreClosing;

		
	}
	protected RetailStoreClosing createNewRetailStoreClosing() 
	{
		
		return new RetailStoreClosing();		
	}
	
	protected void checkParamsForUpdatingRetailStoreClosing(RetailscmUserContext userContext,String retailStoreClosingId, int retailStoreClosingVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		checkerOf(userContext).checkVersionOfRetailStoreClosing( retailStoreClosingVersion);
		

		if(RetailStoreClosing.COMMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentOfRetailStoreClosing(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
	
		
	}
	
	
	
	public RetailStoreClosing clone(RetailscmUserContext userContext, String fromRetailStoreClosingId) throws Exception{
		
		return retailStoreClosingDaoOf(userContext).clone(fromRetailStoreClosingId, this.allTokens());
	}
	
	public RetailStoreClosing internalSaveRetailStoreClosing(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing) throws Exception 
	{
		return internalSaveRetailStoreClosing(userContext, retailStoreClosing, allTokens());

	}
	public RetailStoreClosing internalSaveRetailStoreClosing(RetailscmUserContext userContext, RetailStoreClosing retailStoreClosing, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreClosing(userContext, retailStoreClosingId, retailStoreClosingVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreClosing){ 
			//will be good when the retailStoreClosing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreClosing.
			if (retailStoreClosing.isChanged()){
			
			}
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, options);
			return retailStoreClosing;
			
		}

	}
	
	public RetailStoreClosing updateRetailStoreClosing(RetailscmUserContext userContext,String retailStoreClosingId, int retailStoreClosingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreClosing(userContext, retailStoreClosingId, retailStoreClosingVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
		if(retailStoreClosing.getVersion() != retailStoreClosingVersion){
			String message = "The target version("+retailStoreClosing.getVersion()+") is not equals to version("+retailStoreClosingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreClosing){ 
			//will be good when the retailStoreClosing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreClosing.
			
			retailStoreClosing.changeProperty(property, newValueExpr);
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().done());
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
			//return saveRetailStoreClosing(userContext, retailStoreClosing, tokens().done());
		}

	}
	
	public RetailStoreClosing updateRetailStoreClosingProperty(RetailscmUserContext userContext,String retailStoreClosingId, int retailStoreClosingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreClosing(userContext, retailStoreClosingId, retailStoreClosingVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
		if(retailStoreClosing.getVersion() != retailStoreClosingVersion){
			String message = "The target version("+retailStoreClosing.getVersion()+") is not equals to version("+retailStoreClosingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreClosing){ 
			//will be good when the retailStoreClosing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreClosing.
			
			retailStoreClosing.changeProperty(property, newValueExpr);
			
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().done());
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
			//return saveRetailStoreClosing(userContext, retailStoreClosing, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreClosingTokens tokens(){
		return RetailStoreClosingTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreClosingTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreClosingTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreClosingId, int retailStoreClosingVersion) throws Exception {
		//deleteInternal(userContext, retailStoreClosingId, retailStoreClosingVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreClosingId, int retailStoreClosingVersion) throws Exception{
			
		retailStoreClosingDaoOf(userContext).delete(retailStoreClosingId, retailStoreClosingVersion);
	}
	
	public RetailStoreClosing forgetByAll(RetailscmUserContext userContext, String retailStoreClosingId, int retailStoreClosingVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreClosingId, retailStoreClosingVersion);		
	}
	protected RetailStoreClosing forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreClosingId, int retailStoreClosingVersion) throws Exception{
			
		return retailStoreClosingDaoOf(userContext).disconnectFromAll(retailStoreClosingId, retailStoreClosingVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreClosingManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreClosingDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreClosing with retail_store_country_center in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByRetailStoreCountryCenter(RetailscmUserContext userContext, String retailStoreClosingId, String retailStoreCountryCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithRetailStoreCountryCenter(retailStoreClosing, retailStoreCountryCenterId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with city_service_center in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByCityServiceCenter(RetailscmUserContext userContext, String retailStoreClosingId, String cityServiceCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithCityServiceCenter(retailStoreClosing, cityServiceCenterId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with creation in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByCreation(RetailscmUserContext userContext, String retailStoreClosingId, String creationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithCreation(retailStoreClosing, creationId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with investment_invitation in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByInvestmentInvitation(RetailscmUserContext userContext, String retailStoreClosingId, String investmentInvitationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithInvestmentInvitation(retailStoreClosing, investmentInvitationId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with franchising in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByFranchising(RetailscmUserContext userContext, String retailStoreClosingId, String franchisingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithFranchising(retailStoreClosing, franchisingId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with decoration in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByDecoration(RetailscmUserContext userContext, String retailStoreClosingId, String decorationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithDecoration(retailStoreClosing, decorationId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	//disconnect RetailStoreClosing with opening in RetailStore
	protected RetailStoreClosing breakWithRetailStoreByOpening(RetailscmUserContext userContext, String retailStoreClosingId, String openingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());

			synchronized(retailStoreClosing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreListWithOpening(retailStoreClosing, openingId, this.emptyOptions());

				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				return retailStoreClosing;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);

		
		checkerOf(userContext).checkNameOfRetailStore(name);
		
		checkerOf(userContext).checkTelephoneOfRetailStore(telephone);
		
		checkerOf(userContext).checkOwnerOfRetailStore(owner);
		
		checkerOf(userContext).checkRetailStoreCountryCenterIdOfRetailStore(retailStoreCountryCenterId);
		
		checkerOf(userContext).checkCityServiceCenterIdOfRetailStore(cityServiceCenterId);
		
		checkerOf(userContext).checkCreationIdOfRetailStore(creationId);
		
		checkerOf(userContext).checkInvestmentInvitationIdOfRetailStore(investmentInvitationId);
		
		checkerOf(userContext).checkFranchisingIdOfRetailStore(franchisingId);
		
		checkerOf(userContext).checkDecorationIdOfRetailStore(decorationId);
		
		checkerOf(userContext).checkOpeningIdOfRetailStore(openingId);
		
		checkerOf(userContext).checkFoundedOfRetailStore(founded);
		
		checkerOf(userContext).checkLatitudeOfRetailStore(latitude);
		
		checkerOf(userContext).checkLongitudeOfRetailStore(longitude);
		
		checkerOf(userContext).checkDescriptionOfRetailStore(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);

	
	}
	public  RetailStoreClosing addRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStore(userContext,retailStoreClosingId,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, franchisingId, decorationId, openingId, founded, latitude, longitude, description,tokensExpr);
		
		RetailStore retailStore = createRetailStore(userContext,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, franchisingId, decorationId, openingId, founded, latitude, longitude, description);
		
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
		synchronized(retailStoreClosing){ 
			//Will be good when the retailStoreClosing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreClosing.addRetailStore( retailStore );		
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, retailStore);
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreProperties(RetailscmUserContext userContext, String retailStoreClosingId,String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		checkerOf(userContext).checkIdOfRetailStore(id);
		
		checkerOf(userContext).checkNameOfRetailStore( name);
		checkerOf(userContext).checkTelephoneOfRetailStore( telephone);
		checkerOf(userContext).checkOwnerOfRetailStore( owner);
		checkerOf(userContext).checkFoundedOfRetailStore( founded);
		checkerOf(userContext).checkLatitudeOfRetailStore( latitude);
		checkerOf(userContext).checkLongitudeOfRetailStore( longitude);
		checkerOf(userContext).checkDescriptionOfRetailStore( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
		
	}
	public  RetailStoreClosing updateRetailStoreProperties(RetailscmUserContext userContext, String retailStoreClosingId, String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreProperties(userContext,retailStoreClosingId,id,name,telephone,owner,founded,latitude,longitude,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreListList()
				.searchRetailStoreListWith(RetailStore.ID_PROPERTY, "is", id).done();
		
		RetailStoreClosing retailStoreClosingToUpdate = loadRetailStoreClosing(userContext, retailStoreClosingId, options);
		
		if(retailStoreClosingToUpdate.getRetailStoreList().isEmpty()){
			throw new RetailStoreClosingManagerException("RetailStore is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStore item = retailStoreClosingToUpdate.getRetailStoreList().first();
		
		item.updateName( name );
		item.updateTelephone( telephone );
		item.updateOwner( owner );
		item.updateFounded( founded );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );
		item.updateDescription( description );

		
		//checkParamsForAddingRetailStore(userContext,retailStoreClosingId,name, code, used,tokensExpr);
		RetailStoreClosing retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosingToUpdate, tokens().withRetailStoreList().done());
		synchronized(retailStoreClosing){ 
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStore createRetailStore(RetailscmUserContext userContext, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description) throws Exception{

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
		RetailStoreFranchising  franchising = new RetailStoreFranchising();
		franchising.setId(franchisingId);		
		retailStore.setFranchising(franchising);		
		RetailStoreDecoration  decoration = new RetailStoreDecoration();
		decoration.setId(decorationId);		
		retailStore.setDecoration(decoration);		
		RetailStoreOpening  opening = new RetailStoreOpening();
		opening.setId(openingId);		
		retailStore.setOpening(opening);		
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
	
	protected void checkParamsForRemovingRetailStoreList(RetailscmUserContext userContext, String retailStoreClosingId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
		for(String retailStoreIdItem: retailStoreIds){
			checkerOf(userContext).checkIdOfRetailStore(retailStoreIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
		
	}
	public  RetailStoreClosing removeRetailStoreList(RetailscmUserContext userContext, String retailStoreClosingId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreList(userContext, retailStoreClosingId,  retailStoreIds, tokensExpr);
			
			
			RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
			synchronized(retailStoreClosing){ 
				//Will be good when the retailStoreClosing loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreClosingDaoOf(userContext).planToRemoveRetailStoreList(retailStoreClosing, retailStoreIds, allTokens());
				retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
				deleteRelationListInGraph(userContext, retailStoreClosing.getRetailStoreList());
				return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreClosing( retailStoreClosingId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
	
	}
	public  RetailStoreClosing removeRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStore(userContext,retailStoreClosingId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
		synchronized(retailStoreClosing){ 
			//Will be good when the retailStoreClosing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreClosing.removeRetailStore( retailStore );		
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
			deleteRelationInGraph(userContext, retailStore);
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreClosing( retailStoreClosingId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
	
	}
	public  RetailStoreClosing copyRetailStoreFrom(RetailscmUserContext userContext, String retailStoreClosingId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStore(userContext,retailStoreClosingId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, allTokens());
		synchronized(retailStoreClosing){ 
			//Will be good when the retailStoreClosing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStore.updateLastUpdateTime(userContext.now());
			
			retailStoreClosing.copyRetailStoreFrom( retailStore );		
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, (RetailStore)retailStoreClosing.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreClosing(retailStoreClosingId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreClosingManagerException.class);
	
	}
	
	public  RetailStoreClosing updateRetailStore(RetailscmUserContext userContext, String retailStoreClosingId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStore(userContext, retailStoreClosingId, retailStoreId, retailStoreVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreList().searchRetailStoreListWith(RetailStore.ID_PROPERTY, "eq", retailStoreId).done();
		
		
		
		RetailStoreClosing retailStoreClosing = loadRetailStoreClosing(userContext, retailStoreClosingId, loadTokens);
		
		synchronized(retailStoreClosing){ 
			//Will be good when the retailStoreClosing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreClosing.removeRetailStore( retailStore );	
			//make changes to AcceleraterAccount.
			RetailStore retailStoreIndex = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		
			RetailStore retailStore = retailStoreClosing.findTheRetailStore(retailStoreIndex);
			if(retailStore == null){
				throw new RetailStoreClosingManagerException(retailStore+" is NOT FOUND" );
			}
			
			retailStore.changeProperty(property, newValueExpr);
			retailStore.updateLastUpdateTime(userContext.now());
			retailStoreClosing = saveRetailStoreClosing(userContext, retailStoreClosing, tokens().withRetailStoreList().done());
			return present(userContext,retailStoreClosing, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreClosing newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}




package com.doublechaintech.retailscm.retailstoreopening;

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






public class RetailStoreOpeningManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreOpeningManager {
	
	private static final String SERVICE_TYPE = "RetailStoreOpening";
	@Override
	public RetailStoreOpeningDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreOpeningDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreOpeningManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreOpeningManagerException(message);

	}
	
	

 	protected RetailStoreOpening saveRetailStoreOpening(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreOpeningDAO().save(retailStoreOpening, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreOpening(userContext, retailStoreOpening, tokens);
 	}
 	
 	protected RetailStoreOpening saveRetailStoreOpeningDetail(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening) throws Exception{	

 		
 		return saveRetailStoreOpening(userContext, retailStoreOpening, allTokens());
 	}
 	
 	public RetailStoreOpening loadRetailStoreOpening(RetailscmUserContext userContext, String retailStoreOpeningId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOpeningManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening( userContext, retailStoreOpeningId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOpening, tokens);
 	}
 	
 	
 	 public RetailStoreOpening searchRetailStoreOpening(RetailscmUserContext userContext, String retailStoreOpeningId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOpeningManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening( userContext, retailStoreOpeningId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOpening, tokens);
 	}
 	
 	

 	protected RetailStoreOpening present(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreOpening,tokens);
		
		
		RetailStoreOpening  retailStoreOpeningToPresent = retailStoreOpeningDaoOf(userContext).present(retailStoreOpening, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreOpeningToPresent.collectRefercencesFromLists();
		retailStoreOpeningDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreOpeningToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreOpening loadRetailStoreOpeningDetail(RetailscmUserContext userContext, String retailStoreOpeningId) throws Exception{	
 		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening( userContext, retailStoreOpeningId, allTokens());
 		return present(userContext,retailStoreOpening, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreOpeningId) throws Exception{	
 		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening( userContext, retailStoreOpeningId, viewTokens());
 		return present(userContext,retailStoreOpening, allTokens());
		
 	}
 	protected RetailStoreOpening saveRetailStoreOpening(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, Map<String,Object>tokens) throws Exception{	
 		return retailStoreOpeningDaoOf(userContext).save(retailStoreOpening, tokens);
 	}
 	protected RetailStoreOpening loadRetailStoreOpening(RetailscmUserContext userContext, String retailStoreOpeningId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOpeningManagerException.class);

 
 		return retailStoreOpeningDaoOf(userContext).load(retailStoreOpeningId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreOpening, tokens);
		
		addAction(userContext, retailStoreOpening, tokens,"@create","createRetailStoreOpening","createRetailStoreOpening/","main","primary");
		addAction(userContext, retailStoreOpening, tokens,"@update","updateRetailStoreOpening","updateRetailStoreOpening/"+retailStoreOpening.getId()+"/","main","primary");
		addAction(userContext, retailStoreOpening, tokens,"@copy","cloneRetailStoreOpening","cloneRetailStoreOpening/"+retailStoreOpening.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreOpening, tokens,"retail_store_opening.addRetailStore","addRetailStore","addRetailStore/"+retailStoreOpening.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreOpening, tokens,"retail_store_opening.removeRetailStore","removeRetailStore","removeRetailStore/"+retailStoreOpening.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreOpening, tokens,"retail_store_opening.updateRetailStore","updateRetailStore","updateRetailStore/"+retailStoreOpening.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreOpening, tokens,"retail_store_opening.copyRetailStoreFrom","copyRetailStoreFrom","copyRetailStoreFrom/"+retailStoreOpening.getId()+"/","retailStoreList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreOpening createRetailStoreOpening(RetailscmUserContext userContext, String comment) throws Exception
	//public RetailStoreOpening createRetailStoreOpening(RetailscmUserContext userContext,String comment) throws Exception
	{
		
		

		

		checkerOf(userContext).checkCommentOfRetailStoreOpening(comment);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);


		RetailStoreOpening retailStoreOpening=createNewRetailStoreOpening();	

		retailStoreOpening.setComment(comment);

		retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreOpening);
		return retailStoreOpening;

		
	}
	protected RetailStoreOpening createNewRetailStoreOpening() 
	{
		
		return new RetailStoreOpening();		
	}
	
	protected void checkParamsForUpdatingRetailStoreOpening(RetailscmUserContext userContext,String retailStoreOpeningId, int retailStoreOpeningVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		checkerOf(userContext).checkVersionOfRetailStoreOpening( retailStoreOpeningVersion);
		

		if(RetailStoreOpening.COMMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentOfRetailStoreOpening(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
	
		
	}
	
	
	
	public RetailStoreOpening clone(RetailscmUserContext userContext, String fromRetailStoreOpeningId) throws Exception{
		
		return retailStoreOpeningDaoOf(userContext).clone(fromRetailStoreOpeningId, this.allTokens());
	}
	
	public RetailStoreOpening internalSaveRetailStoreOpening(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening) throws Exception 
	{
		return internalSaveRetailStoreOpening(userContext, retailStoreOpening, allTokens());

	}
	public RetailStoreOpening internalSaveRetailStoreOpening(RetailscmUserContext userContext, RetailStoreOpening retailStoreOpening, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreOpening(userContext, retailStoreOpeningId, retailStoreOpeningVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreOpening){ 
			//will be good when the retailStoreOpening loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOpening.
			if (retailStoreOpening.isChanged()){
			
			}
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, options);
			return retailStoreOpening;
			
		}

	}
	
	public RetailStoreOpening updateRetailStoreOpening(RetailscmUserContext userContext,String retailStoreOpeningId, int retailStoreOpeningVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOpening(userContext, retailStoreOpeningId, retailStoreOpeningVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
		if(retailStoreOpening.getVersion() != retailStoreOpeningVersion){
			String message = "The target version("+retailStoreOpening.getVersion()+") is not equals to version("+retailStoreOpeningVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOpening){ 
			//will be good when the retailStoreOpening loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOpening.
			
			retailStoreOpening.changeProperty(property, newValueExpr);
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().done());
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOpening(userContext, retailStoreOpening, tokens().done());
		}

	}
	
	public RetailStoreOpening updateRetailStoreOpeningProperty(RetailscmUserContext userContext,String retailStoreOpeningId, int retailStoreOpeningVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOpening(userContext, retailStoreOpeningId, retailStoreOpeningVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
		if(retailStoreOpening.getVersion() != retailStoreOpeningVersion){
			String message = "The target version("+retailStoreOpening.getVersion()+") is not equals to version("+retailStoreOpeningVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOpening){ 
			//will be good when the retailStoreOpening loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOpening.
			
			retailStoreOpening.changeProperty(property, newValueExpr);
			
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().done());
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOpening(userContext, retailStoreOpening, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreOpeningTokens tokens(){
		return RetailStoreOpeningTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreOpeningTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreOpeningTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreOpeningId, int retailStoreOpeningVersion) throws Exception {
		//deleteInternal(userContext, retailStoreOpeningId, retailStoreOpeningVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreOpeningId, int retailStoreOpeningVersion) throws Exception{
			
		retailStoreOpeningDaoOf(userContext).delete(retailStoreOpeningId, retailStoreOpeningVersion);
	}
	
	public RetailStoreOpening forgetByAll(RetailscmUserContext userContext, String retailStoreOpeningId, int retailStoreOpeningVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreOpeningId, retailStoreOpeningVersion);		
	}
	protected RetailStoreOpening forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreOpeningId, int retailStoreOpeningVersion) throws Exception{
			
		return retailStoreOpeningDaoOf(userContext).disconnectFromAll(retailStoreOpeningId, retailStoreOpeningVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreOpeningManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreOpeningDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreOpening with retail_store_country_center in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByRetailStoreCountryCenter(RetailscmUserContext userContext, String retailStoreOpeningId, String retailStoreCountryCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithRetailStoreCountryCenter(retailStoreOpening, retailStoreCountryCenterId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with city_service_center in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByCityServiceCenter(RetailscmUserContext userContext, String retailStoreOpeningId, String cityServiceCenterId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithCityServiceCenter(retailStoreOpening, cityServiceCenterId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with creation in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByCreation(RetailscmUserContext userContext, String retailStoreOpeningId, String creationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithCreation(retailStoreOpening, creationId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with investment_invitation in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByInvestmentInvitation(RetailscmUserContext userContext, String retailStoreOpeningId, String investmentInvitationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithInvestmentInvitation(retailStoreOpening, investmentInvitationId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with franchising in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByFranchising(RetailscmUserContext userContext, String retailStoreOpeningId, String franchisingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithFranchising(retailStoreOpening, franchisingId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with decoration in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByDecoration(RetailscmUserContext userContext, String retailStoreOpeningId, String decorationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithDecoration(retailStoreOpening, decorationId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	//disconnect RetailStoreOpening with closing in RetailStore
	protected RetailStoreOpening breakWithRetailStoreByClosing(RetailscmUserContext userContext, String retailStoreOpeningId, String closingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());

			synchronized(retailStoreOpening){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreListWithClosing(retailStoreOpening, closingId, this.emptyOptions());

				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				return retailStoreOpening;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);

		
		checkerOf(userContext).checkNameOfRetailStore(name);
		
		checkerOf(userContext).checkTelephoneOfRetailStore(telephone);
		
		checkerOf(userContext).checkOwnerOfRetailStore(owner);
		
		checkerOf(userContext).checkRetailStoreCountryCenterIdOfRetailStore(retailStoreCountryCenterId);
		
		checkerOf(userContext).checkCityServiceCenterIdOfRetailStore(cityServiceCenterId);
		
		checkerOf(userContext).checkCreationIdOfRetailStore(creationId);
		
		checkerOf(userContext).checkInvestmentInvitationIdOfRetailStore(investmentInvitationId);
		
		checkerOf(userContext).checkFranchisingIdOfRetailStore(franchisingId);
		
		checkerOf(userContext).checkDecorationIdOfRetailStore(decorationId);
		
		checkerOf(userContext).checkClosingIdOfRetailStore(closingId);
		
		checkerOf(userContext).checkFoundedOfRetailStore(founded);
		
		checkerOf(userContext).checkLatitudeOfRetailStore(latitude);
		
		checkerOf(userContext).checkLongitudeOfRetailStore(longitude);
		
		checkerOf(userContext).checkDescriptionOfRetailStore(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);

	
	}
	public  RetailStoreOpening addRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStore(userContext,retailStoreOpeningId,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, franchisingId, decorationId, closingId, founded, latitude, longitude, description,tokensExpr);
		
		RetailStore retailStore = createRetailStore(userContext,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, creationId, investmentInvitationId, franchisingId, decorationId, closingId, founded, latitude, longitude, description);
		
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
		synchronized(retailStoreOpening){ 
			//Will be good when the retailStoreOpening loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOpening.addRetailStore( retailStore );		
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, retailStore);
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreProperties(RetailscmUserContext userContext, String retailStoreOpeningId,String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		checkerOf(userContext).checkIdOfRetailStore(id);
		
		checkerOf(userContext).checkNameOfRetailStore( name);
		checkerOf(userContext).checkTelephoneOfRetailStore( telephone);
		checkerOf(userContext).checkOwnerOfRetailStore( owner);
		checkerOf(userContext).checkFoundedOfRetailStore( founded);
		checkerOf(userContext).checkLatitudeOfRetailStore( latitude);
		checkerOf(userContext).checkLongitudeOfRetailStore( longitude);
		checkerOf(userContext).checkDescriptionOfRetailStore( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
		
	}
	public  RetailStoreOpening updateRetailStoreProperties(RetailscmUserContext userContext, String retailStoreOpeningId, String id,String name,long telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreProperties(userContext,retailStoreOpeningId,id,name,telephone,owner,founded,latitude,longitude,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreListList()
				.searchRetailStoreListWith(RetailStore.ID_PROPERTY, "is", id).done();
		
		RetailStoreOpening retailStoreOpeningToUpdate = loadRetailStoreOpening(userContext, retailStoreOpeningId, options);
		
		if(retailStoreOpeningToUpdate.getRetailStoreList().isEmpty()){
			throw new RetailStoreOpeningManagerException("RetailStore is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStore item = retailStoreOpeningToUpdate.getRetailStoreList().first();
		
		item.updateName( name );
		item.updateTelephone( telephone );
		item.updateOwner( owner );
		item.updateFounded( founded );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );
		item.updateDescription( description );

		
		//checkParamsForAddingRetailStore(userContext,retailStoreOpeningId,name, code, used,tokensExpr);
		RetailStoreOpening retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpeningToUpdate, tokens().withRetailStoreList().done());
		synchronized(retailStoreOpening){ 
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStore createRetailStore(RetailscmUserContext userContext, String name, long telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description) throws Exception{

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
	
	protected void checkParamsForRemovingRetailStoreList(RetailscmUserContext userContext, String retailStoreOpeningId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
		for(String retailStoreIdItem: retailStoreIds){
			checkerOf(userContext).checkIdOfRetailStore(retailStoreIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
		
	}
	public  RetailStoreOpening removeRetailStoreList(RetailscmUserContext userContext, String retailStoreOpeningId, 
			String retailStoreIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreList(userContext, retailStoreOpeningId,  retailStoreIds, tokensExpr);
			
			
			RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
			synchronized(retailStoreOpening){ 
				//Will be good when the retailStoreOpening loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOpeningDaoOf(userContext).planToRemoveRetailStoreList(retailStoreOpening, retailStoreIds, allTokens());
				retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
				deleteRelationListInGraph(userContext, retailStoreOpening.getRetailStoreList());
				return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOpening( retailStoreOpeningId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
	
	}
	public  RetailStoreOpening removeRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStore(userContext,retailStoreOpeningId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
		synchronized(retailStoreOpening){ 
			//Will be good when the retailStoreOpening loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOpening.removeRetailStore( retailStore );		
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
			deleteRelationInGraph(userContext, retailStore);
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOpening( retailStoreOpeningId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
	
	}
	public  RetailStoreOpening copyRetailStoreFrom(RetailscmUserContext userContext, String retailStoreOpeningId, 
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStore(userContext,retailStoreOpeningId, retailStoreId, retailStoreVersion,tokensExpr);
		
		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, allTokens());
		synchronized(retailStoreOpening){ 
			//Will be good when the retailStoreOpening loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStore.updateLastUpdateTime(userContext.now());
			
			retailStoreOpening.copyRetailStoreFrom( retailStore );		
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, (RetailStore)retailStoreOpening.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOpening(retailStoreOpeningId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOpeningManagerException.class);
	
	}
	
	public  RetailStoreOpening updateRetailStore(RetailscmUserContext userContext, String retailStoreOpeningId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStore(userContext, retailStoreOpeningId, retailStoreId, retailStoreVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreList().searchRetailStoreListWith(RetailStore.ID_PROPERTY, "eq", retailStoreId).done();
		
		
		
		RetailStoreOpening retailStoreOpening = loadRetailStoreOpening(userContext, retailStoreOpeningId, loadTokens);
		
		synchronized(retailStoreOpening){ 
			//Will be good when the retailStoreOpening loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOpening.removeRetailStore( retailStore );	
			//make changes to AcceleraterAccount.
			RetailStore retailStoreIndex = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		
			RetailStore retailStore = retailStoreOpening.findTheRetailStore(retailStoreIndex);
			if(retailStore == null){
				throw new RetailStoreOpeningManagerException(retailStore+" is NOT FOUND" );
			}
			
			retailStore.changeProperty(property, newValueExpr);
			retailStore.updateLastUpdateTime(userContext.now());
			retailStoreOpening = saveRetailStoreOpening(userContext, retailStoreOpening, tokens().withRetailStoreList().done());
			return present(userContext,retailStoreOpening, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreOpening newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



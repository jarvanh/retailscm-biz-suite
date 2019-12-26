
package com.doublechaintech.retailscm.retailstorecreation;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.retailstore.RetailStore;


import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstoreclosing.RetailStoreClosing;
import com.doublechaintech.retailscm.retailstoreinvestmentinvitation.RetailStoreInvestmentInvitation;
import com.doublechaintech.retailscm.retailstoredecoration.RetailStoreDecoration;
import com.doublechaintech.retailscm.retailstorecreation.RetailStoreCreation;
import com.doublechaintech.retailscm.retailstoreopening.RetailStoreOpening;
import com.doublechaintech.retailscm.retailstorecityservicecenter.RetailStoreCityServiceCenter;
import com.doublechaintech.retailscm.retailstorefranchising.RetailStoreFranchising;






public class RetailStoreCreationManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreCreationManager {

  


	private static final String SERVICE_TYPE = "RetailStoreCreation";
	@Override
	public RetailStoreCreationDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreCreationDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws RetailStoreCreationManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreCreationManagerException(message);

	}



 	protected RetailStoreCreation saveRetailStoreCreation(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreCreationDAO().save(retailStoreCreation, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreCreation(userContext, retailStoreCreation, tokens);
 	}
 	
 	protected RetailStoreCreation saveRetailStoreCreationDetail(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation) throws Exception{	

 		
 		return saveRetailStoreCreation(userContext, retailStoreCreation, allTokens());
 	}
 	
 	public RetailStoreCreation loadRetailStoreCreation(RetailscmUserContext userContext, String retailStoreCreationId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCreationManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation( userContext, retailStoreCreationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreCreation, tokens);
 	}
 	
 	
 	 public RetailStoreCreation searchRetailStoreCreation(RetailscmUserContext userContext, String retailStoreCreationId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCreationManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation( userContext, retailStoreCreationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreCreation, tokens);
 	}
 	
 	

 	protected RetailStoreCreation present(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreCreation,tokens);
		
		
		RetailStoreCreation  retailStoreCreationToPresent = retailStoreCreationDaoOf(userContext).present(retailStoreCreation, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreCreationToPresent.collectRefercencesFromLists();
		retailStoreCreationDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreCreationToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreCreation loadRetailStoreCreationDetail(RetailscmUserContext userContext, String retailStoreCreationId) throws Exception{	
 		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation( userContext, retailStoreCreationId, allTokens());
 		return present(userContext,retailStoreCreation, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreCreationId) throws Exception{	
 		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation( userContext, retailStoreCreationId, viewTokens());
 		return present(userContext,retailStoreCreation, allTokens());
		
 	}
 	protected RetailStoreCreation saveRetailStoreCreation(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, Map<String,Object>tokens) throws Exception{	
 		return retailStoreCreationDaoOf(userContext).save(retailStoreCreation, tokens);
 	}
 	protected RetailStoreCreation loadRetailStoreCreation(RetailscmUserContext userContext, String retailStoreCreationId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCreationManagerException.class);

 
 		return retailStoreCreationDaoOf(userContext).load(retailStoreCreationId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreCreation, tokens);
		
		addAction(userContext, retailStoreCreation, tokens,"@create","createRetailStoreCreation","createRetailStoreCreation/","main","primary");
		addAction(userContext, retailStoreCreation, tokens,"@update","updateRetailStoreCreation","updateRetailStoreCreation/"+retailStoreCreation.getId()+"/","main","primary");
		addAction(userContext, retailStoreCreation, tokens,"@copy","cloneRetailStoreCreation","cloneRetailStoreCreation/"+retailStoreCreation.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreCreation, tokens,"retail_store_creation.addRetailStore","addRetailStore","addRetailStore/"+retailStoreCreation.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCreation, tokens,"retail_store_creation.removeRetailStore","removeRetailStore","removeRetailStore/"+retailStoreCreation.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCreation, tokens,"retail_store_creation.updateRetailStore","updateRetailStore","updateRetailStore/"+retailStoreCreation.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCreation, tokens,"retail_store_creation.copyRetailStoreFrom","copyRetailStoreFrom","copyRetailStoreFrom/"+retailStoreCreation.getId()+"/","retailStoreList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreCreation createRetailStoreCreation(RetailscmUserContext userContext, String comment) throws Exception
	//public RetailStoreCreation createRetailStoreCreation(RetailscmUserContext userContext,String comment) throws Exception
	{

		

		

		checkerOf(userContext).checkCommentOfRetailStoreCreation(comment);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);


		RetailStoreCreation retailStoreCreation=createNewRetailStoreCreation();	

		retailStoreCreation.setComment(comment);

		retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreCreation);
		return retailStoreCreation;


	}
	protected RetailStoreCreation createNewRetailStoreCreation()
	{

		return new RetailStoreCreation();
	}

	protected void checkParamsForUpdatingRetailStoreCreation(RetailscmUserContext userContext,String retailStoreCreationId, int retailStoreCreationVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).checkVersionOfRetailStoreCreation( retailStoreCreationVersion);
		

		if(RetailStoreCreation.COMMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentOfRetailStoreCreation(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);


	}



	public RetailStoreCreation clone(RetailscmUserContext userContext, String fromRetailStoreCreationId) throws Exception{

		return retailStoreCreationDaoOf(userContext).clone(fromRetailStoreCreationId, this.allTokens());
	}

	public RetailStoreCreation internalSaveRetailStoreCreation(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation) throws Exception
	{
		return internalSaveRetailStoreCreation(userContext, retailStoreCreation, allTokens());

	}
	public RetailStoreCreation internalSaveRetailStoreCreation(RetailscmUserContext userContext, RetailStoreCreation retailStoreCreation, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingRetailStoreCreation(userContext, retailStoreCreationId, retailStoreCreationVersion, property, newValueExpr, tokensExpr);


		synchronized(retailStoreCreation){
			//will be good when the retailStoreCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCreation.
			if (retailStoreCreation.isChanged()){
			
			}
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, options);
			return retailStoreCreation;

		}

	}

	public RetailStoreCreation updateRetailStoreCreation(RetailscmUserContext userContext,String retailStoreCreationId, int retailStoreCreationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreCreation(userContext, retailStoreCreationId, retailStoreCreationVersion, property, newValueExpr, tokensExpr);



		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());
		if(retailStoreCreation.getVersion() != retailStoreCreationVersion){
			String message = "The target version("+retailStoreCreation.getVersion()+") is not equals to version("+retailStoreCreationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreCreation){
			//will be good when the retailStoreCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCreation.
			
			retailStoreCreation.changeProperty(property, newValueExpr);
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().done());
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
			//return saveRetailStoreCreation(userContext, retailStoreCreation, tokens().done());
		}

	}

	public RetailStoreCreation updateRetailStoreCreationProperty(RetailscmUserContext userContext,String retailStoreCreationId, int retailStoreCreationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreCreation(userContext, retailStoreCreationId, retailStoreCreationVersion, property, newValueExpr, tokensExpr);

		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());
		if(retailStoreCreation.getVersion() != retailStoreCreationVersion){
			String message = "The target version("+retailStoreCreation.getVersion()+") is not equals to version("+retailStoreCreationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreCreation){
			//will be good when the retailStoreCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCreation.

			retailStoreCreation.changeProperty(property, newValueExpr);
			
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().done());
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
			//return saveRetailStoreCreation(userContext, retailStoreCreation, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected RetailStoreCreationTokens tokens(){
		return RetailStoreCreationTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreCreationTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreCreationTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreCreationId, int retailStoreCreationVersion) throws Exception {
		//deleteInternal(userContext, retailStoreCreationId, retailStoreCreationVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreCreationId, int retailStoreCreationVersion) throws Exception{

		retailStoreCreationDaoOf(userContext).delete(retailStoreCreationId, retailStoreCreationVersion);
	}

	public RetailStoreCreation forgetByAll(RetailscmUserContext userContext, String retailStoreCreationId, int retailStoreCreationVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreCreationId, retailStoreCreationVersion);
	}
	protected RetailStoreCreation forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreCreationId, int retailStoreCreationVersion) throws Exception{

		return retailStoreCreationDaoOf(userContext).disconnectFromAll(retailStoreCreationId, retailStoreCreationVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreCreationManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreCreationDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreCreation with retail_store_country_center in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByRetailStoreCountryCenter(RetailscmUserContext userContext, String retailStoreCreationId, String retailStoreCountryCenterId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithRetailStoreCountryCenter(retailStoreCreation, retailStoreCountryCenterId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with city_service_center in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByCityServiceCenter(RetailscmUserContext userContext, String retailStoreCreationId, String cityServiceCenterId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithCityServiceCenter(retailStoreCreation, cityServiceCenterId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with investment_invitation in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByInvestmentInvitation(RetailscmUserContext userContext, String retailStoreCreationId, String investmentInvitationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithInvestmentInvitation(retailStoreCreation, investmentInvitationId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with franchising in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByFranchising(RetailscmUserContext userContext, String retailStoreCreationId, String franchisingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithFranchising(retailStoreCreation, franchisingId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with decoration in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByDecoration(RetailscmUserContext userContext, String retailStoreCreationId, String decorationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithDecoration(retailStoreCreation, decorationId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with opening in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByOpening(RetailscmUserContext userContext, String retailStoreCreationId, String openingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithOpening(retailStoreCreation, openingId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}
	//disconnect RetailStoreCreation with closing in RetailStore
	protected RetailStoreCreation breakWithRetailStoreByClosing(RetailscmUserContext userContext, String retailStoreCreationId, String closingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());

			synchronized(retailStoreCreation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreListWithClosing(retailStoreCreation, closingId, this.emptyOptions());

				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				return retailStoreCreation;
			}
	}






	protected void checkParamsForAddingRetailStore(RetailscmUserContext userContext, String retailStoreCreationId, String name, String telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);

		
		checkerOf(userContext).checkNameOfRetailStore(name);
		
		checkerOf(userContext).checkTelephoneOfRetailStore(telephone);
		
		checkerOf(userContext).checkOwnerOfRetailStore(owner);
		
		checkerOf(userContext).checkRetailStoreCountryCenterIdOfRetailStore(retailStoreCountryCenterId);
		
		checkerOf(userContext).checkCityServiceCenterIdOfRetailStore(cityServiceCenterId);
		
		checkerOf(userContext).checkInvestmentInvitationIdOfRetailStore(investmentInvitationId);
		
		checkerOf(userContext).checkFranchisingIdOfRetailStore(franchisingId);
		
		checkerOf(userContext).checkDecorationIdOfRetailStore(decorationId);
		
		checkerOf(userContext).checkOpeningIdOfRetailStore(openingId);
		
		checkerOf(userContext).checkClosingIdOfRetailStore(closingId);
		
		checkerOf(userContext).checkFoundedOfRetailStore(founded);
		
		checkerOf(userContext).checkLatitudeOfRetailStore(latitude);
		
		checkerOf(userContext).checkLongitudeOfRetailStore(longitude);
		
		checkerOf(userContext).checkDescriptionOfRetailStore(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);


	}
	public  RetailStoreCreation addRetailStore(RetailscmUserContext userContext, String retailStoreCreationId, String name, String telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingRetailStore(userContext,retailStoreCreationId,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, investmentInvitationId, franchisingId, decorationId, openingId, closingId, founded, latitude, longitude, description,tokensExpr);

		RetailStore retailStore = createRetailStore(userContext,name, telephone, owner, retailStoreCountryCenterId, cityServiceCenterId, investmentInvitationId, franchisingId, decorationId, openingId, closingId, founded, latitude, longitude, description);

		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, emptyOptions());
		synchronized(retailStoreCreation){
			//Will be good when the retailStoreCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCreation.addRetailStore( retailStore );
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, retailStore);
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreProperties(RetailscmUserContext userContext, String retailStoreCreationId,String id,String name,String telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).checkIdOfRetailStore(id);

		checkerOf(userContext).checkNameOfRetailStore( name);
		checkerOf(userContext).checkTelephoneOfRetailStore( telephone);
		checkerOf(userContext).checkOwnerOfRetailStore( owner);
		checkerOf(userContext).checkFoundedOfRetailStore( founded);
		checkerOf(userContext).checkLatitudeOfRetailStore( latitude);
		checkerOf(userContext).checkLongitudeOfRetailStore( longitude);
		checkerOf(userContext).checkDescriptionOfRetailStore( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);

	}
	public  RetailStoreCreation updateRetailStoreProperties(RetailscmUserContext userContext, String retailStoreCreationId, String id,String name,String telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreProperties(userContext,retailStoreCreationId,id,name,telephone,owner,founded,latitude,longitude,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreListList()
				.searchRetailStoreListWith(RetailStore.ID_PROPERTY, "is", id).done();

		RetailStoreCreation retailStoreCreationToUpdate = loadRetailStoreCreation(userContext, retailStoreCreationId, options);

		if(retailStoreCreationToUpdate.getRetailStoreList().isEmpty()){
			throw new RetailStoreCreationManagerException("RetailStore is NOT FOUND with id: '"+id+"'");
		}

		RetailStore item = retailStoreCreationToUpdate.getRetailStoreList().first();

		item.updateName( name );
		item.updateTelephone( telephone );
		item.updateOwner( owner );
		item.updateFounded( founded );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );
		item.updateDescription( description );


		//checkParamsForAddingRetailStore(userContext,retailStoreCreationId,name, code, used,tokensExpr);
		RetailStoreCreation retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreationToUpdate, tokens().withRetailStoreList().done());
		synchronized(retailStoreCreation){
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
		}
	}


	protected RetailStore createRetailStore(RetailscmUserContext userContext, String name, String telephone, String owner, String retailStoreCountryCenterId, String cityServiceCenterId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description) throws Exception{

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

	protected void checkParamsForRemovingRetailStoreList(RetailscmUserContext userContext, String retailStoreCreationId,
			String retailStoreIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		for(String retailStoreIdItem: retailStoreIds){
			checkerOf(userContext).checkIdOfRetailStore(retailStoreIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);

	}
	public  RetailStoreCreation removeRetailStoreList(RetailscmUserContext userContext, String retailStoreCreationId,
			String retailStoreIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingRetailStoreList(userContext, retailStoreCreationId,  retailStoreIds, tokensExpr);


			RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());
			synchronized(retailStoreCreation){
				//Will be good when the retailStoreCreation loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreCreationDaoOf(userContext).planToRemoveRetailStoreList(retailStoreCreation, retailStoreIds, allTokens());
				retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
				deleteRelationListInGraph(userContext, retailStoreCreation.getRetailStoreList());
				return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingRetailStore(RetailscmUserContext userContext, String retailStoreCreationId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCreation( retailStoreCreationId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);

	}
	public  RetailStoreCreation removeRetailStore(RetailscmUserContext userContext, String retailStoreCreationId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingRetailStore(userContext,retailStoreCreationId, retailStoreId, retailStoreVersion,tokensExpr);

		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());
		synchronized(retailStoreCreation){
			//Will be good when the retailStoreCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCreation.removeRetailStore( retailStore );
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
			deleteRelationInGraph(userContext, retailStore);
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingRetailStore(RetailscmUserContext userContext, String retailStoreCreationId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCreation( retailStoreCreationId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);

	}
	public  RetailStoreCreation copyRetailStoreFrom(RetailscmUserContext userContext, String retailStoreCreationId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingRetailStore(userContext,retailStoreCreationId, retailStoreId, retailStoreVersion,tokensExpr);

		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, allTokens());
		synchronized(retailStoreCreation){
			//Will be good when the retailStoreCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			retailStore.updateLastUpdateTime(userContext.now());

			retailStoreCreation.copyRetailStoreFrom( retailStore );
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, (RetailStore)retailStoreCreation.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingRetailStore(RetailscmUserContext userContext, String retailStoreCreationId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreCreation(retailStoreCreationId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		

		if(RetailStore.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.TELEPHONE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTelephoneOfRetailStore(parseString(newValueExpr));
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCreationManagerException.class);

	}

	public  RetailStoreCreation updateRetailStore(RetailscmUserContext userContext, String retailStoreCreationId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingRetailStore(userContext, retailStoreCreationId, retailStoreId, retailStoreVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withRetailStoreList().searchRetailStoreListWith(RetailStore.ID_PROPERTY, "eq", retailStoreId).done();



		RetailStoreCreation retailStoreCreation = loadRetailStoreCreation(userContext, retailStoreCreationId, loadTokens);

		synchronized(retailStoreCreation){
			//Will be good when the retailStoreCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreCreation.removeRetailStore( retailStore );
			//make changes to AcceleraterAccount.
			RetailStore retailStoreIndex = createIndexedRetailStore(retailStoreId, retailStoreVersion);

			RetailStore retailStore = retailStoreCreation.findTheRetailStore(retailStoreIndex);
			if(retailStore == null){
				throw new RetailStoreCreationManagerException(retailStore+" is NOT FOUND" );
			}

			retailStore.changeProperty(property, newValueExpr);
			retailStore.updateLastUpdateTime(userContext.now());
			retailStoreCreation = saveRetailStoreCreation(userContext, retailStoreCreation, tokens().withRetailStoreList().done());
			return present(userContext,retailStoreCreation, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreCreation newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



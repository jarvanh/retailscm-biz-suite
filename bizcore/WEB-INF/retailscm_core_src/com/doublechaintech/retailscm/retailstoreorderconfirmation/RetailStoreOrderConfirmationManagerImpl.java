
package com.doublechaintech.retailscm.retailstoreorderconfirmation;

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

import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;


import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstoreorderapproval.RetailStoreOrderApproval;
import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.retailstoreorderdelivery.RetailStoreOrderDelivery;
import com.doublechaintech.retailscm.retailstoreorderprocessing.RetailStoreOrderProcessing;
import com.doublechaintech.retailscm.retailstoreorderpicking.RetailStoreOrderPicking;
import com.doublechaintech.retailscm.retailstoreorderconfirmation.RetailStoreOrderConfirmation;
import com.doublechaintech.retailscm.retailstoreordershipment.RetailStoreOrderShipment;






public class RetailStoreOrderConfirmationManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreOrderConfirmationManager {
	
	private static final String SERVICE_TYPE = "RetailStoreOrderConfirmation";
	@Override
	public RetailStoreOrderConfirmationDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreOrderConfirmationDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreOrderConfirmationManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreOrderConfirmationManagerException(message);

	}
	
	

 	protected RetailStoreOrderConfirmation saveRetailStoreOrderConfirmation(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreOrderConfirmationDAO().save(retailStoreOrderConfirmation, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens);
 	}
 	
 	protected RetailStoreOrderConfirmation saveRetailStoreOrderConfirmationDetail(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation) throws Exception{	

 		
 		return saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, allTokens());
 	}
 	
 	public RetailStoreOrderConfirmation loadRetailStoreOrderConfirmation(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderConfirmationManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation( userContext, retailStoreOrderConfirmationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderConfirmation, tokens);
 	}
 	
 	
 	 public RetailStoreOrderConfirmation searchRetailStoreOrderConfirmation(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderConfirmationManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation( userContext, retailStoreOrderConfirmationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderConfirmation, tokens);
 	}
 	
 	

 	protected RetailStoreOrderConfirmation present(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreOrderConfirmation,tokens);
		
		
		RetailStoreOrderConfirmation  retailStoreOrderConfirmationToPresent = retailStoreOrderConfirmationDaoOf(userContext).present(retailStoreOrderConfirmation, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreOrderConfirmationToPresent.collectRefercencesFromLists();
		retailStoreOrderConfirmationDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreOrderConfirmationToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreOrderConfirmation loadRetailStoreOrderConfirmationDetail(RetailscmUserContext userContext, String retailStoreOrderConfirmationId) throws Exception{	
 		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation( userContext, retailStoreOrderConfirmationId, allTokens());
 		return present(userContext,retailStoreOrderConfirmation, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreOrderConfirmationId) throws Exception{	
 		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation( userContext, retailStoreOrderConfirmationId, viewTokens());
 		return present(userContext,retailStoreOrderConfirmation, allTokens());
		
 	}
 	protected RetailStoreOrderConfirmation saveRetailStoreOrderConfirmation(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, Map<String,Object>tokens) throws Exception{	
 		return retailStoreOrderConfirmationDaoOf(userContext).save(retailStoreOrderConfirmation, tokens);
 	}
 	protected RetailStoreOrderConfirmation loadRetailStoreOrderConfirmation(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderConfirmationManagerException.class);

 
 		return retailStoreOrderConfirmationDaoOf(userContext).load(retailStoreOrderConfirmationId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreOrderConfirmation, tokens);
		
		addAction(userContext, retailStoreOrderConfirmation, tokens,"@create","createRetailStoreOrderConfirmation","createRetailStoreOrderConfirmation/","main","primary");
		addAction(userContext, retailStoreOrderConfirmation, tokens,"@update","updateRetailStoreOrderConfirmation","updateRetailStoreOrderConfirmation/"+retailStoreOrderConfirmation.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrderConfirmation, tokens,"@copy","cloneRetailStoreOrderConfirmation","cloneRetailStoreOrderConfirmation/"+retailStoreOrderConfirmation.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreOrderConfirmation, tokens,"retail_store_order_confirmation.addRetailStoreOrder","addRetailStoreOrder","addRetailStoreOrder/"+retailStoreOrderConfirmation.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderConfirmation, tokens,"retail_store_order_confirmation.removeRetailStoreOrder","removeRetailStoreOrder","removeRetailStoreOrder/"+retailStoreOrderConfirmation.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderConfirmation, tokens,"retail_store_order_confirmation.updateRetailStoreOrder","updateRetailStoreOrder","updateRetailStoreOrder/"+retailStoreOrderConfirmation.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderConfirmation, tokens,"retail_store_order_confirmation.copyRetailStoreOrderFrom","copyRetailStoreOrderFrom","copyRetailStoreOrderFrom/"+retailStoreOrderConfirmation.getId()+"/","retailStoreOrderList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreOrderConfirmation createRetailStoreOrderConfirmation(RetailscmUserContext userContext, String who,Date confirmTime) throws Exception
	//public RetailStoreOrderConfirmation createRetailStoreOrderConfirmation(RetailscmUserContext userContext,String who, Date confirmTime) throws Exception
	{
		
		

		

		checkerOf(userContext).checkWhoOfRetailStoreOrderConfirmation(who);
		checkerOf(userContext).checkConfirmTimeOfRetailStoreOrderConfirmation(confirmTime);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);


		RetailStoreOrderConfirmation retailStoreOrderConfirmation=createNewRetailStoreOrderConfirmation();	

		retailStoreOrderConfirmation.setWho(who);
		retailStoreOrderConfirmation.setConfirmTime(confirmTime);

		retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreOrderConfirmation);
		return retailStoreOrderConfirmation;

		
	}
	protected RetailStoreOrderConfirmation createNewRetailStoreOrderConfirmation() 
	{
		
		return new RetailStoreOrderConfirmation();		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrderConfirmation(RetailscmUserContext userContext,String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderConfirmation( retailStoreOrderConfirmationVersion);
		

		if(RetailStoreOrderConfirmation.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfRetailStoreOrderConfirmation(parseString(newValueExpr));
		}
		if(RetailStoreOrderConfirmation.CONFIRM_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkConfirmTimeOfRetailStoreOrderConfirmation(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
	
		
	}
	
	
	
	public RetailStoreOrderConfirmation clone(RetailscmUserContext userContext, String fromRetailStoreOrderConfirmationId) throws Exception{
		
		return retailStoreOrderConfirmationDaoOf(userContext).clone(fromRetailStoreOrderConfirmationId, this.allTokens());
	}
	
	public RetailStoreOrderConfirmation internalSaveRetailStoreOrderConfirmation(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation) throws Exception 
	{
		return internalSaveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, allTokens());

	}
	public RetailStoreOrderConfirmation internalSaveRetailStoreOrderConfirmation(RetailscmUserContext userContext, RetailStoreOrderConfirmation retailStoreOrderConfirmation, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreOrderConfirmation){ 
			//will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderConfirmation.
			if (retailStoreOrderConfirmation.isChanged()){
			
			}
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, options);
			return retailStoreOrderConfirmation;
			
		}

	}
	
	public RetailStoreOrderConfirmation updateRetailStoreOrderConfirmation(RetailscmUserContext userContext,String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
		if(retailStoreOrderConfirmation.getVersion() != retailStoreOrderConfirmationVersion){
			String message = "The target version("+retailStoreOrderConfirmation.getVersion()+") is not equals to version("+retailStoreOrderConfirmationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderConfirmation){ 
			//will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderConfirmation.
			
			retailStoreOrderConfirmation.changeProperty(property, newValueExpr);
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().done());
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().done());
		}

	}
	
	public RetailStoreOrderConfirmation updateRetailStoreOrderConfirmationProperty(RetailscmUserContext userContext,String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
		if(retailStoreOrderConfirmation.getVersion() != retailStoreOrderConfirmationVersion){
			String message = "The target version("+retailStoreOrderConfirmation.getVersion()+") is not equals to version("+retailStoreOrderConfirmationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderConfirmation){ 
			//will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderConfirmation.
			
			retailStoreOrderConfirmation.changeProperty(property, newValueExpr);
			
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().done());
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreOrderConfirmationTokens tokens(){
		return RetailStoreOrderConfirmationTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreOrderConfirmationTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreOrderListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreOrderConfirmationTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion) throws Exception {
		//deleteInternal(userContext, retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion) throws Exception{
			
		retailStoreOrderConfirmationDaoOf(userContext).delete(retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion);
	}
	
	public RetailStoreOrderConfirmation forgetByAll(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion);		
	}
	protected RetailStoreOrderConfirmation forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreOrderConfirmationId, int retailStoreOrderConfirmationVersion) throws Exception{
			
		return retailStoreOrderConfirmationDaoOf(userContext).disconnectFromAll(retailStoreOrderConfirmationId, retailStoreOrderConfirmationVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreOrderConfirmationManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreOrderConfirmationDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreOrderConfirmation with buyer in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByBuyer(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String buyerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithBuyer(retailStoreOrderConfirmation, buyerId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with seller in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderBySeller(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String sellerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithSeller(retailStoreOrderConfirmation, sellerId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with approval in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByApproval(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String approvalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithApproval(retailStoreOrderConfirmation, approvalId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with processing in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByProcessing(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String processingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithProcessing(retailStoreOrderConfirmation, processingId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with picking in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByPicking(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String pickingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithPicking(retailStoreOrderConfirmation, pickingId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with shipment in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByShipment(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String shipmentId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithShipment(retailStoreOrderConfirmation, shipmentId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	//disconnect RetailStoreOrderConfirmation with delivery in RetailStoreOrder
	protected RetailStoreOrderConfirmation breakWithRetailStoreOrderByDelivery(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String deliveryId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());

			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderListWithDelivery(retailStoreOrderConfirmation, deliveryId, this.emptyOptions());

				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderConfirmation;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String approvalId, String processingId, String pickingId, String shipmentId, String deliveryId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);

		
		checkerOf(userContext).checkBuyerIdOfRetailStoreOrder(buyerId);
		
		checkerOf(userContext).checkSellerIdOfRetailStoreOrder(sellerId);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder(title);
		
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(totalAmount);
		
		checkerOf(userContext).checkApprovalIdOfRetailStoreOrder(approvalId);
		
		checkerOf(userContext).checkProcessingIdOfRetailStoreOrder(processingId);
		
		checkerOf(userContext).checkPickingIdOfRetailStoreOrder(pickingId);
		
		checkerOf(userContext).checkShipmentIdOfRetailStoreOrder(shipmentId);
		
		checkerOf(userContext).checkDeliveryIdOfRetailStoreOrder(deliveryId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);

	
	}
	public  RetailStoreOrderConfirmation addRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String approvalId, String processingId, String pickingId, String shipmentId, String deliveryId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderConfirmationId,buyerId, sellerId, title, totalAmount, approvalId, processingId, pickingId, shipmentId, deliveryId,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createRetailStoreOrder(userContext,buyerId, sellerId, title, totalAmount, approvalId, processingId, pickingId, shipmentId, deliveryId);
		
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
		synchronized(retailStoreOrderConfirmation){ 
			//Will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderConfirmation.addRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderConfirmationId,String id,String title,BigDecimal totalAmount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(id);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder( title);
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder( totalAmount);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
		
	}
	public  RetailStoreOrderConfirmation updateRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String id,String title,BigDecimal totalAmount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreOrderProperties(userContext,retailStoreOrderConfirmationId,id,title,totalAmount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderListList()
				.searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "is", id).done();
		
		RetailStoreOrderConfirmation retailStoreOrderConfirmationToUpdate = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, options);
		
		if(retailStoreOrderConfirmationToUpdate.getRetailStoreOrderList().isEmpty()){
			throw new RetailStoreOrderConfirmationManagerException("RetailStoreOrder is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStoreOrder item = retailStoreOrderConfirmationToUpdate.getRetailStoreOrderList().first();
		
		item.updateTitle( title );
		item.updateTotalAmount( totalAmount );

		
		//checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderConfirmationId,name, code, used,tokensExpr);
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationToUpdate, tokens().withRetailStoreOrderList().done());
		synchronized(retailStoreOrderConfirmation){ 
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStoreOrder createRetailStoreOrder(RetailscmUserContext userContext, String buyerId, String sellerId, String title, BigDecimal totalAmount, String approvalId, String processingId, String pickingId, String shipmentId, String deliveryId) throws Exception{

		RetailStoreOrder retailStoreOrder = new RetailStoreOrder();
		
		
		RetailStore  buyer = new RetailStore();
		buyer.setId(buyerId);		
		retailStoreOrder.setBuyer(buyer);		
		RetailStoreCountryCenter  seller = new RetailStoreCountryCenter();
		seller.setId(sellerId);		
		retailStoreOrder.setSeller(seller);		
		retailStoreOrder.setTitle(title);		
		retailStoreOrder.setTotalAmount(totalAmount);		
		RetailStoreOrderApproval  approval = new RetailStoreOrderApproval();
		approval.setId(approvalId);		
		retailStoreOrder.setApproval(approval);		
		RetailStoreOrderProcessing  processing = new RetailStoreOrderProcessing();
		processing.setId(processingId);		
		retailStoreOrder.setProcessing(processing);		
		RetailStoreOrderPicking  picking = new RetailStoreOrderPicking();
		picking.setId(pickingId);		
		retailStoreOrder.setPicking(picking);		
		RetailStoreOrderShipment  shipment = new RetailStoreOrderShipment();
		shipment.setId(shipmentId);		
		retailStoreOrder.setShipment(shipment);		
		RetailStoreOrderDelivery  delivery = new RetailStoreOrderDelivery();
		delivery.setId(deliveryId);		
		retailStoreOrder.setDelivery(delivery);		
		retailStoreOrder.setLastUpdateTime(userContext.now());
	
		
		return retailStoreOrder;
	
		
	}
	
	protected RetailStoreOrder createIndexedRetailStoreOrder(String id, int version){

		RetailStoreOrder retailStoreOrder = new RetailStoreOrder();
		retailStoreOrder.setId(id);
		retailStoreOrder.setVersion(version);
		return retailStoreOrder;			
		
	}
	
	protected void checkParamsForRemovingRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		for(String retailStoreOrderIdItem: retailStoreOrderIds){
			checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
		
	}
	public  RetailStoreOrderConfirmation removeRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreOrderList(userContext, retailStoreOrderConfirmationId,  retailStoreOrderIds, tokensExpr);
			
			
			RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
			synchronized(retailStoreOrderConfirmation){ 
				//Will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderConfirmationDaoOf(userContext).planToRemoveRetailStoreOrderList(retailStoreOrderConfirmation, retailStoreOrderIds, allTokens());
				retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
				deleteRelationListInGraph(userContext, retailStoreOrderConfirmation.getRetailStoreOrderList());
				return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation( retailStoreOrderConfirmationId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
	
	}
	public  RetailStoreOrderConfirmation removeRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStoreOrder(userContext,retailStoreOrderConfirmationId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
		synchronized(retailStoreOrderConfirmation){ 
			//Will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderConfirmation.removeRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
			deleteRelationInGraph(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation( retailStoreOrderConfirmationId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
	
	}
	public  RetailStoreOrderConfirmation copyRetailStoreOrderFrom(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStoreOrder(userContext,retailStoreOrderConfirmationId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, allTokens());
		synchronized(retailStoreOrderConfirmation){ 
			//Will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			
			retailStoreOrderConfirmation.copyRetailStoreOrderFrom( retailStoreOrder );		
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, (RetailStoreOrder)retailStoreOrderConfirmation.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrderConfirmation(retailStoreOrderConfirmationId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		

		if(RetailStoreOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfRetailStoreOrder(parseString(newValueExpr));
		}
		
		if(RetailStoreOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderConfirmationManagerException.class);
	
	}
	
	public  RetailStoreOrderConfirmation updateRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderConfirmationId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderConfirmationId, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderList().searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "eq", retailStoreOrderId).done();
		
		
		
		RetailStoreOrderConfirmation retailStoreOrderConfirmation = loadRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmationId, loadTokens);
		
		synchronized(retailStoreOrderConfirmation){ 
			//Will be good when the retailStoreOrderConfirmation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrderConfirmation.removeRetailStoreOrder( retailStoreOrder );	
			//make changes to AcceleraterAccount.
			RetailStoreOrder retailStoreOrderIndex = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		
			RetailStoreOrder retailStoreOrder = retailStoreOrderConfirmation.findTheRetailStoreOrder(retailStoreOrderIndex);
			if(retailStoreOrder == null){
				throw new RetailStoreOrderConfirmationManagerException(retailStoreOrder+" is NOT FOUND" );
			}
			
			retailStoreOrder.changeProperty(property, newValueExpr);
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			retailStoreOrderConfirmation = saveRetailStoreOrderConfirmation(userContext, retailStoreOrderConfirmation, tokens().withRetailStoreOrderList().done());
			return present(userContext,retailStoreOrderConfirmation, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreOrderConfirmation newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



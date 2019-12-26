
package com.doublechaintech.retailscm.retailstoreordershipment;

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






public class RetailStoreOrderShipmentManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreOrderShipmentManager {
	
	private static final String SERVICE_TYPE = "RetailStoreOrderShipment";
	@Override
	public RetailStoreOrderShipmentDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreOrderShipmentDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreOrderShipmentManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreOrderShipmentManagerException(message);

	}
	
	

 	protected RetailStoreOrderShipment saveRetailStoreOrderShipment(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreOrderShipmentDAO().save(retailStoreOrderShipment, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens);
 	}
 	
 	protected RetailStoreOrderShipment saveRetailStoreOrderShipmentDetail(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment) throws Exception{	

 		
 		return saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, allTokens());
 	}
 	
 	public RetailStoreOrderShipment loadRetailStoreOrderShipment(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderShipmentManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment( userContext, retailStoreOrderShipmentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderShipment, tokens);
 	}
 	
 	
 	 public RetailStoreOrderShipment searchRetailStoreOrderShipment(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderShipmentManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment( userContext, retailStoreOrderShipmentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderShipment, tokens);
 	}
 	
 	

 	protected RetailStoreOrderShipment present(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreOrderShipment,tokens);
		
		
		RetailStoreOrderShipment  retailStoreOrderShipmentToPresent = retailStoreOrderShipmentDaoOf(userContext).present(retailStoreOrderShipment, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreOrderShipmentToPresent.collectRefercencesFromLists();
		retailStoreOrderShipmentDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreOrderShipmentToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreOrderShipment loadRetailStoreOrderShipmentDetail(RetailscmUserContext userContext, String retailStoreOrderShipmentId) throws Exception{	
 		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment( userContext, retailStoreOrderShipmentId, allTokens());
 		return present(userContext,retailStoreOrderShipment, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreOrderShipmentId) throws Exception{	
 		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment( userContext, retailStoreOrderShipmentId, viewTokens());
 		return present(userContext,retailStoreOrderShipment, allTokens());
		
 	}
 	protected RetailStoreOrderShipment saveRetailStoreOrderShipment(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, Map<String,Object>tokens) throws Exception{	
 		return retailStoreOrderShipmentDaoOf(userContext).save(retailStoreOrderShipment, tokens);
 	}
 	protected RetailStoreOrderShipment loadRetailStoreOrderShipment(RetailscmUserContext userContext, String retailStoreOrderShipmentId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderShipmentManagerException.class);

 
 		return retailStoreOrderShipmentDaoOf(userContext).load(retailStoreOrderShipmentId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreOrderShipment, tokens);
		
		addAction(userContext, retailStoreOrderShipment, tokens,"@create","createRetailStoreOrderShipment","createRetailStoreOrderShipment/","main","primary");
		addAction(userContext, retailStoreOrderShipment, tokens,"@update","updateRetailStoreOrderShipment","updateRetailStoreOrderShipment/"+retailStoreOrderShipment.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrderShipment, tokens,"@copy","cloneRetailStoreOrderShipment","cloneRetailStoreOrderShipment/"+retailStoreOrderShipment.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreOrderShipment, tokens,"retail_store_order_shipment.addRetailStoreOrder","addRetailStoreOrder","addRetailStoreOrder/"+retailStoreOrderShipment.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderShipment, tokens,"retail_store_order_shipment.removeRetailStoreOrder","removeRetailStoreOrder","removeRetailStoreOrder/"+retailStoreOrderShipment.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderShipment, tokens,"retail_store_order_shipment.updateRetailStoreOrder","updateRetailStoreOrder","updateRetailStoreOrder/"+retailStoreOrderShipment.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderShipment, tokens,"retail_store_order_shipment.copyRetailStoreOrderFrom","copyRetailStoreOrderFrom","copyRetailStoreOrderFrom/"+retailStoreOrderShipment.getId()+"/","retailStoreOrderList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreOrderShipment createRetailStoreOrderShipment(RetailscmUserContext userContext, String who,Date shipTime) throws Exception
	//public RetailStoreOrderShipment createRetailStoreOrderShipment(RetailscmUserContext userContext,String who, Date shipTime) throws Exception
	{
		
		

		

		checkerOf(userContext).checkWhoOfRetailStoreOrderShipment(who);
		checkerOf(userContext).checkShipTimeOfRetailStoreOrderShipment(shipTime);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);


		RetailStoreOrderShipment retailStoreOrderShipment=createNewRetailStoreOrderShipment();	

		retailStoreOrderShipment.setWho(who);
		retailStoreOrderShipment.setShipTime(shipTime);

		retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreOrderShipment);
		return retailStoreOrderShipment;

		
	}
	protected RetailStoreOrderShipment createNewRetailStoreOrderShipment() 
	{
		
		return new RetailStoreOrderShipment();		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrderShipment(RetailscmUserContext userContext,String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderShipment( retailStoreOrderShipmentVersion);
		

		if(RetailStoreOrderShipment.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfRetailStoreOrderShipment(parseString(newValueExpr));
		}
		if(RetailStoreOrderShipment.SHIP_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkShipTimeOfRetailStoreOrderShipment(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
	
		
	}
	
	
	
	public RetailStoreOrderShipment clone(RetailscmUserContext userContext, String fromRetailStoreOrderShipmentId) throws Exception{
		
		return retailStoreOrderShipmentDaoOf(userContext).clone(fromRetailStoreOrderShipmentId, this.allTokens());
	}
	
	public RetailStoreOrderShipment internalSaveRetailStoreOrderShipment(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment) throws Exception 
	{
		return internalSaveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, allTokens());

	}
	public RetailStoreOrderShipment internalSaveRetailStoreOrderShipment(RetailscmUserContext userContext, RetailStoreOrderShipment retailStoreOrderShipment, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, retailStoreOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreOrderShipment){ 
			//will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderShipment.
			if (retailStoreOrderShipment.isChanged()){
			
			}
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, options);
			return retailStoreOrderShipment;
			
		}

	}
	
	public RetailStoreOrderShipment updateRetailStoreOrderShipment(RetailscmUserContext userContext,String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, retailStoreOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
		if(retailStoreOrderShipment.getVersion() != retailStoreOrderShipmentVersion){
			String message = "The target version("+retailStoreOrderShipment.getVersion()+") is not equals to version("+retailStoreOrderShipmentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderShipment){ 
			//will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderShipment.
			
			retailStoreOrderShipment.changeProperty(property, newValueExpr);
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().done());
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().done());
		}

	}
	
	public RetailStoreOrderShipment updateRetailStoreOrderShipmentProperty(RetailscmUserContext userContext,String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, retailStoreOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
		if(retailStoreOrderShipment.getVersion() != retailStoreOrderShipmentVersion){
			String message = "The target version("+retailStoreOrderShipment.getVersion()+") is not equals to version("+retailStoreOrderShipmentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderShipment){ 
			//will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderShipment.
			
			retailStoreOrderShipment.changeProperty(property, newValueExpr);
			
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().done());
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreOrderShipmentTokens tokens(){
		return RetailStoreOrderShipmentTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreOrderShipmentTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreOrderListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreOrderShipmentTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion) throws Exception {
		//deleteInternal(userContext, retailStoreOrderShipmentId, retailStoreOrderShipmentVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion) throws Exception{
			
		retailStoreOrderShipmentDaoOf(userContext).delete(retailStoreOrderShipmentId, retailStoreOrderShipmentVersion);
	}
	
	public RetailStoreOrderShipment forgetByAll(RetailscmUserContext userContext, String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreOrderShipmentId, retailStoreOrderShipmentVersion);		
	}
	protected RetailStoreOrderShipment forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreOrderShipmentId, int retailStoreOrderShipmentVersion) throws Exception{
			
		return retailStoreOrderShipmentDaoOf(userContext).disconnectFromAll(retailStoreOrderShipmentId, retailStoreOrderShipmentVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreOrderShipmentManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreOrderShipmentDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreOrderShipment with buyer in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByBuyer(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String buyerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithBuyer(retailStoreOrderShipment, buyerId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with seller in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderBySeller(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String sellerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithSeller(retailStoreOrderShipment, sellerId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with confirmation in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByConfirmation(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithConfirmation(retailStoreOrderShipment, confirmationId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with approval in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByApproval(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String approvalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithApproval(retailStoreOrderShipment, approvalId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with processing in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByProcessing(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String processingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithProcessing(retailStoreOrderShipment, processingId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with picking in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByPicking(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String pickingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithPicking(retailStoreOrderShipment, pickingId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	//disconnect RetailStoreOrderShipment with delivery in RetailStoreOrder
	protected RetailStoreOrderShipment breakWithRetailStoreOrderByDelivery(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String deliveryId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());

			synchronized(retailStoreOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderListWithDelivery(retailStoreOrderShipment, deliveryId, this.emptyOptions());

				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderShipment;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);

		
		checkerOf(userContext).checkBuyerIdOfRetailStoreOrder(buyerId);
		
		checkerOf(userContext).checkSellerIdOfRetailStoreOrder(sellerId);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder(title);
		
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(totalAmount);
		
		checkerOf(userContext).checkConfirmationIdOfRetailStoreOrder(confirmationId);
		
		checkerOf(userContext).checkApprovalIdOfRetailStoreOrder(approvalId);
		
		checkerOf(userContext).checkProcessingIdOfRetailStoreOrder(processingId);
		
		checkerOf(userContext).checkPickingIdOfRetailStoreOrder(pickingId);
		
		checkerOf(userContext).checkDeliveryIdOfRetailStoreOrder(deliveryId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);

	
	}
	public  RetailStoreOrderShipment addRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderShipmentId,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, processingId, pickingId, deliveryId,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createRetailStoreOrder(userContext,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, processingId, pickingId, deliveryId);
		
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
		synchronized(retailStoreOrderShipment){ 
			//Will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderShipment.addRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderShipmentId,String id,String title,BigDecimal totalAmount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(id);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder( title);
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder( totalAmount);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
		
	}
	public  RetailStoreOrderShipment updateRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String id,String title,BigDecimal totalAmount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreOrderProperties(userContext,retailStoreOrderShipmentId,id,title,totalAmount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderListList()
				.searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "is", id).done();
		
		RetailStoreOrderShipment retailStoreOrderShipmentToUpdate = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, options);
		
		if(retailStoreOrderShipmentToUpdate.getRetailStoreOrderList().isEmpty()){
			throw new RetailStoreOrderShipmentManagerException("RetailStoreOrder is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStoreOrder item = retailStoreOrderShipmentToUpdate.getRetailStoreOrderList().first();
		
		item.updateTitle( title );
		item.updateTotalAmount( totalAmount );

		
		//checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderShipmentId,name, code, used,tokensExpr);
		RetailStoreOrderShipment retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipmentToUpdate, tokens().withRetailStoreOrderList().done());
		synchronized(retailStoreOrderShipment){ 
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStoreOrder createRetailStoreOrder(RetailscmUserContext userContext, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId) throws Exception{

		RetailStoreOrder retailStoreOrder = new RetailStoreOrder();
		
		
		RetailStore  buyer = new RetailStore();
		buyer.setId(buyerId);		
		retailStoreOrder.setBuyer(buyer);		
		RetailStoreCountryCenter  seller = new RetailStoreCountryCenter();
		seller.setId(sellerId);		
		retailStoreOrder.setSeller(seller);		
		retailStoreOrder.setTitle(title);		
		retailStoreOrder.setTotalAmount(totalAmount);		
		RetailStoreOrderConfirmation  confirmation = new RetailStoreOrderConfirmation();
		confirmation.setId(confirmationId);		
		retailStoreOrder.setConfirmation(confirmation);		
		RetailStoreOrderApproval  approval = new RetailStoreOrderApproval();
		approval.setId(approvalId);		
		retailStoreOrder.setApproval(approval);		
		RetailStoreOrderProcessing  processing = new RetailStoreOrderProcessing();
		processing.setId(processingId);		
		retailStoreOrder.setProcessing(processing);		
		RetailStoreOrderPicking  picking = new RetailStoreOrderPicking();
		picking.setId(pickingId);		
		retailStoreOrder.setPicking(picking);		
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
	
	protected void checkParamsForRemovingRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		for(String retailStoreOrderIdItem: retailStoreOrderIds){
			userContext.getChecker().checkIdOfRetailStoreOrder(retailStoreOrderIdItem);
=======
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		for(String retailStoreOrderIdItem: retailStoreOrderIds){
			checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
		
	}
	public  RetailStoreOrderShipment removeRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreOrderList(userContext, retailStoreOrderShipmentId,  retailStoreOrderIds, tokensExpr);
			
			
			RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
			synchronized(retailStoreOrderShipment){ 
				//Will be good when the retailStoreOrderShipment loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderShipmentDaoOf(userContext).planToRemoveRetailStoreOrderList(retailStoreOrderShipment, retailStoreOrderIds, allTokens());
				retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
				deleteRelationListInGraph(userContext, retailStoreOrderShipment.getRetailStoreOrderList());
				return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment( retailStoreOrderShipmentId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
	
	}
	public  RetailStoreOrderShipment removeRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStoreOrder(userContext,retailStoreOrderShipmentId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
		synchronized(retailStoreOrderShipment){ 
			//Will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderShipment.removeRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
			deleteRelationInGraph(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment( retailStoreOrderShipmentId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
	
	}
	public  RetailStoreOrderShipment copyRetailStoreOrderFrom(RetailscmUserContext userContext, String retailStoreOrderShipmentId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStoreOrder(userContext,retailStoreOrderShipmentId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, allTokens());
		synchronized(retailStoreOrderShipment){ 
			//Will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			
			retailStoreOrderShipment.copyRetailStoreOrderFrom( retailStoreOrder );		
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, (RetailStoreOrder)retailStoreOrderShipment.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrderShipment(retailStoreOrderShipmentId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		

		if(RetailStoreOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfRetailStoreOrder(parseString(newValueExpr));
		}
		
		if(RetailStoreOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderShipmentManagerException.class);
	
	}
	
	public  RetailStoreOrderShipment updateRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderShipmentId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderShipmentId, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderList().searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "eq", retailStoreOrderId).done();
		
		
		
		RetailStoreOrderShipment retailStoreOrderShipment = loadRetailStoreOrderShipment(userContext, retailStoreOrderShipmentId, loadTokens);
		
		synchronized(retailStoreOrderShipment){ 
			//Will be good when the retailStoreOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrderShipment.removeRetailStoreOrder( retailStoreOrder );	
			//make changes to AcceleraterAccount.
			RetailStoreOrder retailStoreOrderIndex = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		
			RetailStoreOrder retailStoreOrder = retailStoreOrderShipment.findTheRetailStoreOrder(retailStoreOrderIndex);
			if(retailStoreOrder == null){
				throw new RetailStoreOrderShipmentManagerException(retailStoreOrder+" is NOT FOUND" );
			}
			
			retailStoreOrder.changeProperty(property, newValueExpr);
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			retailStoreOrderShipment = saveRetailStoreOrderShipment(userContext, retailStoreOrderShipment, tokens().withRetailStoreOrderList().done());
			return present(userContext,retailStoreOrderShipment, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreOrderShipment newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



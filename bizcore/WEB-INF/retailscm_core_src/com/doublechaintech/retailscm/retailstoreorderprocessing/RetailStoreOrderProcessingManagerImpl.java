
package com.doublechaintech.retailscm.retailstoreorderprocessing;

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






public class RetailStoreOrderProcessingManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreOrderProcessingManager {
	
	private static final String SERVICE_TYPE = "RetailStoreOrderProcessing";
	@Override
	public RetailStoreOrderProcessingDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreOrderProcessingDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws RetailStoreOrderProcessingManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreOrderProcessingManagerException(message);

	}
	
	

 	protected RetailStoreOrderProcessing saveRetailStoreOrderProcessing(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreOrderProcessingDAO().save(retailStoreOrderProcessing, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens);
 	}
 	
 	protected RetailStoreOrderProcessing saveRetailStoreOrderProcessingDetail(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing) throws Exception{	

 		
 		return saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, allTokens());
 	}
 	
 	public RetailStoreOrderProcessing loadRetailStoreOrderProcessing(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderProcessingManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing( userContext, retailStoreOrderProcessingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderProcessing, tokens);
 	}
 	
 	
 	 public RetailStoreOrderProcessing searchRetailStoreOrderProcessing(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderProcessingManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing( userContext, retailStoreOrderProcessingId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrderProcessing, tokens);
 	}
 	
 	

 	protected RetailStoreOrderProcessing present(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreOrderProcessing,tokens);
		
		
		RetailStoreOrderProcessing  retailStoreOrderProcessingToPresent = retailStoreOrderProcessingDaoOf(userContext).present(retailStoreOrderProcessing, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreOrderProcessingToPresent.collectRefercencesFromLists();
		retailStoreOrderProcessingDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreOrderProcessingToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreOrderProcessing loadRetailStoreOrderProcessingDetail(RetailscmUserContext userContext, String retailStoreOrderProcessingId) throws Exception{	
 		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing( userContext, retailStoreOrderProcessingId, allTokens());
 		return present(userContext,retailStoreOrderProcessing, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreOrderProcessingId) throws Exception{	
 		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing( userContext, retailStoreOrderProcessingId, viewTokens());
 		return present(userContext,retailStoreOrderProcessing, allTokens());
		
 	}
 	protected RetailStoreOrderProcessing saveRetailStoreOrderProcessing(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, Map<String,Object>tokens) throws Exception{	
 		return retailStoreOrderProcessingDaoOf(userContext).save(retailStoreOrderProcessing, tokens);
 	}
 	protected RetailStoreOrderProcessing loadRetailStoreOrderProcessing(RetailscmUserContext userContext, String retailStoreOrderProcessingId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderProcessingManagerException.class);

 
 		return retailStoreOrderProcessingDaoOf(userContext).load(retailStoreOrderProcessingId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreOrderProcessing, tokens);
		
		addAction(userContext, retailStoreOrderProcessing, tokens,"@create","createRetailStoreOrderProcessing","createRetailStoreOrderProcessing/","main","primary");
		addAction(userContext, retailStoreOrderProcessing, tokens,"@update","updateRetailStoreOrderProcessing","updateRetailStoreOrderProcessing/"+retailStoreOrderProcessing.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrderProcessing, tokens,"@copy","cloneRetailStoreOrderProcessing","cloneRetailStoreOrderProcessing/"+retailStoreOrderProcessing.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreOrderProcessing, tokens,"retail_store_order_processing.addRetailStoreOrder","addRetailStoreOrder","addRetailStoreOrder/"+retailStoreOrderProcessing.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderProcessing, tokens,"retail_store_order_processing.removeRetailStoreOrder","removeRetailStoreOrder","removeRetailStoreOrder/"+retailStoreOrderProcessing.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderProcessing, tokens,"retail_store_order_processing.updateRetailStoreOrder","updateRetailStoreOrder","updateRetailStoreOrder/"+retailStoreOrderProcessing.getId()+"/","retailStoreOrderList","primary");
		addAction(userContext, retailStoreOrderProcessing, tokens,"retail_store_order_processing.copyRetailStoreOrderFrom","copyRetailStoreOrderFrom","copyRetailStoreOrderFrom/"+retailStoreOrderProcessing.getId()+"/","retailStoreOrderList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreOrderProcessing createRetailStoreOrderProcessing(RetailscmUserContext userContext, String who,Date processTime) throws Exception
	//public RetailStoreOrderProcessing createRetailStoreOrderProcessing(RetailscmUserContext userContext,String who, Date processTime) throws Exception
	{
		
		

		

		checkerOf(userContext).checkWhoOfRetailStoreOrderProcessing(who);
		checkerOf(userContext).checkProcessTimeOfRetailStoreOrderProcessing(processTime);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);


		RetailStoreOrderProcessing retailStoreOrderProcessing=createNewRetailStoreOrderProcessing();	

		retailStoreOrderProcessing.setWho(who);
		retailStoreOrderProcessing.setProcessTime(processTime);

		retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreOrderProcessing);
		return retailStoreOrderProcessing;

		
	}
	protected RetailStoreOrderProcessing createNewRetailStoreOrderProcessing() 
	{
		
		return new RetailStoreOrderProcessing();		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrderProcessing(RetailscmUserContext userContext,String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderProcessing( retailStoreOrderProcessingVersion);
		

		if(RetailStoreOrderProcessing.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfRetailStoreOrderProcessing(parseString(newValueExpr));
		}
		if(RetailStoreOrderProcessing.PROCESS_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkProcessTimeOfRetailStoreOrderProcessing(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
	
		
	}
	
	
	
	public RetailStoreOrderProcessing clone(RetailscmUserContext userContext, String fromRetailStoreOrderProcessingId) throws Exception{
		
		return retailStoreOrderProcessingDaoOf(userContext).clone(fromRetailStoreOrderProcessingId, this.allTokens());
	}
	
	public RetailStoreOrderProcessing internalSaveRetailStoreOrderProcessing(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing) throws Exception 
	{
		return internalSaveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, allTokens());

	}
	public RetailStoreOrderProcessing internalSaveRetailStoreOrderProcessing(RetailscmUserContext userContext, RetailStoreOrderProcessing retailStoreOrderProcessing, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, retailStoreOrderProcessingVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(retailStoreOrderProcessing){ 
			//will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderProcessing.
			if (retailStoreOrderProcessing.isChanged()){
			
			}
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, options);
			return retailStoreOrderProcessing;
			
		}

	}
	
	public RetailStoreOrderProcessing updateRetailStoreOrderProcessing(RetailscmUserContext userContext,String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, retailStoreOrderProcessingVersion, property, newValueExpr, tokensExpr);
		
		
		
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
		if(retailStoreOrderProcessing.getVersion() != retailStoreOrderProcessingVersion){
			String message = "The target version("+retailStoreOrderProcessing.getVersion()+") is not equals to version("+retailStoreOrderProcessingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderProcessing){ 
			//will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderProcessing.
			
			retailStoreOrderProcessing.changeProperty(property, newValueExpr);
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().done());
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().done());
		}

	}
	
	public RetailStoreOrderProcessing updateRetailStoreOrderProcessingProperty(RetailscmUserContext userContext,String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, retailStoreOrderProcessingVersion, property, newValueExpr, tokensExpr);
		
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
		if(retailStoreOrderProcessing.getVersion() != retailStoreOrderProcessingVersion){
			String message = "The target version("+retailStoreOrderProcessing.getVersion()+") is not equals to version("+retailStoreOrderProcessingVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrderProcessing){ 
			//will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrderProcessing.
			
			retailStoreOrderProcessing.changeProperty(property, newValueExpr);
			
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().done());
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected RetailStoreOrderProcessingTokens tokens(){
		return RetailStoreOrderProcessingTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreOrderProcessingTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreOrderListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreOrderProcessingTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion) throws Exception {
		//deleteInternal(userContext, retailStoreOrderProcessingId, retailStoreOrderProcessingVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion) throws Exception{
			
		retailStoreOrderProcessingDaoOf(userContext).delete(retailStoreOrderProcessingId, retailStoreOrderProcessingVersion);
	}
	
	public RetailStoreOrderProcessing forgetByAll(RetailscmUserContext userContext, String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreOrderProcessingId, retailStoreOrderProcessingVersion);		
	}
	protected RetailStoreOrderProcessing forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreOrderProcessingId, int retailStoreOrderProcessingVersion) throws Exception{
			
		return retailStoreOrderProcessingDaoOf(userContext).disconnectFromAll(retailStoreOrderProcessingId, retailStoreOrderProcessingVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreOrderProcessingManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreOrderProcessingDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreOrderProcessing with buyer in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByBuyer(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String buyerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithBuyer(retailStoreOrderProcessing, buyerId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with seller in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderBySeller(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String sellerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithSeller(retailStoreOrderProcessing, sellerId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with confirmation in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByConfirmation(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithConfirmation(retailStoreOrderProcessing, confirmationId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with approval in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByApproval(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String approvalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithApproval(retailStoreOrderProcessing, approvalId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with picking in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByPicking(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String pickingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithPicking(retailStoreOrderProcessing, pickingId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with shipment in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByShipment(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String shipmentId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithShipment(retailStoreOrderProcessing, shipmentId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	//disconnect RetailStoreOrderProcessing with delivery in RetailStoreOrder
	protected RetailStoreOrderProcessing breakWithRetailStoreOrderByDelivery(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String deliveryId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());

			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderListWithDelivery(retailStoreOrderProcessing, deliveryId, this.emptyOptions());

				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				return retailStoreOrderProcessing;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String pickingId, String shipmentId, String deliveryId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);

		
		checkerOf(userContext).checkBuyerIdOfRetailStoreOrder(buyerId);
		
		checkerOf(userContext).checkSellerIdOfRetailStoreOrder(sellerId);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder(title);
		
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(totalAmount);
		
		checkerOf(userContext).checkConfirmationIdOfRetailStoreOrder(confirmationId);
		
		checkerOf(userContext).checkApprovalIdOfRetailStoreOrder(approvalId);
		
		checkerOf(userContext).checkPickingIdOfRetailStoreOrder(pickingId);
		
		checkerOf(userContext).checkShipmentIdOfRetailStoreOrder(shipmentId);
		
		checkerOf(userContext).checkDeliveryIdOfRetailStoreOrder(deliveryId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);

	
	}
	public  RetailStoreOrderProcessing addRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String pickingId, String shipmentId, String deliveryId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderProcessingId,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, pickingId, shipmentId, deliveryId,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createRetailStoreOrder(userContext,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, pickingId, shipmentId, deliveryId);
		
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
		synchronized(retailStoreOrderProcessing){ 
			//Will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderProcessing.addRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderProcessingId,String id,String title,BigDecimal totalAmount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(id);
		
		checkerOf(userContext).checkTitleOfRetailStoreOrder( title);
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder( totalAmount);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
		
	}
	public  RetailStoreOrderProcessing updateRetailStoreOrderProperties(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String id,String title,BigDecimal totalAmount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingRetailStoreOrderProperties(userContext,retailStoreOrderProcessingId,id,title,totalAmount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderListList()
				.searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "is", id).done();
		
		RetailStoreOrderProcessing retailStoreOrderProcessingToUpdate = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, options);
		
		if(retailStoreOrderProcessingToUpdate.getRetailStoreOrderList().isEmpty()){
			throw new RetailStoreOrderProcessingManagerException("RetailStoreOrder is NOT FOUND with id: '"+id+"'");
		}
		
		RetailStoreOrder item = retailStoreOrderProcessingToUpdate.getRetailStoreOrderList().first();
		
		item.updateTitle( title );
		item.updateTotalAmount( totalAmount );

		
		//checkParamsForAddingRetailStoreOrder(userContext,retailStoreOrderProcessingId,name, code, used,tokensExpr);
		RetailStoreOrderProcessing retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingToUpdate, tokens().withRetailStoreOrderList().done());
		synchronized(retailStoreOrderProcessing){ 
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected RetailStoreOrder createRetailStoreOrder(RetailscmUserContext userContext, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String pickingId, String shipmentId, String deliveryId) throws Exception{

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
	
	protected void checkParamsForRemovingRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		for(String retailStoreOrderIdItem: retailStoreOrderIds){
			checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
		
	}
	public  RetailStoreOrderProcessing removeRetailStoreOrderList(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
			String retailStoreOrderIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingRetailStoreOrderList(userContext, retailStoreOrderProcessingId,  retailStoreOrderIds, tokensExpr);
			
			
			RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
			synchronized(retailStoreOrderProcessing){ 
				//Will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderProcessingDaoOf(userContext).planToRemoveRetailStoreOrderList(retailStoreOrderProcessing, retailStoreOrderIds, allTokens());
				retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
				deleteRelationListInGraph(userContext, retailStoreOrderProcessing.getRetailStoreOrderList());
				return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing( retailStoreOrderProcessingId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
	
	}
	public  RetailStoreOrderProcessing removeRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingRetailStoreOrder(userContext,retailStoreOrderProcessingId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
		synchronized(retailStoreOrderProcessing){ 
			//Will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrderProcessing.removeRetailStoreOrder( retailStoreOrder );		
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
			deleteRelationInGraph(userContext, retailStoreOrder);
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing( retailStoreOrderProcessingId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
	
	}
	public  RetailStoreOrderProcessing copyRetailStoreOrderFrom(RetailscmUserContext userContext, String retailStoreOrderProcessingId, 
		String retailStoreOrderId, int retailStoreOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingRetailStoreOrder(userContext,retailStoreOrderProcessingId, retailStoreOrderId, retailStoreOrderVersion,tokensExpr);
		
		RetailStoreOrder retailStoreOrder = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, allTokens());
		synchronized(retailStoreOrderProcessing){ 
			//Will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			
			retailStoreOrderProcessing.copyRetailStoreOrderFrom( retailStoreOrder );		
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderManager().onNewInstanceCreated(userContext, (RetailStoreOrder)retailStoreOrderProcessing.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrderProcessing(retailStoreOrderProcessingId);
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder(retailStoreOrderVersion);
		

		if(RetailStoreOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfRetailStoreOrder(parseString(newValueExpr));
		}
		
		if(RetailStoreOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderProcessingManagerException.class);
	
	}
	
	public  RetailStoreOrderProcessing updateRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderProcessingId, String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderProcessingId, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderList().searchRetailStoreOrderListWith(RetailStoreOrder.ID_PROPERTY, "eq", retailStoreOrderId).done();
		
		
		
		RetailStoreOrderProcessing retailStoreOrderProcessing = loadRetailStoreOrderProcessing(userContext, retailStoreOrderProcessingId, loadTokens);
		
		synchronized(retailStoreOrderProcessing){ 
			//Will be good when the retailStoreOrderProcessing loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrderProcessing.removeRetailStoreOrder( retailStoreOrder );	
			//make changes to AcceleraterAccount.
			RetailStoreOrder retailStoreOrderIndex = createIndexedRetailStoreOrder(retailStoreOrderId, retailStoreOrderVersion);
		
			RetailStoreOrder retailStoreOrder = retailStoreOrderProcessing.findTheRetailStoreOrder(retailStoreOrderIndex);
			if(retailStoreOrder == null){
				throw new RetailStoreOrderProcessingManagerException(retailStoreOrder+" is NOT FOUND" );
			}
			
			retailStoreOrder.changeProperty(property, newValueExpr);
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			retailStoreOrderProcessing = saveRetailStoreOrderProcessing(userContext, retailStoreOrderProcessing, tokens().withRetailStoreOrderList().done());
			return present(userContext,retailStoreOrderProcessing, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreOrderProcessing newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



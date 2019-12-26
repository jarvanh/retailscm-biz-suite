
package com.doublechaintech.retailscm.supplyordershipment;

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

import com.doublechaintech.retailscm.consumerorder.ConsumerOrder;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;


import com.doublechaintech.retailscm.supplyorderapproval.SupplyOrderApproval;
import com.doublechaintech.retailscm.retailstoremember.RetailStoreMember;
import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.goodssupplier.GoodsSupplier;
import com.doublechaintech.retailscm.supplyorderdelivery.SupplyOrderDelivery;
import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorderpicking.SupplyOrderPicking;
import com.doublechaintech.retailscm.supplyorderprocessing.SupplyOrderProcessing;
import com.doublechaintech.retailscm.supplyorderconfirmation.SupplyOrderConfirmation;
import com.doublechaintech.retailscm.supplyordershipment.SupplyOrderShipment;






public class SupplyOrderShipmentManagerImpl extends CustomRetailscmCheckerManager implements SupplyOrderShipmentManager {
	
	private static final String SERVICE_TYPE = "SupplyOrderShipment";
	@Override
	public SupplyOrderShipmentDAO daoOf(RetailscmUserContext userContext) {
		return supplyOrderShipmentDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws SupplyOrderShipmentManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new SupplyOrderShipmentManagerException(message);

	}
	
	

 	protected SupplyOrderShipment saveSupplyOrderShipment(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, String [] tokensExpr) throws Exception{	
 		//return getSupplyOrderShipmentDAO().save(supplyOrderShipment, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens);
 	}
 	
 	protected SupplyOrderShipment saveSupplyOrderShipmentDetail(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment) throws Exception{	

 		
 		return saveSupplyOrderShipment(userContext, supplyOrderShipment, allTokens());
 	}
 	
 	public SupplyOrderShipment loadSupplyOrderShipment(RetailscmUserContext userContext, String supplyOrderShipmentId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderShipmentManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment( userContext, supplyOrderShipmentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,supplyOrderShipment, tokens);
 	}
 	
 	
 	 public SupplyOrderShipment searchSupplyOrderShipment(RetailscmUserContext userContext, String supplyOrderShipmentId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderShipmentManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment( userContext, supplyOrderShipmentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,supplyOrderShipment, tokens);
 	}
 	
 	

 	protected SupplyOrderShipment present(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,supplyOrderShipment,tokens);
		
		
		SupplyOrderShipment  supplyOrderShipmentToPresent = supplyOrderShipmentDaoOf(userContext).present(supplyOrderShipment, tokens);
		
		List<BaseEntity> entityListToNaming = supplyOrderShipmentToPresent.collectRefercencesFromLists();
		supplyOrderShipmentDaoOf(userContext).alias(entityListToNaming);
		
		return  supplyOrderShipmentToPresent;
		
		
	}
 
 	
 	
 	public SupplyOrderShipment loadSupplyOrderShipmentDetail(RetailscmUserContext userContext, String supplyOrderShipmentId) throws Exception{	
 		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment( userContext, supplyOrderShipmentId, allTokens());
 		return present(userContext,supplyOrderShipment, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String supplyOrderShipmentId) throws Exception{	
 		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment( userContext, supplyOrderShipmentId, viewTokens());
 		return present(userContext,supplyOrderShipment, allTokens());
		
 	}
 	protected SupplyOrderShipment saveSupplyOrderShipment(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, Map<String,Object>tokens) throws Exception{	
 		return supplyOrderShipmentDaoOf(userContext).save(supplyOrderShipment, tokens);
 	}
 	protected SupplyOrderShipment loadSupplyOrderShipment(RetailscmUserContext userContext, String supplyOrderShipmentId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderShipmentManagerException.class);

 
 		return supplyOrderShipmentDaoOf(userContext).load(supplyOrderShipmentId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, Map<String, Object> tokens){
		super.addActions(userContext, supplyOrderShipment, tokens);
		
		addAction(userContext, supplyOrderShipment, tokens,"@create","createSupplyOrderShipment","createSupplyOrderShipment/","main","primary");
		addAction(userContext, supplyOrderShipment, tokens,"@update","updateSupplyOrderShipment","updateSupplyOrderShipment/"+supplyOrderShipment.getId()+"/","main","primary");
		addAction(userContext, supplyOrderShipment, tokens,"@copy","cloneSupplyOrderShipment","cloneSupplyOrderShipment/"+supplyOrderShipment.getId()+"/","main","primary");
		
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.addConsumerOrder","addConsumerOrder","addConsumerOrder/"+supplyOrderShipment.getId()+"/","consumerOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.removeConsumerOrder","removeConsumerOrder","removeConsumerOrder/"+supplyOrderShipment.getId()+"/","consumerOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.updateConsumerOrder","updateConsumerOrder","updateConsumerOrder/"+supplyOrderShipment.getId()+"/","consumerOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.copyConsumerOrderFrom","copyConsumerOrderFrom","copyConsumerOrderFrom/"+supplyOrderShipment.getId()+"/","consumerOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.addSupplyOrder","addSupplyOrder","addSupplyOrder/"+supplyOrderShipment.getId()+"/","supplyOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.removeSupplyOrder","removeSupplyOrder","removeSupplyOrder/"+supplyOrderShipment.getId()+"/","supplyOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.updateSupplyOrder","updateSupplyOrder","updateSupplyOrder/"+supplyOrderShipment.getId()+"/","supplyOrderList","primary");
		addAction(userContext, supplyOrderShipment, tokens,"supply_order_shipment.copySupplyOrderFrom","copySupplyOrderFrom","copySupplyOrderFrom/"+supplyOrderShipment.getId()+"/","supplyOrderList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public SupplyOrderShipment createSupplyOrderShipment(RetailscmUserContext userContext, String who,Date shipTime) throws Exception
	//public SupplyOrderShipment createSupplyOrderShipment(RetailscmUserContext userContext,String who, Date shipTime) throws Exception
	{
		
		

		

		checkerOf(userContext).checkWhoOfSupplyOrderShipment(who);
		checkerOf(userContext).checkShipTimeOfSupplyOrderShipment(shipTime);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);


		SupplyOrderShipment supplyOrderShipment=createNewSupplyOrderShipment();	

		supplyOrderShipment.setWho(who);
		supplyOrderShipment.setShipTime(shipTime);

		supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, emptyOptions());
		
		onNewInstanceCreated(userContext, supplyOrderShipment);
		return supplyOrderShipment;

		
	}
	protected SupplyOrderShipment createNewSupplyOrderShipment() 
	{
		
		return new SupplyOrderShipment();		
	}
	
	protected void checkParamsForUpdatingSupplyOrderShipment(RetailscmUserContext userContext,String supplyOrderShipmentId, int supplyOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).checkVersionOfSupplyOrderShipment( supplyOrderShipmentVersion);
		

		if(SupplyOrderShipment.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfSupplyOrderShipment(parseString(newValueExpr));
		}
		if(SupplyOrderShipment.SHIP_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkShipTimeOfSupplyOrderShipment(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
		
	}
	
	
	
	public SupplyOrderShipment clone(RetailscmUserContext userContext, String fromSupplyOrderShipmentId) throws Exception{
		
		return supplyOrderShipmentDaoOf(userContext).clone(fromSupplyOrderShipmentId, this.allTokens());
	}
	
	public SupplyOrderShipment internalSaveSupplyOrderShipment(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment) throws Exception 
	{
		return internalSaveSupplyOrderShipment(userContext, supplyOrderShipment, allTokens());

	}
	public SupplyOrderShipment internalSaveSupplyOrderShipment(RetailscmUserContext userContext, SupplyOrderShipment supplyOrderShipment, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingSupplyOrderShipment(userContext, supplyOrderShipmentId, supplyOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(supplyOrderShipment){ 
			//will be good when the supplyOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrderShipment.
			if (supplyOrderShipment.isChanged()){
			
			}
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, options);
			return supplyOrderShipment;
			
		}

	}
	
	public SupplyOrderShipment updateSupplyOrderShipment(RetailscmUserContext userContext,String supplyOrderShipmentId, int supplyOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingSupplyOrderShipment(userContext, supplyOrderShipmentId, supplyOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		if(supplyOrderShipment.getVersion() != supplyOrderShipmentVersion){
			String message = "The target version("+supplyOrderShipment.getVersion()+") is not equals to version("+supplyOrderShipmentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(supplyOrderShipment){ 
			//will be good when the supplyOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrderShipment.
			
			supplyOrderShipment.changeProperty(property, newValueExpr);
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().done());
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
			//return saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().done());
		}

	}
	
	public SupplyOrderShipment updateSupplyOrderShipmentProperty(RetailscmUserContext userContext,String supplyOrderShipmentId, int supplyOrderShipmentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingSupplyOrderShipment(userContext, supplyOrderShipmentId, supplyOrderShipmentVersion, property, newValueExpr, tokensExpr);
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		if(supplyOrderShipment.getVersion() != supplyOrderShipmentVersion){
			String message = "The target version("+supplyOrderShipment.getVersion()+") is not equals to version("+supplyOrderShipmentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(supplyOrderShipment){ 
			//will be good when the supplyOrderShipment loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrderShipment.
			
			supplyOrderShipment.changeProperty(property, newValueExpr);
			
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().done());
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
			//return saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected SupplyOrderShipmentTokens tokens(){
		return SupplyOrderShipmentTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return SupplyOrderShipmentTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortConsumerOrderListWith("id","desc")
		.sortSupplyOrderListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return SupplyOrderShipmentTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String supplyOrderShipmentId, int supplyOrderShipmentVersion) throws Exception {
		//deleteInternal(userContext, supplyOrderShipmentId, supplyOrderShipmentVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String supplyOrderShipmentId, int supplyOrderShipmentVersion) throws Exception{
			
		supplyOrderShipmentDaoOf(userContext).delete(supplyOrderShipmentId, supplyOrderShipmentVersion);
	}
	
	public SupplyOrderShipment forgetByAll(RetailscmUserContext userContext, String supplyOrderShipmentId, int supplyOrderShipmentVersion) throws Exception {
		return forgetByAllInternal(userContext, supplyOrderShipmentId, supplyOrderShipmentVersion);		
	}
	protected SupplyOrderShipment forgetByAllInternal(RetailscmUserContext userContext,
			String supplyOrderShipmentId, int supplyOrderShipmentVersion) throws Exception{
			
		return supplyOrderShipmentDaoOf(userContext).disconnectFromAll(supplyOrderShipmentId, supplyOrderShipmentVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new SupplyOrderShipmentManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return supplyOrderShipmentDaoOf(userContext).deleteAll();
	}


	//disconnect SupplyOrderShipment with consumer in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByConsumer(RetailscmUserContext userContext, String supplyOrderShipmentId, String consumerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithConsumer(supplyOrderShipment, consumerId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with confirmation in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByConfirmation(RetailscmUserContext userContext, String supplyOrderShipmentId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithConfirmation(supplyOrderShipment, confirmationId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with approval in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByApproval(RetailscmUserContext userContext, String supplyOrderShipmentId, String approvalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithApproval(supplyOrderShipment, approvalId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with processing in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByProcessing(RetailscmUserContext userContext, String supplyOrderShipmentId, String processingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithProcessing(supplyOrderShipment, processingId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with delivery in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByDelivery(RetailscmUserContext userContext, String supplyOrderShipmentId, String deliveryId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithDelivery(supplyOrderShipment, deliveryId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with store in ConsumerOrder
	protected SupplyOrderShipment breakWithConsumerOrderByStore(RetailscmUserContext userContext, String supplyOrderShipmentId, String storeId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderListWithStore(supplyOrderShipment, storeId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with buyer in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByBuyer(RetailscmUserContext userContext, String supplyOrderShipmentId, String buyerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithBuyer(supplyOrderShipment, buyerId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with seller in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderBySeller(RetailscmUserContext userContext, String supplyOrderShipmentId, String sellerId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithSeller(supplyOrderShipment, sellerId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with confirmation in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByConfirmation(RetailscmUserContext userContext, String supplyOrderShipmentId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithConfirmation(supplyOrderShipment, confirmationId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with approval in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByApproval(RetailscmUserContext userContext, String supplyOrderShipmentId, String approvalId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithApproval(supplyOrderShipment, approvalId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with processing in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByProcessing(RetailscmUserContext userContext, String supplyOrderShipmentId, String processingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithProcessing(supplyOrderShipment, processingId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with picking in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByPicking(RetailscmUserContext userContext, String supplyOrderShipmentId, String pickingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithPicking(supplyOrderShipment, pickingId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	//disconnect SupplyOrderShipment with delivery in SupplyOrder
	protected SupplyOrderShipment breakWithSupplyOrderByDelivery(RetailscmUserContext userContext, String supplyOrderShipmentId, String deliveryId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());

			synchronized(supplyOrderShipment){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderListWithDelivery(supplyOrderShipment, deliveryId, this.emptyOptions());

				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				return supplyOrderShipment;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String title, String consumerId, String confirmationId, String approvalId, String processingId, String deliveryId, String storeId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);

		
		checkerOf(userContext).checkTitleOfConsumerOrder(title);
		
		checkerOf(userContext).checkConsumerIdOfConsumerOrder(consumerId);
		
		checkerOf(userContext).checkConfirmationIdOfConsumerOrder(confirmationId);
		
		checkerOf(userContext).checkApprovalIdOfConsumerOrder(approvalId);
		
		checkerOf(userContext).checkProcessingIdOfConsumerOrder(processingId);
		
		checkerOf(userContext).checkDeliveryIdOfConsumerOrder(deliveryId);
		
		checkerOf(userContext).checkStoreIdOfConsumerOrder(storeId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);

	
	}
	public  SupplyOrderShipment addConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String title, String consumerId, String confirmationId, String approvalId, String processingId, String deliveryId, String storeId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingConsumerOrder(userContext,supplyOrderShipmentId,title, consumerId, confirmationId, approvalId, processingId, deliveryId, storeId,tokensExpr);
		
		ConsumerOrder consumerOrder = createConsumerOrder(userContext,title, consumerId, confirmationId, approvalId, processingId, deliveryId, storeId);
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrderShipment.addConsumerOrder( consumerOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
			
			userContext.getManagerGroup().getConsumerOrderManager().onNewInstanceCreated(userContext, consumerOrder);
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingConsumerOrderProperties(RetailscmUserContext userContext, String supplyOrderShipmentId,String id,String title,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfConsumerOrder(id);
		
		checkerOf(userContext).checkTitleOfConsumerOrder( title);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
		
	}
	public  SupplyOrderShipment updateConsumerOrderProperties(RetailscmUserContext userContext, String supplyOrderShipmentId, String id,String title, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingConsumerOrderProperties(userContext,supplyOrderShipmentId,id,title,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withConsumerOrderListList()
				.searchConsumerOrderListWith(ConsumerOrder.ID_PROPERTY, "is", id).done();
		
		SupplyOrderShipment supplyOrderShipmentToUpdate = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, options);
		
		if(supplyOrderShipmentToUpdate.getConsumerOrderList().isEmpty()){
			throw new SupplyOrderShipmentManagerException("ConsumerOrder is NOT FOUND with id: '"+id+"'");
		}
		
		ConsumerOrder item = supplyOrderShipmentToUpdate.getConsumerOrderList().first();
		
		item.updateTitle( title );

		
		//checkParamsForAddingConsumerOrder(userContext,supplyOrderShipmentId,name, code, used,tokensExpr);
		SupplyOrderShipment supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipmentToUpdate, tokens().withConsumerOrderList().done());
		synchronized(supplyOrderShipment){ 
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected ConsumerOrder createConsumerOrder(RetailscmUserContext userContext, String title, String consumerId, String confirmationId, String approvalId, String processingId, String deliveryId, String storeId) throws Exception{

		ConsumerOrder consumerOrder = new ConsumerOrder();
		
		
		consumerOrder.setTitle(title);		
		RetailStoreMember  consumer = new RetailStoreMember();
		consumer.setId(consumerId);		
		consumerOrder.setConsumer(consumer);		
		SupplyOrderConfirmation  confirmation = new SupplyOrderConfirmation();
		confirmation.setId(confirmationId);		
		consumerOrder.setConfirmation(confirmation);		
		SupplyOrderApproval  approval = new SupplyOrderApproval();
		approval.setId(approvalId);		
		consumerOrder.setApproval(approval);		
		SupplyOrderProcessing  processing = new SupplyOrderProcessing();
		processing.setId(processingId);		
		consumerOrder.setProcessing(processing);		
		SupplyOrderDelivery  delivery = new SupplyOrderDelivery();
		delivery.setId(deliveryId);		
		consumerOrder.setDelivery(delivery);		
		RetailStore  store = new RetailStore();
		store.setId(storeId);		
		consumerOrder.setStore(store);		
		consumerOrder.setLastUpdateTime(userContext.now());
	
		
		return consumerOrder;
	
		
	}
	
	protected ConsumerOrder createIndexedConsumerOrder(String id, int version){

		ConsumerOrder consumerOrder = new ConsumerOrder();
		consumerOrder.setId(id);
		consumerOrder.setVersion(version);
		return consumerOrder;			
		
	}
	
	protected void checkParamsForRemovingConsumerOrderList(RetailscmUserContext userContext, String supplyOrderShipmentId, 
			String consumerOrderIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		for(String consumerOrderIdItem: consumerOrderIds){
			userContext.getChecker().checkIdOfConsumerOrder(consumerOrderIdItem);
=======
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		for(String consumerOrderIdItem: consumerOrderIds){
			checkerOf(userContext).checkIdOfConsumerOrder(consumerOrderIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
		
	}
	public  SupplyOrderShipment removeConsumerOrderList(RetailscmUserContext userContext, String supplyOrderShipmentId, 
			String consumerOrderIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingConsumerOrderList(userContext, supplyOrderShipmentId,  consumerOrderIds, tokensExpr);
			
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
			synchronized(supplyOrderShipment){ 
				//Will be good when the supplyOrderShipment loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderShipmentDaoOf(userContext).planToRemoveConsumerOrderList(supplyOrderShipment, consumerOrderIds, allTokens());
				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
				deleteRelationListInGraph(userContext, supplyOrderShipment.getConsumerOrderList());
				return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String consumerOrderId, int consumerOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment( supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfConsumerOrder(consumerOrderId);
		checkerOf(userContext).checkVersionOfConsumerOrder(consumerOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	public  SupplyOrderShipment removeConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String consumerOrderId, int consumerOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingConsumerOrder(userContext,supplyOrderShipmentId, consumerOrderId, consumerOrderVersion,tokensExpr);
		
		ConsumerOrder consumerOrder = createIndexedConsumerOrder(consumerOrderId, consumerOrderVersion);
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrderShipment.removeConsumerOrder( consumerOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
			deleteRelationInGraph(userContext, consumerOrder);
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String consumerOrderId, int consumerOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment( supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfConsumerOrder(consumerOrderId);
		checkerOf(userContext).checkVersionOfConsumerOrder(consumerOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	public  SupplyOrderShipment copyConsumerOrderFrom(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String consumerOrderId, int consumerOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingConsumerOrder(userContext,supplyOrderShipmentId, consumerOrderId, consumerOrderVersion,tokensExpr);
		
		ConsumerOrder consumerOrder = createIndexedConsumerOrder(consumerOrderId, consumerOrderVersion);
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			consumerOrder.updateLastUpdateTime(userContext.now());
			
			supplyOrderShipment.copyConsumerOrderFrom( consumerOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
			
			userContext.getManagerGroup().getConsumerOrderManager().onNewInstanceCreated(userContext, (ConsumerOrder)supplyOrderShipment.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String consumerOrderId, int consumerOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfConsumerOrder(consumerOrderId);
		checkerOf(userContext).checkVersionOfConsumerOrder(consumerOrderVersion);
		

		if(ConsumerOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfConsumerOrder(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	
	public  SupplyOrderShipment updateConsumerOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String consumerOrderId, int consumerOrderVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingConsumerOrder(userContext, supplyOrderShipmentId, consumerOrderId, consumerOrderVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withConsumerOrderList().searchConsumerOrderListWith(ConsumerOrder.ID_PROPERTY, "eq", consumerOrderId).done();
		
		
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, loadTokens);
		
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrderShipment.removeConsumerOrder( consumerOrder );	
			//make changes to AcceleraterAccount.
			ConsumerOrder consumerOrderIndex = createIndexedConsumerOrder(consumerOrderId, consumerOrderVersion);
		
			ConsumerOrder consumerOrder = supplyOrderShipment.findTheConsumerOrder(consumerOrderIndex);
			if(consumerOrder == null){
				throw new SupplyOrderShipmentManagerException(consumerOrder+" is NOT FOUND" );
			}
			
			consumerOrder.changeProperty(property, newValueExpr);
			consumerOrder.updateLastUpdateTime(userContext.now());
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withConsumerOrderList().done());
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	protected void checkParamsForAddingSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);

		
		checkerOf(userContext).checkBuyerIdOfSupplyOrder(buyerId);
		
		checkerOf(userContext).checkSellerIdOfSupplyOrder(sellerId);
		
		checkerOf(userContext).checkTitleOfSupplyOrder(title);
		
		checkerOf(userContext).checkTotalAmountOfSupplyOrder(totalAmount);
		
		checkerOf(userContext).checkConfirmationIdOfSupplyOrder(confirmationId);
		
		checkerOf(userContext).checkApprovalIdOfSupplyOrder(approvalId);
		
		checkerOf(userContext).checkProcessingIdOfSupplyOrder(processingId);
		
		checkerOf(userContext).checkPickingIdOfSupplyOrder(pickingId);
		
		checkerOf(userContext).checkDeliveryIdOfSupplyOrder(deliveryId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);

	
	}
	public  SupplyOrderShipment addSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingSupplyOrder(userContext,supplyOrderShipmentId,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, processingId, pickingId, deliveryId,tokensExpr);
		
		SupplyOrder supplyOrder = createSupplyOrder(userContext,buyerId, sellerId, title, totalAmount, confirmationId, approvalId, processingId, pickingId, deliveryId);
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrderShipment.addSupplyOrder( supplyOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
			
			userContext.getManagerGroup().getSupplyOrderManager().onNewInstanceCreated(userContext, supplyOrder);
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingSupplyOrderProperties(RetailscmUserContext userContext, String supplyOrderShipmentId,String id,String title,BigDecimal totalAmount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfSupplyOrder(id);
		
		checkerOf(userContext).checkTitleOfSupplyOrder( title);
		checkerOf(userContext).checkTotalAmountOfSupplyOrder( totalAmount);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
		
	}
	public  SupplyOrderShipment updateSupplyOrderProperties(RetailscmUserContext userContext, String supplyOrderShipmentId, String id,String title,BigDecimal totalAmount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingSupplyOrderProperties(userContext,supplyOrderShipmentId,id,title,totalAmount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withSupplyOrderListList()
				.searchSupplyOrderListWith(SupplyOrder.ID_PROPERTY, "is", id).done();
		
		SupplyOrderShipment supplyOrderShipmentToUpdate = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, options);
		
		if(supplyOrderShipmentToUpdate.getSupplyOrderList().isEmpty()){
			throw new SupplyOrderShipmentManagerException("SupplyOrder is NOT FOUND with id: '"+id+"'");
		}
		
		SupplyOrder item = supplyOrderShipmentToUpdate.getSupplyOrderList().first();
		
		item.updateTitle( title );
		item.updateTotalAmount( totalAmount );

		
		//checkParamsForAddingSupplyOrder(userContext,supplyOrderShipmentId,name, code, used,tokensExpr);
		SupplyOrderShipment supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipmentToUpdate, tokens().withSupplyOrderList().done());
		synchronized(supplyOrderShipment){ 
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected SupplyOrder createSupplyOrder(RetailscmUserContext userContext, String buyerId, String sellerId, String title, BigDecimal totalAmount, String confirmationId, String approvalId, String processingId, String pickingId, String deliveryId) throws Exception{

		SupplyOrder supplyOrder = new SupplyOrder();
		
		
		RetailStoreCountryCenter  buyer = new RetailStoreCountryCenter();
		buyer.setId(buyerId);		
		supplyOrder.setBuyer(buyer);		
		GoodsSupplier  seller = new GoodsSupplier();
		seller.setId(sellerId);		
		supplyOrder.setSeller(seller);		
		supplyOrder.setTitle(title);		
		supplyOrder.setTotalAmount(totalAmount);		
		SupplyOrderConfirmation  confirmation = new SupplyOrderConfirmation();
		confirmation.setId(confirmationId);		
		supplyOrder.setConfirmation(confirmation);		
		SupplyOrderApproval  approval = new SupplyOrderApproval();
		approval.setId(approvalId);		
		supplyOrder.setApproval(approval);		
		SupplyOrderProcessing  processing = new SupplyOrderProcessing();
		processing.setId(processingId);		
		supplyOrder.setProcessing(processing);		
		SupplyOrderPicking  picking = new SupplyOrderPicking();
		picking.setId(pickingId);		
		supplyOrder.setPicking(picking);		
		SupplyOrderDelivery  delivery = new SupplyOrderDelivery();
		delivery.setId(deliveryId);		
		supplyOrder.setDelivery(delivery);		
		supplyOrder.setLastUpdateTime(userContext.now());
	
		
		return supplyOrder;
	
		
	}
	
	protected SupplyOrder createIndexedSupplyOrder(String id, int version){

		SupplyOrder supplyOrder = new SupplyOrder();
		supplyOrder.setId(id);
		supplyOrder.setVersion(version);
		return supplyOrder;			
		
	}
	
	protected void checkParamsForRemovingSupplyOrderList(RetailscmUserContext userContext, String supplyOrderShipmentId, 
			String supplyOrderIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		for(String supplyOrderIdItem: supplyOrderIds){
			userContext.getChecker().checkIdOfSupplyOrder(supplyOrderIdItem);
=======
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		for(String supplyOrderIdItem: supplyOrderIds){
			checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
		
	}
	public  SupplyOrderShipment removeSupplyOrderList(RetailscmUserContext userContext, String supplyOrderShipmentId, 
			String supplyOrderIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingSupplyOrderList(userContext, supplyOrderShipmentId,  supplyOrderIds, tokensExpr);
			
			
			SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
			synchronized(supplyOrderShipment){ 
				//Will be good when the supplyOrderShipment loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderShipmentDaoOf(userContext).planToRemoveSupplyOrderList(supplyOrderShipment, supplyOrderIds, allTokens());
				supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
				deleteRelationListInGraph(userContext, supplyOrderShipment.getSupplyOrderList());
				return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String supplyOrderId, int supplyOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment( supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkVersionOfSupplyOrder(supplyOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	public  SupplyOrderShipment removeSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String supplyOrderId, int supplyOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingSupplyOrder(userContext,supplyOrderShipmentId, supplyOrderId, supplyOrderVersion,tokensExpr);
		
		SupplyOrder supplyOrder = createIndexedSupplyOrder(supplyOrderId, supplyOrderVersion);
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrderShipment.removeSupplyOrder( supplyOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
			deleteRelationInGraph(userContext, supplyOrder);
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String supplyOrderId, int supplyOrderVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrderShipment( supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkVersionOfSupplyOrder(supplyOrderVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	public  SupplyOrderShipment copySupplyOrderFrom(RetailscmUserContext userContext, String supplyOrderShipmentId, 
		String supplyOrderId, int supplyOrderVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingSupplyOrder(userContext,supplyOrderShipmentId, supplyOrderId, supplyOrderVersion,tokensExpr);
		
		SupplyOrder supplyOrder = createIndexedSupplyOrder(supplyOrderId, supplyOrderVersion);
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, allTokens());
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			supplyOrder.updateLastUpdateTime(userContext.now());
			
			supplyOrderShipment.copySupplyOrderFrom( supplyOrder );		
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
			
			userContext.getManagerGroup().getSupplyOrderManager().onNewInstanceCreated(userContext, (SupplyOrder)supplyOrderShipment.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String supplyOrderId, int supplyOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrderShipment(supplyOrderShipmentId);
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkVersionOfSupplyOrder(supplyOrderVersion);
		

		if(SupplyOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfSupplyOrder(parseString(newValueExpr));
		}
		
		if(SupplyOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfSupplyOrder(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderShipmentManagerException.class);
	
	}
	
	public  SupplyOrderShipment updateSupplyOrder(RetailscmUserContext userContext, String supplyOrderShipmentId, String supplyOrderId, int supplyOrderVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingSupplyOrder(userContext, supplyOrderShipmentId, supplyOrderId, supplyOrderVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withSupplyOrderList().searchSupplyOrderListWith(SupplyOrder.ID_PROPERTY, "eq", supplyOrderId).done();
		
		
		
		SupplyOrderShipment supplyOrderShipment = loadSupplyOrderShipment(userContext, supplyOrderShipmentId, loadTokens);
		
		synchronized(supplyOrderShipment){ 
			//Will be good when the supplyOrderShipment loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrderShipment.removeSupplyOrder( supplyOrder );	
			//make changes to AcceleraterAccount.
			SupplyOrder supplyOrderIndex = createIndexedSupplyOrder(supplyOrderId, supplyOrderVersion);
		
			SupplyOrder supplyOrder = supplyOrderShipment.findTheSupplyOrder(supplyOrderIndex);
			if(supplyOrder == null){
				throw new SupplyOrderShipmentManagerException(supplyOrder+" is NOT FOUND" );
			}
			
			supplyOrder.changeProperty(property, newValueExpr);
			supplyOrder.updateLastUpdateTime(userContext.now());
			supplyOrderShipment = saveSupplyOrderShipment(userContext, supplyOrderShipment, tokens().withSupplyOrderList().done());
			return present(userContext,supplyOrderShipment, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, SupplyOrderShipment newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



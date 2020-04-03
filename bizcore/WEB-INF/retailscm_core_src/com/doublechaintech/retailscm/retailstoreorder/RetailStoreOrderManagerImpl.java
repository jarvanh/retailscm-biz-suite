
package com.doublechaintech.retailscm.retailstoreorder;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.goods.Goods;
import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.retailstoreordershippinggroup.RetailStoreOrderShippingGroup;
import com.doublechaintech.retailscm.retailstoreorderpaymentgroup.RetailStoreOrderPaymentGroup;
import com.doublechaintech.retailscm.retailstoreorderlineitem.RetailStoreOrderLineItem;

import com.doublechaintech.retailscm.retailstorecountrycenter.CandidateRetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstore.CandidateRetailStore;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.sku.Sku;
import com.doublechaintech.retailscm.receivingspace.ReceivingSpace;
import com.doublechaintech.retailscm.smartpallet.SmartPallet;
import com.doublechaintech.retailscm.shippingspace.ShippingSpace;
import com.doublechaintech.retailscm.transporttask.TransportTask;
import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;






public class RetailStoreOrderManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreOrderManager {

  


	private static final String SERVICE_TYPE = "RetailStoreOrder";
	@Override
	public RetailStoreOrderDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreOrderDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws RetailStoreOrderManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreOrderManagerException(message);

	}



 	protected RetailStoreOrder saveRetailStoreOrder(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreOrderDAO().save(retailStoreOrder, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreOrder(userContext, retailStoreOrder, tokens);
 	}
 	
 	protected RetailStoreOrder saveRetailStoreOrderDetail(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder) throws Exception{	

 		
 		return saveRetailStoreOrder(userContext, retailStoreOrder, allTokens());
 	}
 	
 	public RetailStoreOrder loadRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder( userContext, retailStoreOrderId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrder, tokens);
 	}
 	
 	
 	 public RetailStoreOrder searchRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder( userContext, retailStoreOrderId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreOrder, tokens);
 	}
 	
 	

 	protected RetailStoreOrder present(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreOrder,tokens);
		
		
		RetailStoreOrder  retailStoreOrderToPresent = retailStoreOrderDaoOf(userContext).present(retailStoreOrder, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreOrderToPresent.collectRefercencesFromLists();
		retailStoreOrderDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreOrderToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreOrder loadRetailStoreOrderDetail(RetailscmUserContext userContext, String retailStoreOrderId) throws Exception{	
 		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder( userContext, retailStoreOrderId, allTokens());
 		return present(userContext,retailStoreOrder, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreOrderId) throws Exception{	
 		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder( userContext, retailStoreOrderId, viewTokens());
 		return present(userContext,retailStoreOrder, allTokens());
		
 	}
 	protected RetailStoreOrder saveRetailStoreOrder(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, Map<String,Object>tokens) throws Exception{	
 		return retailStoreOrderDaoOf(userContext).save(retailStoreOrder, tokens);
 	}
 	protected RetailStoreOrder loadRetailStoreOrder(RetailscmUserContext userContext, String retailStoreOrderId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreOrderManagerException.class);

 
 		return retailStoreOrderDaoOf(userContext).load(retailStoreOrderId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreOrder, tokens);
		
		addAction(userContext, retailStoreOrder, tokens,"@create","createRetailStoreOrder","createRetailStoreOrder/","main","primary");
		addAction(userContext, retailStoreOrder, tokens,"@update","updateRetailStoreOrder","updateRetailStoreOrder/"+retailStoreOrder.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrder, tokens,"@copy","cloneRetailStoreOrder","cloneRetailStoreOrder/"+retailStoreOrder.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.transfer_to_buyer","transferToAnotherBuyer","transferToAnotherBuyer/"+retailStoreOrder.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.transfer_to_seller","transferToAnotherSeller","transferToAnotherSeller/"+retailStoreOrder.getId()+"/","main","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.addRetailStoreOrderLineItem","addRetailStoreOrderLineItem","addRetailStoreOrderLineItem/"+retailStoreOrder.getId()+"/","retailStoreOrderLineItemList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.removeRetailStoreOrderLineItem","removeRetailStoreOrderLineItem","removeRetailStoreOrderLineItem/"+retailStoreOrder.getId()+"/","retailStoreOrderLineItemList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.updateRetailStoreOrderLineItem","updateRetailStoreOrderLineItem","updateRetailStoreOrderLineItem/"+retailStoreOrder.getId()+"/","retailStoreOrderLineItemList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.copyRetailStoreOrderLineItemFrom","copyRetailStoreOrderLineItemFrom","copyRetailStoreOrderLineItemFrom/"+retailStoreOrder.getId()+"/","retailStoreOrderLineItemList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.addRetailStoreOrderShippingGroup","addRetailStoreOrderShippingGroup","addRetailStoreOrderShippingGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderShippingGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.removeRetailStoreOrderShippingGroup","removeRetailStoreOrderShippingGroup","removeRetailStoreOrderShippingGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderShippingGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.updateRetailStoreOrderShippingGroup","updateRetailStoreOrderShippingGroup","updateRetailStoreOrderShippingGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderShippingGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.copyRetailStoreOrderShippingGroupFrom","copyRetailStoreOrderShippingGroupFrom","copyRetailStoreOrderShippingGroupFrom/"+retailStoreOrder.getId()+"/","retailStoreOrderShippingGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.addRetailStoreOrderPaymentGroup","addRetailStoreOrderPaymentGroup","addRetailStoreOrderPaymentGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderPaymentGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.removeRetailStoreOrderPaymentGroup","removeRetailStoreOrderPaymentGroup","removeRetailStoreOrderPaymentGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderPaymentGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.updateRetailStoreOrderPaymentGroup","updateRetailStoreOrderPaymentGroup","updateRetailStoreOrderPaymentGroup/"+retailStoreOrder.getId()+"/","retailStoreOrderPaymentGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.copyRetailStoreOrderPaymentGroupFrom","copyRetailStoreOrderPaymentGroupFrom","copyRetailStoreOrderPaymentGroupFrom/"+retailStoreOrder.getId()+"/","retailStoreOrderPaymentGroupList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.addGoods","addGoods","addGoods/"+retailStoreOrder.getId()+"/","goodsList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.removeGoods","removeGoods","removeGoods/"+retailStoreOrder.getId()+"/","goodsList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.updateGoods","updateGoods","updateGoods/"+retailStoreOrder.getId()+"/","goodsList","primary");
		addAction(userContext, retailStoreOrder, tokens,"retail_store_order.copyGoodsFrom","copyGoodsFrom","copyGoodsFrom/"+retailStoreOrder.getId()+"/","goodsList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreOrder createRetailStoreOrder(RetailscmUserContext userContext, String buyerId,String sellerId,String title,BigDecimal totalAmount) throws Exception
	//public RetailStoreOrder createRetailStoreOrder(RetailscmUserContext userContext,String buyerId, String sellerId, String title, BigDecimal totalAmount) throws Exception
	{

		

		

		checkerOf(userContext).checkTitleOfRetailStoreOrder(title);
		checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(totalAmount);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


		RetailStoreOrder retailStoreOrder=createNewRetailStoreOrder();	

			
		RetailStore buyer = loadRetailStore(userContext, buyerId,emptyOptions());
		retailStoreOrder.setBuyer(buyer);
		
		
			
		RetailStoreCountryCenter seller = loadRetailStoreCountryCenter(userContext, sellerId,emptyOptions());
		retailStoreOrder.setSeller(seller);
		
		
		retailStoreOrder.setTitle(title);
		retailStoreOrder.setTotalAmount(totalAmount);
		retailStoreOrder.setLastUpdateTime(userContext.now());

		retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreOrder);
		return retailStoreOrder;


	}
	protected RetailStoreOrder createNewRetailStoreOrder()
	{

		return new RetailStoreOrder();
	}

	protected void checkParamsForUpdatingRetailStoreOrder(RetailscmUserContext userContext,String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkVersionOfRetailStoreOrder( retailStoreOrderVersion);
		
		

				

		
		if(RetailStoreOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfRetailStoreOrder(parseString(newValueExpr));
		}
		if(RetailStoreOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfRetailStoreOrder(parseBigDecimal(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


	}



	public RetailStoreOrder clone(RetailscmUserContext userContext, String fromRetailStoreOrderId) throws Exception{

		return retailStoreOrderDaoOf(userContext).clone(fromRetailStoreOrderId, this.allTokens());
	}

	public RetailStoreOrder internalSaveRetailStoreOrder(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder) throws Exception
	{
		return internalSaveRetailStoreOrder(userContext, retailStoreOrder, allTokens());

	}
	public RetailStoreOrder internalSaveRetailStoreOrder(RetailscmUserContext userContext, RetailStoreOrder retailStoreOrder, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr, tokensExpr);


		synchronized(retailStoreOrder){
			//will be good when the retailStoreOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrder.
			if (retailStoreOrder.isChanged()){
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			}
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, options);
			return retailStoreOrder;

		}

	}

	public RetailStoreOrder updateRetailStoreOrder(RetailscmUserContext userContext,String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr, tokensExpr);



		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		if(retailStoreOrder.getVersion() != retailStoreOrderVersion){
			String message = "The target version("+retailStoreOrder.getVersion()+") is not equals to version("+retailStoreOrderVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrder){
			//will be good when the retailStoreOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrder.
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			retailStoreOrder.changeProperty(property, newValueExpr);
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrder(userContext, retailStoreOrder, tokens().done());
		}

	}

	public RetailStoreOrder updateRetailStoreOrderProperty(RetailscmUserContext userContext,String retailStoreOrderId, int retailStoreOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreOrder(userContext, retailStoreOrderId, retailStoreOrderVersion, property, newValueExpr, tokensExpr);

		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		if(retailStoreOrder.getVersion() != retailStoreOrderVersion){
			String message = "The target version("+retailStoreOrder.getVersion()+") is not equals to version("+retailStoreOrderVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreOrder){
			//will be good when the retailStoreOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreOrder.

			retailStoreOrder.changeProperty(property, newValueExpr);
			retailStoreOrder.updateLastUpdateTime(userContext.now());
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			//return saveRetailStoreOrder(userContext, retailStoreOrder, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected RetailStoreOrderTokens tokens(){
		return RetailStoreOrderTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreOrderTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortRetailStoreOrderLineItemListWith("id","desc")
		.sortRetailStoreOrderShippingGroupListWith("id","desc")
		.sortRetailStoreOrderPaymentGroupListWith("id","desc")
		.sortGoodsListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreOrderTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherBuyer(RetailscmUserContext userContext, String retailStoreOrderId, String anotherBuyerId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
 		checkerOf(userContext).checkIdOfRetailStore(anotherBuyerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

 	}
 	public RetailStoreOrder transferToAnotherBuyer(RetailscmUserContext userContext, String retailStoreOrderId, String anotherBuyerId) throws Exception
 	{
 		checkParamsForTransferingAnotherBuyer(userContext, retailStoreOrderId,anotherBuyerId);
 
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());	
		synchronized(retailStoreOrder){
			//will be good when the retailStoreOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStore buyer = loadRetailStore(userContext, anotherBuyerId, emptyOptions());		
			retailStoreOrder.updateBuyer(buyer);		
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, emptyOptions());
			
			return present(userContext,retailStoreOrder, allTokens());
			
		}

 	}

	


	public CandidateRetailStore requestCandidateBuyer(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStore result = new CandidateRetailStore();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStore> candidateList = retailStoreDaoOf(userContext).requestCandidateRetailStoreForRetailStoreOrder(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherSeller(RetailscmUserContext userContext, String retailStoreOrderId, String anotherSellerId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
 		checkerOf(userContext).checkIdOfRetailStoreCountryCenter(anotherSellerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

 	}
 	public RetailStoreOrder transferToAnotherSeller(RetailscmUserContext userContext, String retailStoreOrderId, String anotherSellerId) throws Exception
 	{
 		checkParamsForTransferingAnotherSeller(userContext, retailStoreOrderId,anotherSellerId);
 
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());	
		synchronized(retailStoreOrder){
			//will be good when the retailStoreOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreCountryCenter seller = loadRetailStoreCountryCenter(userContext, anotherSellerId, emptyOptions());		
			retailStoreOrder.updateSeller(seller);		
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, emptyOptions());
			
			return present(userContext,retailStoreOrder, allTokens());
			
		}

 	}

	


	public CandidateRetailStoreCountryCenter requestCandidateSeller(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreCountryCenter result = new CandidateRetailStoreCountryCenter();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreCountryCenter> candidateList = retailStoreCountryCenterDaoOf(userContext).requestCandidateRetailStoreCountryCenterForRetailStoreOrder(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected RetailStore loadRetailStore(RetailscmUserContext userContext, String newBuyerId, Map<String,Object> options) throws Exception
 	{

 		return retailStoreDaoOf(userContext).load(newBuyerId, options);
 	}
 	


	

 	protected RetailStoreCountryCenter loadRetailStoreCountryCenter(RetailscmUserContext userContext, String newSellerId, Map<String,Object> options) throws Exception
 	{

 		return retailStoreCountryCenterDaoOf(userContext).load(newSellerId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreOrderId, int retailStoreOrderVersion) throws Exception {
		//deleteInternal(userContext, retailStoreOrderId, retailStoreOrderVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreOrderId, int retailStoreOrderVersion) throws Exception{

		retailStoreOrderDaoOf(userContext).delete(retailStoreOrderId, retailStoreOrderVersion);
	}

	public RetailStoreOrder forgetByAll(RetailscmUserContext userContext, String retailStoreOrderId, int retailStoreOrderVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreOrderId, retailStoreOrderVersion);
	}
	protected RetailStoreOrder forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreOrderId, int retailStoreOrderVersion) throws Exception{

		return retailStoreOrderDaoOf(userContext).disconnectFromAll(retailStoreOrderId, retailStoreOrderVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreOrderManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreOrderDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreOrder with sku_id in RetailStoreOrderLineItem
	protected RetailStoreOrder breakWithRetailStoreOrderLineItemBySkuId(RetailscmUserContext userContext, String retailStoreOrderId, String skuIdId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveRetailStoreOrderLineItemListWithSkuId(retailStoreOrder, skuIdId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with sku in Goods
	protected RetailStoreOrder breakWithGoodsBySku(RetailscmUserContext userContext, String retailStoreOrderId, String skuId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithSku(retailStoreOrder, skuId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with receiving_space in Goods
	protected RetailStoreOrder breakWithGoodsByReceivingSpace(RetailscmUserContext userContext, String retailStoreOrderId, String receivingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithReceivingSpace(retailStoreOrder, receivingSpaceId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with goods_allocation in Goods
	protected RetailStoreOrder breakWithGoodsByGoodsAllocation(RetailscmUserContext userContext, String retailStoreOrderId, String goodsAllocationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithGoodsAllocation(retailStoreOrder, goodsAllocationId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with smart_pallet in Goods
	protected RetailStoreOrder breakWithGoodsBySmartPallet(RetailscmUserContext userContext, String retailStoreOrderId, String smartPalletId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithSmartPallet(retailStoreOrder, smartPalletId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with shipping_space in Goods
	protected RetailStoreOrder breakWithGoodsByShippingSpace(RetailscmUserContext userContext, String retailStoreOrderId, String shippingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithShippingSpace(retailStoreOrder, shippingSpaceId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with transport_task in Goods
	protected RetailStoreOrder breakWithGoodsByTransportTask(RetailscmUserContext userContext, String retailStoreOrderId, String transportTaskId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithTransportTask(retailStoreOrder, transportTaskId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with retail_store in Goods
	protected RetailStoreOrder breakWithGoodsByRetailStore(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithRetailStore(retailStoreOrder, retailStoreId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}
	//disconnect RetailStoreOrder with biz_order in Goods
	protected RetailStoreOrder breakWithGoodsByBizOrder(RetailscmUserContext userContext, String retailStoreOrderId, String bizOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());

			synchronized(retailStoreOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreOrderDaoOf(userContext).planToRemoveGoodsListWithBizOrder(retailStoreOrder, bizOrderId, this.emptyOptions());

				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				return retailStoreOrder;
			}
	}






	protected void checkParamsForAddingRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);

		
		checkerOf(userContext).checkSkuIdOfRetailStoreOrderLineItem(skuId);
		
		checkerOf(userContext).checkSkuNameOfRetailStoreOrderLineItem(skuName);
		
		checkerOf(userContext).checkAmountOfRetailStoreOrderLineItem(amount);
		
		checkerOf(userContext).checkQuantityOfRetailStoreOrderLineItem(quantity);
		
		checkerOf(userContext).checkUnitOfMeasurementOfRetailStoreOrderLineItem(unitOfMeasurement);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


	}
	public  RetailStoreOrder addRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingRetailStoreOrderLineItem(userContext,retailStoreOrderId,skuId, skuName, amount, quantity, unitOfMeasurement,tokensExpr);

		RetailStoreOrderLineItem retailStoreOrderLineItem = createRetailStoreOrderLineItem(userContext,skuId, skuName, amount, quantity, unitOfMeasurement);

		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, emptyOptions());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.addRetailStoreOrderLineItem( retailStoreOrderLineItem );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderLineItemManager().onNewInstanceCreated(userContext, retailStoreOrderLineItem);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderLineItemProperties(RetailscmUserContext userContext, String retailStoreOrderId,String id,String skuId,String skuName,BigDecimal amount,int quantity,String unitOfMeasurement,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderLineItem(id);

		checkerOf(userContext).checkSkuIdOfRetailStoreOrderLineItem( skuId);
		checkerOf(userContext).checkSkuNameOfRetailStoreOrderLineItem( skuName);
		checkerOf(userContext).checkAmountOfRetailStoreOrderLineItem( amount);
		checkerOf(userContext).checkQuantityOfRetailStoreOrderLineItem( quantity);
		checkerOf(userContext).checkUnitOfMeasurementOfRetailStoreOrderLineItem( unitOfMeasurement);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder updateRetailStoreOrderLineItemProperties(RetailscmUserContext userContext, String retailStoreOrderId, String id,String skuId,String skuName,BigDecimal amount,int quantity,String unitOfMeasurement, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreOrderLineItemProperties(userContext,retailStoreOrderId,id,skuId,skuName,amount,quantity,unitOfMeasurement,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderLineItemListList()
				.searchRetailStoreOrderLineItemListWith(RetailStoreOrderLineItem.ID_PROPERTY, "is", id).done();

		RetailStoreOrder retailStoreOrderToUpdate = loadRetailStoreOrder(userContext, retailStoreOrderId, options);

		if(retailStoreOrderToUpdate.getRetailStoreOrderLineItemList().isEmpty()){
			throw new RetailStoreOrderManagerException("RetailStoreOrderLineItem is NOT FOUND with id: '"+id+"'");
		}

		RetailStoreOrderLineItem item = retailStoreOrderToUpdate.getRetailStoreOrderLineItemList().first();

		item.updateSkuId( skuId );
		item.updateSkuName( skuName );
		item.updateAmount( amount );
		item.updateQuantity( quantity );
		item.updateUnitOfMeasurement( unitOfMeasurement );


		//checkParamsForAddingRetailStoreOrderLineItem(userContext,retailStoreOrderId,name, code, used,tokensExpr);
		RetailStoreOrder retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrderToUpdate, tokens().withRetailStoreOrderLineItemList().done());
		synchronized(retailStoreOrder){
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected RetailStoreOrderLineItem createRetailStoreOrderLineItem(RetailscmUserContext userContext, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement) throws Exception{

		RetailStoreOrderLineItem retailStoreOrderLineItem = new RetailStoreOrderLineItem();
		
		
		retailStoreOrderLineItem.setSkuId(skuId);		
		retailStoreOrderLineItem.setSkuName(skuName);		
		retailStoreOrderLineItem.setAmount(amount);		
		retailStoreOrderLineItem.setQuantity(quantity);		
		retailStoreOrderLineItem.setUnitOfMeasurement(unitOfMeasurement);
	
		
		return retailStoreOrderLineItem;


	}

	protected RetailStoreOrderLineItem createIndexedRetailStoreOrderLineItem(String id, int version){

		RetailStoreOrderLineItem retailStoreOrderLineItem = new RetailStoreOrderLineItem();
		retailStoreOrderLineItem.setId(id);
		retailStoreOrderLineItem.setVersion(version);
		return retailStoreOrderLineItem;

	}

	protected void checkParamsForRemovingRetailStoreOrderLineItemList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderLineItemIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		for(String retailStoreOrderLineItemIdItem: retailStoreOrderLineItemIds){
			checkerOf(userContext).checkIdOfRetailStoreOrderLineItem(retailStoreOrderLineItemIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderLineItemList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderLineItemIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingRetailStoreOrderLineItemList(userContext, retailStoreOrderId,  retailStoreOrderLineItemIds, tokensExpr);


			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
			synchronized(retailStoreOrder){
				//Will be good when the retailStoreOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderDaoOf(userContext).planToRemoveRetailStoreOrderLineItemList(retailStoreOrder, retailStoreOrderLineItemIds, allTokens());
				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
				deleteRelationListInGraph(userContext, retailStoreOrder.getRetailStoreOrderLineItemList());
				return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderLineItem(retailStoreOrderLineItemId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderLineItem(retailStoreOrderLineItemVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingRetailStoreOrderLineItem(userContext,retailStoreOrderId, retailStoreOrderLineItemId, retailStoreOrderLineItemVersion,tokensExpr);

		RetailStoreOrderLineItem retailStoreOrderLineItem = createIndexedRetailStoreOrderLineItem(retailStoreOrderLineItemId, retailStoreOrderLineItemVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.removeRetailStoreOrderLineItem( retailStoreOrderLineItem );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
			deleteRelationInGraph(userContext, retailStoreOrderLineItem);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderLineItem(retailStoreOrderLineItemId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderLineItem(retailStoreOrderLineItemVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder copyRetailStoreOrderLineItemFrom(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingRetailStoreOrderLineItem(userContext,retailStoreOrderId, retailStoreOrderLineItemId, retailStoreOrderLineItemVersion,tokensExpr);

		RetailStoreOrderLineItem retailStoreOrderLineItem = createIndexedRetailStoreOrderLineItem(retailStoreOrderLineItemId, retailStoreOrderLineItemVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			retailStoreOrder.copyRetailStoreOrderLineItemFrom( retailStoreOrderLineItem );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderLineItemManager().onNewInstanceCreated(userContext, (RetailStoreOrderLineItem)retailStoreOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderLineItem(retailStoreOrderLineItemId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderLineItem(retailStoreOrderLineItemVersion);
		

		if(RetailStoreOrderLineItem.SKU_ID_PROPERTY.equals(property)){
			checkerOf(userContext).checkSkuIdOfRetailStoreOrderLineItem(parseString(newValueExpr));
		}
		
		if(RetailStoreOrderLineItem.SKU_NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkSkuNameOfRetailStoreOrderLineItem(parseString(newValueExpr));
		}
		
		if(RetailStoreOrderLineItem.AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAmountOfRetailStoreOrderLineItem(parseBigDecimal(newValueExpr));
		}
		
		if(RetailStoreOrderLineItem.QUANTITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkQuantityOfRetailStoreOrderLineItem(parseInt(newValueExpr));
		}
		
		if(RetailStoreOrderLineItem.UNIT_OF_MEASUREMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkUnitOfMeasurementOfRetailStoreOrderLineItem(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}

	public  RetailStoreOrder updateRetailStoreOrderLineItem(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderLineItemId, int retailStoreOrderLineItemVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingRetailStoreOrderLineItem(userContext, retailStoreOrderId, retailStoreOrderLineItemId, retailStoreOrderLineItemVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderLineItemList().searchRetailStoreOrderLineItemListWith(RetailStoreOrderLineItem.ID_PROPERTY, "eq", retailStoreOrderLineItemId).done();



		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, loadTokens);

		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrder.removeRetailStoreOrderLineItem( retailStoreOrderLineItem );
			//make changes to AcceleraterAccount.
			RetailStoreOrderLineItem retailStoreOrderLineItemIndex = createIndexedRetailStoreOrderLineItem(retailStoreOrderLineItemId, retailStoreOrderLineItemVersion);

			RetailStoreOrderLineItem retailStoreOrderLineItem = retailStoreOrder.findTheRetailStoreOrderLineItem(retailStoreOrderLineItemIndex);
			if(retailStoreOrderLineItem == null){
				throw new RetailStoreOrderManagerException(retailStoreOrderLineItem+" is NOT FOUND" );
			}

			retailStoreOrderLineItem.changeProperty(property, newValueExpr);
			
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderLineItemList().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId, String name, BigDecimal amount,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);

		
		checkerOf(userContext).checkNameOfRetailStoreOrderShippingGroup(name);
		
		checkerOf(userContext).checkAmountOfRetailStoreOrderShippingGroup(amount);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


	}
	public  RetailStoreOrder addRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId, String name, BigDecimal amount, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingRetailStoreOrderShippingGroup(userContext,retailStoreOrderId,name, amount,tokensExpr);

		RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = createRetailStoreOrderShippingGroup(userContext,name, amount);

		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, emptyOptions());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.addRetailStoreOrderShippingGroup( retailStoreOrderShippingGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderShippingGroupList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderShippingGroupManager().onNewInstanceCreated(userContext, retailStoreOrderShippingGroup);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderShippingGroupProperties(RetailscmUserContext userContext, String retailStoreOrderId,String id,String name,BigDecimal amount,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderShippingGroup(id);

		checkerOf(userContext).checkNameOfRetailStoreOrderShippingGroup( name);
		checkerOf(userContext).checkAmountOfRetailStoreOrderShippingGroup( amount);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder updateRetailStoreOrderShippingGroupProperties(RetailscmUserContext userContext, String retailStoreOrderId, String id,String name,BigDecimal amount, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreOrderShippingGroupProperties(userContext,retailStoreOrderId,id,name,amount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderShippingGroupListList()
				.searchRetailStoreOrderShippingGroupListWith(RetailStoreOrderShippingGroup.ID_PROPERTY, "is", id).done();

		RetailStoreOrder retailStoreOrderToUpdate = loadRetailStoreOrder(userContext, retailStoreOrderId, options);

		if(retailStoreOrderToUpdate.getRetailStoreOrderShippingGroupList().isEmpty()){
			throw new RetailStoreOrderManagerException("RetailStoreOrderShippingGroup is NOT FOUND with id: '"+id+"'");
		}

		RetailStoreOrderShippingGroup item = retailStoreOrderToUpdate.getRetailStoreOrderShippingGroupList().first();

		item.updateName( name );
		item.updateAmount( amount );


		//checkParamsForAddingRetailStoreOrderShippingGroup(userContext,retailStoreOrderId,name, code, used,tokensExpr);
		RetailStoreOrder retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrderToUpdate, tokens().withRetailStoreOrderShippingGroupList().done());
		synchronized(retailStoreOrder){
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected RetailStoreOrderShippingGroup createRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String name, BigDecimal amount) throws Exception{

		RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = new RetailStoreOrderShippingGroup();
		
		
		retailStoreOrderShippingGroup.setName(name);		
		retailStoreOrderShippingGroup.setAmount(amount);
	
		
		return retailStoreOrderShippingGroup;


	}

	protected RetailStoreOrderShippingGroup createIndexedRetailStoreOrderShippingGroup(String id, int version){

		RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = new RetailStoreOrderShippingGroup();
		retailStoreOrderShippingGroup.setId(id);
		retailStoreOrderShippingGroup.setVersion(version);
		return retailStoreOrderShippingGroup;

	}

	protected void checkParamsForRemovingRetailStoreOrderShippingGroupList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderShippingGroupIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		for(String retailStoreOrderShippingGroupIdItem: retailStoreOrderShippingGroupIds){
			checkerOf(userContext).checkIdOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderShippingGroupList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderShippingGroupIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingRetailStoreOrderShippingGroupList(userContext, retailStoreOrderId,  retailStoreOrderShippingGroupIds, tokensExpr);


			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
			synchronized(retailStoreOrder){
				//Will be good when the retailStoreOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderDaoOf(userContext).planToRemoveRetailStoreOrderShippingGroupList(retailStoreOrder, retailStoreOrderShippingGroupIds, allTokens());
				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderShippingGroupList().done());
				deleteRelationListInGraph(userContext, retailStoreOrder.getRetailStoreOrderShippingGroupList());
				return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingRetailStoreOrderShippingGroup(userContext,retailStoreOrderId, retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion,tokensExpr);

		RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = createIndexedRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.removeRetailStoreOrderShippingGroup( retailStoreOrderShippingGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderShippingGroupList().done());
			deleteRelationInGraph(userContext, retailStoreOrderShippingGroup);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder copyRetailStoreOrderShippingGroupFrom(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingRetailStoreOrderShippingGroup(userContext,retailStoreOrderId, retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion,tokensExpr);

		RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = createIndexedRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			retailStoreOrder.copyRetailStoreOrderShippingGroupFrom( retailStoreOrderShippingGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderShippingGroupList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderShippingGroupManager().onNewInstanceCreated(userContext, (RetailStoreOrderShippingGroup)retailStoreOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupVersion);
		

		if(RetailStoreOrderShippingGroup.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStoreOrderShippingGroup(parseString(newValueExpr));
		}
		
		if(RetailStoreOrderShippingGroup.AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAmountOfRetailStoreOrderShippingGroup(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}

	public  RetailStoreOrder updateRetailStoreOrderShippingGroup(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderShippingGroupId, int retailStoreOrderShippingGroupVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingRetailStoreOrderShippingGroup(userContext, retailStoreOrderId, retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderShippingGroupList().searchRetailStoreOrderShippingGroupListWith(RetailStoreOrderShippingGroup.ID_PROPERTY, "eq", retailStoreOrderShippingGroupId).done();



		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, loadTokens);

		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrder.removeRetailStoreOrderShippingGroup( retailStoreOrderShippingGroup );
			//make changes to AcceleraterAccount.
			RetailStoreOrderShippingGroup retailStoreOrderShippingGroupIndex = createIndexedRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupId, retailStoreOrderShippingGroupVersion);

			RetailStoreOrderShippingGroup retailStoreOrderShippingGroup = retailStoreOrder.findTheRetailStoreOrderShippingGroup(retailStoreOrderShippingGroupIndex);
			if(retailStoreOrderShippingGroup == null){
				throw new RetailStoreOrderManagerException(retailStoreOrderShippingGroup+" is NOT FOUND" );
			}

			retailStoreOrderShippingGroup.changeProperty(property, newValueExpr);
			
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderShippingGroupList().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId, String name, String cardNumber,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);

		
		checkerOf(userContext).checkNameOfRetailStoreOrderPaymentGroup(name);
		
		checkerOf(userContext).checkCardNumberOfRetailStoreOrderPaymentGroup(cardNumber);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


	}
	public  RetailStoreOrder addRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId, String name, String cardNumber, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingRetailStoreOrderPaymentGroup(userContext,retailStoreOrderId,name, cardNumber,tokensExpr);

		RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = createRetailStoreOrderPaymentGroup(userContext,name, cardNumber);

		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, emptyOptions());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.addRetailStoreOrderPaymentGroup( retailStoreOrderPaymentGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderPaymentGroupList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderPaymentGroupManager().onNewInstanceCreated(userContext, retailStoreOrderPaymentGroup);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreOrderPaymentGroupProperties(RetailscmUserContext userContext, String retailStoreOrderId,String id,String name,String cardNumber,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderPaymentGroup(id);

		checkerOf(userContext).checkNameOfRetailStoreOrderPaymentGroup( name);
		checkerOf(userContext).checkCardNumberOfRetailStoreOrderPaymentGroup( cardNumber);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder updateRetailStoreOrderPaymentGroupProperties(RetailscmUserContext userContext, String retailStoreOrderId, String id,String name,String cardNumber, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreOrderPaymentGroupProperties(userContext,retailStoreOrderId,id,name,cardNumber,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreOrderPaymentGroupListList()
				.searchRetailStoreOrderPaymentGroupListWith(RetailStoreOrderPaymentGroup.ID_PROPERTY, "is", id).done();

		RetailStoreOrder retailStoreOrderToUpdate = loadRetailStoreOrder(userContext, retailStoreOrderId, options);

		if(retailStoreOrderToUpdate.getRetailStoreOrderPaymentGroupList().isEmpty()){
			throw new RetailStoreOrderManagerException("RetailStoreOrderPaymentGroup is NOT FOUND with id: '"+id+"'");
		}

		RetailStoreOrderPaymentGroup item = retailStoreOrderToUpdate.getRetailStoreOrderPaymentGroupList().first();

		item.updateName( name );
		item.updateCardNumber( cardNumber );


		//checkParamsForAddingRetailStoreOrderPaymentGroup(userContext,retailStoreOrderId,name, code, used,tokensExpr);
		RetailStoreOrder retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrderToUpdate, tokens().withRetailStoreOrderPaymentGroupList().done());
		synchronized(retailStoreOrder){
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected RetailStoreOrderPaymentGroup createRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String name, String cardNumber) throws Exception{

		RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = new RetailStoreOrderPaymentGroup();
		
		
		retailStoreOrderPaymentGroup.setName(name);		
		retailStoreOrderPaymentGroup.setCardNumber(cardNumber);
	
		
		return retailStoreOrderPaymentGroup;


	}

	protected RetailStoreOrderPaymentGroup createIndexedRetailStoreOrderPaymentGroup(String id, int version){

		RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = new RetailStoreOrderPaymentGroup();
		retailStoreOrderPaymentGroup.setId(id);
		retailStoreOrderPaymentGroup.setVersion(version);
		return retailStoreOrderPaymentGroup;

	}

	protected void checkParamsForRemovingRetailStoreOrderPaymentGroupList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderPaymentGroupIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		for(String retailStoreOrderPaymentGroupIdItem: retailStoreOrderPaymentGroupIds){
			checkerOf(userContext).checkIdOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderPaymentGroupList(RetailscmUserContext userContext, String retailStoreOrderId,
			String retailStoreOrderPaymentGroupIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingRetailStoreOrderPaymentGroupList(userContext, retailStoreOrderId,  retailStoreOrderPaymentGroupIds, tokensExpr);


			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
			synchronized(retailStoreOrder){
				//Will be good when the retailStoreOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderDaoOf(userContext).planToRemoveRetailStoreOrderPaymentGroupList(retailStoreOrder, retailStoreOrderPaymentGroupIds, allTokens());
				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderPaymentGroupList().done());
				deleteRelationListInGraph(userContext, retailStoreOrder.getRetailStoreOrderPaymentGroupList());
				return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingRetailStoreOrderPaymentGroup(userContext,retailStoreOrderId, retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion,tokensExpr);

		RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = createIndexedRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.removeRetailStoreOrderPaymentGroup( retailStoreOrderPaymentGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderPaymentGroupList().done());
			deleteRelationInGraph(userContext, retailStoreOrderPaymentGroup);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder copyRetailStoreOrderPaymentGroupFrom(RetailscmUserContext userContext, String retailStoreOrderId,
		String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingRetailStoreOrderPaymentGroup(userContext,retailStoreOrderId, retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion,tokensExpr);

		RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = createIndexedRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			retailStoreOrder.copyRetailStoreOrderPaymentGroupFrom( retailStoreOrderPaymentGroup );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderPaymentGroupList().done());
			
			userContext.getManagerGroup().getRetailStoreOrderPaymentGroupManager().onNewInstanceCreated(userContext, (RetailStoreOrderPaymentGroup)retailStoreOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupVersion);
		

		if(RetailStoreOrderPaymentGroup.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStoreOrderPaymentGroup(parseString(newValueExpr));
		}
		
		if(RetailStoreOrderPaymentGroup.CARD_NUMBER_PROPERTY.equals(property)){
			checkerOf(userContext).checkCardNumberOfRetailStoreOrderPaymentGroup(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}

	public  RetailStoreOrder updateRetailStoreOrderPaymentGroup(RetailscmUserContext userContext, String retailStoreOrderId, String retailStoreOrderPaymentGroupId, int retailStoreOrderPaymentGroupVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingRetailStoreOrderPaymentGroup(userContext, retailStoreOrderId, retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withRetailStoreOrderPaymentGroupList().searchRetailStoreOrderPaymentGroupListWith(RetailStoreOrderPaymentGroup.ID_PROPERTY, "eq", retailStoreOrderPaymentGroupId).done();



		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, loadTokens);

		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrder.removeRetailStoreOrderPaymentGroup( retailStoreOrderPaymentGroup );
			//make changes to AcceleraterAccount.
			RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroupIndex = createIndexedRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupId, retailStoreOrderPaymentGroupVersion);

			RetailStoreOrderPaymentGroup retailStoreOrderPaymentGroup = retailStoreOrder.findTheRetailStoreOrderPaymentGroup(retailStoreOrderPaymentGroupIndex);
			if(retailStoreOrderPaymentGroup == null){
				throw new RetailStoreOrderManagerException(retailStoreOrderPaymentGroup+" is NOT FOUND" );
			}

			retailStoreOrderPaymentGroup.changeProperty(property, newValueExpr);
			
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withRetailStoreOrderPaymentGroupList().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingGoods(RetailscmUserContext userContext, String retailStoreOrderId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);

		
		checkerOf(userContext).checkNameOfGoods(name);
		
		checkerOf(userContext).checkRfidOfGoods(rfid);
		
		checkerOf(userContext).checkUomOfGoods(uom);
		
		checkerOf(userContext).checkMaxPackageOfGoods(maxPackage);
		
		checkerOf(userContext).checkExpireTimeOfGoods(expireTime);
		
		checkerOf(userContext).checkSkuIdOfGoods(skuId);
		
		checkerOf(userContext).checkReceivingSpaceIdOfGoods(receivingSpaceId);
		
		checkerOf(userContext).checkGoodsAllocationIdOfGoods(goodsAllocationId);
		
		checkerOf(userContext).checkSmartPalletIdOfGoods(smartPalletId);
		
		checkerOf(userContext).checkShippingSpaceIdOfGoods(shippingSpaceId);
		
		checkerOf(userContext).checkTransportTaskIdOfGoods(transportTaskId);
		
		checkerOf(userContext).checkRetailStoreIdOfGoods(retailStoreId);
		
		checkerOf(userContext).checkBizOrderIdOfGoods(bizOrderId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);


	}
	public  RetailStoreOrder addGoods(RetailscmUserContext userContext, String retailStoreOrderId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoods(userContext,retailStoreOrderId,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, bizOrderId,tokensExpr);

		Goods goods = createGoods(userContext,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, bizOrderId);

		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, emptyOptions());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.addGoods( goods );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, goods);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsProperties(RetailscmUserContext userContext, String retailStoreOrderId,String id,String name,String rfid,String uom,int maxPackage,Date expireTime,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfGoods(id);

		checkerOf(userContext).checkNameOfGoods( name);
		checkerOf(userContext).checkRfidOfGoods( rfid);
		checkerOf(userContext).checkUomOfGoods( uom);
		checkerOf(userContext).checkMaxPackageOfGoods( maxPackage);
		checkerOf(userContext).checkExpireTimeOfGoods( expireTime);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder updateGoodsProperties(RetailscmUserContext userContext, String retailStoreOrderId, String id,String name,String rfid,String uom,int maxPackage,Date expireTime, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsProperties(userContext,retailStoreOrderId,id,name,rfid,uom,maxPackage,expireTime,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsListList()
				.searchGoodsListWith(Goods.ID_PROPERTY, "is", id).done();

		RetailStoreOrder retailStoreOrderToUpdate = loadRetailStoreOrder(userContext, retailStoreOrderId, options);

		if(retailStoreOrderToUpdate.getGoodsList().isEmpty()){
			throw new RetailStoreOrderManagerException("Goods is NOT FOUND with id: '"+id+"'");
		}

		Goods item = retailStoreOrderToUpdate.getGoodsList().first();

		item.updateName( name );
		item.updateRfid( rfid );
		item.updateUom( uom );
		item.updateMaxPackage( maxPackage );
		item.updateExpireTime( expireTime );


		//checkParamsForAddingGoods(userContext,retailStoreOrderId,name, code, used,tokensExpr);
		RetailStoreOrder retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrderToUpdate, tokens().withGoodsList().done());
		synchronized(retailStoreOrder){
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected Goods createGoods(RetailscmUserContext userContext, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId) throws Exception{

		Goods goods = new Goods();
		
		
		goods.setName(name);		
		goods.setRfid(rfid);		
		goods.setUom(uom);		
		goods.setMaxPackage(maxPackage);		
		goods.setExpireTime(expireTime);		
		Sku  sku = new Sku();
		sku.setId(skuId);		
		goods.setSku(sku);		
		ReceivingSpace  receivingSpace = new ReceivingSpace();
		receivingSpace.setId(receivingSpaceId);		
		goods.setReceivingSpace(receivingSpace);		
		GoodsAllocation  goodsAllocation = new GoodsAllocation();
		goodsAllocation.setId(goodsAllocationId);		
		goods.setGoodsAllocation(goodsAllocation);		
		SmartPallet  smartPallet = new SmartPallet();
		smartPallet.setId(smartPalletId);		
		goods.setSmartPallet(smartPallet);		
		ShippingSpace  shippingSpace = new ShippingSpace();
		shippingSpace.setId(shippingSpaceId);		
		goods.setShippingSpace(shippingSpace);		
		TransportTask  transportTask = new TransportTask();
		transportTask.setId(transportTaskId);		
		goods.setTransportTask(transportTask);		
		RetailStore  retailStore = new RetailStore();
		retailStore.setId(retailStoreId);		
		goods.setRetailStore(retailStore);		
		SupplyOrder  bizOrder = new SupplyOrder();
		bizOrder.setId(bizOrderId);		
		goods.setBizOrder(bizOrder);
	
		
		return goods;


	}

	protected Goods createIndexedGoods(String id, int version){

		Goods goods = new Goods();
		goods.setId(id);
		goods.setVersion(version);
		return goods;

	}

	protected void checkParamsForRemovingGoodsList(RetailscmUserContext userContext, String retailStoreOrderId,
			String goodsIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		for(String goodsIdItem: goodsIds){
			checkerOf(userContext).checkIdOfGoods(goodsIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeGoodsList(RetailscmUserContext userContext, String retailStoreOrderId,
			String goodsIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsList(userContext, retailStoreOrderId,  goodsIds, tokensExpr);


			RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
			synchronized(retailStoreOrder){
				//Will be good when the retailStoreOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreOrderDaoOf(userContext).planToRemoveGoodsList(retailStoreOrder, goodsIds, allTokens());
				retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
				deleteRelationListInGraph(userContext, retailStoreOrder.getGoodsList());
				return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoods(RetailscmUserContext userContext, String retailStoreOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder removeGoods(RetailscmUserContext userContext, String retailStoreOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoods(userContext,retailStoreOrderId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreOrder.removeGoods( goods );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
			deleteRelationInGraph(userContext, goods);
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoods(RetailscmUserContext userContext, String retailStoreOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreOrder( retailStoreOrderId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}
	public  RetailStoreOrder copyGoodsFrom(RetailscmUserContext userContext, String retailStoreOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoods(userContext,retailStoreOrderId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, allTokens());
		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			retailStoreOrder.copyGoodsFrom( goods );
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, (Goods)retailStoreOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoods(RetailscmUserContext userContext, String retailStoreOrderId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreOrder(retailStoreOrderId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		

		if(Goods.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfGoods(parseString(newValueExpr));
		}
		
		if(Goods.RFID_PROPERTY.equals(property)){
			checkerOf(userContext).checkRfidOfGoods(parseString(newValueExpr));
		}
		
		if(Goods.UOM_PROPERTY.equals(property)){
			checkerOf(userContext).checkUomOfGoods(parseString(newValueExpr));
		}
		
		if(Goods.MAX_PACKAGE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMaxPackageOfGoods(parseInt(newValueExpr));
		}
		
		if(Goods.EXPIRE_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkExpireTimeOfGoods(parseDate(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreOrderManagerException.class);

	}

	public  RetailStoreOrder updateGoods(RetailscmUserContext userContext, String retailStoreOrderId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoods(userContext, retailStoreOrderId, goodsId, goodsVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsList().searchGoodsListWith(Goods.ID_PROPERTY, "eq", goodsId).done();



		RetailStoreOrder retailStoreOrder = loadRetailStoreOrder(userContext, retailStoreOrderId, loadTokens);

		synchronized(retailStoreOrder){
			//Will be good when the retailStoreOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreOrder.removeGoods( goods );
			//make changes to AcceleraterAccount.
			Goods goodsIndex = createIndexedGoods(goodsId, goodsVersion);

			Goods goods = retailStoreOrder.findTheGoods(goodsIndex);
			if(goods == null){
				throw new RetailStoreOrderManagerException(goods+" is NOT FOUND" );
			}

			goods.changeProperty(property, newValueExpr);
			
			retailStoreOrder = saveRetailStoreOrder(userContext, retailStoreOrder, tokens().withGoodsList().done());
			return present(userContext,retailStoreOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreOrder newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}




package com.doublechaintech.retailscm.supplyorder;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.supplyorderpaymentgroup.SupplyOrderPaymentGroup;
import com.doublechaintech.retailscm.goods.Goods;
import com.doublechaintech.retailscm.supplyorderlineitem.SupplyOrderLineItem;
import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.goodssupplier.GoodsSupplier;
import com.doublechaintech.retailscm.supplyordershippinggroup.SupplyOrderShippingGroup;

import com.doublechaintech.retailscm.retailstorecountrycenter.CandidateRetailStoreCountryCenter;
import com.doublechaintech.retailscm.goodssupplier.CandidateGoodsSupplier;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.sku.Sku;
import com.doublechaintech.retailscm.receivingspace.ReceivingSpace;
import com.doublechaintech.retailscm.smartpallet.SmartPallet;
import com.doublechaintech.retailscm.shippingspace.ShippingSpace;
import com.doublechaintech.retailscm.transporttask.TransportTask;
import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;






public class SupplyOrderManagerImpl extends CustomRetailscmCheckerManager implements SupplyOrderManager {

  


	private static final String SERVICE_TYPE = "SupplyOrder";
	@Override
	public SupplyOrderDAO daoOf(RetailscmUserContext userContext) {
		return supplyOrderDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws SupplyOrderManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new SupplyOrderManagerException(message);

	}



 	protected SupplyOrder saveSupplyOrder(RetailscmUserContext userContext, SupplyOrder supplyOrder, String [] tokensExpr) throws Exception{	
 		//return getSupplyOrderDAO().save(supplyOrder, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveSupplyOrder(userContext, supplyOrder, tokens);
 	}
 	
 	protected SupplyOrder saveSupplyOrderDetail(RetailscmUserContext userContext, SupplyOrder supplyOrder) throws Exception{	

 		
 		return saveSupplyOrder(userContext, supplyOrder, allTokens());
 	}
 	
 	public SupplyOrder loadSupplyOrder(RetailscmUserContext userContext, String supplyOrderId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		SupplyOrder supplyOrder = loadSupplyOrder( userContext, supplyOrderId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,supplyOrder, tokens);
 	}
 	
 	
 	 public SupplyOrder searchSupplyOrder(RetailscmUserContext userContext, String supplyOrderId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		SupplyOrder supplyOrder = loadSupplyOrder( userContext, supplyOrderId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,supplyOrder, tokens);
 	}
 	
 	

 	protected SupplyOrder present(RetailscmUserContext userContext, SupplyOrder supplyOrder, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,supplyOrder,tokens);
		
		
		SupplyOrder  supplyOrderToPresent = supplyOrderDaoOf(userContext).present(supplyOrder, tokens);
		
		List<BaseEntity> entityListToNaming = supplyOrderToPresent.collectRefercencesFromLists();
		supplyOrderDaoOf(userContext).alias(entityListToNaming);
		
		return  supplyOrderToPresent;
		
		
	}
 
 	
 	
 	public SupplyOrder loadSupplyOrderDetail(RetailscmUserContext userContext, String supplyOrderId) throws Exception{	
 		SupplyOrder supplyOrder = loadSupplyOrder( userContext, supplyOrderId, allTokens());
 		return present(userContext,supplyOrder, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String supplyOrderId) throws Exception{	
 		SupplyOrder supplyOrder = loadSupplyOrder( userContext, supplyOrderId, viewTokens());
 		return present(userContext,supplyOrder, allTokens());
		
 	}
 	protected SupplyOrder saveSupplyOrder(RetailscmUserContext userContext, SupplyOrder supplyOrder, Map<String,Object>tokens) throws Exception{	
 		return supplyOrderDaoOf(userContext).save(supplyOrder, tokens);
 	}
 	protected SupplyOrder loadSupplyOrder(RetailscmUserContext userContext, String supplyOrderId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).throwExceptionIfHasErrors( SupplyOrderManagerException.class);

 
 		return supplyOrderDaoOf(userContext).load(supplyOrderId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, SupplyOrder supplyOrder, Map<String, Object> tokens){
		super.addActions(userContext, supplyOrder, tokens);
		
		addAction(userContext, supplyOrder, tokens,"@create","createSupplyOrder","createSupplyOrder/","main","primary");
		addAction(userContext, supplyOrder, tokens,"@update","updateSupplyOrder","updateSupplyOrder/"+supplyOrder.getId()+"/","main","primary");
		addAction(userContext, supplyOrder, tokens,"@copy","cloneSupplyOrder","cloneSupplyOrder/"+supplyOrder.getId()+"/","main","primary");
		
		addAction(userContext, supplyOrder, tokens,"supply_order.transfer_to_buyer","transferToAnotherBuyer","transferToAnotherBuyer/"+supplyOrder.getId()+"/","main","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.transfer_to_seller","transferToAnotherSeller","transferToAnotherSeller/"+supplyOrder.getId()+"/","main","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.addSupplyOrderLineItem","addSupplyOrderLineItem","addSupplyOrderLineItem/"+supplyOrder.getId()+"/","supplyOrderLineItemList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.removeSupplyOrderLineItem","removeSupplyOrderLineItem","removeSupplyOrderLineItem/"+supplyOrder.getId()+"/","supplyOrderLineItemList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.updateSupplyOrderLineItem","updateSupplyOrderLineItem","updateSupplyOrderLineItem/"+supplyOrder.getId()+"/","supplyOrderLineItemList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.copySupplyOrderLineItemFrom","copySupplyOrderLineItemFrom","copySupplyOrderLineItemFrom/"+supplyOrder.getId()+"/","supplyOrderLineItemList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.addSupplyOrderShippingGroup","addSupplyOrderShippingGroup","addSupplyOrderShippingGroup/"+supplyOrder.getId()+"/","supplyOrderShippingGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.removeSupplyOrderShippingGroup","removeSupplyOrderShippingGroup","removeSupplyOrderShippingGroup/"+supplyOrder.getId()+"/","supplyOrderShippingGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.updateSupplyOrderShippingGroup","updateSupplyOrderShippingGroup","updateSupplyOrderShippingGroup/"+supplyOrder.getId()+"/","supplyOrderShippingGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.copySupplyOrderShippingGroupFrom","copySupplyOrderShippingGroupFrom","copySupplyOrderShippingGroupFrom/"+supplyOrder.getId()+"/","supplyOrderShippingGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.addSupplyOrderPaymentGroup","addSupplyOrderPaymentGroup","addSupplyOrderPaymentGroup/"+supplyOrder.getId()+"/","supplyOrderPaymentGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.removeSupplyOrderPaymentGroup","removeSupplyOrderPaymentGroup","removeSupplyOrderPaymentGroup/"+supplyOrder.getId()+"/","supplyOrderPaymentGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.updateSupplyOrderPaymentGroup","updateSupplyOrderPaymentGroup","updateSupplyOrderPaymentGroup/"+supplyOrder.getId()+"/","supplyOrderPaymentGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.copySupplyOrderPaymentGroupFrom","copySupplyOrderPaymentGroupFrom","copySupplyOrderPaymentGroupFrom/"+supplyOrder.getId()+"/","supplyOrderPaymentGroupList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.addGoods","addGoods","addGoods/"+supplyOrder.getId()+"/","goodsList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.removeGoods","removeGoods","removeGoods/"+supplyOrder.getId()+"/","goodsList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.updateGoods","updateGoods","updateGoods/"+supplyOrder.getId()+"/","goodsList","primary");
		addAction(userContext, supplyOrder, tokens,"supply_order.copyGoodsFrom","copyGoodsFrom","copyGoodsFrom/"+supplyOrder.getId()+"/","goodsList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, SupplyOrder supplyOrder, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public SupplyOrder createSupplyOrder(RetailscmUserContext userContext, String buyerId,String sellerId,String title,BigDecimal totalAmount) throws Exception
	//public SupplyOrder createSupplyOrder(RetailscmUserContext userContext,String buyerId, String sellerId, String title, BigDecimal totalAmount) throws Exception
	{

		

		

		checkerOf(userContext).checkTitleOfSupplyOrder(title);
		checkerOf(userContext).checkTotalAmountOfSupplyOrder(totalAmount);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


		SupplyOrder supplyOrder=createNewSupplyOrder();	

			
		RetailStoreCountryCenter buyer = loadRetailStoreCountryCenter(userContext, buyerId,emptyOptions());
		supplyOrder.setBuyer(buyer);
		
		
			
		GoodsSupplier seller = loadGoodsSupplier(userContext, sellerId,emptyOptions());
		supplyOrder.setSeller(seller);
		
		
		supplyOrder.setTitle(title);
		supplyOrder.setTotalAmount(totalAmount);
		supplyOrder.setLastUpdateTime(userContext.now());

		supplyOrder = saveSupplyOrder(userContext, supplyOrder, emptyOptions());
		
		onNewInstanceCreated(userContext, supplyOrder);
		return supplyOrder;


	}
	protected SupplyOrder createNewSupplyOrder()
	{

		return new SupplyOrder();
	}

	protected void checkParamsForUpdatingSupplyOrder(RetailscmUserContext userContext,String supplyOrderId, int supplyOrderVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkVersionOfSupplyOrder( supplyOrderVersion);
		
		

				

		
		if(SupplyOrder.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfSupplyOrder(parseString(newValueExpr));
		}
		if(SupplyOrder.TOTAL_AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAmountOfSupplyOrder(parseBigDecimal(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


	}



	public SupplyOrder clone(RetailscmUserContext userContext, String fromSupplyOrderId) throws Exception{

		return supplyOrderDaoOf(userContext).clone(fromSupplyOrderId, this.allTokens());
	}

	public SupplyOrder internalSaveSupplyOrder(RetailscmUserContext userContext, SupplyOrder supplyOrder) throws Exception
	{
		return internalSaveSupplyOrder(userContext, supplyOrder, allTokens());

	}
	public SupplyOrder internalSaveSupplyOrder(RetailscmUserContext userContext, SupplyOrder supplyOrder, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingSupplyOrder(userContext, supplyOrderId, supplyOrderVersion, property, newValueExpr, tokensExpr);


		synchronized(supplyOrder){
			//will be good when the supplyOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrder.
			if (supplyOrder.isChanged()){
			supplyOrder.updateLastUpdateTime(userContext.now());
			}
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, options);
			return supplyOrder;

		}

	}

	public SupplyOrder updateSupplyOrder(RetailscmUserContext userContext,String supplyOrderId, int supplyOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSupplyOrder(userContext, supplyOrderId, supplyOrderVersion, property, newValueExpr, tokensExpr);



		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		if(supplyOrder.getVersion() != supplyOrderVersion){
			String message = "The target version("+supplyOrder.getVersion()+") is not equals to version("+supplyOrderVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(supplyOrder){
			//will be good when the supplyOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrder.
			supplyOrder.updateLastUpdateTime(userContext.now());
			supplyOrder.changeProperty(property, newValueExpr);
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			//return saveSupplyOrder(userContext, supplyOrder, tokens().done());
		}

	}

	public SupplyOrder updateSupplyOrderProperty(RetailscmUserContext userContext,String supplyOrderId, int supplyOrderVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSupplyOrder(userContext, supplyOrderId, supplyOrderVersion, property, newValueExpr, tokensExpr);

		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		if(supplyOrder.getVersion() != supplyOrderVersion){
			String message = "The target version("+supplyOrder.getVersion()+") is not equals to version("+supplyOrderVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(supplyOrder){
			//will be good when the supplyOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to SupplyOrder.

			supplyOrder.changeProperty(property, newValueExpr);
			supplyOrder.updateLastUpdateTime(userContext.now());
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			//return saveSupplyOrder(userContext, supplyOrder, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected SupplyOrderTokens tokens(){
		return SupplyOrderTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return SupplyOrderTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortSupplyOrderLineItemListWith("id","desc")
		.sortSupplyOrderShippingGroupListWith("id","desc")
		.sortSupplyOrderPaymentGroupListWith("id","desc")
		.sortGoodsListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return SupplyOrderTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherBuyer(RetailscmUserContext userContext, String supplyOrderId, String anotherBuyerId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
 		checkerOf(userContext).checkIdOfRetailStoreCountryCenter(anotherBuyerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

 	}
 	public SupplyOrder transferToAnotherBuyer(RetailscmUserContext userContext, String supplyOrderId, String anotherBuyerId) throws Exception
 	{
 		checkParamsForTransferingAnotherBuyer(userContext, supplyOrderId,anotherBuyerId);
 
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());	
		synchronized(supplyOrder){
			//will be good when the supplyOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreCountryCenter buyer = loadRetailStoreCountryCenter(userContext, anotherBuyerId, emptyOptions());		
			supplyOrder.updateBuyer(buyer);		
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, emptyOptions());
			
			return present(userContext,supplyOrder, allTokens());
			
		}

 	}

	


	public CandidateRetailStoreCountryCenter requestCandidateBuyer(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

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
		SmartList<RetailStoreCountryCenter> candidateList = retailStoreCountryCenterDaoOf(userContext).requestCandidateRetailStoreCountryCenterForSupplyOrder(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherSeller(RetailscmUserContext userContext, String supplyOrderId, String anotherSellerId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
 		checkerOf(userContext).checkIdOfGoodsSupplier(anotherSellerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

 	}
 	public SupplyOrder transferToAnotherSeller(RetailscmUserContext userContext, String supplyOrderId, String anotherSellerId) throws Exception
 	{
 		checkParamsForTransferingAnotherSeller(userContext, supplyOrderId,anotherSellerId);
 
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());	
		synchronized(supplyOrder){
			//will be good when the supplyOrder loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			GoodsSupplier seller = loadGoodsSupplier(userContext, anotherSellerId, emptyOptions());		
			supplyOrder.updateSeller(seller);		
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, emptyOptions());
			
			return present(userContext,supplyOrder, allTokens());
			
		}

 	}

	


	public CandidateGoodsSupplier requestCandidateSeller(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateGoodsSupplier result = new CandidateGoodsSupplier();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<GoodsSupplier> candidateList = goodsSupplierDaoOf(userContext).requestCandidateGoodsSupplierForSupplyOrder(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected GoodsSupplier loadGoodsSupplier(RetailscmUserContext userContext, String newSellerId, Map<String,Object> options) throws Exception
 	{

 		return goodsSupplierDaoOf(userContext).load(newSellerId, options);
 	}
 	


	

 	protected RetailStoreCountryCenter loadRetailStoreCountryCenter(RetailscmUserContext userContext, String newBuyerId, Map<String,Object> options) throws Exception
 	{

 		return retailStoreCountryCenterDaoOf(userContext).load(newBuyerId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String supplyOrderId, int supplyOrderVersion) throws Exception {
		//deleteInternal(userContext, supplyOrderId, supplyOrderVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String supplyOrderId, int supplyOrderVersion) throws Exception{

		supplyOrderDaoOf(userContext).delete(supplyOrderId, supplyOrderVersion);
	}

	public SupplyOrder forgetByAll(RetailscmUserContext userContext, String supplyOrderId, int supplyOrderVersion) throws Exception {
		return forgetByAllInternal(userContext, supplyOrderId, supplyOrderVersion);
	}
	protected SupplyOrder forgetByAllInternal(RetailscmUserContext userContext,
			String supplyOrderId, int supplyOrderVersion) throws Exception{

		return supplyOrderDaoOf(userContext).disconnectFromAll(supplyOrderId, supplyOrderVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new SupplyOrderManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return supplyOrderDaoOf(userContext).deleteAll();
	}


	//disconnect SupplyOrder with sku_id in SupplyOrderLineItem
	protected SupplyOrder breakWithSupplyOrderLineItemBySkuId(RetailscmUserContext userContext, String supplyOrderId, String skuIdId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveSupplyOrderLineItemListWithSkuId(supplyOrder, skuIdId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with sku in Goods
	protected SupplyOrder breakWithGoodsBySku(RetailscmUserContext userContext, String supplyOrderId, String skuId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithSku(supplyOrder, skuId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with receiving_space in Goods
	protected SupplyOrder breakWithGoodsByReceivingSpace(RetailscmUserContext userContext, String supplyOrderId, String receivingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithReceivingSpace(supplyOrder, receivingSpaceId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with goods_allocation in Goods
	protected SupplyOrder breakWithGoodsByGoodsAllocation(RetailscmUserContext userContext, String supplyOrderId, String goodsAllocationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithGoodsAllocation(supplyOrder, goodsAllocationId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with smart_pallet in Goods
	protected SupplyOrder breakWithGoodsBySmartPallet(RetailscmUserContext userContext, String supplyOrderId, String smartPalletId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithSmartPallet(supplyOrder, smartPalletId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with shipping_space in Goods
	protected SupplyOrder breakWithGoodsByShippingSpace(RetailscmUserContext userContext, String supplyOrderId, String shippingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithShippingSpace(supplyOrder, shippingSpaceId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with transport_task in Goods
	protected SupplyOrder breakWithGoodsByTransportTask(RetailscmUserContext userContext, String supplyOrderId, String transportTaskId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithTransportTask(supplyOrder, transportTaskId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with retail_store in Goods
	protected SupplyOrder breakWithGoodsByRetailStore(RetailscmUserContext userContext, String supplyOrderId, String retailStoreId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithRetailStore(supplyOrder, retailStoreId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}
	//disconnect SupplyOrder with retail_store_order in Goods
	protected SupplyOrder breakWithGoodsByRetailStoreOrder(RetailscmUserContext userContext, String supplyOrderId, String retailStoreOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());

			synchronized(supplyOrder){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				supplyOrderDaoOf(userContext).planToRemoveGoodsListWithRetailStoreOrder(supplyOrder, retailStoreOrderId, this.emptyOptions());

				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				return supplyOrder;
			}
	}






	protected void checkParamsForAddingSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);

		
		checkerOf(userContext).checkSkuIdOfSupplyOrderLineItem(skuId);
		
		checkerOf(userContext).checkSkuNameOfSupplyOrderLineItem(skuName);
		
		checkerOf(userContext).checkAmountOfSupplyOrderLineItem(amount);
		
		checkerOf(userContext).checkQuantityOfSupplyOrderLineItem(quantity);
		
		checkerOf(userContext).checkUnitOfMeasurementOfSupplyOrderLineItem(unitOfMeasurement);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


	}
	public  SupplyOrder addSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingSupplyOrderLineItem(userContext,supplyOrderId,skuId, skuName, amount, quantity, unitOfMeasurement,tokensExpr);

		SupplyOrderLineItem supplyOrderLineItem = createSupplyOrderLineItem(userContext,skuId, skuName, amount, quantity, unitOfMeasurement);

		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, emptyOptions());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.addSupplyOrderLineItem( supplyOrderLineItem );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
			
			userContext.getManagerGroup().getSupplyOrderLineItemManager().onNewInstanceCreated(userContext, supplyOrderLineItem);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingSupplyOrderLineItemProperties(RetailscmUserContext userContext, String supplyOrderId,String id,String skuId,String skuName,BigDecimal amount,int quantity,String unitOfMeasurement,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderLineItem(id);

		checkerOf(userContext).checkSkuIdOfSupplyOrderLineItem( skuId);
		checkerOf(userContext).checkSkuNameOfSupplyOrderLineItem( skuName);
		checkerOf(userContext).checkAmountOfSupplyOrderLineItem( amount);
		checkerOf(userContext).checkQuantityOfSupplyOrderLineItem( quantity);
		checkerOf(userContext).checkUnitOfMeasurementOfSupplyOrderLineItem( unitOfMeasurement);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder updateSupplyOrderLineItemProperties(RetailscmUserContext userContext, String supplyOrderId, String id,String skuId,String skuName,BigDecimal amount,int quantity,String unitOfMeasurement, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSupplyOrderLineItemProperties(userContext,supplyOrderId,id,skuId,skuName,amount,quantity,unitOfMeasurement,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withSupplyOrderLineItemListList()
				.searchSupplyOrderLineItemListWith(SupplyOrderLineItem.ID_PROPERTY, "is", id).done();

		SupplyOrder supplyOrderToUpdate = loadSupplyOrder(userContext, supplyOrderId, options);

		if(supplyOrderToUpdate.getSupplyOrderLineItemList().isEmpty()){
			throw new SupplyOrderManagerException("SupplyOrderLineItem is NOT FOUND with id: '"+id+"'");
		}

		SupplyOrderLineItem item = supplyOrderToUpdate.getSupplyOrderLineItemList().first();

		item.updateSkuId( skuId );
		item.updateSkuName( skuName );
		item.updateAmount( amount );
		item.updateQuantity( quantity );
		item.updateUnitOfMeasurement( unitOfMeasurement );


		//checkParamsForAddingSupplyOrderLineItem(userContext,supplyOrderId,name, code, used,tokensExpr);
		SupplyOrder supplyOrder = saveSupplyOrder(userContext, supplyOrderToUpdate, tokens().withSupplyOrderLineItemList().done());
		synchronized(supplyOrder){
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected SupplyOrderLineItem createSupplyOrderLineItem(RetailscmUserContext userContext, String skuId, String skuName, BigDecimal amount, int quantity, String unitOfMeasurement) throws Exception{

		SupplyOrderLineItem supplyOrderLineItem = new SupplyOrderLineItem();
		
		
		supplyOrderLineItem.setSkuId(skuId);		
		supplyOrderLineItem.setSkuName(skuName);		
		supplyOrderLineItem.setAmount(amount);		
		supplyOrderLineItem.setQuantity(quantity);		
		supplyOrderLineItem.setUnitOfMeasurement(unitOfMeasurement);
	
		
		return supplyOrderLineItem;


	}

	protected SupplyOrderLineItem createIndexedSupplyOrderLineItem(String id, int version){

		SupplyOrderLineItem supplyOrderLineItem = new SupplyOrderLineItem();
		supplyOrderLineItem.setId(id);
		supplyOrderLineItem.setVersion(version);
		return supplyOrderLineItem;

	}

	protected void checkParamsForRemovingSupplyOrderLineItemList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderLineItemIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		for(String supplyOrderLineItemIdItem: supplyOrderLineItemIds){
			checkerOf(userContext).checkIdOfSupplyOrderLineItem(supplyOrderLineItemIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderLineItemList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderLineItemIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingSupplyOrderLineItemList(userContext, supplyOrderId,  supplyOrderLineItemIds, tokensExpr);


			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
			synchronized(supplyOrder){
				//Will be good when the supplyOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderDaoOf(userContext).planToRemoveSupplyOrderLineItemList(supplyOrder, supplyOrderLineItemIds, allTokens());
				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
				deleteRelationListInGraph(userContext, supplyOrder.getSupplyOrderLineItemList());
				return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderLineItemId, int supplyOrderLineItemVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderLineItem(supplyOrderLineItemId);
		checkerOf(userContext).checkVersionOfSupplyOrderLineItem(supplyOrderLineItemVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderLineItemId, int supplyOrderLineItemVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingSupplyOrderLineItem(userContext,supplyOrderId, supplyOrderLineItemId, supplyOrderLineItemVersion,tokensExpr);

		SupplyOrderLineItem supplyOrderLineItem = createIndexedSupplyOrderLineItem(supplyOrderLineItemId, supplyOrderLineItemVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.removeSupplyOrderLineItem( supplyOrderLineItem );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
			deleteRelationInGraph(userContext, supplyOrderLineItem);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderLineItemId, int supplyOrderLineItemVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderLineItem(supplyOrderLineItemId);
		checkerOf(userContext).checkVersionOfSupplyOrderLineItem(supplyOrderLineItemVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder copySupplyOrderLineItemFrom(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderLineItemId, int supplyOrderLineItemVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingSupplyOrderLineItem(userContext,supplyOrderId, supplyOrderLineItemId, supplyOrderLineItemVersion,tokensExpr);

		SupplyOrderLineItem supplyOrderLineItem = createIndexedSupplyOrderLineItem(supplyOrderLineItemId, supplyOrderLineItemVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			supplyOrder.copySupplyOrderLineItemFrom( supplyOrderLineItem );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
			
			userContext.getManagerGroup().getSupplyOrderLineItemManager().onNewInstanceCreated(userContext, (SupplyOrderLineItem)supplyOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderLineItemId, int supplyOrderLineItemVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderLineItem(supplyOrderLineItemId);
		checkerOf(userContext).checkVersionOfSupplyOrderLineItem(supplyOrderLineItemVersion);
		

		if(SupplyOrderLineItem.SKU_ID_PROPERTY.equals(property)){
			checkerOf(userContext).checkSkuIdOfSupplyOrderLineItem(parseString(newValueExpr));
		}
		
		if(SupplyOrderLineItem.SKU_NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkSkuNameOfSupplyOrderLineItem(parseString(newValueExpr));
		}
		
		if(SupplyOrderLineItem.AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAmountOfSupplyOrderLineItem(parseBigDecimal(newValueExpr));
		}
		
		if(SupplyOrderLineItem.QUANTITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkQuantityOfSupplyOrderLineItem(parseInt(newValueExpr));
		}
		
		if(SupplyOrderLineItem.UNIT_OF_MEASUREMENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkUnitOfMeasurementOfSupplyOrderLineItem(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}

	public  SupplyOrder updateSupplyOrderLineItem(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderLineItemId, int supplyOrderLineItemVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingSupplyOrderLineItem(userContext, supplyOrderId, supplyOrderLineItemId, supplyOrderLineItemVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withSupplyOrderLineItemList().searchSupplyOrderLineItemListWith(SupplyOrderLineItem.ID_PROPERTY, "eq", supplyOrderLineItemId).done();



		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, loadTokens);

		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrder.removeSupplyOrderLineItem( supplyOrderLineItem );
			//make changes to AcceleraterAccount.
			SupplyOrderLineItem supplyOrderLineItemIndex = createIndexedSupplyOrderLineItem(supplyOrderLineItemId, supplyOrderLineItemVersion);

			SupplyOrderLineItem supplyOrderLineItem = supplyOrder.findTheSupplyOrderLineItem(supplyOrderLineItemIndex);
			if(supplyOrderLineItem == null){
				throw new SupplyOrderManagerException(supplyOrderLineItem+" is NOT FOUND" );
			}

			supplyOrderLineItem.changeProperty(property, newValueExpr);
			
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderLineItemList().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId, String name, BigDecimal amount,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);

		
		checkerOf(userContext).checkNameOfSupplyOrderShippingGroup(name);
		
		checkerOf(userContext).checkAmountOfSupplyOrderShippingGroup(amount);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


	}
	public  SupplyOrder addSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId, String name, BigDecimal amount, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingSupplyOrderShippingGroup(userContext,supplyOrderId,name, amount,tokensExpr);

		SupplyOrderShippingGroup supplyOrderShippingGroup = createSupplyOrderShippingGroup(userContext,name, amount);

		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, emptyOptions());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.addSupplyOrderShippingGroup( supplyOrderShippingGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderShippingGroupList().done());
			
			userContext.getManagerGroup().getSupplyOrderShippingGroupManager().onNewInstanceCreated(userContext, supplyOrderShippingGroup);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingSupplyOrderShippingGroupProperties(RetailscmUserContext userContext, String supplyOrderId,String id,String name,BigDecimal amount,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderShippingGroup(id);

		checkerOf(userContext).checkNameOfSupplyOrderShippingGroup( name);
		checkerOf(userContext).checkAmountOfSupplyOrderShippingGroup( amount);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder updateSupplyOrderShippingGroupProperties(RetailscmUserContext userContext, String supplyOrderId, String id,String name,BigDecimal amount, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSupplyOrderShippingGroupProperties(userContext,supplyOrderId,id,name,amount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withSupplyOrderShippingGroupListList()
				.searchSupplyOrderShippingGroupListWith(SupplyOrderShippingGroup.ID_PROPERTY, "is", id).done();

		SupplyOrder supplyOrderToUpdate = loadSupplyOrder(userContext, supplyOrderId, options);

		if(supplyOrderToUpdate.getSupplyOrderShippingGroupList().isEmpty()){
			throw new SupplyOrderManagerException("SupplyOrderShippingGroup is NOT FOUND with id: '"+id+"'");
		}

		SupplyOrderShippingGroup item = supplyOrderToUpdate.getSupplyOrderShippingGroupList().first();

		item.updateName( name );
		item.updateAmount( amount );


		//checkParamsForAddingSupplyOrderShippingGroup(userContext,supplyOrderId,name, code, used,tokensExpr);
		SupplyOrder supplyOrder = saveSupplyOrder(userContext, supplyOrderToUpdate, tokens().withSupplyOrderShippingGroupList().done());
		synchronized(supplyOrder){
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected SupplyOrderShippingGroup createSupplyOrderShippingGroup(RetailscmUserContext userContext, String name, BigDecimal amount) throws Exception{

		SupplyOrderShippingGroup supplyOrderShippingGroup = new SupplyOrderShippingGroup();
		
		
		supplyOrderShippingGroup.setName(name);		
		supplyOrderShippingGroup.setAmount(amount);
	
		
		return supplyOrderShippingGroup;


	}

	protected SupplyOrderShippingGroup createIndexedSupplyOrderShippingGroup(String id, int version){

		SupplyOrderShippingGroup supplyOrderShippingGroup = new SupplyOrderShippingGroup();
		supplyOrderShippingGroup.setId(id);
		supplyOrderShippingGroup.setVersion(version);
		return supplyOrderShippingGroup;

	}

	protected void checkParamsForRemovingSupplyOrderShippingGroupList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderShippingGroupIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		for(String supplyOrderShippingGroupIdItem: supplyOrderShippingGroupIds){
			checkerOf(userContext).checkIdOfSupplyOrderShippingGroup(supplyOrderShippingGroupIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderShippingGroupList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderShippingGroupIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingSupplyOrderShippingGroupList(userContext, supplyOrderId,  supplyOrderShippingGroupIds, tokensExpr);


			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
			synchronized(supplyOrder){
				//Will be good when the supplyOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderDaoOf(userContext).planToRemoveSupplyOrderShippingGroupList(supplyOrder, supplyOrderShippingGroupIds, allTokens());
				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderShippingGroupList().done());
				deleteRelationListInGraph(userContext, supplyOrder.getSupplyOrderShippingGroupList());
				return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderShippingGroup(supplyOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderShippingGroup(supplyOrderShippingGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingSupplyOrderShippingGroup(userContext,supplyOrderId, supplyOrderShippingGroupId, supplyOrderShippingGroupVersion,tokensExpr);

		SupplyOrderShippingGroup supplyOrderShippingGroup = createIndexedSupplyOrderShippingGroup(supplyOrderShippingGroupId, supplyOrderShippingGroupVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.removeSupplyOrderShippingGroup( supplyOrderShippingGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderShippingGroupList().done());
			deleteRelationInGraph(userContext, supplyOrderShippingGroup);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderShippingGroup(supplyOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderShippingGroup(supplyOrderShippingGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder copySupplyOrderShippingGroupFrom(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingSupplyOrderShippingGroup(userContext,supplyOrderId, supplyOrderShippingGroupId, supplyOrderShippingGroupVersion,tokensExpr);

		SupplyOrderShippingGroup supplyOrderShippingGroup = createIndexedSupplyOrderShippingGroup(supplyOrderShippingGroupId, supplyOrderShippingGroupVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			supplyOrder.copySupplyOrderShippingGroupFrom( supplyOrderShippingGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderShippingGroupList().done());
			
			userContext.getManagerGroup().getSupplyOrderShippingGroupManager().onNewInstanceCreated(userContext, (SupplyOrderShippingGroup)supplyOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderShippingGroup(supplyOrderShippingGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderShippingGroup(supplyOrderShippingGroupVersion);
		

		if(SupplyOrderShippingGroup.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfSupplyOrderShippingGroup(parseString(newValueExpr));
		}
		
		if(SupplyOrderShippingGroup.AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAmountOfSupplyOrderShippingGroup(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}

	public  SupplyOrder updateSupplyOrderShippingGroup(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderShippingGroupId, int supplyOrderShippingGroupVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingSupplyOrderShippingGroup(userContext, supplyOrderId, supplyOrderShippingGroupId, supplyOrderShippingGroupVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withSupplyOrderShippingGroupList().searchSupplyOrderShippingGroupListWith(SupplyOrderShippingGroup.ID_PROPERTY, "eq", supplyOrderShippingGroupId).done();



		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, loadTokens);

		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrder.removeSupplyOrderShippingGroup( supplyOrderShippingGroup );
			//make changes to AcceleraterAccount.
			SupplyOrderShippingGroup supplyOrderShippingGroupIndex = createIndexedSupplyOrderShippingGroup(supplyOrderShippingGroupId, supplyOrderShippingGroupVersion);

			SupplyOrderShippingGroup supplyOrderShippingGroup = supplyOrder.findTheSupplyOrderShippingGroup(supplyOrderShippingGroupIndex);
			if(supplyOrderShippingGroup == null){
				throw new SupplyOrderManagerException(supplyOrderShippingGroup+" is NOT FOUND" );
			}

			supplyOrderShippingGroup.changeProperty(property, newValueExpr);
			
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderShippingGroupList().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId, String name, String cardNumber,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);

		
		checkerOf(userContext).checkNameOfSupplyOrderPaymentGroup(name);
		
		checkerOf(userContext).checkCardNumberOfSupplyOrderPaymentGroup(cardNumber);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


	}
	public  SupplyOrder addSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId, String name, String cardNumber, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingSupplyOrderPaymentGroup(userContext,supplyOrderId,name, cardNumber,tokensExpr);

		SupplyOrderPaymentGroup supplyOrderPaymentGroup = createSupplyOrderPaymentGroup(userContext,name, cardNumber);

		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, emptyOptions());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.addSupplyOrderPaymentGroup( supplyOrderPaymentGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderPaymentGroupList().done());
			
			userContext.getManagerGroup().getSupplyOrderPaymentGroupManager().onNewInstanceCreated(userContext, supplyOrderPaymentGroup);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingSupplyOrderPaymentGroupProperties(RetailscmUserContext userContext, String supplyOrderId,String id,String name,String cardNumber,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderPaymentGroup(id);

		checkerOf(userContext).checkNameOfSupplyOrderPaymentGroup( name);
		checkerOf(userContext).checkCardNumberOfSupplyOrderPaymentGroup( cardNumber);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder updateSupplyOrderPaymentGroupProperties(RetailscmUserContext userContext, String supplyOrderId, String id,String name,String cardNumber, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingSupplyOrderPaymentGroupProperties(userContext,supplyOrderId,id,name,cardNumber,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withSupplyOrderPaymentGroupListList()
				.searchSupplyOrderPaymentGroupListWith(SupplyOrderPaymentGroup.ID_PROPERTY, "is", id).done();

		SupplyOrder supplyOrderToUpdate = loadSupplyOrder(userContext, supplyOrderId, options);

		if(supplyOrderToUpdate.getSupplyOrderPaymentGroupList().isEmpty()){
			throw new SupplyOrderManagerException("SupplyOrderPaymentGroup is NOT FOUND with id: '"+id+"'");
		}

		SupplyOrderPaymentGroup item = supplyOrderToUpdate.getSupplyOrderPaymentGroupList().first();

		item.updateName( name );
		item.updateCardNumber( cardNumber );


		//checkParamsForAddingSupplyOrderPaymentGroup(userContext,supplyOrderId,name, code, used,tokensExpr);
		SupplyOrder supplyOrder = saveSupplyOrder(userContext, supplyOrderToUpdate, tokens().withSupplyOrderPaymentGroupList().done());
		synchronized(supplyOrder){
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected SupplyOrderPaymentGroup createSupplyOrderPaymentGroup(RetailscmUserContext userContext, String name, String cardNumber) throws Exception{

		SupplyOrderPaymentGroup supplyOrderPaymentGroup = new SupplyOrderPaymentGroup();
		
		
		supplyOrderPaymentGroup.setName(name);		
		supplyOrderPaymentGroup.setCardNumber(cardNumber);
	
		
		return supplyOrderPaymentGroup;


	}

	protected SupplyOrderPaymentGroup createIndexedSupplyOrderPaymentGroup(String id, int version){

		SupplyOrderPaymentGroup supplyOrderPaymentGroup = new SupplyOrderPaymentGroup();
		supplyOrderPaymentGroup.setId(id);
		supplyOrderPaymentGroup.setVersion(version);
		return supplyOrderPaymentGroup;

	}

	protected void checkParamsForRemovingSupplyOrderPaymentGroupList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderPaymentGroupIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		for(String supplyOrderPaymentGroupIdItem: supplyOrderPaymentGroupIds){
			checkerOf(userContext).checkIdOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderPaymentGroupList(RetailscmUserContext userContext, String supplyOrderId,
			String supplyOrderPaymentGroupIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingSupplyOrderPaymentGroupList(userContext, supplyOrderId,  supplyOrderPaymentGroupIds, tokensExpr);


			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
			synchronized(supplyOrder){
				//Will be good when the supplyOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderDaoOf(userContext).planToRemoveSupplyOrderPaymentGroupList(supplyOrder, supplyOrderPaymentGroupIds, allTokens());
				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderPaymentGroupList().done());
				deleteRelationListInGraph(userContext, supplyOrder.getSupplyOrderPaymentGroupList());
				return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingSupplyOrderPaymentGroup(userContext,supplyOrderId, supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion,tokensExpr);

		SupplyOrderPaymentGroup supplyOrderPaymentGroup = createIndexedSupplyOrderPaymentGroup(supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.removeSupplyOrderPaymentGroup( supplyOrderPaymentGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderPaymentGroupList().done());
			deleteRelationInGraph(userContext, supplyOrderPaymentGroup);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder copySupplyOrderPaymentGroupFrom(RetailscmUserContext userContext, String supplyOrderId,
		String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingSupplyOrderPaymentGroup(userContext,supplyOrderId, supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion,tokensExpr);

		SupplyOrderPaymentGroup supplyOrderPaymentGroup = createIndexedSupplyOrderPaymentGroup(supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			supplyOrder.copySupplyOrderPaymentGroupFrom( supplyOrderPaymentGroup );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderPaymentGroupList().done());
			
			userContext.getManagerGroup().getSupplyOrderPaymentGroupManager().onNewInstanceCreated(userContext, (SupplyOrderPaymentGroup)supplyOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupId);
		checkerOf(userContext).checkVersionOfSupplyOrderPaymentGroup(supplyOrderPaymentGroupVersion);
		

		if(SupplyOrderPaymentGroup.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfSupplyOrderPaymentGroup(parseString(newValueExpr));
		}
		
		if(SupplyOrderPaymentGroup.CARD_NUMBER_PROPERTY.equals(property)){
			checkerOf(userContext).checkCardNumberOfSupplyOrderPaymentGroup(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}

	public  SupplyOrder updateSupplyOrderPaymentGroup(RetailscmUserContext userContext, String supplyOrderId, String supplyOrderPaymentGroupId, int supplyOrderPaymentGroupVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingSupplyOrderPaymentGroup(userContext, supplyOrderId, supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withSupplyOrderPaymentGroupList().searchSupplyOrderPaymentGroupListWith(SupplyOrderPaymentGroup.ID_PROPERTY, "eq", supplyOrderPaymentGroupId).done();



		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, loadTokens);

		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrder.removeSupplyOrderPaymentGroup( supplyOrderPaymentGroup );
			//make changes to AcceleraterAccount.
			SupplyOrderPaymentGroup supplyOrderPaymentGroupIndex = createIndexedSupplyOrderPaymentGroup(supplyOrderPaymentGroupId, supplyOrderPaymentGroupVersion);

			SupplyOrderPaymentGroup supplyOrderPaymentGroup = supplyOrder.findTheSupplyOrderPaymentGroup(supplyOrderPaymentGroupIndex);
			if(supplyOrderPaymentGroup == null){
				throw new SupplyOrderManagerException(supplyOrderPaymentGroup+" is NOT FOUND" );
			}

			supplyOrderPaymentGroup.changeProperty(property, newValueExpr);
			
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withSupplyOrderPaymentGroupList().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingGoods(RetailscmUserContext userContext, String supplyOrderId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String retailStoreOrderId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);

		
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
		
		checkerOf(userContext).checkRetailStoreOrderIdOfGoods(retailStoreOrderId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);


	}
	public  SupplyOrder addGoods(RetailscmUserContext userContext, String supplyOrderId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String retailStoreOrderId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoods(userContext,supplyOrderId,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, retailStoreOrderId,tokensExpr);

		Goods goods = createGoods(userContext,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, retailStoreOrderId);

		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, emptyOptions());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.addGoods( goods );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, goods);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsProperties(RetailscmUserContext userContext, String supplyOrderId,String id,String name,String rfid,String uom,int maxPackage,Date expireTime,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		checkerOf(userContext).checkIdOfGoods(id);

		checkerOf(userContext).checkNameOfGoods( name);
		checkerOf(userContext).checkRfidOfGoods( rfid);
		checkerOf(userContext).checkUomOfGoods( uom);
		checkerOf(userContext).checkMaxPackageOfGoods( maxPackage);
		checkerOf(userContext).checkExpireTimeOfGoods( expireTime);

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder updateGoodsProperties(RetailscmUserContext userContext, String supplyOrderId, String id,String name,String rfid,String uom,int maxPackage,Date expireTime, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsProperties(userContext,supplyOrderId,id,name,rfid,uom,maxPackage,expireTime,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsListList()
				.searchGoodsListWith(Goods.ID_PROPERTY, "is", id).done();

		SupplyOrder supplyOrderToUpdate = loadSupplyOrder(userContext, supplyOrderId, options);

		if(supplyOrderToUpdate.getGoodsList().isEmpty()){
			throw new SupplyOrderManagerException("Goods is NOT FOUND with id: '"+id+"'");
		}

		Goods item = supplyOrderToUpdate.getGoodsList().first();

		item.updateName( name );
		item.updateRfid( rfid );
		item.updateUom( uom );
		item.updateMaxPackage( maxPackage );
		item.updateExpireTime( expireTime );


		//checkParamsForAddingGoods(userContext,supplyOrderId,name, code, used,tokensExpr);
		SupplyOrder supplyOrder = saveSupplyOrder(userContext, supplyOrderToUpdate, tokens().withGoodsList().done());
		synchronized(supplyOrder){
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}
	}


	protected Goods createGoods(RetailscmUserContext userContext, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String retailStoreOrderId) throws Exception{

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
		RetailStoreOrder  retailStoreOrder = new RetailStoreOrder();
		retailStoreOrder.setId(retailStoreOrderId);		
		goods.setRetailStoreOrder(retailStoreOrder);
	
		
		return goods;


	}

	protected Goods createIndexedGoods(String id, int version){

		Goods goods = new Goods();
		goods.setId(id);
		goods.setVersion(version);
		return goods;

	}

	protected void checkParamsForRemovingGoodsList(RetailscmUserContext userContext, String supplyOrderId,
			String goodsIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
		for(String goodsIdItem: goodsIds){
			checkerOf(userContext).checkIdOfGoods(goodsIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeGoodsList(RetailscmUserContext userContext, String supplyOrderId,
			String goodsIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsList(userContext, supplyOrderId,  goodsIds, tokensExpr);


			SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
			synchronized(supplyOrder){
				//Will be good when the supplyOrder loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				supplyOrderDaoOf(userContext).planToRemoveGoodsList(supplyOrder, goodsIds, allTokens());
				supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
				deleteRelationListInGraph(userContext, supplyOrder.getGoodsList());
				return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoods(RetailscmUserContext userContext, String supplyOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder removeGoods(RetailscmUserContext userContext, String supplyOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoods(userContext,supplyOrderId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			supplyOrder.removeGoods( goods );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
			deleteRelationInGraph(userContext, goods);
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoods(RetailscmUserContext userContext, String supplyOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfSupplyOrder( supplyOrderId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}
	public  SupplyOrder copyGoodsFrom(RetailscmUserContext userContext, String supplyOrderId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoods(userContext,supplyOrderId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, allTokens());
		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			supplyOrder.copyGoodsFrom( goods );
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, (Goods)supplyOrder.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoods(RetailscmUserContext userContext, String supplyOrderId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfSupplyOrder(supplyOrderId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(SupplyOrderManagerException.class);

	}

	public  SupplyOrder updateGoods(RetailscmUserContext userContext, String supplyOrderId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoods(userContext, supplyOrderId, goodsId, goodsVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsList().searchGoodsListWith(Goods.ID_PROPERTY, "eq", goodsId).done();



		SupplyOrder supplyOrder = loadSupplyOrder(userContext, supplyOrderId, loadTokens);

		synchronized(supplyOrder){
			//Will be good when the supplyOrder loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//supplyOrder.removeGoods( goods );
			//make changes to AcceleraterAccount.
			Goods goodsIndex = createIndexedGoods(goodsId, goodsVersion);

			Goods goods = supplyOrder.findTheGoods(goodsIndex);
			if(goods == null){
				throw new SupplyOrderManagerException(goods+" is NOT FOUND" );
			}

			goods.changeProperty(property, newValueExpr);
			
			supplyOrder = saveSupplyOrder(userContext, supplyOrder, tokens().withGoodsList().done());
			return present(userContext,supplyOrder, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, SupplyOrder newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



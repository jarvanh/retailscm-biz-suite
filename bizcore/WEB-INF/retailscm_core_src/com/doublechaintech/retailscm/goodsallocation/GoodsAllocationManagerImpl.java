
package com.doublechaintech.retailscm.goodsallocation;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.goods.Goods;
import com.doublechaintech.retailscm.goodsshelf.GoodsShelf;

import com.doublechaintech.retailscm.goodsshelf.CandidateGoodsShelf;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.sku.Sku;
import com.doublechaintech.retailscm.receivingspace.ReceivingSpace;
import com.doublechaintech.retailscm.smartpallet.SmartPallet;
import com.doublechaintech.retailscm.shippingspace.ShippingSpace;
import com.doublechaintech.retailscm.transporttask.TransportTask;
import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;






public class GoodsAllocationManagerImpl extends CustomRetailscmCheckerManager implements GoodsAllocationManager {

  


	private static final String SERVICE_TYPE = "GoodsAllocation";
	@Override
	public GoodsAllocationDAO daoOf(RetailscmUserContext userContext) {
		return goodsAllocationDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws GoodsAllocationManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new GoodsAllocationManagerException(message);

	}



 	protected GoodsAllocation saveGoodsAllocation(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, String [] tokensExpr) throws Exception{	
 		//return getGoodsAllocationDAO().save(goodsAllocation, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveGoodsAllocation(userContext, goodsAllocation, tokens);
 	}
 	
 	protected GoodsAllocation saveGoodsAllocationDetail(RetailscmUserContext userContext, GoodsAllocation goodsAllocation) throws Exception{	

 		
 		return saveGoodsAllocation(userContext, goodsAllocation, allTokens());
 	}
 	
 	public GoodsAllocation loadGoodsAllocation(RetailscmUserContext userContext, String goodsAllocationId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsAllocationManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		GoodsAllocation goodsAllocation = loadGoodsAllocation( userContext, goodsAllocationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsAllocation, tokens);
 	}
 	
 	
 	 public GoodsAllocation searchGoodsAllocation(RetailscmUserContext userContext, String goodsAllocationId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsAllocationManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		GoodsAllocation goodsAllocation = loadGoodsAllocation( userContext, goodsAllocationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsAllocation, tokens);
 	}
 	
 	

 	protected GoodsAllocation present(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,goodsAllocation,tokens);
		
		
		GoodsAllocation  goodsAllocationToPresent = goodsAllocationDaoOf(userContext).present(goodsAllocation, tokens);
		
		List<BaseEntity> entityListToNaming = goodsAllocationToPresent.collectRefercencesFromLists();
		goodsAllocationDaoOf(userContext).alias(entityListToNaming);
		
		return  goodsAllocationToPresent;
		
		
	}
 
 	
 	
 	public GoodsAllocation loadGoodsAllocationDetail(RetailscmUserContext userContext, String goodsAllocationId) throws Exception{	
 		GoodsAllocation goodsAllocation = loadGoodsAllocation( userContext, goodsAllocationId, allTokens());
 		return present(userContext,goodsAllocation, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String goodsAllocationId) throws Exception{	
 		GoodsAllocation goodsAllocation = loadGoodsAllocation( userContext, goodsAllocationId, viewTokens());
 		return present(userContext,goodsAllocation, allTokens());
		
 	}
 	protected GoodsAllocation saveGoodsAllocation(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, Map<String,Object>tokens) throws Exception{	
 		return goodsAllocationDaoOf(userContext).save(goodsAllocation, tokens);
 	}
 	protected GoodsAllocation loadGoodsAllocation(RetailscmUserContext userContext, String goodsAllocationId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsAllocationManagerException.class);

 
 		return goodsAllocationDaoOf(userContext).load(goodsAllocationId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, Map<String, Object> tokens){
		super.addActions(userContext, goodsAllocation, tokens);
		
		addAction(userContext, goodsAllocation, tokens,"@create","createGoodsAllocation","createGoodsAllocation/","main","primary");
		addAction(userContext, goodsAllocation, tokens,"@update","updateGoodsAllocation","updateGoodsAllocation/"+goodsAllocation.getId()+"/","main","primary");
		addAction(userContext, goodsAllocation, tokens,"@copy","cloneGoodsAllocation","cloneGoodsAllocation/"+goodsAllocation.getId()+"/","main","primary");
		
		addAction(userContext, goodsAllocation, tokens,"goods_allocation.transfer_to_goods_shelf","transferToAnotherGoodsShelf","transferToAnotherGoodsShelf/"+goodsAllocation.getId()+"/","main","primary");
		addAction(userContext, goodsAllocation, tokens,"goods_allocation.addGoods","addGoods","addGoods/"+goodsAllocation.getId()+"/","goodsList","primary");
		addAction(userContext, goodsAllocation, tokens,"goods_allocation.removeGoods","removeGoods","removeGoods/"+goodsAllocation.getId()+"/","goodsList","primary");
		addAction(userContext, goodsAllocation, tokens,"goods_allocation.updateGoods","updateGoods","updateGoods/"+goodsAllocation.getId()+"/","goodsList","primary");
		addAction(userContext, goodsAllocation, tokens,"goods_allocation.copyGoodsFrom","copyGoodsFrom","copyGoodsFrom/"+goodsAllocation.getId()+"/","goodsList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public GoodsAllocation createGoodsAllocation(RetailscmUserContext userContext, String location,BigDecimal latitude,BigDecimal longitude,String goodsShelfId) throws Exception
	//public GoodsAllocation createGoodsAllocation(RetailscmUserContext userContext,String location, BigDecimal latitude, BigDecimal longitude, String goodsShelfId) throws Exception
	{

		

		

		checkerOf(userContext).checkLocationOfGoodsAllocation(location);
		checkerOf(userContext).checkLatitudeOfGoodsAllocation(latitude);
		checkerOf(userContext).checkLongitudeOfGoodsAllocation(longitude);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);


		GoodsAllocation goodsAllocation=createNewGoodsAllocation();	

		goodsAllocation.setLocation(location);
		goodsAllocation.setLatitude(latitude);
		goodsAllocation.setLongitude(longitude);
			
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId,emptyOptions());
		goodsAllocation.setGoodsShelf(goodsShelf);
		
		

		goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, emptyOptions());
		
		onNewInstanceCreated(userContext, goodsAllocation);
		return goodsAllocation;


	}
	protected GoodsAllocation createNewGoodsAllocation()
	{

		return new GoodsAllocation();
	}

	protected void checkParamsForUpdatingGoodsAllocation(RetailscmUserContext userContext,String goodsAllocationId, int goodsAllocationVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).checkVersionOfGoodsAllocation( goodsAllocationVersion);
		

		if(GoodsAllocation.LOCATION_PROPERTY.equals(property)){
			checkerOf(userContext).checkLocationOfGoodsAllocation(parseString(newValueExpr));
		}
		if(GoodsAllocation.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfGoodsAllocation(parseBigDecimal(newValueExpr));
		}
		if(GoodsAllocation.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfGoodsAllocation(parseBigDecimal(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);


	}



	public GoodsAllocation clone(RetailscmUserContext userContext, String fromGoodsAllocationId) throws Exception{

		return goodsAllocationDaoOf(userContext).clone(fromGoodsAllocationId, this.allTokens());
	}

	public GoodsAllocation internalSaveGoodsAllocation(RetailscmUserContext userContext, GoodsAllocation goodsAllocation) throws Exception
	{
		return internalSaveGoodsAllocation(userContext, goodsAllocation, allTokens());

	}
	public GoodsAllocation internalSaveGoodsAllocation(RetailscmUserContext userContext, GoodsAllocation goodsAllocation, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingGoodsAllocation(userContext, goodsAllocationId, goodsAllocationVersion, property, newValueExpr, tokensExpr);


		synchronized(goodsAllocation){
			//will be good when the goodsAllocation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsAllocation.
			if (goodsAllocation.isChanged()){
			
			}
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, options);
			return goodsAllocation;

		}

	}

	public GoodsAllocation updateGoodsAllocation(RetailscmUserContext userContext,String goodsAllocationId, int goodsAllocationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsAllocation(userContext, goodsAllocationId, goodsAllocationVersion, property, newValueExpr, tokensExpr);



		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());
		if(goodsAllocation.getVersion() != goodsAllocationVersion){
			String message = "The target version("+goodsAllocation.getVersion()+") is not equals to version("+goodsAllocationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsAllocation){
			//will be good when the goodsAllocation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsAllocation.
			
			goodsAllocation.changeProperty(property, newValueExpr);
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().done());
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
			//return saveGoodsAllocation(userContext, goodsAllocation, tokens().done());
		}

	}

	public GoodsAllocation updateGoodsAllocationProperty(RetailscmUserContext userContext,String goodsAllocationId, int goodsAllocationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsAllocation(userContext, goodsAllocationId, goodsAllocationVersion, property, newValueExpr, tokensExpr);

		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());
		if(goodsAllocation.getVersion() != goodsAllocationVersion){
			String message = "The target version("+goodsAllocation.getVersion()+") is not equals to version("+goodsAllocationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsAllocation){
			//will be good when the goodsAllocation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsAllocation.

			goodsAllocation.changeProperty(property, newValueExpr);
			
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().done());
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
			//return saveGoodsAllocation(userContext, goodsAllocation, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected GoodsAllocationTokens tokens(){
		return GoodsAllocationTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return GoodsAllocationTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortGoodsListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return GoodsAllocationTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherGoodsShelf(RetailscmUserContext userContext, String goodsAllocationId, String anotherGoodsShelfId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
 		checkerOf(userContext).checkIdOfGoodsShelf(anotherGoodsShelfId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

 	}
 	public GoodsAllocation transferToAnotherGoodsShelf(RetailscmUserContext userContext, String goodsAllocationId, String anotherGoodsShelfId) throws Exception
 	{
 		checkParamsForTransferingAnotherGoodsShelf(userContext, goodsAllocationId,anotherGoodsShelfId);
 
		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());	
		synchronized(goodsAllocation){
			//will be good when the goodsAllocation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			GoodsShelf goodsShelf = loadGoodsShelf(userContext, anotherGoodsShelfId, emptyOptions());		
			goodsAllocation.updateGoodsShelf(goodsShelf);		
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, emptyOptions());
			
			return present(userContext,goodsAllocation, allTokens());
			
		}

 	}

	


	public CandidateGoodsShelf requestCandidateGoodsShelf(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateGoodsShelf result = new CandidateGoodsShelf();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("location");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<GoodsShelf> candidateList = goodsShelfDaoOf(userContext).requestCandidateGoodsShelfForGoodsAllocation(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected GoodsShelf loadGoodsShelf(RetailscmUserContext userContext, String newGoodsShelfId, Map<String,Object> options) throws Exception
 	{

 		return goodsShelfDaoOf(userContext).load(newGoodsShelfId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String goodsAllocationId, int goodsAllocationVersion) throws Exception {
		//deleteInternal(userContext, goodsAllocationId, goodsAllocationVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String goodsAllocationId, int goodsAllocationVersion) throws Exception{

		goodsAllocationDaoOf(userContext).delete(goodsAllocationId, goodsAllocationVersion);
	}

	public GoodsAllocation forgetByAll(RetailscmUserContext userContext, String goodsAllocationId, int goodsAllocationVersion) throws Exception {
		return forgetByAllInternal(userContext, goodsAllocationId, goodsAllocationVersion);
	}
	protected GoodsAllocation forgetByAllInternal(RetailscmUserContext userContext,
			String goodsAllocationId, int goodsAllocationVersion) throws Exception{

		return goodsAllocationDaoOf(userContext).disconnectFromAll(goodsAllocationId, goodsAllocationVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new GoodsAllocationManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return goodsAllocationDaoOf(userContext).deleteAll();
	}


	//disconnect GoodsAllocation with sku in Goods
	protected GoodsAllocation breakWithGoodsBySku(RetailscmUserContext userContext, String goodsAllocationId, String skuId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithSku(goodsAllocation, skuId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with receiving_space in Goods
	protected GoodsAllocation breakWithGoodsByReceivingSpace(RetailscmUserContext userContext, String goodsAllocationId, String receivingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithReceivingSpace(goodsAllocation, receivingSpaceId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with smart_pallet in Goods
	protected GoodsAllocation breakWithGoodsBySmartPallet(RetailscmUserContext userContext, String goodsAllocationId, String smartPalletId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithSmartPallet(goodsAllocation, smartPalletId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with shipping_space in Goods
	protected GoodsAllocation breakWithGoodsByShippingSpace(RetailscmUserContext userContext, String goodsAllocationId, String shippingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithShippingSpace(goodsAllocation, shippingSpaceId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with transport_task in Goods
	protected GoodsAllocation breakWithGoodsByTransportTask(RetailscmUserContext userContext, String goodsAllocationId, String transportTaskId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithTransportTask(goodsAllocation, transportTaskId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with retail_store in Goods
	protected GoodsAllocation breakWithGoodsByRetailStore(RetailscmUserContext userContext, String goodsAllocationId, String retailStoreId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithRetailStore(goodsAllocation, retailStoreId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with biz_order in Goods
	protected GoodsAllocation breakWithGoodsByBizOrder(RetailscmUserContext userContext, String goodsAllocationId, String bizOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithBizOrder(goodsAllocation, bizOrderId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}
	//disconnect GoodsAllocation with retail_store_order in Goods
	protected GoodsAllocation breakWithGoodsByRetailStoreOrder(RetailscmUserContext userContext, String goodsAllocationId, String retailStoreOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());

			synchronized(goodsAllocation){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				goodsAllocationDaoOf(userContext).planToRemoveGoodsListWithRetailStoreOrder(goodsAllocation, retailStoreOrderId, this.emptyOptions());

				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				return goodsAllocation;
			}
	}






	protected void checkParamsForAddingGoods(RetailscmUserContext userContext, String goodsAllocationId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);

		
		checkerOf(userContext).checkNameOfGoods(name);
		
		checkerOf(userContext).checkRfidOfGoods(rfid);
		
		checkerOf(userContext).checkUomOfGoods(uom);
		
		checkerOf(userContext).checkMaxPackageOfGoods(maxPackage);
		
		checkerOf(userContext).checkExpireTimeOfGoods(expireTime);
		
		checkerOf(userContext).checkSkuIdOfGoods(skuId);
		
		checkerOf(userContext).checkReceivingSpaceIdOfGoods(receivingSpaceId);
		
		checkerOf(userContext).checkSmartPalletIdOfGoods(smartPalletId);
		
		checkerOf(userContext).checkShippingSpaceIdOfGoods(shippingSpaceId);
		
		checkerOf(userContext).checkTransportTaskIdOfGoods(transportTaskId);
		
		checkerOf(userContext).checkRetailStoreIdOfGoods(retailStoreId);
		
		checkerOf(userContext).checkBizOrderIdOfGoods(bizOrderId);
		
		checkerOf(userContext).checkRetailStoreOrderIdOfGoods(retailStoreOrderId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);


	}
	public  GoodsAllocation addGoods(RetailscmUserContext userContext, String goodsAllocationId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoods(userContext,goodsAllocationId,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, bizOrderId, retailStoreOrderId,tokensExpr);

		Goods goods = createGoods(userContext,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, smartPalletId, shippingSpaceId, transportTaskId, retailStoreId, bizOrderId, retailStoreOrderId);

		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, emptyOptions());
		synchronized(goodsAllocation){
			//Will be good when the goodsAllocation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsAllocation.addGoods( goods );
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, goods);
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsProperties(RetailscmUserContext userContext, String goodsAllocationId,String id,String name,String rfid,String uom,int maxPackage,Date expireTime,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).checkIdOfGoods(id);

		checkerOf(userContext).checkNameOfGoods( name);
		checkerOf(userContext).checkRfidOfGoods( rfid);
		checkerOf(userContext).checkUomOfGoods( uom);
		checkerOf(userContext).checkMaxPackageOfGoods( maxPackage);
		checkerOf(userContext).checkExpireTimeOfGoods( expireTime);

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

	}
	public  GoodsAllocation updateGoodsProperties(RetailscmUserContext userContext, String goodsAllocationId, String id,String name,String rfid,String uom,int maxPackage,Date expireTime, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsProperties(userContext,goodsAllocationId,id,name,rfid,uom,maxPackage,expireTime,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsListList()
				.searchGoodsListWith(Goods.ID_PROPERTY, "is", id).done();

		GoodsAllocation goodsAllocationToUpdate = loadGoodsAllocation(userContext, goodsAllocationId, options);

		if(goodsAllocationToUpdate.getGoodsList().isEmpty()){
			throw new GoodsAllocationManagerException("Goods is NOT FOUND with id: '"+id+"'");
		}

		Goods item = goodsAllocationToUpdate.getGoodsList().first();

		item.updateName( name );
		item.updateRfid( rfid );
		item.updateUom( uom );
		item.updateMaxPackage( maxPackage );
		item.updateExpireTime( expireTime );


		//checkParamsForAddingGoods(userContext,goodsAllocationId,name, code, used,tokensExpr);
		GoodsAllocation goodsAllocation = saveGoodsAllocation(userContext, goodsAllocationToUpdate, tokens().withGoodsList().done());
		synchronized(goodsAllocation){
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
		}
	}


	protected Goods createGoods(RetailscmUserContext userContext, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String smartPalletId, String shippingSpaceId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId) throws Exception{

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

	protected void checkParamsForRemovingGoodsList(RetailscmUserContext userContext, String goodsAllocationId,
			String goodsIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		for(String goodsIdItem: goodsIds){
			checkerOf(userContext).checkIdOfGoods(goodsIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

	}
	public  GoodsAllocation removeGoodsList(RetailscmUserContext userContext, String goodsAllocationId,
			String goodsIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsList(userContext, goodsAllocationId,  goodsIds, tokensExpr);


			GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());
			synchronized(goodsAllocation){
				//Will be good when the goodsAllocation loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				goodsAllocationDaoOf(userContext).planToRemoveGoodsList(goodsAllocation, goodsIds, allTokens());
				goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
				deleteRelationListInGraph(userContext, goodsAllocation.getGoodsList());
				return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoods(RetailscmUserContext userContext, String goodsAllocationId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsAllocation( goodsAllocationId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

	}
	public  GoodsAllocation removeGoods(RetailscmUserContext userContext, String goodsAllocationId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoods(userContext,goodsAllocationId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());
		synchronized(goodsAllocation){
			//Will be good when the goodsAllocation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsAllocation.removeGoods( goods );
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
			deleteRelationInGraph(userContext, goods);
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoods(RetailscmUserContext userContext, String goodsAllocationId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsAllocation( goodsAllocationId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

	}
	public  GoodsAllocation copyGoodsFrom(RetailscmUserContext userContext, String goodsAllocationId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoods(userContext,goodsAllocationId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, allTokens());
		synchronized(goodsAllocation){
			//Will be good when the goodsAllocation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			goodsAllocation.copyGoodsFrom( goods );
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, (Goods)goodsAllocation.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoods(RetailscmUserContext userContext, String goodsAllocationId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsAllocationManagerException.class);

	}

	public  GoodsAllocation updateGoods(RetailscmUserContext userContext, String goodsAllocationId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoods(userContext, goodsAllocationId, goodsId, goodsVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsList().searchGoodsListWith(Goods.ID_PROPERTY, "eq", goodsId).done();



		GoodsAllocation goodsAllocation = loadGoodsAllocation(userContext, goodsAllocationId, loadTokens);

		synchronized(goodsAllocation){
			//Will be good when the goodsAllocation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//goodsAllocation.removeGoods( goods );
			//make changes to AcceleraterAccount.
			Goods goodsIndex = createIndexedGoods(goodsId, goodsVersion);

			Goods goods = goodsAllocation.findTheGoods(goodsIndex);
			if(goods == null){
				throw new GoodsAllocationManagerException(goods+" is NOT FOUND" );
			}

			goods.changeProperty(property, newValueExpr);
			
			goodsAllocation = saveGoodsAllocation(userContext, goodsAllocation, tokens().withGoodsList().done());
			return present(userContext,goodsAllocation, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, GoodsAllocation newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



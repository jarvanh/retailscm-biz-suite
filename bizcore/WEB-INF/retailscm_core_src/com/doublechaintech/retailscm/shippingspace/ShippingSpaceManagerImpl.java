
package com.doublechaintech.retailscm.shippingspace;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.goods.Goods;
import com.doublechaintech.retailscm.warehouse.Warehouse;

import com.doublechaintech.retailscm.warehouse.CandidateWarehouse;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.sku.Sku;
import com.doublechaintech.retailscm.receivingspace.ReceivingSpace;
import com.doublechaintech.retailscm.smartpallet.SmartPallet;
import com.doublechaintech.retailscm.shippingspace.ShippingSpace;
import com.doublechaintech.retailscm.transporttask.TransportTask;
import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;






public class ShippingSpaceManagerImpl extends CustomRetailscmCheckerManager implements ShippingSpaceManager {

  


	private static final String SERVICE_TYPE = "ShippingSpace";
	@Override
	public ShippingSpaceDAO daoOf(RetailscmUserContext userContext) {
		return shippingSpaceDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws ShippingSpaceManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new ShippingSpaceManagerException(message);

	}



 	protected ShippingSpace saveShippingSpace(RetailscmUserContext userContext, ShippingSpace shippingSpace, String [] tokensExpr) throws Exception{	
 		//return getShippingSpaceDAO().save(shippingSpace, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveShippingSpace(userContext, shippingSpace, tokens);
 	}
 	
 	protected ShippingSpace saveShippingSpaceDetail(RetailscmUserContext userContext, ShippingSpace shippingSpace) throws Exception{	

 		
 		return saveShippingSpace(userContext, shippingSpace, allTokens());
 	}
 	
 	public ShippingSpace loadShippingSpace(RetailscmUserContext userContext, String shippingSpaceId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		checkerOf(userContext).throwExceptionIfHasErrors( ShippingSpaceManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		ShippingSpace shippingSpace = loadShippingSpace( userContext, shippingSpaceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,shippingSpace, tokens);
 	}
 	
 	
 	 public ShippingSpace searchShippingSpace(RetailscmUserContext userContext, String shippingSpaceId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		checkerOf(userContext).throwExceptionIfHasErrors( ShippingSpaceManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		ShippingSpace shippingSpace = loadShippingSpace( userContext, shippingSpaceId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,shippingSpace, tokens);
 	}
 	
 	

 	protected ShippingSpace present(RetailscmUserContext userContext, ShippingSpace shippingSpace, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,shippingSpace,tokens);
		
		
		ShippingSpace  shippingSpaceToPresent = shippingSpaceDaoOf(userContext).present(shippingSpace, tokens);
		
		List<BaseEntity> entityListToNaming = shippingSpaceToPresent.collectRefercencesFromLists();
		shippingSpaceDaoOf(userContext).alias(entityListToNaming);
		
		return  shippingSpaceToPresent;
		
		
	}
 
 	
 	
 	public ShippingSpace loadShippingSpaceDetail(RetailscmUserContext userContext, String shippingSpaceId) throws Exception{	
 		ShippingSpace shippingSpace = loadShippingSpace( userContext, shippingSpaceId, allTokens());
 		return present(userContext,shippingSpace, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String shippingSpaceId) throws Exception{	
 		ShippingSpace shippingSpace = loadShippingSpace( userContext, shippingSpaceId, viewTokens());
 		return present(userContext,shippingSpace, allTokens());
		
 	}
 	protected ShippingSpace saveShippingSpace(RetailscmUserContext userContext, ShippingSpace shippingSpace, Map<String,Object>tokens) throws Exception{	
 		return shippingSpaceDaoOf(userContext).save(shippingSpace, tokens);
 	}
 	protected ShippingSpace loadShippingSpace(RetailscmUserContext userContext, String shippingSpaceId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		checkerOf(userContext).throwExceptionIfHasErrors( ShippingSpaceManagerException.class);

 
 		return shippingSpaceDaoOf(userContext).load(shippingSpaceId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, ShippingSpace shippingSpace, Map<String, Object> tokens){
		super.addActions(userContext, shippingSpace, tokens);
		
		addAction(userContext, shippingSpace, tokens,"@create","createShippingSpace","createShippingSpace/","main","primary");
		addAction(userContext, shippingSpace, tokens,"@update","updateShippingSpace","updateShippingSpace/"+shippingSpace.getId()+"/","main","primary");
		addAction(userContext, shippingSpace, tokens,"@copy","cloneShippingSpace","cloneShippingSpace/"+shippingSpace.getId()+"/","main","primary");
		
		addAction(userContext, shippingSpace, tokens,"shipping_space.transfer_to_warehouse","transferToAnotherWarehouse","transferToAnotherWarehouse/"+shippingSpace.getId()+"/","main","primary");
		addAction(userContext, shippingSpace, tokens,"shipping_space.addGoods","addGoods","addGoods/"+shippingSpace.getId()+"/","goodsList","primary");
		addAction(userContext, shippingSpace, tokens,"shipping_space.removeGoods","removeGoods","removeGoods/"+shippingSpace.getId()+"/","goodsList","primary");
		addAction(userContext, shippingSpace, tokens,"shipping_space.updateGoods","updateGoods","updateGoods/"+shippingSpace.getId()+"/","goodsList","primary");
		addAction(userContext, shippingSpace, tokens,"shipping_space.copyGoodsFrom","copyGoodsFrom","copyGoodsFrom/"+shippingSpace.getId()+"/","goodsList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, ShippingSpace shippingSpace, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public ShippingSpace createShippingSpace(RetailscmUserContext userContext, String location,String contactNumber,String totalArea,String warehouseId,BigDecimal latitude,BigDecimal longitude,String description) throws Exception
	//public ShippingSpace createShippingSpace(RetailscmUserContext userContext,String location, String contactNumber, String totalArea, String warehouseId, BigDecimal latitude, BigDecimal longitude, String description) throws Exception
	{

		

		

		checkerOf(userContext).checkLocationOfShippingSpace(location);
		checkerOf(userContext).checkContactNumberOfShippingSpace(contactNumber);
		checkerOf(userContext).checkTotalAreaOfShippingSpace(totalArea);
		checkerOf(userContext).checkLatitudeOfShippingSpace(latitude);
		checkerOf(userContext).checkLongitudeOfShippingSpace(longitude);
		checkerOf(userContext).checkDescriptionOfShippingSpace(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);


		ShippingSpace shippingSpace=createNewShippingSpace();	

		shippingSpace.setLocation(location);
		shippingSpace.setContactNumber(contactNumber);
		shippingSpace.setTotalArea(totalArea);
			
		Warehouse warehouse = loadWarehouse(userContext, warehouseId,emptyOptions());
		shippingSpace.setWarehouse(warehouse);
		
		
		shippingSpace.setLatitude(latitude);
		shippingSpace.setLongitude(longitude);
		shippingSpace.setDescription(description);
		shippingSpace.setLastUpdateTime(userContext.now());

		shippingSpace = saveShippingSpace(userContext, shippingSpace, emptyOptions());
		
		onNewInstanceCreated(userContext, shippingSpace);
		return shippingSpace;


	}
	protected ShippingSpace createNewShippingSpace()
	{

		return new ShippingSpace();
	}

	protected void checkParamsForUpdatingShippingSpace(RetailscmUserContext userContext,String shippingSpaceId, int shippingSpaceVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		checkerOf(userContext).checkVersionOfShippingSpace( shippingSpaceVersion);
		

		if(ShippingSpace.LOCATION_PROPERTY.equals(property)){
			checkerOf(userContext).checkLocationOfShippingSpace(parseString(newValueExpr));
		}
		if(ShippingSpace.CONTACT_NUMBER_PROPERTY.equals(property)){
			checkerOf(userContext).checkContactNumberOfShippingSpace(parseString(newValueExpr));
		}
		if(ShippingSpace.TOTAL_AREA_PROPERTY.equals(property)){
			checkerOf(userContext).checkTotalAreaOfShippingSpace(parseString(newValueExpr));
		}		

		
		if(ShippingSpace.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfShippingSpace(parseBigDecimal(newValueExpr));
		}
		if(ShippingSpace.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfShippingSpace(parseBigDecimal(newValueExpr));
		}
		if(ShippingSpace.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfShippingSpace(parseString(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);


	}



	public ShippingSpace clone(RetailscmUserContext userContext, String fromShippingSpaceId) throws Exception{

		return shippingSpaceDaoOf(userContext).clone(fromShippingSpaceId, this.allTokens());
	}

	public ShippingSpace internalSaveShippingSpace(RetailscmUserContext userContext, ShippingSpace shippingSpace) throws Exception
	{
		return internalSaveShippingSpace(userContext, shippingSpace, allTokens());

	}
	public ShippingSpace internalSaveShippingSpace(RetailscmUserContext userContext, ShippingSpace shippingSpace, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingShippingSpace(userContext, shippingSpaceId, shippingSpaceVersion, property, newValueExpr, tokensExpr);


		synchronized(shippingSpace){
			//will be good when the shippingSpace loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ShippingSpace.
			if (shippingSpace.isChanged()){
			shippingSpace.updateLastUpdateTime(userContext.now());
			}
			shippingSpace = saveShippingSpace(userContext, shippingSpace, options);
			return shippingSpace;

		}

	}

	public ShippingSpace updateShippingSpace(RetailscmUserContext userContext,String shippingSpaceId, int shippingSpaceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingShippingSpace(userContext, shippingSpaceId, shippingSpaceVersion, property, newValueExpr, tokensExpr);



		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());
		if(shippingSpace.getVersion() != shippingSpaceVersion){
			String message = "The target version("+shippingSpace.getVersion()+") is not equals to version("+shippingSpaceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(shippingSpace){
			//will be good when the shippingSpace loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ShippingSpace.
			shippingSpace.updateLastUpdateTime(userContext.now());
			shippingSpace.changeProperty(property, newValueExpr);
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().done());
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
			//return saveShippingSpace(userContext, shippingSpace, tokens().done());
		}

	}

	public ShippingSpace updateShippingSpaceProperty(RetailscmUserContext userContext,String shippingSpaceId, int shippingSpaceVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingShippingSpace(userContext, shippingSpaceId, shippingSpaceVersion, property, newValueExpr, tokensExpr);

		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());
		if(shippingSpace.getVersion() != shippingSpaceVersion){
			String message = "The target version("+shippingSpace.getVersion()+") is not equals to version("+shippingSpaceVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(shippingSpace){
			//will be good when the shippingSpace loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to ShippingSpace.

			shippingSpace.changeProperty(property, newValueExpr);
			shippingSpace.updateLastUpdateTime(userContext.now());
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().done());
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
			//return saveShippingSpace(userContext, shippingSpace, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected ShippingSpaceTokens tokens(){
		return ShippingSpaceTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return ShippingSpaceTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortGoodsListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return ShippingSpaceTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherWarehouse(RetailscmUserContext userContext, String shippingSpaceId, String anotherWarehouseId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
 		checkerOf(userContext).checkIdOfWarehouse(anotherWarehouseId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

 	}
 	public ShippingSpace transferToAnotherWarehouse(RetailscmUserContext userContext, String shippingSpaceId, String anotherWarehouseId) throws Exception
 	{
 		checkParamsForTransferingAnotherWarehouse(userContext, shippingSpaceId,anotherWarehouseId);
 
		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());	
		synchronized(shippingSpace){
			//will be good when the shippingSpace loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Warehouse warehouse = loadWarehouse(userContext, anotherWarehouseId, emptyOptions());		
			shippingSpace.updateWarehouse(warehouse);		
			shippingSpace = saveShippingSpace(userContext, shippingSpace, emptyOptions());
			
			return present(userContext,shippingSpace, allTokens());
			
		}

 	}

	


	public CandidateWarehouse requestCandidateWarehouse(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateWarehouse result = new CandidateWarehouse();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("location");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<Warehouse> candidateList = warehouseDaoOf(userContext).requestCandidateWarehouseForShippingSpace(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected Warehouse loadWarehouse(RetailscmUserContext userContext, String newWarehouseId, Map<String,Object> options) throws Exception
 	{

 		return warehouseDaoOf(userContext).load(newWarehouseId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String shippingSpaceId, int shippingSpaceVersion) throws Exception {
		//deleteInternal(userContext, shippingSpaceId, shippingSpaceVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String shippingSpaceId, int shippingSpaceVersion) throws Exception{

		shippingSpaceDaoOf(userContext).delete(shippingSpaceId, shippingSpaceVersion);
	}

	public ShippingSpace forgetByAll(RetailscmUserContext userContext, String shippingSpaceId, int shippingSpaceVersion) throws Exception {
		return forgetByAllInternal(userContext, shippingSpaceId, shippingSpaceVersion);
	}
	protected ShippingSpace forgetByAllInternal(RetailscmUserContext userContext,
			String shippingSpaceId, int shippingSpaceVersion) throws Exception{

		return shippingSpaceDaoOf(userContext).disconnectFromAll(shippingSpaceId, shippingSpaceVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new ShippingSpaceManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return shippingSpaceDaoOf(userContext).deleteAll();
	}


	//disconnect ShippingSpace with sku in Goods
	protected ShippingSpace breakWithGoodsBySku(RetailscmUserContext userContext, String shippingSpaceId, String skuId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithSku(shippingSpace, skuId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with receiving_space in Goods
	protected ShippingSpace breakWithGoodsByReceivingSpace(RetailscmUserContext userContext, String shippingSpaceId, String receivingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithReceivingSpace(shippingSpace, receivingSpaceId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with goods_allocation in Goods
	protected ShippingSpace breakWithGoodsByGoodsAllocation(RetailscmUserContext userContext, String shippingSpaceId, String goodsAllocationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithGoodsAllocation(shippingSpace, goodsAllocationId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with smart_pallet in Goods
	protected ShippingSpace breakWithGoodsBySmartPallet(RetailscmUserContext userContext, String shippingSpaceId, String smartPalletId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithSmartPallet(shippingSpace, smartPalletId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with transport_task in Goods
	protected ShippingSpace breakWithGoodsByTransportTask(RetailscmUserContext userContext, String shippingSpaceId, String transportTaskId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithTransportTask(shippingSpace, transportTaskId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with retail_store in Goods
	protected ShippingSpace breakWithGoodsByRetailStore(RetailscmUserContext userContext, String shippingSpaceId, String retailStoreId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithRetailStore(shippingSpace, retailStoreId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with biz_order in Goods
	protected ShippingSpace breakWithGoodsByBizOrder(RetailscmUserContext userContext, String shippingSpaceId, String bizOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithBizOrder(shippingSpace, bizOrderId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}
	//disconnect ShippingSpace with retail_store_order in Goods
	protected ShippingSpace breakWithGoodsByRetailStoreOrder(RetailscmUserContext userContext, String shippingSpaceId, String retailStoreOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());

			synchronized(shippingSpace){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				shippingSpaceDaoOf(userContext).planToRemoveGoodsListWithRetailStoreOrder(shippingSpace, retailStoreOrderId, this.emptyOptions());

				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				return shippingSpace;
			}
	}






	protected void checkParamsForAddingGoods(RetailscmUserContext userContext, String shippingSpaceId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);

		
		checkerOf(userContext).checkNameOfGoods(name);
		
		checkerOf(userContext).checkRfidOfGoods(rfid);
		
		checkerOf(userContext).checkUomOfGoods(uom);
		
		checkerOf(userContext).checkMaxPackageOfGoods(maxPackage);
		
		checkerOf(userContext).checkExpireTimeOfGoods(expireTime);
		
		checkerOf(userContext).checkSkuIdOfGoods(skuId);
		
		checkerOf(userContext).checkReceivingSpaceIdOfGoods(receivingSpaceId);
		
		checkerOf(userContext).checkGoodsAllocationIdOfGoods(goodsAllocationId);
		
		checkerOf(userContext).checkSmartPalletIdOfGoods(smartPalletId);
		
		checkerOf(userContext).checkTransportTaskIdOfGoods(transportTaskId);
		
		checkerOf(userContext).checkRetailStoreIdOfGoods(retailStoreId);
		
		checkerOf(userContext).checkBizOrderIdOfGoods(bizOrderId);
		
		checkerOf(userContext).checkRetailStoreOrderIdOfGoods(retailStoreOrderId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);


	}
	public  ShippingSpace addGoods(RetailscmUserContext userContext, String shippingSpaceId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoods(userContext,shippingSpaceId,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, transportTaskId, retailStoreId, bizOrderId, retailStoreOrderId,tokensExpr);

		Goods goods = createGoods(userContext,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, transportTaskId, retailStoreId, bizOrderId, retailStoreOrderId);

		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, emptyOptions());
		synchronized(shippingSpace){
			//Will be good when the shippingSpace loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			shippingSpace.addGoods( goods );
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, goods);
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsProperties(RetailscmUserContext userContext, String shippingSpaceId,String id,String name,String rfid,String uom,int maxPackage,Date expireTime,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		checkerOf(userContext).checkIdOfGoods(id);

		checkerOf(userContext).checkNameOfGoods( name);
		checkerOf(userContext).checkRfidOfGoods( rfid);
		checkerOf(userContext).checkUomOfGoods( uom);
		checkerOf(userContext).checkMaxPackageOfGoods( maxPackage);
		checkerOf(userContext).checkExpireTimeOfGoods( expireTime);

		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

	}
	public  ShippingSpace updateGoodsProperties(RetailscmUserContext userContext, String shippingSpaceId, String id,String name,String rfid,String uom,int maxPackage,Date expireTime, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsProperties(userContext,shippingSpaceId,id,name,rfid,uom,maxPackage,expireTime,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsListList()
				.searchGoodsListWith(Goods.ID_PROPERTY, "is", id).done();

		ShippingSpace shippingSpaceToUpdate = loadShippingSpace(userContext, shippingSpaceId, options);

		if(shippingSpaceToUpdate.getGoodsList().isEmpty()){
			throw new ShippingSpaceManagerException("Goods is NOT FOUND with id: '"+id+"'");
		}

		Goods item = shippingSpaceToUpdate.getGoodsList().first();

		item.updateName( name );
		item.updateRfid( rfid );
		item.updateUom( uom );
		item.updateMaxPackage( maxPackage );
		item.updateExpireTime( expireTime );


		//checkParamsForAddingGoods(userContext,shippingSpaceId,name, code, used,tokensExpr);
		ShippingSpace shippingSpace = saveShippingSpace(userContext, shippingSpaceToUpdate, tokens().withGoodsList().done());
		synchronized(shippingSpace){
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
		}
	}


	protected Goods createGoods(RetailscmUserContext userContext, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String transportTaskId, String retailStoreId, String bizOrderId, String retailStoreOrderId) throws Exception{

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

	protected void checkParamsForRemovingGoodsList(RetailscmUserContext userContext, String shippingSpaceId,
			String goodsIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
		for(String goodsIdItem: goodsIds){
			checkerOf(userContext).checkIdOfGoods(goodsIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

	}
	public  ShippingSpace removeGoodsList(RetailscmUserContext userContext, String shippingSpaceId,
			String goodsIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsList(userContext, shippingSpaceId,  goodsIds, tokensExpr);


			ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());
			synchronized(shippingSpace){
				//Will be good when the shippingSpace loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				shippingSpaceDaoOf(userContext).planToRemoveGoodsList(shippingSpace, goodsIds, allTokens());
				shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
				deleteRelationListInGraph(userContext, shippingSpace.getGoodsList());
				return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoods(RetailscmUserContext userContext, String shippingSpaceId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfShippingSpace( shippingSpaceId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

	}
	public  ShippingSpace removeGoods(RetailscmUserContext userContext, String shippingSpaceId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoods(userContext,shippingSpaceId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());
		synchronized(shippingSpace){
			//Will be good when the shippingSpace loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			shippingSpace.removeGoods( goods );
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
			deleteRelationInGraph(userContext, goods);
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoods(RetailscmUserContext userContext, String shippingSpaceId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfShippingSpace( shippingSpaceId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

	}
	public  ShippingSpace copyGoodsFrom(RetailscmUserContext userContext, String shippingSpaceId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoods(userContext,shippingSpaceId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, allTokens());
		synchronized(shippingSpace){
			//Will be good when the shippingSpace loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			shippingSpace.copyGoodsFrom( goods );
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, (Goods)shippingSpace.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoods(RetailscmUserContext userContext, String shippingSpaceId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfShippingSpace(shippingSpaceId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(ShippingSpaceManagerException.class);

	}

	public  ShippingSpace updateGoods(RetailscmUserContext userContext, String shippingSpaceId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoods(userContext, shippingSpaceId, goodsId, goodsVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsList().searchGoodsListWith(Goods.ID_PROPERTY, "eq", goodsId).done();



		ShippingSpace shippingSpace = loadShippingSpace(userContext, shippingSpaceId, loadTokens);

		synchronized(shippingSpace){
			//Will be good when the shippingSpace loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//shippingSpace.removeGoods( goods );
			//make changes to AcceleraterAccount.
			Goods goodsIndex = createIndexedGoods(goodsId, goodsVersion);

			Goods goods = shippingSpace.findTheGoods(goodsIndex);
			if(goods == null){
				throw new ShippingSpaceManagerException(goods+" is NOT FOUND" );
			}

			goods.changeProperty(property, newValueExpr);
			
			shippingSpace = saveShippingSpace(userContext, shippingSpace, tokens().withGoodsList().done());
			return present(userContext,shippingSpace, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, ShippingSpace newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



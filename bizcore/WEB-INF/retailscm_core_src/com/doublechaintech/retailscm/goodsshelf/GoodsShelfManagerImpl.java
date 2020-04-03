
package com.doublechaintech.retailscm.goodsshelf;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.supplierspace.SupplierSpace;
import com.doublechaintech.retailscm.damagespace.DamageSpace;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.goodsshelfstockcount.GoodsShelfStockCount;
import com.doublechaintech.retailscm.storagespace.StorageSpace;

import com.doublechaintech.retailscm.supplierspace.CandidateSupplierSpace;
import com.doublechaintech.retailscm.damagespace.CandidateDamageSpace;
import com.doublechaintech.retailscm.storagespace.CandidateStorageSpace;

import com.doublechaintech.retailscm.goodsshelf.GoodsShelf;






public class GoodsShelfManagerImpl extends CustomRetailscmCheckerManager implements GoodsShelfManager {

  


	private static final String SERVICE_TYPE = "GoodsShelf";
	@Override
	public GoodsShelfDAO daoOf(RetailscmUserContext userContext) {
		return goodsShelfDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws GoodsShelfManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new GoodsShelfManagerException(message);

	}



 	protected GoodsShelf saveGoodsShelf(RetailscmUserContext userContext, GoodsShelf goodsShelf, String [] tokensExpr) throws Exception{	
 		//return getGoodsShelfDAO().save(goodsShelf, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveGoodsShelf(userContext, goodsShelf, tokens);
 	}
 	
 	protected GoodsShelf saveGoodsShelfDetail(RetailscmUserContext userContext, GoodsShelf goodsShelf) throws Exception{	

 		
 		return saveGoodsShelf(userContext, goodsShelf, allTokens());
 	}
 	
 	public GoodsShelf loadGoodsShelf(RetailscmUserContext userContext, String goodsShelfId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsShelfManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		GoodsShelf goodsShelf = loadGoodsShelf( userContext, goodsShelfId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsShelf, tokens);
 	}
 	
 	
 	 public GoodsShelf searchGoodsShelf(RetailscmUserContext userContext, String goodsShelfId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsShelfManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		GoodsShelf goodsShelf = loadGoodsShelf( userContext, goodsShelfId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsShelf, tokens);
 	}
 	
 	

 	protected GoodsShelf present(RetailscmUserContext userContext, GoodsShelf goodsShelf, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,goodsShelf,tokens);
		
		
		GoodsShelf  goodsShelfToPresent = goodsShelfDaoOf(userContext).present(goodsShelf, tokens);
		
		List<BaseEntity> entityListToNaming = goodsShelfToPresent.collectRefercencesFromLists();
		goodsShelfDaoOf(userContext).alias(entityListToNaming);
		
		return  goodsShelfToPresent;
		
		
	}
 
 	
 	
 	public GoodsShelf loadGoodsShelfDetail(RetailscmUserContext userContext, String goodsShelfId) throws Exception{	
 		GoodsShelf goodsShelf = loadGoodsShelf( userContext, goodsShelfId, allTokens());
 		return present(userContext,goodsShelf, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String goodsShelfId) throws Exception{	
 		GoodsShelf goodsShelf = loadGoodsShelf( userContext, goodsShelfId, viewTokens());
 		return present(userContext,goodsShelf, allTokens());
		
 	}
 	protected GoodsShelf saveGoodsShelf(RetailscmUserContext userContext, GoodsShelf goodsShelf, Map<String,Object>tokens) throws Exception{	
 		return goodsShelfDaoOf(userContext).save(goodsShelf, tokens);
 	}
 	protected GoodsShelf loadGoodsShelf(RetailscmUserContext userContext, String goodsShelfId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsShelfManagerException.class);

 
 		return goodsShelfDaoOf(userContext).load(goodsShelfId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsShelf goodsShelf, Map<String, Object> tokens){
		super.addActions(userContext, goodsShelf, tokens);
		
		addAction(userContext, goodsShelf, tokens,"@create","createGoodsShelf","createGoodsShelf/","main","primary");
		addAction(userContext, goodsShelf, tokens,"@update","updateGoodsShelf","updateGoodsShelf/"+goodsShelf.getId()+"/","main","primary");
		addAction(userContext, goodsShelf, tokens,"@copy","cloneGoodsShelf","cloneGoodsShelf/"+goodsShelf.getId()+"/","main","primary");
		
		addAction(userContext, goodsShelf, tokens,"goods_shelf.transfer_to_storage_space","transferToAnotherStorageSpace","transferToAnotherStorageSpace/"+goodsShelf.getId()+"/","main","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.transfer_to_supplier_space","transferToAnotherSupplierSpace","transferToAnotherSupplierSpace/"+goodsShelf.getId()+"/","main","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.transfer_to_damage_space","transferToAnotherDamageSpace","transferToAnotherDamageSpace/"+goodsShelf.getId()+"/","main","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.addGoodsShelfStockCount","addGoodsShelfStockCount","addGoodsShelfStockCount/"+goodsShelf.getId()+"/","goodsShelfStockCountList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.removeGoodsShelfStockCount","removeGoodsShelfStockCount","removeGoodsShelfStockCount/"+goodsShelf.getId()+"/","goodsShelfStockCountList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.updateGoodsShelfStockCount","updateGoodsShelfStockCount","updateGoodsShelfStockCount/"+goodsShelf.getId()+"/","goodsShelfStockCountList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.copyGoodsShelfStockCountFrom","copyGoodsShelfStockCountFrom","copyGoodsShelfStockCountFrom/"+goodsShelf.getId()+"/","goodsShelfStockCountList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.addGoodsAllocation","addGoodsAllocation","addGoodsAllocation/"+goodsShelf.getId()+"/","goodsAllocationList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.removeGoodsAllocation","removeGoodsAllocation","removeGoodsAllocation/"+goodsShelf.getId()+"/","goodsAllocationList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.updateGoodsAllocation","updateGoodsAllocation","updateGoodsAllocation/"+goodsShelf.getId()+"/","goodsAllocationList","primary");
		addAction(userContext, goodsShelf, tokens,"goods_shelf.copyGoodsAllocationFrom","copyGoodsAllocationFrom","copyGoodsAllocationFrom/"+goodsShelf.getId()+"/","goodsAllocationList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsShelf goodsShelf, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public GoodsShelf createGoodsShelf(RetailscmUserContext userContext, String location,String storageSpaceId,String supplierSpaceId,String damageSpaceId) throws Exception
	//public GoodsShelf createGoodsShelf(RetailscmUserContext userContext,String location, String storageSpaceId, String supplierSpaceId, String damageSpaceId) throws Exception
	{

		

		

		checkerOf(userContext).checkLocationOfGoodsShelf(location);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);


		GoodsShelf goodsShelf=createNewGoodsShelf();	

		goodsShelf.setLocation(location);
			
		StorageSpace storageSpace = loadStorageSpace(userContext, storageSpaceId,emptyOptions());
		goodsShelf.setStorageSpace(storageSpace);
		
		
			
		SupplierSpace supplierSpace = loadSupplierSpace(userContext, supplierSpaceId,emptyOptions());
		goodsShelf.setSupplierSpace(supplierSpace);
		
		
			
		DamageSpace damageSpace = loadDamageSpace(userContext, damageSpaceId,emptyOptions());
		goodsShelf.setDamageSpace(damageSpace);
		
		
		goodsShelf.setLastUpdateTime(userContext.now());

		goodsShelf = saveGoodsShelf(userContext, goodsShelf, emptyOptions());
		
		onNewInstanceCreated(userContext, goodsShelf);
		return goodsShelf;


	}
	protected GoodsShelf createNewGoodsShelf()
	{

		return new GoodsShelf();
	}

	protected void checkParamsForUpdatingGoodsShelf(RetailscmUserContext userContext,String goodsShelfId, int goodsShelfVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).checkVersionOfGoodsShelf( goodsShelfVersion);
		

		if(GoodsShelf.LOCATION_PROPERTY.equals(property)){
			checkerOf(userContext).checkLocationOfGoodsShelf(parseString(newValueExpr));
		}		

				

				

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);


	}



	public GoodsShelf clone(RetailscmUserContext userContext, String fromGoodsShelfId) throws Exception{

		return goodsShelfDaoOf(userContext).clone(fromGoodsShelfId, this.allTokens());
	}

	public GoodsShelf internalSaveGoodsShelf(RetailscmUserContext userContext, GoodsShelf goodsShelf) throws Exception
	{
		return internalSaveGoodsShelf(userContext, goodsShelf, allTokens());

	}
	public GoodsShelf internalSaveGoodsShelf(RetailscmUserContext userContext, GoodsShelf goodsShelf, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingGoodsShelf(userContext, goodsShelfId, goodsShelfVersion, property, newValueExpr, tokensExpr);


		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsShelf.
			if (goodsShelf.isChanged()){
			goodsShelf.updateLastUpdateTime(userContext.now());
			}
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, options);
			return goodsShelf;

		}

	}

	public GoodsShelf updateGoodsShelf(RetailscmUserContext userContext,String goodsShelfId, int goodsShelfVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsShelf(userContext, goodsShelfId, goodsShelfVersion, property, newValueExpr, tokensExpr);



		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		if(goodsShelf.getVersion() != goodsShelfVersion){
			String message = "The target version("+goodsShelf.getVersion()+") is not equals to version("+goodsShelfVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsShelf.
			goodsShelf.updateLastUpdateTime(userContext.now());
			goodsShelf.changeProperty(property, newValueExpr);
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().done());
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
			//return saveGoodsShelf(userContext, goodsShelf, tokens().done());
		}

	}

	public GoodsShelf updateGoodsShelfProperty(RetailscmUserContext userContext,String goodsShelfId, int goodsShelfVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsShelf(userContext, goodsShelfId, goodsShelfVersion, property, newValueExpr, tokensExpr);

		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		if(goodsShelf.getVersion() != goodsShelfVersion){
			String message = "The target version("+goodsShelf.getVersion()+") is not equals to version("+goodsShelfVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsShelf.

			goodsShelf.changeProperty(property, newValueExpr);
			goodsShelf.updateLastUpdateTime(userContext.now());
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().done());
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
			//return saveGoodsShelf(userContext, goodsShelf, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected GoodsShelfTokens tokens(){
		return GoodsShelfTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return GoodsShelfTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortGoodsShelfStockCountListWith("id","desc")
		.sortGoodsAllocationListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return GoodsShelfTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherStorageSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherStorageSpaceId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
 		checkerOf(userContext).checkIdOfStorageSpace(anotherStorageSpaceId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

 	}
 	public GoodsShelf transferToAnotherStorageSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherStorageSpaceId) throws Exception
 	{
 		checkParamsForTransferingAnotherStorageSpace(userContext, goodsShelfId,anotherStorageSpaceId);
 
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());	
		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			StorageSpace storageSpace = loadStorageSpace(userContext, anotherStorageSpaceId, emptyOptions());		
			goodsShelf.updateStorageSpace(storageSpace);		
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, emptyOptions());
			
			return present(userContext,goodsShelf, allTokens());
			
		}

 	}

	


	public CandidateStorageSpace requestCandidateStorageSpace(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateStorageSpace result = new CandidateStorageSpace();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("location");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<StorageSpace> candidateList = storageSpaceDaoOf(userContext).requestCandidateStorageSpaceForGoodsShelf(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherSupplierSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherSupplierSpaceId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
 		checkerOf(userContext).checkIdOfSupplierSpace(anotherSupplierSpaceId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

 	}
 	public GoodsShelf transferToAnotherSupplierSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherSupplierSpaceId) throws Exception
 	{
 		checkParamsForTransferingAnotherSupplierSpace(userContext, goodsShelfId,anotherSupplierSpaceId);
 
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());	
		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			SupplierSpace supplierSpace = loadSupplierSpace(userContext, anotherSupplierSpaceId, emptyOptions());		
			goodsShelf.updateSupplierSpace(supplierSpace);		
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, emptyOptions());
			
			return present(userContext,goodsShelf, allTokens());
			
		}

 	}

	


	public CandidateSupplierSpace requestCandidateSupplierSpace(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateSupplierSpace result = new CandidateSupplierSpace();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("location");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<SupplierSpace> candidateList = supplierSpaceDaoOf(userContext).requestCandidateSupplierSpaceForGoodsShelf(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherDamageSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherDamageSpaceId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
 		checkerOf(userContext).checkIdOfDamageSpace(anotherDamageSpaceId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

 	}
 	public GoodsShelf transferToAnotherDamageSpace(RetailscmUserContext userContext, String goodsShelfId, String anotherDamageSpaceId) throws Exception
 	{
 		checkParamsForTransferingAnotherDamageSpace(userContext, goodsShelfId,anotherDamageSpaceId);
 
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());	
		synchronized(goodsShelf){
			//will be good when the goodsShelf loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			DamageSpace damageSpace = loadDamageSpace(userContext, anotherDamageSpaceId, emptyOptions());		
			goodsShelf.updateDamageSpace(damageSpace);		
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, emptyOptions());
			
			return present(userContext,goodsShelf, allTokens());
			
		}

 	}

	


	public CandidateDamageSpace requestCandidateDamageSpace(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateDamageSpace result = new CandidateDamageSpace();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("location");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<DamageSpace> candidateList = damageSpaceDaoOf(userContext).requestCandidateDamageSpaceForGoodsShelf(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected SupplierSpace loadSupplierSpace(RetailscmUserContext userContext, String newSupplierSpaceId, Map<String,Object> options) throws Exception
 	{

 		return supplierSpaceDaoOf(userContext).load(newSupplierSpaceId, options);
 	}
 	


	

 	protected DamageSpace loadDamageSpace(RetailscmUserContext userContext, String newDamageSpaceId, Map<String,Object> options) throws Exception
 	{

 		return damageSpaceDaoOf(userContext).load(newDamageSpaceId, options);
 	}
 	


	

 	protected StorageSpace loadStorageSpace(RetailscmUserContext userContext, String newStorageSpaceId, Map<String,Object> options) throws Exception
 	{

 		return storageSpaceDaoOf(userContext).load(newStorageSpaceId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String goodsShelfId, int goodsShelfVersion) throws Exception {
		//deleteInternal(userContext, goodsShelfId, goodsShelfVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String goodsShelfId, int goodsShelfVersion) throws Exception{

		goodsShelfDaoOf(userContext).delete(goodsShelfId, goodsShelfVersion);
	}

	public GoodsShelf forgetByAll(RetailscmUserContext userContext, String goodsShelfId, int goodsShelfVersion) throws Exception {
		return forgetByAllInternal(userContext, goodsShelfId, goodsShelfVersion);
	}
	protected GoodsShelf forgetByAllInternal(RetailscmUserContext userContext,
			String goodsShelfId, int goodsShelfVersion) throws Exception{

		return goodsShelfDaoOf(userContext).disconnectFromAll(goodsShelfId, goodsShelfVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new GoodsShelfManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return goodsShelfDaoOf(userContext).deleteAll();
	}








	protected void checkParamsForAddingGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId, String title, Date countTime, String summary,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);

		
		checkerOf(userContext).checkTitleOfGoodsShelfStockCount(title);
		
		checkerOf(userContext).checkCountTimeOfGoodsShelfStockCount(countTime);
		
		checkerOf(userContext).checkSummaryOfGoodsShelfStockCount(summary);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);


	}
	public  GoodsShelf addGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId, String title, Date countTime, String summary, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoodsShelfStockCount(userContext,goodsShelfId,title, countTime, summary,tokensExpr);

		GoodsShelfStockCount goodsShelfStockCount = createGoodsShelfStockCount(userContext,title, countTime, summary);

		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, emptyOptions());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsShelf.addGoodsShelfStockCount( goodsShelfStockCount );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsShelfStockCountList().done());
			
			userContext.getManagerGroup().getGoodsShelfStockCountManager().onNewInstanceCreated(userContext, goodsShelfStockCount);
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsShelfStockCountProperties(RetailscmUserContext userContext, String goodsShelfId,String id,String title,Date countTime,String summary,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsShelfStockCount(id);

		checkerOf(userContext).checkTitleOfGoodsShelfStockCount( title);
		checkerOf(userContext).checkCountTimeOfGoodsShelfStockCount( countTime);
		checkerOf(userContext).checkSummaryOfGoodsShelfStockCount( summary);

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf updateGoodsShelfStockCountProperties(RetailscmUserContext userContext, String goodsShelfId, String id,String title,Date countTime,String summary, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsShelfStockCountProperties(userContext,goodsShelfId,id,title,countTime,summary,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsShelfStockCountListList()
				.searchGoodsShelfStockCountListWith(GoodsShelfStockCount.ID_PROPERTY, "is", id).done();

		GoodsShelf goodsShelfToUpdate = loadGoodsShelf(userContext, goodsShelfId, options);

		if(goodsShelfToUpdate.getGoodsShelfStockCountList().isEmpty()){
			throw new GoodsShelfManagerException("GoodsShelfStockCount is NOT FOUND with id: '"+id+"'");
		}

		GoodsShelfStockCount item = goodsShelfToUpdate.getGoodsShelfStockCountList().first();

		item.updateTitle( title );
		item.updateCountTime( countTime );
		item.updateSummary( summary );


		//checkParamsForAddingGoodsShelfStockCount(userContext,goodsShelfId,name, code, used,tokensExpr);
		GoodsShelf goodsShelf = saveGoodsShelf(userContext, goodsShelfToUpdate, tokens().withGoodsShelfStockCountList().done());
		synchronized(goodsShelf){
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}
	}


	protected GoodsShelfStockCount createGoodsShelfStockCount(RetailscmUserContext userContext, String title, Date countTime, String summary) throws Exception{

		GoodsShelfStockCount goodsShelfStockCount = new GoodsShelfStockCount();
		
		
		goodsShelfStockCount.setTitle(title);		
		goodsShelfStockCount.setCountTime(countTime);		
		goodsShelfStockCount.setSummary(summary);
	
		
		return goodsShelfStockCount;


	}

	protected GoodsShelfStockCount createIndexedGoodsShelfStockCount(String id, int version){

		GoodsShelfStockCount goodsShelfStockCount = new GoodsShelfStockCount();
		goodsShelfStockCount.setId(id);
		goodsShelfStockCount.setVersion(version);
		return goodsShelfStockCount;

	}

	protected void checkParamsForRemovingGoodsShelfStockCountList(RetailscmUserContext userContext, String goodsShelfId,
			String goodsShelfStockCountIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		for(String goodsShelfStockCountIdItem: goodsShelfStockCountIds){
			checkerOf(userContext).checkIdOfGoodsShelfStockCount(goodsShelfStockCountIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf removeGoodsShelfStockCountList(RetailscmUserContext userContext, String goodsShelfId,
			String goodsShelfStockCountIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsShelfStockCountList(userContext, goodsShelfId,  goodsShelfStockCountIds, tokensExpr);


			GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
			synchronized(goodsShelf){
				//Will be good when the goodsShelf loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				goodsShelfDaoOf(userContext).planToRemoveGoodsShelfStockCountList(goodsShelf, goodsShelfStockCountIds, allTokens());
				goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsShelfStockCountList().done());
				deleteRelationListInGraph(userContext, goodsShelf.getGoodsShelfStockCountList());
				return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId,
		String goodsShelfStockCountId, int goodsShelfStockCountVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsShelf( goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsShelfStockCount(goodsShelfStockCountId);
		checkerOf(userContext).checkVersionOfGoodsShelfStockCount(goodsShelfStockCountVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf removeGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId,
		String goodsShelfStockCountId, int goodsShelfStockCountVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoodsShelfStockCount(userContext,goodsShelfId, goodsShelfStockCountId, goodsShelfStockCountVersion,tokensExpr);

		GoodsShelfStockCount goodsShelfStockCount = createIndexedGoodsShelfStockCount(goodsShelfStockCountId, goodsShelfStockCountVersion);
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsShelf.removeGoodsShelfStockCount( goodsShelfStockCount );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsShelfStockCountList().done());
			deleteRelationInGraph(userContext, goodsShelfStockCount);
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId,
		String goodsShelfStockCountId, int goodsShelfStockCountVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsShelf( goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsShelfStockCount(goodsShelfStockCountId);
		checkerOf(userContext).checkVersionOfGoodsShelfStockCount(goodsShelfStockCountVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf copyGoodsShelfStockCountFrom(RetailscmUserContext userContext, String goodsShelfId,
		String goodsShelfStockCountId, int goodsShelfStockCountVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoodsShelfStockCount(userContext,goodsShelfId, goodsShelfStockCountId, goodsShelfStockCountVersion,tokensExpr);

		GoodsShelfStockCount goodsShelfStockCount = createIndexedGoodsShelfStockCount(goodsShelfStockCountId, goodsShelfStockCountVersion);
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			goodsShelf.copyGoodsShelfStockCountFrom( goodsShelfStockCount );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsShelfStockCountList().done());
			
			userContext.getManagerGroup().getGoodsShelfStockCountManager().onNewInstanceCreated(userContext, (GoodsShelfStockCount)goodsShelf.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId, String goodsShelfStockCountId, int goodsShelfStockCountVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsShelfStockCount(goodsShelfStockCountId);
		checkerOf(userContext).checkVersionOfGoodsShelfStockCount(goodsShelfStockCountVersion);
		

		if(GoodsShelfStockCount.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfGoodsShelfStockCount(parseString(newValueExpr));
		}
		
		if(GoodsShelfStockCount.COUNT_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkCountTimeOfGoodsShelfStockCount(parseDate(newValueExpr));
		}
		
		if(GoodsShelfStockCount.SUMMARY_PROPERTY.equals(property)){
			checkerOf(userContext).checkSummaryOfGoodsShelfStockCount(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}

	public  GoodsShelf updateGoodsShelfStockCount(RetailscmUserContext userContext, String goodsShelfId, String goodsShelfStockCountId, int goodsShelfStockCountVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoodsShelfStockCount(userContext, goodsShelfId, goodsShelfStockCountId, goodsShelfStockCountVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsShelfStockCountList().searchGoodsShelfStockCountListWith(GoodsShelfStockCount.ID_PROPERTY, "eq", goodsShelfStockCountId).done();



		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, loadTokens);

		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//goodsShelf.removeGoodsShelfStockCount( goodsShelfStockCount );
			//make changes to AcceleraterAccount.
			GoodsShelfStockCount goodsShelfStockCountIndex = createIndexedGoodsShelfStockCount(goodsShelfStockCountId, goodsShelfStockCountVersion);

			GoodsShelfStockCount goodsShelfStockCount = goodsShelf.findTheGoodsShelfStockCount(goodsShelfStockCountIndex);
			if(goodsShelfStockCount == null){
				throw new GoodsShelfManagerException(goodsShelfStockCount+" is NOT FOUND" );
			}

			goodsShelfStockCount.changeProperty(property, newValueExpr);
			
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsShelfStockCountList().done());
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId, String location, BigDecimal latitude, BigDecimal longitude,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);

		
		checkerOf(userContext).checkLocationOfGoodsAllocation(location);
		
		checkerOf(userContext).checkLatitudeOfGoodsAllocation(latitude);
		
		checkerOf(userContext).checkLongitudeOfGoodsAllocation(longitude);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);


	}
	public  GoodsShelf addGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId, String location, BigDecimal latitude, BigDecimal longitude, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoodsAllocation(userContext,goodsShelfId,location, latitude, longitude,tokensExpr);

		GoodsAllocation goodsAllocation = createGoodsAllocation(userContext,location, latitude, longitude);

		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, emptyOptions());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsShelf.addGoodsAllocation( goodsAllocation );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsAllocationList().done());
			
			userContext.getManagerGroup().getGoodsAllocationManager().onNewInstanceCreated(userContext, goodsAllocation);
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsAllocationProperties(RetailscmUserContext userContext, String goodsShelfId,String id,String location,BigDecimal latitude,BigDecimal longitude,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsAllocation(id);

		checkerOf(userContext).checkLocationOfGoodsAllocation( location);
		checkerOf(userContext).checkLatitudeOfGoodsAllocation( latitude);
		checkerOf(userContext).checkLongitudeOfGoodsAllocation( longitude);

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf updateGoodsAllocationProperties(RetailscmUserContext userContext, String goodsShelfId, String id,String location,BigDecimal latitude,BigDecimal longitude, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsAllocationProperties(userContext,goodsShelfId,id,location,latitude,longitude,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsAllocationListList()
				.searchGoodsAllocationListWith(GoodsAllocation.ID_PROPERTY, "is", id).done();

		GoodsShelf goodsShelfToUpdate = loadGoodsShelf(userContext, goodsShelfId, options);

		if(goodsShelfToUpdate.getGoodsAllocationList().isEmpty()){
			throw new GoodsShelfManagerException("GoodsAllocation is NOT FOUND with id: '"+id+"'");
		}

		GoodsAllocation item = goodsShelfToUpdate.getGoodsAllocationList().first();

		item.updateLocation( location );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );


		//checkParamsForAddingGoodsAllocation(userContext,goodsShelfId,name, code, used,tokensExpr);
		GoodsShelf goodsShelf = saveGoodsShelf(userContext, goodsShelfToUpdate, tokens().withGoodsAllocationList().done());
		synchronized(goodsShelf){
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}
	}


	protected GoodsAllocation createGoodsAllocation(RetailscmUserContext userContext, String location, BigDecimal latitude, BigDecimal longitude) throws Exception{

		GoodsAllocation goodsAllocation = new GoodsAllocation();
		
		
		goodsAllocation.setLocation(location);		
		goodsAllocation.setLatitude(latitude);		
		goodsAllocation.setLongitude(longitude);
	
		
		return goodsAllocation;


	}

	protected GoodsAllocation createIndexedGoodsAllocation(String id, int version){

		GoodsAllocation goodsAllocation = new GoodsAllocation();
		goodsAllocation.setId(id);
		goodsAllocation.setVersion(version);
		return goodsAllocation;

	}

	protected void checkParamsForRemovingGoodsAllocationList(RetailscmUserContext userContext, String goodsShelfId,
			String goodsAllocationIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		for(String goodsAllocationIdItem: goodsAllocationIds){
			checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf removeGoodsAllocationList(RetailscmUserContext userContext, String goodsShelfId,
			String goodsAllocationIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsAllocationList(userContext, goodsShelfId,  goodsAllocationIds, tokensExpr);


			GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
			synchronized(goodsShelf){
				//Will be good when the goodsShelf loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				goodsShelfDaoOf(userContext).planToRemoveGoodsAllocationList(goodsShelf, goodsAllocationIds, allTokens());
				goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsAllocationList().done());
				deleteRelationListInGraph(userContext, goodsShelf.getGoodsAllocationList());
				return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId,
		String goodsAllocationId, int goodsAllocationVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsShelf( goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).checkVersionOfGoodsAllocation(goodsAllocationVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf removeGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId,
		String goodsAllocationId, int goodsAllocationVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoodsAllocation(userContext,goodsShelfId, goodsAllocationId, goodsAllocationVersion,tokensExpr);

		GoodsAllocation goodsAllocation = createIndexedGoodsAllocation(goodsAllocationId, goodsAllocationVersion);
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			goodsShelf.removeGoodsAllocation( goodsAllocation );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsAllocationList().done());
			deleteRelationInGraph(userContext, goodsAllocation);
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId,
		String goodsAllocationId, int goodsAllocationVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfGoodsShelf( goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).checkVersionOfGoodsAllocation(goodsAllocationVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}
	public  GoodsShelf copyGoodsAllocationFrom(RetailscmUserContext userContext, String goodsShelfId,
		String goodsAllocationId, int goodsAllocationVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoodsAllocation(userContext,goodsShelfId, goodsAllocationId, goodsAllocationVersion,tokensExpr);

		GoodsAllocation goodsAllocation = createIndexedGoodsAllocation(goodsAllocationId, goodsAllocationVersion);
		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, allTokens());
		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			goodsShelf.copyGoodsAllocationFrom( goodsAllocation );
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsAllocationList().done());
			
			userContext.getManagerGroup().getGoodsAllocationManager().onNewInstanceCreated(userContext, (GoodsAllocation)goodsShelf.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId, String goodsAllocationId, int goodsAllocationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfGoodsShelf(goodsShelfId);
		checkerOf(userContext).checkIdOfGoodsAllocation(goodsAllocationId);
		checkerOf(userContext).checkVersionOfGoodsAllocation(goodsAllocationVersion);
		

		if(GoodsAllocation.LOCATION_PROPERTY.equals(property)){
			checkerOf(userContext).checkLocationOfGoodsAllocation(parseString(newValueExpr));
		}
		
		if(GoodsAllocation.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfGoodsAllocation(parseBigDecimal(newValueExpr));
		}
		
		if(GoodsAllocation.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfGoodsAllocation(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsShelfManagerException.class);

	}

	public  GoodsShelf updateGoodsAllocation(RetailscmUserContext userContext, String goodsShelfId, String goodsAllocationId, int goodsAllocationVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoodsAllocation(userContext, goodsShelfId, goodsAllocationId, goodsAllocationVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsAllocationList().searchGoodsAllocationListWith(GoodsAllocation.ID_PROPERTY, "eq", goodsAllocationId).done();



		GoodsShelf goodsShelf = loadGoodsShelf(userContext, goodsShelfId, loadTokens);

		synchronized(goodsShelf){
			//Will be good when the goodsShelf loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//goodsShelf.removeGoodsAllocation( goodsAllocation );
			//make changes to AcceleraterAccount.
			GoodsAllocation goodsAllocationIndex = createIndexedGoodsAllocation(goodsAllocationId, goodsAllocationVersion);

			GoodsAllocation goodsAllocation = goodsShelf.findTheGoodsAllocation(goodsAllocationIndex);
			if(goodsAllocation == null){
				throw new GoodsShelfManagerException(goodsAllocation+" is NOT FOUND" );
			}

			goodsAllocation.changeProperty(property, newValueExpr);
			
			goodsShelf = saveGoodsShelf(userContext, goodsShelf, tokens().withGoodsAllocationList().done());
			return present(userContext,goodsShelf, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, GoodsShelf newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



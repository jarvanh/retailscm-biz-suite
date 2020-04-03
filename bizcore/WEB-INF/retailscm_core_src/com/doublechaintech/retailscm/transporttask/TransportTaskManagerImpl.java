
package com.doublechaintech.retailscm.transporttask;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.goods.Goods;
import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.transporttasktrack.TransportTaskTrack;
import com.doublechaintech.retailscm.transporttruck.TransportTruck;
import com.doublechaintech.retailscm.truckdriver.TruckDriver;
import com.doublechaintech.retailscm.transportfleet.TransportFleet;

import com.doublechaintech.retailscm.retailstore.CandidateRetailStore;
import com.doublechaintech.retailscm.transporttruck.CandidateTransportTruck;
import com.doublechaintech.retailscm.truckdriver.CandidateTruckDriver;
import com.doublechaintech.retailscm.transportfleet.CandidateTransportFleet;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.supplyorder.SupplyOrder;
import com.doublechaintech.retailscm.goodsallocation.GoodsAllocation;
import com.doublechaintech.retailscm.sku.Sku;
import com.doublechaintech.retailscm.receivingspace.ReceivingSpace;
import com.doublechaintech.retailscm.smartpallet.SmartPallet;
import com.doublechaintech.retailscm.shippingspace.ShippingSpace;
import com.doublechaintech.retailscm.transporttask.TransportTask;
import com.doublechaintech.retailscm.retailstoreorder.RetailStoreOrder;






public class TransportTaskManagerImpl extends CustomRetailscmCheckerManager implements TransportTaskManager {

  


	private static final String SERVICE_TYPE = "TransportTask";
	@Override
	public TransportTaskDAO daoOf(RetailscmUserContext userContext) {
		return transportTaskDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws TransportTaskManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new TransportTaskManagerException(message);

	}



 	protected TransportTask saveTransportTask(RetailscmUserContext userContext, TransportTask transportTask, String [] tokensExpr) throws Exception{	
 		//return getTransportTaskDAO().save(transportTask, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveTransportTask(userContext, transportTask, tokens);
 	}
 	
 	protected TransportTask saveTransportTaskDetail(RetailscmUserContext userContext, TransportTask transportTask) throws Exception{	

 		
 		return saveTransportTask(userContext, transportTask, allTokens());
 	}
 	
 	public TransportTask loadTransportTask(RetailscmUserContext userContext, String transportTaskId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).throwExceptionIfHasErrors( TransportTaskManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		TransportTask transportTask = loadTransportTask( userContext, transportTaskId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,transportTask, tokens);
 	}
 	
 	
 	 public TransportTask searchTransportTask(RetailscmUserContext userContext, String transportTaskId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).throwExceptionIfHasErrors( TransportTaskManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		TransportTask transportTask = loadTransportTask( userContext, transportTaskId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,transportTask, tokens);
 	}
 	
 	

 	protected TransportTask present(RetailscmUserContext userContext, TransportTask transportTask, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,transportTask,tokens);
		
		
		TransportTask  transportTaskToPresent = transportTaskDaoOf(userContext).present(transportTask, tokens);
		
		List<BaseEntity> entityListToNaming = transportTaskToPresent.collectRefercencesFromLists();
		transportTaskDaoOf(userContext).alias(entityListToNaming);
		
		return  transportTaskToPresent;
		
		
	}
 
 	
 	
 	public TransportTask loadTransportTaskDetail(RetailscmUserContext userContext, String transportTaskId) throws Exception{	
 		TransportTask transportTask = loadTransportTask( userContext, transportTaskId, allTokens());
 		return present(userContext,transportTask, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String transportTaskId) throws Exception{	
 		TransportTask transportTask = loadTransportTask( userContext, transportTaskId, viewTokens());
 		return present(userContext,transportTask, allTokens());
		
 	}
 	protected TransportTask saveTransportTask(RetailscmUserContext userContext, TransportTask transportTask, Map<String,Object>tokens) throws Exception{	
 		return transportTaskDaoOf(userContext).save(transportTask, tokens);
 	}
 	protected TransportTask loadTransportTask(RetailscmUserContext userContext, String transportTaskId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).throwExceptionIfHasErrors( TransportTaskManagerException.class);

 
 		return transportTaskDaoOf(userContext).load(transportTaskId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, TransportTask transportTask, Map<String, Object> tokens){
		super.addActions(userContext, transportTask, tokens);
		
		addAction(userContext, transportTask, tokens,"@create","createTransportTask","createTransportTask/","main","primary");
		addAction(userContext, transportTask, tokens,"@update","updateTransportTask","updateTransportTask/"+transportTask.getId()+"/","main","primary");
		addAction(userContext, transportTask, tokens,"@copy","cloneTransportTask","cloneTransportTask/"+transportTask.getId()+"/","main","primary");
		
		addAction(userContext, transportTask, tokens,"transport_task.transfer_to_end","transferToAnotherEnd","transferToAnotherEnd/"+transportTask.getId()+"/","main","primary");
		addAction(userContext, transportTask, tokens,"transport_task.transfer_to_driver","transferToAnotherDriver","transferToAnotherDriver/"+transportTask.getId()+"/","main","primary");
		addAction(userContext, transportTask, tokens,"transport_task.transfer_to_truck","transferToAnotherTruck","transferToAnotherTruck/"+transportTask.getId()+"/","main","primary");
		addAction(userContext, transportTask, tokens,"transport_task.transfer_to_belongs_to","transferToAnotherBelongsTo","transferToAnotherBelongsTo/"+transportTask.getId()+"/","main","primary");
		addAction(userContext, transportTask, tokens,"transport_task.addGoods","addGoods","addGoods/"+transportTask.getId()+"/","goodsList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.removeGoods","removeGoods","removeGoods/"+transportTask.getId()+"/","goodsList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.updateGoods","updateGoods","updateGoods/"+transportTask.getId()+"/","goodsList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.copyGoodsFrom","copyGoodsFrom","copyGoodsFrom/"+transportTask.getId()+"/","goodsList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.addTransportTaskTrack","addTransportTaskTrack","addTransportTaskTrack/"+transportTask.getId()+"/","transportTaskTrackList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.removeTransportTaskTrack","removeTransportTaskTrack","removeTransportTaskTrack/"+transportTask.getId()+"/","transportTaskTrackList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.updateTransportTaskTrack","updateTransportTaskTrack","updateTransportTaskTrack/"+transportTask.getId()+"/","transportTaskTrackList","primary");
		addAction(userContext, transportTask, tokens,"transport_task.copyTransportTaskTrackFrom","copyTransportTaskTrackFrom","copyTransportTaskTrackFrom/"+transportTask.getId()+"/","transportTaskTrackList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, TransportTask transportTask, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public TransportTask createTransportTask(RetailscmUserContext userContext, String name,String start,Date beginTime,String endId,String driverId,String truckId,String belongsToId,BigDecimal latitude,BigDecimal longitude) throws Exception
	//public TransportTask createTransportTask(RetailscmUserContext userContext,String name, String start, Date beginTime, String endId, String driverId, String truckId, String belongsToId, BigDecimal latitude, BigDecimal longitude) throws Exception
	{

		

		

		checkerOf(userContext).checkNameOfTransportTask(name);
		checkerOf(userContext).checkStartOfTransportTask(start);
		checkerOf(userContext).checkBeginTimeOfTransportTask(beginTime);
		checkerOf(userContext).checkLatitudeOfTransportTask(latitude);
		checkerOf(userContext).checkLongitudeOfTransportTask(longitude);
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);


		TransportTask transportTask=createNewTransportTask();	

		transportTask.setName(name);
		transportTask.setStart(start);
		transportTask.setBeginTime(beginTime);
			
		RetailStore end = loadRetailStore(userContext, endId,emptyOptions());
		transportTask.setEnd(end);
		
		
			
		TruckDriver driver = loadTruckDriver(userContext, driverId,emptyOptions());
		transportTask.setDriver(driver);
		
		
			
		TransportTruck truck = loadTransportTruck(userContext, truckId,emptyOptions());
		transportTask.setTruck(truck);
		
		
			
		TransportFleet belongsTo = loadTransportFleet(userContext, belongsToId,emptyOptions());
		transportTask.setBelongsTo(belongsTo);
		
		
		transportTask.setLatitude(latitude);
		transportTask.setLongitude(longitude);

		transportTask = saveTransportTask(userContext, transportTask, emptyOptions());
		
		onNewInstanceCreated(userContext, transportTask);
		return transportTask;


	}
	protected TransportTask createNewTransportTask()
	{

		return new TransportTask();
	}

	protected void checkParamsForUpdatingTransportTask(RetailscmUserContext userContext,String transportTaskId, int transportTaskVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).checkVersionOfTransportTask( transportTaskVersion);
		

		if(TransportTask.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfTransportTask(parseString(newValueExpr));
		}
		if(TransportTask.START_PROPERTY.equals(property)){
			checkerOf(userContext).checkStartOfTransportTask(parseString(newValueExpr));
		}
		if(TransportTask.BEGIN_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkBeginTimeOfTransportTask(parseDate(newValueExpr));
		}		

				

				

				

		
		if(TransportTask.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfTransportTask(parseBigDecimal(newValueExpr));
		}
		if(TransportTask.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfTransportTask(parseBigDecimal(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);


	}



	public TransportTask clone(RetailscmUserContext userContext, String fromTransportTaskId) throws Exception{

		return transportTaskDaoOf(userContext).clone(fromTransportTaskId, this.allTokens());
	}

	public TransportTask internalSaveTransportTask(RetailscmUserContext userContext, TransportTask transportTask) throws Exception
	{
		return internalSaveTransportTask(userContext, transportTask, allTokens());

	}
	public TransportTask internalSaveTransportTask(RetailscmUserContext userContext, TransportTask transportTask, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingTransportTask(userContext, transportTaskId, transportTaskVersion, property, newValueExpr, tokensExpr);


		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to TransportTask.
			if (transportTask.isChanged()){
			
			}
			transportTask = saveTransportTask(userContext, transportTask, options);
			return transportTask;

		}

	}

	public TransportTask updateTransportTask(RetailscmUserContext userContext,String transportTaskId, int transportTaskVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingTransportTask(userContext, transportTaskId, transportTaskVersion, property, newValueExpr, tokensExpr);



		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		if(transportTask.getVersion() != transportTaskVersion){
			String message = "The target version("+transportTask.getVersion()+") is not equals to version("+transportTaskVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to TransportTask.
			
			transportTask.changeProperty(property, newValueExpr);
			transportTask = saveTransportTask(userContext, transportTask, tokens().done());
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
			//return saveTransportTask(userContext, transportTask, tokens().done());
		}

	}

	public TransportTask updateTransportTaskProperty(RetailscmUserContext userContext,String transportTaskId, int transportTaskVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingTransportTask(userContext, transportTaskId, transportTaskVersion, property, newValueExpr, tokensExpr);

		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		if(transportTask.getVersion() != transportTaskVersion){
			String message = "The target version("+transportTask.getVersion()+") is not equals to version("+transportTaskVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to TransportTask.

			transportTask.changeProperty(property, newValueExpr);
			
			transportTask = saveTransportTask(userContext, transportTask, tokens().done());
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
			//return saveTransportTask(userContext, transportTask, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected TransportTaskTokens tokens(){
		return TransportTaskTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return TransportTaskTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortGoodsListWith("id","desc")
		.sortTransportTaskTrackListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return TransportTaskTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherEnd(RetailscmUserContext userContext, String transportTaskId, String anotherEndId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
 		checkerOf(userContext).checkIdOfRetailStore(anotherEndId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

 	}
 	public TransportTask transferToAnotherEnd(RetailscmUserContext userContext, String transportTaskId, String anotherEndId) throws Exception
 	{
 		checkParamsForTransferingAnotherEnd(userContext, transportTaskId,anotherEndId);
 
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());	
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStore end = loadRetailStore(userContext, anotherEndId, emptyOptions());		
			transportTask.updateEnd(end);		
			transportTask = saveTransportTask(userContext, transportTask, emptyOptions());
			
			return present(userContext,transportTask, allTokens());
			
		}

 	}

	


	public CandidateRetailStore requestCandidateEnd(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

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
		SmartList<RetailStore> candidateList = retailStoreDaoOf(userContext).requestCandidateRetailStoreForTransportTask(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherDriver(RetailscmUserContext userContext, String transportTaskId, String anotherDriverId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
 		checkerOf(userContext).checkIdOfTruckDriver(anotherDriverId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

 	}
 	public TransportTask transferToAnotherDriver(RetailscmUserContext userContext, String transportTaskId, String anotherDriverId) throws Exception
 	{
 		checkParamsForTransferingAnotherDriver(userContext, transportTaskId,anotherDriverId);
 
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());	
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			TruckDriver driver = loadTruckDriver(userContext, anotherDriverId, emptyOptions());		
			transportTask.updateDriver(driver);		
			transportTask = saveTransportTask(userContext, transportTask, emptyOptions());
			
			return present(userContext,transportTask, allTokens());
			
		}

 	}

	


	public CandidateTruckDriver requestCandidateDriver(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateTruckDriver result = new CandidateTruckDriver();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<TruckDriver> candidateList = truckDriverDaoOf(userContext).requestCandidateTruckDriverForTransportTask(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherTruck(RetailscmUserContext userContext, String transportTaskId, String anotherTruckId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
 		checkerOf(userContext).checkIdOfTransportTruck(anotherTruckId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

 	}
 	public TransportTask transferToAnotherTruck(RetailscmUserContext userContext, String transportTaskId, String anotherTruckId) throws Exception
 	{
 		checkParamsForTransferingAnotherTruck(userContext, transportTaskId,anotherTruckId);
 
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());	
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			TransportTruck truck = loadTransportTruck(userContext, anotherTruckId, emptyOptions());		
			transportTask.updateTruck(truck);		
			transportTask = saveTransportTask(userContext, transportTask, emptyOptions());
			
			return present(userContext,transportTask, allTokens());
			
		}

 	}

	


	public CandidateTransportTruck requestCandidateTruck(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateTransportTruck result = new CandidateTransportTruck();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<TransportTruck> candidateList = transportTruckDaoOf(userContext).requestCandidateTransportTruckForTransportTask(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 	protected void checkParamsForTransferingAnotherBelongsTo(RetailscmUserContext userContext, String transportTaskId, String anotherBelongsToId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
 		checkerOf(userContext).checkIdOfTransportFleet(anotherBelongsToId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

 	}
 	public TransportTask transferToAnotherBelongsTo(RetailscmUserContext userContext, String transportTaskId, String anotherBelongsToId) throws Exception
 	{
 		checkParamsForTransferingAnotherBelongsTo(userContext, transportTaskId,anotherBelongsToId);
 
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());	
		synchronized(transportTask){
			//will be good when the transportTask loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			TransportFleet belongsTo = loadTransportFleet(userContext, anotherBelongsToId, emptyOptions());		
			transportTask.updateBelongsTo(belongsTo);		
			transportTask = saveTransportTask(userContext, transportTask, emptyOptions());
			
			return present(userContext,transportTask, allTokens());
			
		}

 	}

	


	public CandidateTransportFleet requestCandidateBelongsTo(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateTransportFleet result = new CandidateTransportFleet();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<TransportFleet> candidateList = transportFleetDaoOf(userContext).requestCandidateTransportFleetForTransportTask(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected TransportFleet loadTransportFleet(RetailscmUserContext userContext, String newBelongsToId, Map<String,Object> options) throws Exception
 	{

 		return transportFleetDaoOf(userContext).load(newBelongsToId, options);
 	}
 	


	

 	protected TruckDriver loadTruckDriver(RetailscmUserContext userContext, String newDriverId, Map<String,Object> options) throws Exception
 	{

 		return truckDriverDaoOf(userContext).load(newDriverId, options);
 	}
 	


	

 	protected RetailStore loadRetailStore(RetailscmUserContext userContext, String newEndId, Map<String,Object> options) throws Exception
 	{

 		return retailStoreDaoOf(userContext).load(newEndId, options);
 	}
 	


	

 	protected TransportTruck loadTransportTruck(RetailscmUserContext userContext, String newTruckId, Map<String,Object> options) throws Exception
 	{

 		return transportTruckDaoOf(userContext).load(newTruckId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String transportTaskId, int transportTaskVersion) throws Exception {
		//deleteInternal(userContext, transportTaskId, transportTaskVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String transportTaskId, int transportTaskVersion) throws Exception{

		transportTaskDaoOf(userContext).delete(transportTaskId, transportTaskVersion);
	}

	public TransportTask forgetByAll(RetailscmUserContext userContext, String transportTaskId, int transportTaskVersion) throws Exception {
		return forgetByAllInternal(userContext, transportTaskId, transportTaskVersion);
	}
	protected TransportTask forgetByAllInternal(RetailscmUserContext userContext,
			String transportTaskId, int transportTaskVersion) throws Exception{

		return transportTaskDaoOf(userContext).disconnectFromAll(transportTaskId, transportTaskVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new TransportTaskManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return transportTaskDaoOf(userContext).deleteAll();
	}


	//disconnect TransportTask with sku in Goods
	protected TransportTask breakWithGoodsBySku(RetailscmUserContext userContext, String transportTaskId, String skuId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithSku(transportTask, skuId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with receiving_space in Goods
	protected TransportTask breakWithGoodsByReceivingSpace(RetailscmUserContext userContext, String transportTaskId, String receivingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithReceivingSpace(transportTask, receivingSpaceId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with goods_allocation in Goods
	protected TransportTask breakWithGoodsByGoodsAllocation(RetailscmUserContext userContext, String transportTaskId, String goodsAllocationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithGoodsAllocation(transportTask, goodsAllocationId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with smart_pallet in Goods
	protected TransportTask breakWithGoodsBySmartPallet(RetailscmUserContext userContext, String transportTaskId, String smartPalletId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithSmartPallet(transportTask, smartPalletId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with shipping_space in Goods
	protected TransportTask breakWithGoodsByShippingSpace(RetailscmUserContext userContext, String transportTaskId, String shippingSpaceId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithShippingSpace(transportTask, shippingSpaceId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with retail_store in Goods
	protected TransportTask breakWithGoodsByRetailStore(RetailscmUserContext userContext, String transportTaskId, String retailStoreId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithRetailStore(transportTask, retailStoreId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with biz_order in Goods
	protected TransportTask breakWithGoodsByBizOrder(RetailscmUserContext userContext, String transportTaskId, String bizOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithBizOrder(transportTask, bizOrderId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}
	//disconnect TransportTask with retail_store_order in Goods
	protected TransportTask breakWithGoodsByRetailStoreOrder(RetailscmUserContext userContext, String transportTaskId, String retailStoreOrderId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());

			synchronized(transportTask){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				transportTaskDaoOf(userContext).planToRemoveGoodsListWithRetailStoreOrder(transportTask, retailStoreOrderId, this.emptyOptions());

				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				return transportTask;
			}
	}






	protected void checkParamsForAddingGoods(RetailscmUserContext userContext, String transportTaskId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String retailStoreId, String bizOrderId, String retailStoreOrderId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfTransportTask(transportTaskId);

		
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
		
		checkerOf(userContext).checkRetailStoreIdOfGoods(retailStoreId);
		
		checkerOf(userContext).checkBizOrderIdOfGoods(bizOrderId);
		
		checkerOf(userContext).checkRetailStoreOrderIdOfGoods(retailStoreOrderId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);


	}
	public  TransportTask addGoods(RetailscmUserContext userContext, String transportTaskId, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String retailStoreId, String bizOrderId, String retailStoreOrderId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingGoods(userContext,transportTaskId,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, retailStoreId, bizOrderId, retailStoreOrderId,tokensExpr);

		Goods goods = createGoods(userContext,name, rfid, uom, maxPackage, expireTime, skuId, receivingSpaceId, goodsAllocationId, smartPalletId, shippingSpaceId, retailStoreId, bizOrderId, retailStoreOrderId);

		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, emptyOptions());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			transportTask.addGoods( goods );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, goods);
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingGoodsProperties(RetailscmUserContext userContext, String transportTaskId,String id,String name,String rfid,String uom,int maxPackage,Date expireTime,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).checkIdOfGoods(id);

		checkerOf(userContext).checkNameOfGoods( name);
		checkerOf(userContext).checkRfidOfGoods( rfid);
		checkerOf(userContext).checkUomOfGoods( uom);
		checkerOf(userContext).checkMaxPackageOfGoods( maxPackage);
		checkerOf(userContext).checkExpireTimeOfGoods( expireTime);

		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask updateGoodsProperties(RetailscmUserContext userContext, String transportTaskId, String id,String name,String rfid,String uom,int maxPackage,Date expireTime, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsProperties(userContext,transportTaskId,id,name,rfid,uom,maxPackage,expireTime,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withGoodsListList()
				.searchGoodsListWith(Goods.ID_PROPERTY, "is", id).done();

		TransportTask transportTaskToUpdate = loadTransportTask(userContext, transportTaskId, options);

		if(transportTaskToUpdate.getGoodsList().isEmpty()){
			throw new TransportTaskManagerException("Goods is NOT FOUND with id: '"+id+"'");
		}

		Goods item = transportTaskToUpdate.getGoodsList().first();

		item.updateName( name );
		item.updateRfid( rfid );
		item.updateUom( uom );
		item.updateMaxPackage( maxPackage );
		item.updateExpireTime( expireTime );


		//checkParamsForAddingGoods(userContext,transportTaskId,name, code, used,tokensExpr);
		TransportTask transportTask = saveTransportTask(userContext, transportTaskToUpdate, tokens().withGoodsList().done());
		synchronized(transportTask){
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}
	}


	protected Goods createGoods(RetailscmUserContext userContext, String name, String rfid, String uom, int maxPackage, Date expireTime, String skuId, String receivingSpaceId, String goodsAllocationId, String smartPalletId, String shippingSpaceId, String retailStoreId, String bizOrderId, String retailStoreOrderId) throws Exception{

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

	protected void checkParamsForRemovingGoodsList(RetailscmUserContext userContext, String transportTaskId,
			String goodsIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		for(String goodsIdItem: goodsIds){
			checkerOf(userContext).checkIdOfGoods(goodsIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask removeGoodsList(RetailscmUserContext userContext, String transportTaskId,
			String goodsIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingGoodsList(userContext, transportTaskId,  goodsIds, tokensExpr);


			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
			synchronized(transportTask){
				//Will be good when the transportTask loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				transportTaskDaoOf(userContext).planToRemoveGoodsList(transportTask, goodsIds, allTokens());
				transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
				deleteRelationListInGraph(userContext, transportTask.getGoodsList());
				return present(userContext,transportTask, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingGoods(RetailscmUserContext userContext, String transportTaskId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfTransportTask( transportTaskId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask removeGoods(RetailscmUserContext userContext, String transportTaskId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingGoods(userContext,transportTaskId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			transportTask.removeGoods( goods );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
			deleteRelationInGraph(userContext, goods);
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingGoods(RetailscmUserContext userContext, String transportTaskId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfTransportTask( transportTaskId);
		checkerOf(userContext).checkIdOfGoods(goodsId);
		checkerOf(userContext).checkVersionOfGoods(goodsVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask copyGoodsFrom(RetailscmUserContext userContext, String transportTaskId,
		String goodsId, int goodsVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingGoods(userContext,transportTaskId, goodsId, goodsVersion,tokensExpr);

		Goods goods = createIndexedGoods(goodsId, goodsVersion);
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			transportTask.copyGoodsFrom( goods );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
			
			userContext.getManagerGroup().getGoodsManager().onNewInstanceCreated(userContext, (Goods)transportTask.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingGoods(RetailscmUserContext userContext, String transportTaskId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}

	public  TransportTask updateGoods(RetailscmUserContext userContext, String transportTaskId, String goodsId, int goodsVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingGoods(userContext, transportTaskId, goodsId, goodsVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withGoodsList().searchGoodsListWith(Goods.ID_PROPERTY, "eq", goodsId).done();



		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, loadTokens);

		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//transportTask.removeGoods( goods );
			//make changes to AcceleraterAccount.
			Goods goodsIndex = createIndexedGoods(goodsId, goodsVersion);

			Goods goods = transportTask.findTheGoods(goodsIndex);
			if(goods == null){
				throw new TransportTaskManagerException(goods+" is NOT FOUND" );
			}

			goods.changeProperty(property, newValueExpr);
			
			transportTask = saveTransportTask(userContext, transportTask, tokens().withGoodsList().done());
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId, Date trackTime, BigDecimal latitude, BigDecimal longitude,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfTransportTask(transportTaskId);

		
		checkerOf(userContext).checkTrackTimeOfTransportTaskTrack(trackTime);
		
		checkerOf(userContext).checkLatitudeOfTransportTaskTrack(latitude);
		
		checkerOf(userContext).checkLongitudeOfTransportTaskTrack(longitude);
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);


	}
	public  TransportTask addTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId, Date trackTime, BigDecimal latitude, BigDecimal longitude, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingTransportTaskTrack(userContext,transportTaskId,trackTime, latitude, longitude,tokensExpr);

		TransportTaskTrack transportTaskTrack = createTransportTaskTrack(userContext,trackTime, latitude, longitude);

		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, emptyOptions());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			transportTask.addTransportTaskTrack( transportTaskTrack );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withTransportTaskTrackList().done());
			
			userContext.getManagerGroup().getTransportTaskTrackManager().onNewInstanceCreated(userContext, transportTaskTrack);
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingTransportTaskTrackProperties(RetailscmUserContext userContext, String transportTaskId,String id,Date trackTime,BigDecimal latitude,BigDecimal longitude,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).checkIdOfTransportTaskTrack(id);

		checkerOf(userContext).checkTrackTimeOfTransportTaskTrack( trackTime);
		checkerOf(userContext).checkLatitudeOfTransportTaskTrack( latitude);
		checkerOf(userContext).checkLongitudeOfTransportTaskTrack( longitude);

		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask updateTransportTaskTrackProperties(RetailscmUserContext userContext, String transportTaskId, String id,Date trackTime,BigDecimal latitude,BigDecimal longitude, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingTransportTaskTrackProperties(userContext,transportTaskId,id,trackTime,latitude,longitude,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withTransportTaskTrackListList()
				.searchTransportTaskTrackListWith(TransportTaskTrack.ID_PROPERTY, "is", id).done();

		TransportTask transportTaskToUpdate = loadTransportTask(userContext, transportTaskId, options);

		if(transportTaskToUpdate.getTransportTaskTrackList().isEmpty()){
			throw new TransportTaskManagerException("TransportTaskTrack is NOT FOUND with id: '"+id+"'");
		}

		TransportTaskTrack item = transportTaskToUpdate.getTransportTaskTrackList().first();

		item.updateTrackTime( trackTime );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );


		//checkParamsForAddingTransportTaskTrack(userContext,transportTaskId,name, code, used,tokensExpr);
		TransportTask transportTask = saveTransportTask(userContext, transportTaskToUpdate, tokens().withTransportTaskTrackList().done());
		synchronized(transportTask){
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}
	}


	protected TransportTaskTrack createTransportTaskTrack(RetailscmUserContext userContext, Date trackTime, BigDecimal latitude, BigDecimal longitude) throws Exception{

		TransportTaskTrack transportTaskTrack = new TransportTaskTrack();
		
		
		transportTaskTrack.setTrackTime(trackTime);		
		transportTaskTrack.setLatitude(latitude);		
		transportTaskTrack.setLongitude(longitude);
	
		
		return transportTaskTrack;


	}

	protected TransportTaskTrack createIndexedTransportTaskTrack(String id, int version){

		TransportTaskTrack transportTaskTrack = new TransportTaskTrack();
		transportTaskTrack.setId(id);
		transportTaskTrack.setVersion(version);
		return transportTaskTrack;

	}

	protected void checkParamsForRemovingTransportTaskTrackList(RetailscmUserContext userContext, String transportTaskId,
			String transportTaskTrackIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		for(String transportTaskTrackIdItem: transportTaskTrackIds){
			checkerOf(userContext).checkIdOfTransportTaskTrack(transportTaskTrackIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask removeTransportTaskTrackList(RetailscmUserContext userContext, String transportTaskId,
			String transportTaskTrackIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingTransportTaskTrackList(userContext, transportTaskId,  transportTaskTrackIds, tokensExpr);


			TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
			synchronized(transportTask){
				//Will be good when the transportTask loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				transportTaskDaoOf(userContext).planToRemoveTransportTaskTrackList(transportTask, transportTaskTrackIds, allTokens());
				transportTask = saveTransportTask(userContext, transportTask, tokens().withTransportTaskTrackList().done());
				deleteRelationListInGraph(userContext, transportTask.getTransportTaskTrackList());
				return present(userContext,transportTask, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId,
		String transportTaskTrackId, int transportTaskTrackVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfTransportTask( transportTaskId);
		checkerOf(userContext).checkIdOfTransportTaskTrack(transportTaskTrackId);
		checkerOf(userContext).checkVersionOfTransportTaskTrack(transportTaskTrackVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask removeTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId,
		String transportTaskTrackId, int transportTaskTrackVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingTransportTaskTrack(userContext,transportTaskId, transportTaskTrackId, transportTaskTrackVersion,tokensExpr);

		TransportTaskTrack transportTaskTrack = createIndexedTransportTaskTrack(transportTaskTrackId, transportTaskTrackVersion);
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			transportTask.removeTransportTaskTrack( transportTaskTrack );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withTransportTaskTrackList().done());
			deleteRelationInGraph(userContext, transportTaskTrack);
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId,
		String transportTaskTrackId, int transportTaskTrackVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfTransportTask( transportTaskId);
		checkerOf(userContext).checkIdOfTransportTaskTrack(transportTaskTrackId);
		checkerOf(userContext).checkVersionOfTransportTaskTrack(transportTaskTrackVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}
	public  TransportTask copyTransportTaskTrackFrom(RetailscmUserContext userContext, String transportTaskId,
		String transportTaskTrackId, int transportTaskTrackVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingTransportTaskTrack(userContext,transportTaskId, transportTaskTrackId, transportTaskTrackVersion,tokensExpr);

		TransportTaskTrack transportTaskTrack = createIndexedTransportTaskTrack(transportTaskTrackId, transportTaskTrackVersion);
		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, allTokens());
		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			transportTask.copyTransportTaskTrackFrom( transportTaskTrack );
			transportTask = saveTransportTask(userContext, transportTask, tokens().withTransportTaskTrackList().done());
			
			userContext.getManagerGroup().getTransportTaskTrackManager().onNewInstanceCreated(userContext, (TransportTaskTrack)transportTask.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId, String transportTaskTrackId, int transportTaskTrackVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfTransportTask(transportTaskId);
		checkerOf(userContext).checkIdOfTransportTaskTrack(transportTaskTrackId);
		checkerOf(userContext).checkVersionOfTransportTaskTrack(transportTaskTrackVersion);
		

		if(TransportTaskTrack.TRACK_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkTrackTimeOfTransportTaskTrack(parseDate(newValueExpr));
		}
		
		if(TransportTaskTrack.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfTransportTaskTrack(parseBigDecimal(newValueExpr));
		}
		
		if(TransportTaskTrack.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfTransportTaskTrack(parseBigDecimal(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(TransportTaskManagerException.class);

	}

	public  TransportTask updateTransportTaskTrack(RetailscmUserContext userContext, String transportTaskId, String transportTaskTrackId, int transportTaskTrackVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingTransportTaskTrack(userContext, transportTaskId, transportTaskTrackId, transportTaskTrackVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withTransportTaskTrackList().searchTransportTaskTrackListWith(TransportTaskTrack.ID_PROPERTY, "eq", transportTaskTrackId).done();



		TransportTask transportTask = loadTransportTask(userContext, transportTaskId, loadTokens);

		synchronized(transportTask){
			//Will be good when the transportTask loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//transportTask.removeTransportTaskTrack( transportTaskTrack );
			//make changes to AcceleraterAccount.
			TransportTaskTrack transportTaskTrackIndex = createIndexedTransportTaskTrack(transportTaskTrackId, transportTaskTrackVersion);

			TransportTaskTrack transportTaskTrack = transportTask.findTheTransportTaskTrack(transportTaskTrackIndex);
			if(transportTaskTrack == null){
				throw new TransportTaskManagerException(transportTaskTrack+" is NOT FOUND" );
			}

			transportTaskTrack.changeProperty(property, newValueExpr);
			
			transportTask = saveTransportTask(userContext, transportTask, tokens().withTransportTaskTrackList().done());
			return present(userContext,transportTask, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, TransportTask newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



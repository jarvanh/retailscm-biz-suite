
package com.doublechaintech.retailscm.goodsmovement;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.goods.Goods;

import com.doublechaintech.retailscm.goods.CandidateGoods;







public class GoodsMovementManagerImpl extends CustomRetailscmCheckerManager implements GoodsMovementManager {

  


	private static final String SERVICE_TYPE = "GoodsMovement";
	@Override
	public GoodsMovementDAO daoOf(RetailscmUserContext userContext) {
		return goodsMovementDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws GoodsMovementManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new GoodsMovementManagerException(message);

	}



 	protected GoodsMovement saveGoodsMovement(RetailscmUserContext userContext, GoodsMovement goodsMovement, String [] tokensExpr) throws Exception{	
 		//return getGoodsMovementDAO().save(goodsMovement, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveGoodsMovement(userContext, goodsMovement, tokens);
 	}
 	
 	protected GoodsMovement saveGoodsMovementDetail(RetailscmUserContext userContext, GoodsMovement goodsMovement) throws Exception{	

 		
 		return saveGoodsMovement(userContext, goodsMovement, allTokens());
 	}
 	
 	public GoodsMovement loadGoodsMovement(RetailscmUserContext userContext, String goodsMovementId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsMovement(goodsMovementId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsMovementManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		GoodsMovement goodsMovement = loadGoodsMovement( userContext, goodsMovementId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsMovement, tokens);
 	}
 	
 	
 	 public GoodsMovement searchGoodsMovement(RetailscmUserContext userContext, String goodsMovementId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfGoodsMovement(goodsMovementId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsMovementManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		GoodsMovement goodsMovement = loadGoodsMovement( userContext, goodsMovementId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,goodsMovement, tokens);
 	}
 	
 	

 	protected GoodsMovement present(RetailscmUserContext userContext, GoodsMovement goodsMovement, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,goodsMovement,tokens);
		
		
		GoodsMovement  goodsMovementToPresent = goodsMovementDaoOf(userContext).present(goodsMovement, tokens);
		
		List<BaseEntity> entityListToNaming = goodsMovementToPresent.collectRefercencesFromLists();
		goodsMovementDaoOf(userContext).alias(entityListToNaming);
		
		return  goodsMovementToPresent;
		
		
	}
 
 	
 	
 	public GoodsMovement loadGoodsMovementDetail(RetailscmUserContext userContext, String goodsMovementId) throws Exception{	
 		GoodsMovement goodsMovement = loadGoodsMovement( userContext, goodsMovementId, allTokens());
 		return present(userContext,goodsMovement, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String goodsMovementId) throws Exception{	
 		GoodsMovement goodsMovement = loadGoodsMovement( userContext, goodsMovementId, viewTokens());
 		return present(userContext,goodsMovement, allTokens());
		
 	}
 	protected GoodsMovement saveGoodsMovement(RetailscmUserContext userContext, GoodsMovement goodsMovement, Map<String,Object>tokens) throws Exception{	
 		return goodsMovementDaoOf(userContext).save(goodsMovement, tokens);
 	}
 	protected GoodsMovement loadGoodsMovement(RetailscmUserContext userContext, String goodsMovementId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfGoodsMovement(goodsMovementId);
		checkerOf(userContext).throwExceptionIfHasErrors( GoodsMovementManagerException.class);

 
 		return goodsMovementDaoOf(userContext).load(goodsMovementId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsMovement goodsMovement, Map<String, Object> tokens){
		super.addActions(userContext, goodsMovement, tokens);
		
		addAction(userContext, goodsMovement, tokens,"@create","createGoodsMovement","createGoodsMovement/","main","primary");
		addAction(userContext, goodsMovement, tokens,"@update","updateGoodsMovement","updateGoodsMovement/"+goodsMovement.getId()+"/","main","primary");
		addAction(userContext, goodsMovement, tokens,"@copy","cloneGoodsMovement","cloneGoodsMovement/"+goodsMovement.getId()+"/","main","primary");
		
		addAction(userContext, goodsMovement, tokens,"goods_movement.transfer_to_goods","transferToAnotherGoods","transferToAnotherGoods/"+goodsMovement.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, GoodsMovement goodsMovement, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public GoodsMovement createGoodsMovement(RetailscmUserContext userContext, DateTime moveTime,String facility,String facilityId,String fromIp,String userAgent,String sessionId,BigDecimal latitude,BigDecimal longitude,String goodsId) throws Exception
	//public GoodsMovement createGoodsMovement(RetailscmUserContext userContext,DateTime moveTime, String facility, String facilityId, String fromIp, String userAgent, String sessionId, BigDecimal latitude, BigDecimal longitude, String goodsId) throws Exception
	{

		

		

		checkerOf(userContext).checkMoveTimeOfGoodsMovement(moveTime);
		checkerOf(userContext).checkFacilityOfGoodsMovement(facility);
		checkerOf(userContext).checkFacilityIdOfGoodsMovement(facilityId);
		checkerOf(userContext).checkFromIpOfGoodsMovement(fromIp);
		checkerOf(userContext).checkUserAgentOfGoodsMovement(userAgent);
		checkerOf(userContext).checkSessionIdOfGoodsMovement(sessionId);
		checkerOf(userContext).checkLatitudeOfGoodsMovement(latitude);
		checkerOf(userContext).checkLongitudeOfGoodsMovement(longitude);
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsMovementManagerException.class);


		GoodsMovement goodsMovement=createNewGoodsMovement();	

		goodsMovement.setMoveTime(moveTime);
		goodsMovement.setFacility(facility);
		goodsMovement.setFacilityId(facilityId);
		goodsMovement.setFromIp(fromIp);
		goodsMovement.setUserAgent(userAgent);
		goodsMovement.setSessionId(sessionId);
		goodsMovement.setLatitude(latitude);
		goodsMovement.setLongitude(longitude);
			
		Goods goods = loadGoods(userContext, goodsId,emptyOptions());
		goodsMovement.setGoods(goods);
		
		

		goodsMovement = saveGoodsMovement(userContext, goodsMovement, emptyOptions());
		
		onNewInstanceCreated(userContext, goodsMovement);
		return goodsMovement;


	}
	protected GoodsMovement createNewGoodsMovement()
	{

		return new GoodsMovement();
	}

	protected void checkParamsForUpdatingGoodsMovement(RetailscmUserContext userContext,String goodsMovementId, int goodsMovementVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfGoodsMovement(goodsMovementId);
		checkerOf(userContext).checkVersionOfGoodsMovement( goodsMovementVersion);
		

		if(GoodsMovement.MOVE_TIME_PROPERTY.equals(property)){
			checkerOf(userContext).checkMoveTimeOfGoodsMovement(parseTimestamp(newValueExpr));
		}
		if(GoodsMovement.FACILITY_PROPERTY.equals(property)){
			checkerOf(userContext).checkFacilityOfGoodsMovement(parseString(newValueExpr));
		}
		if(GoodsMovement.FACILITY_ID_PROPERTY.equals(property)){
			checkerOf(userContext).checkFacilityIdOfGoodsMovement(parseString(newValueExpr));
		}
		if(GoodsMovement.FROM_IP_PROPERTY.equals(property)){
			checkerOf(userContext).checkFromIpOfGoodsMovement(parseString(newValueExpr));
		}
		if(GoodsMovement.USER_AGENT_PROPERTY.equals(property)){
			checkerOf(userContext).checkUserAgentOfGoodsMovement(parseString(newValueExpr));
		}
		if(GoodsMovement.SESSION_ID_PROPERTY.equals(property)){
			checkerOf(userContext).checkSessionIdOfGoodsMovement(parseString(newValueExpr));
		}
		if(GoodsMovement.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfGoodsMovement(parseBigDecimal(newValueExpr));
		}
		if(GoodsMovement.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfGoodsMovement(parseBigDecimal(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(GoodsMovementManagerException.class);


	}



	public GoodsMovement clone(RetailscmUserContext userContext, String fromGoodsMovementId) throws Exception{

		return goodsMovementDaoOf(userContext).clone(fromGoodsMovementId, this.allTokens());
	}

	public GoodsMovement internalSaveGoodsMovement(RetailscmUserContext userContext, GoodsMovement goodsMovement) throws Exception
	{
		return internalSaveGoodsMovement(userContext, goodsMovement, allTokens());

	}
	public GoodsMovement internalSaveGoodsMovement(RetailscmUserContext userContext, GoodsMovement goodsMovement, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingGoodsMovement(userContext, goodsMovementId, goodsMovementVersion, property, newValueExpr, tokensExpr);


		synchronized(goodsMovement){
			//will be good when the goodsMovement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsMovement.
			if (goodsMovement.isChanged()){
			
			}
			goodsMovement = saveGoodsMovement(userContext, goodsMovement, options);
			return goodsMovement;

		}

	}

	public GoodsMovement updateGoodsMovement(RetailscmUserContext userContext,String goodsMovementId, int goodsMovementVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsMovement(userContext, goodsMovementId, goodsMovementVersion, property, newValueExpr, tokensExpr);



		GoodsMovement goodsMovement = loadGoodsMovement(userContext, goodsMovementId, allTokens());
		if(goodsMovement.getVersion() != goodsMovementVersion){
			String message = "The target version("+goodsMovement.getVersion()+") is not equals to version("+goodsMovementVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsMovement){
			//will be good when the goodsMovement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsMovement.
			
			goodsMovement.changeProperty(property, newValueExpr);
			goodsMovement = saveGoodsMovement(userContext, goodsMovement, tokens().done());
			return present(userContext,goodsMovement, mergedAllTokens(tokensExpr));
			//return saveGoodsMovement(userContext, goodsMovement, tokens().done());
		}

	}

	public GoodsMovement updateGoodsMovementProperty(RetailscmUserContext userContext,String goodsMovementId, int goodsMovementVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingGoodsMovement(userContext, goodsMovementId, goodsMovementVersion, property, newValueExpr, tokensExpr);

		GoodsMovement goodsMovement = loadGoodsMovement(userContext, goodsMovementId, allTokens());
		if(goodsMovement.getVersion() != goodsMovementVersion){
			String message = "The target version("+goodsMovement.getVersion()+") is not equals to version("+goodsMovementVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(goodsMovement){
			//will be good when the goodsMovement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to GoodsMovement.

			goodsMovement.changeProperty(property, newValueExpr);
			
			goodsMovement = saveGoodsMovement(userContext, goodsMovement, tokens().done());
			return present(userContext,goodsMovement, mergedAllTokens(tokensExpr));
			//return saveGoodsMovement(userContext, goodsMovement, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected GoodsMovementTokens tokens(){
		return GoodsMovementTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return GoodsMovementTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return GoodsMovementTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherGoods(RetailscmUserContext userContext, String goodsMovementId, String anotherGoodsId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfGoodsMovement(goodsMovementId);
 		checkerOf(userContext).checkIdOfGoods(anotherGoodsId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(GoodsMovementManagerException.class);

 	}
 	public GoodsMovement transferToAnotherGoods(RetailscmUserContext userContext, String goodsMovementId, String anotherGoodsId) throws Exception
 	{
 		checkParamsForTransferingAnotherGoods(userContext, goodsMovementId,anotherGoodsId);
 
		GoodsMovement goodsMovement = loadGoodsMovement(userContext, goodsMovementId, allTokens());	
		synchronized(goodsMovement){
			//will be good when the goodsMovement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			Goods goods = loadGoods(userContext, anotherGoodsId, emptyOptions());		
			goodsMovement.updateGoods(goods);		
			goodsMovement = saveGoodsMovement(userContext, goodsMovement, emptyOptions());
			
			return present(userContext,goodsMovement, allTokens());
			
		}

 	}

	


	public CandidateGoods requestCandidateGoods(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateGoods result = new CandidateGoods();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<Goods> candidateList = goodsDaoOf(userContext).requestCandidateGoodsForGoodsMovement(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected Goods loadGoods(RetailscmUserContext userContext, String newGoodsId, Map<String,Object> options) throws Exception
 	{

 		return goodsDaoOf(userContext).load(newGoodsId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String goodsMovementId, int goodsMovementVersion) throws Exception {
		//deleteInternal(userContext, goodsMovementId, goodsMovementVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String goodsMovementId, int goodsMovementVersion) throws Exception{

		goodsMovementDaoOf(userContext).delete(goodsMovementId, goodsMovementVersion);
	}

	public GoodsMovement forgetByAll(RetailscmUserContext userContext, String goodsMovementId, int goodsMovementVersion) throws Exception {
		return forgetByAllInternal(userContext, goodsMovementId, goodsMovementVersion);
	}
	protected GoodsMovement forgetByAllInternal(RetailscmUserContext userContext,
			String goodsMovementId, int goodsMovementVersion) throws Exception{

		return goodsMovementDaoOf(userContext).disconnectFromAll(goodsMovementId, goodsMovementVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new GoodsMovementManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return goodsMovementDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, GoodsMovement newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



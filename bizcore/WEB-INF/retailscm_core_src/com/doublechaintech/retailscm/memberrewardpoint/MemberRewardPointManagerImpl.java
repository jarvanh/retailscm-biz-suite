
package com.doublechaintech.retailscm.memberrewardpoint;

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

import com.doublechaintech.retailscm.retailstoremember.RetailStoreMember;

import com.doublechaintech.retailscm.retailstoremember.CandidateRetailStoreMember;







public class MemberRewardPointManagerImpl extends CustomRetailscmCheckerManager implements MemberRewardPointManager {
	
	private static final String SERVICE_TYPE = "MemberRewardPoint";
	@Override
	public MemberRewardPointDAO daoOf(RetailscmUserContext userContext) {
		return memberRewardPointDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws MemberRewardPointManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new MemberRewardPointManagerException(message);

	}
	
	

 	protected MemberRewardPoint saveMemberRewardPoint(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, String [] tokensExpr) throws Exception{	
 		//return getMemberRewardPointDAO().save(memberRewardPoint, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveMemberRewardPoint(userContext, memberRewardPoint, tokens);
 	}
 	
 	protected MemberRewardPoint saveMemberRewardPointDetail(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint) throws Exception{	

 		
 		return saveMemberRewardPoint(userContext, memberRewardPoint, allTokens());
 	}
 	
 	public MemberRewardPoint loadMemberRewardPoint(RetailscmUserContext userContext, String memberRewardPointId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfMemberRewardPoint(memberRewardPointId);
		checkerOf(userContext).throwExceptionIfHasErrors( MemberRewardPointManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint( userContext, memberRewardPointId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,memberRewardPoint, tokens);
 	}
 	
 	
 	 public MemberRewardPoint searchMemberRewardPoint(RetailscmUserContext userContext, String memberRewardPointId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfMemberRewardPoint(memberRewardPointId);
		checkerOf(userContext).throwExceptionIfHasErrors( MemberRewardPointManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint( userContext, memberRewardPointId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,memberRewardPoint, tokens);
 	}
 	
 	

 	protected MemberRewardPoint present(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,memberRewardPoint,tokens);
		
		
		MemberRewardPoint  memberRewardPointToPresent = memberRewardPointDaoOf(userContext).present(memberRewardPoint, tokens);
		
		List<BaseEntity> entityListToNaming = memberRewardPointToPresent.collectRefercencesFromLists();
		memberRewardPointDaoOf(userContext).alias(entityListToNaming);
		
		return  memberRewardPointToPresent;
		
		
	}
 
 	
 	
 	public MemberRewardPoint loadMemberRewardPointDetail(RetailscmUserContext userContext, String memberRewardPointId) throws Exception{	
 		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint( userContext, memberRewardPointId, allTokens());
 		return present(userContext,memberRewardPoint, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String memberRewardPointId) throws Exception{	
 		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint( userContext, memberRewardPointId, viewTokens());
 		return present(userContext,memberRewardPoint, allTokens());
		
 	}
 	protected MemberRewardPoint saveMemberRewardPoint(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, Map<String,Object>tokens) throws Exception{	
 		return memberRewardPointDaoOf(userContext).save(memberRewardPoint, tokens);
 	}
 	protected MemberRewardPoint loadMemberRewardPoint(RetailscmUserContext userContext, String memberRewardPointId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfMemberRewardPoint(memberRewardPointId);
		checkerOf(userContext).throwExceptionIfHasErrors( MemberRewardPointManagerException.class);

 
 		return memberRewardPointDaoOf(userContext).load(memberRewardPointId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, Map<String, Object> tokens){
		super.addActions(userContext, memberRewardPoint, tokens);
		
		addAction(userContext, memberRewardPoint, tokens,"@create","createMemberRewardPoint","createMemberRewardPoint/","main","primary");
		addAction(userContext, memberRewardPoint, tokens,"@update","updateMemberRewardPoint","updateMemberRewardPoint/"+memberRewardPoint.getId()+"/","main","primary");
		addAction(userContext, memberRewardPoint, tokens,"@copy","cloneMemberRewardPoint","cloneMemberRewardPoint/"+memberRewardPoint.getId()+"/","main","primary");
		
		addAction(userContext, memberRewardPoint, tokens,"member_reward_point.transfer_to_owner","transferToAnotherOwner","transferToAnotherOwner/"+memberRewardPoint.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public MemberRewardPoint createMemberRewardPoint(RetailscmUserContext userContext, String name,int point,String ownerId) throws Exception
	//public MemberRewardPoint createMemberRewardPoint(RetailscmUserContext userContext,String name, int point, String ownerId) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfMemberRewardPoint(name);
		checkerOf(userContext).checkPointOfMemberRewardPoint(point);
	
		checkerOf(userContext).throwExceptionIfHasErrors(MemberRewardPointManagerException.class);


		MemberRewardPoint memberRewardPoint=createNewMemberRewardPoint();	

		memberRewardPoint.setName(name);
		memberRewardPoint.setPoint(point);
			
		RetailStoreMember owner = loadRetailStoreMember(userContext, ownerId,emptyOptions());
		memberRewardPoint.setOwner(owner);
		
		

		memberRewardPoint = saveMemberRewardPoint(userContext, memberRewardPoint, emptyOptions());
		
		onNewInstanceCreated(userContext, memberRewardPoint);
		return memberRewardPoint;

		
	}
	protected MemberRewardPoint createNewMemberRewardPoint() 
	{
		
		return new MemberRewardPoint();		
	}
	
	protected void checkParamsForUpdatingMemberRewardPoint(RetailscmUserContext userContext,String memberRewardPointId, int memberRewardPointVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfMemberRewardPoint(memberRewardPointId);
		checkerOf(userContext).checkVersionOfMemberRewardPoint( memberRewardPointVersion);
		

		if(MemberRewardPoint.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfMemberRewardPoint(parseString(newValueExpr));
		}
		if(MemberRewardPoint.POINT_PROPERTY.equals(property)){
			checkerOf(userContext).checkPointOfMemberRewardPoint(parseInt(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(MemberRewardPointManagerException.class);
	
		
	}
	
	
	
	public MemberRewardPoint clone(RetailscmUserContext userContext, String fromMemberRewardPointId) throws Exception{
		
		return memberRewardPointDaoOf(userContext).clone(fromMemberRewardPointId, this.allTokens());
	}
	
	public MemberRewardPoint internalSaveMemberRewardPoint(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint) throws Exception 
	{
		return internalSaveMemberRewardPoint(userContext, memberRewardPoint, allTokens());

	}
	public MemberRewardPoint internalSaveMemberRewardPoint(RetailscmUserContext userContext, MemberRewardPoint memberRewardPoint, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingMemberRewardPoint(userContext, memberRewardPointId, memberRewardPointVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(memberRewardPoint){ 
			//will be good when the memberRewardPoint loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to MemberRewardPoint.
			if (memberRewardPoint.isChanged()){
			
			}
			memberRewardPoint = saveMemberRewardPoint(userContext, memberRewardPoint, options);
			return memberRewardPoint;
			
		}

	}
	
	public MemberRewardPoint updateMemberRewardPoint(RetailscmUserContext userContext,String memberRewardPointId, int memberRewardPointVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingMemberRewardPoint(userContext, memberRewardPointId, memberRewardPointVersion, property, newValueExpr, tokensExpr);
		
		
		
		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint(userContext, memberRewardPointId, allTokens());
		if(memberRewardPoint.getVersion() != memberRewardPointVersion){
			String message = "The target version("+memberRewardPoint.getVersion()+") is not equals to version("+memberRewardPointVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(memberRewardPoint){ 
			//will be good when the memberRewardPoint loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to MemberRewardPoint.
			
			memberRewardPoint.changeProperty(property, newValueExpr);
			memberRewardPoint = saveMemberRewardPoint(userContext, memberRewardPoint, tokens().done());
			return present(userContext,memberRewardPoint, mergedAllTokens(tokensExpr));
			//return saveMemberRewardPoint(userContext, memberRewardPoint, tokens().done());
		}

	}
	
	public MemberRewardPoint updateMemberRewardPointProperty(RetailscmUserContext userContext,String memberRewardPointId, int memberRewardPointVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingMemberRewardPoint(userContext, memberRewardPointId, memberRewardPointVersion, property, newValueExpr, tokensExpr);
		
		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint(userContext, memberRewardPointId, allTokens());
		if(memberRewardPoint.getVersion() != memberRewardPointVersion){
			String message = "The target version("+memberRewardPoint.getVersion()+") is not equals to version("+memberRewardPointVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(memberRewardPoint){ 
			//will be good when the memberRewardPoint loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to MemberRewardPoint.
			
			memberRewardPoint.changeProperty(property, newValueExpr);
			
			memberRewardPoint = saveMemberRewardPoint(userContext, memberRewardPoint, tokens().done());
			return present(userContext,memberRewardPoint, mergedAllTokens(tokensExpr));
			//return saveMemberRewardPoint(userContext, memberRewardPoint, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected MemberRewardPointTokens tokens(){
		return MemberRewardPointTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return MemberRewardPointTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return MemberRewardPointTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherOwner(RetailscmUserContext userContext, String memberRewardPointId, String anotherOwnerId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfMemberRewardPoint(memberRewardPointId);
 		checkerOf(userContext).checkIdOfRetailStoreMember(anotherOwnerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(MemberRewardPointManagerException.class);
 		
 	}
 	public MemberRewardPoint transferToAnotherOwner(RetailscmUserContext userContext, String memberRewardPointId, String anotherOwnerId) throws Exception
 	{
 		checkParamsForTransferingAnotherOwner(userContext, memberRewardPointId,anotherOwnerId);
 
		MemberRewardPoint memberRewardPoint = loadMemberRewardPoint(userContext, memberRewardPointId, allTokens());	
		synchronized(memberRewardPoint){
			//will be good when the memberRewardPoint loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreMember owner = loadRetailStoreMember(userContext, anotherOwnerId, emptyOptions());		
			memberRewardPoint.updateOwner(owner);		
			memberRewardPoint = saveMemberRewardPoint(userContext, memberRewardPoint, emptyOptions());
			
			return present(userContext,memberRewardPoint, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateRetailStoreMember requestCandidateOwner(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreMember result = new CandidateRetailStoreMember();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreMember> candidateList = retailStoreMemberDaoOf(userContext).requestCandidateRetailStoreMemberForMemberRewardPoint(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected RetailStoreMember loadRetailStoreMember(RetailscmUserContext userContext, String newOwnerId, Map<String,Object> options) throws Exception
 	{
		
 		return retailStoreMemberDaoOf(userContext).load(newOwnerId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String memberRewardPointId, int memberRewardPointVersion) throws Exception {
		//deleteInternal(userContext, memberRewardPointId, memberRewardPointVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String memberRewardPointId, int memberRewardPointVersion) throws Exception{
			
		memberRewardPointDaoOf(userContext).delete(memberRewardPointId, memberRewardPointVersion);
	}
	
	public MemberRewardPoint forgetByAll(RetailscmUserContext userContext, String memberRewardPointId, int memberRewardPointVersion) throws Exception {
		return forgetByAllInternal(userContext, memberRewardPointId, memberRewardPointVersion);		
	}
	protected MemberRewardPoint forgetByAllInternal(RetailscmUserContext userContext,
			String memberRewardPointId, int memberRewardPointVersion) throws Exception{
			
		return memberRewardPointDaoOf(userContext).disconnectFromAll(memberRewardPointId, memberRewardPointVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new MemberRewardPointManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return memberRewardPointDaoOf(userContext).deleteAll();
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, MemberRewardPoint newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



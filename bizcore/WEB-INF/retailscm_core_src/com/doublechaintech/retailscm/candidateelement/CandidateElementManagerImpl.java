
package com.doublechaintech.retailscm.candidateelement;

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

import com.doublechaintech.retailscm.candidatecontainer.CandidateContainer;

import com.doublechaintech.retailscm.candidatecontainer.CandidateCandidateContainer;







public class CandidateElementManagerImpl extends CustomRetailscmCheckerManager implements CandidateElementManager {
	
	private static final String SERVICE_TYPE = "CandidateElement";
<<<<<<< HEAD
=======
	@Override
	public CandidateElementDAO daoOf(RetailscmUserContext userContext) {
		return candidateElementDaoOf(userContext);
	}
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws CandidateElementManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new CandidateElementManagerException(message);

	}
	
	

 	protected CandidateElement saveCandidateElement(RetailscmUserContext userContext, CandidateElement candidateElement, String [] tokensExpr) throws Exception{	
 		//return getCandidateElementDAO().save(candidateElement, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveCandidateElement(userContext, candidateElement, tokens);
 	}
 	
 	protected CandidateElement saveCandidateElementDetail(RetailscmUserContext userContext, CandidateElement candidateElement) throws Exception{	

 		
 		return saveCandidateElement(userContext, candidateElement, allTokens());
 	}
 	
 	public CandidateElement loadCandidateElement(RetailscmUserContext userContext, String candidateElementId, String [] tokensExpr) throws Exception{				
 
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfCandidateElement(candidateElementId);
		userContext.getChecker().throwExceptionIfHasErrors( CandidateElementManagerException.class);
=======
 		checkerOf(userContext).checkIdOfCandidateElement(candidateElementId);
		checkerOf(userContext).throwExceptionIfHasErrors( CandidateElementManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		CandidateElement candidateElement = loadCandidateElement( userContext, candidateElementId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,candidateElement, tokens);
 	}
 	
 	
 	 public CandidateElement searchCandidateElement(RetailscmUserContext userContext, String candidateElementId, String textToSearch,String [] tokensExpr) throws Exception{				
 
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfCandidateElement(candidateElementId);
		userContext.getChecker().throwExceptionIfHasErrors( CandidateElementManagerException.class);
=======
 		checkerOf(userContext).checkIdOfCandidateElement(candidateElementId);
		checkerOf(userContext).throwExceptionIfHasErrors( CandidateElementManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		CandidateElement candidateElement = loadCandidateElement( userContext, candidateElementId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,candidateElement, tokens);
 	}
 	
 	

 	protected CandidateElement present(RetailscmUserContext userContext, CandidateElement candidateElement, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,candidateElement,tokens);
		
		
<<<<<<< HEAD
		CandidateElement  candidateElementToPresent = userContext.getDAOGroup().getCandidateElementDAO().present(candidateElement, tokens);
		
		List<BaseEntity> entityListToNaming = candidateElementToPresent.collectRefercencesFromLists();
		userContext.getDAOGroup().getCandidateElementDAO().alias(entityListToNaming);
=======
		CandidateElement  candidateElementToPresent = candidateElementDaoOf(userContext).present(candidateElement, tokens);
		
		List<BaseEntity> entityListToNaming = candidateElementToPresent.collectRefercencesFromLists();
		candidateElementDaoOf(userContext).alias(entityListToNaming);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		
		return  candidateElementToPresent;
		
		
	}
 
 	
 	
 	public CandidateElement loadCandidateElementDetail(RetailscmUserContext userContext, String candidateElementId) throws Exception{	
 		CandidateElement candidateElement = loadCandidateElement( userContext, candidateElementId, allTokens());
 		return present(userContext,candidateElement, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String candidateElementId) throws Exception{	
 		CandidateElement candidateElement = loadCandidateElement( userContext, candidateElementId, viewTokens());
 		return present(userContext,candidateElement, allTokens());
		
 	}
 	protected CandidateElement saveCandidateElement(RetailscmUserContext userContext, CandidateElement candidateElement, Map<String,Object>tokens) throws Exception{	
<<<<<<< HEAD
 		return userContext.getDAOGroup().getCandidateElementDAO().save(candidateElement, tokens);
 	}
 	protected CandidateElement loadCandidateElement(RetailscmUserContext userContext, String candidateElementId, Map<String,Object>tokens) throws Exception{	
		userContext.getChecker().checkIdOfCandidateElement(candidateElementId);
		userContext.getChecker().throwExceptionIfHasErrors( CandidateElementManagerException.class);

 
 		return userContext.getDAOGroup().getCandidateElementDAO().load(candidateElementId, tokens);
=======
 		return candidateElementDaoOf(userContext).save(candidateElement, tokens);
 	}
 	protected CandidateElement loadCandidateElement(RetailscmUserContext userContext, String candidateElementId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfCandidateElement(candidateElementId);
		checkerOf(userContext).throwExceptionIfHasErrors( CandidateElementManagerException.class);

 
 		return candidateElementDaoOf(userContext).load(candidateElementId, tokens);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, CandidateElement candidateElement, Map<String, Object> tokens){
		super.addActions(userContext, candidateElement, tokens);
		
		addAction(userContext, candidateElement, tokens,"@create","createCandidateElement","createCandidateElement/","main","primary");
		addAction(userContext, candidateElement, tokens,"@update","updateCandidateElement","updateCandidateElement/"+candidateElement.getId()+"/","main","primary");
		addAction(userContext, candidateElement, tokens,"@copy","cloneCandidateElement","cloneCandidateElement/"+candidateElement.getId()+"/","main","primary");
		
		addAction(userContext, candidateElement, tokens,"candidate_element.transfer_to_container","transferToAnotherContainer","transferToAnotherContainer/"+candidateElement.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, CandidateElement candidateElement, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

<<<<<<< HEAD

	public CandidateElement createCandidateElement(RetailscmUserContext userContext,String name, String type, String image, String containerId) throws Exception
=======
	public CandidateElement createCandidateElement(RetailscmUserContext userContext, String name,String type,String image,String containerId) throws Exception
	//public CandidateElement createCandidateElement(RetailscmUserContext userContext,String name, String type, String image, String containerId) throws Exception
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	{
		
		

		

<<<<<<< HEAD
		userContext.getChecker().checkNameOfCandidateElement(name);
		userContext.getChecker().checkTypeOfCandidateElement(type);
		userContext.getChecker().checkImageOfCandidateElement(image);
	
		userContext.getChecker().throwExceptionIfHasErrors(CandidateElementManagerException.class);
=======
		checkerOf(userContext).checkNameOfCandidateElement(name);
		checkerOf(userContext).checkTypeOfCandidateElement(type);
		checkerOf(userContext).checkImageOfCandidateElement(image);
	
		checkerOf(userContext).throwExceptionIfHasErrors(CandidateElementManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe


		CandidateElement candidateElement=createNewCandidateElement();	

		candidateElement.setName(name);
		candidateElement.setType(type);
		candidateElement.setImage(image);
			
		CandidateContainer container = loadCandidateContainer(userContext, containerId,emptyOptions());
		candidateElement.setContainer(container);
		
		

		candidateElement = saveCandidateElement(userContext, candidateElement, emptyOptions());
		
		onNewInstanceCreated(userContext, candidateElement);
		return candidateElement;

		
	}
	protected CandidateElement createNewCandidateElement() 
	{
		
		return new CandidateElement();		
	}
	
	protected void checkParamsForUpdatingCandidateElement(RetailscmUserContext userContext,String candidateElementId, int candidateElementVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfCandidateElement(candidateElementId);
		userContext.getChecker().checkVersionOfCandidateElement( candidateElementVersion);
		

		if(CandidateElement.NAME_PROPERTY.equals(property)){
			userContext.getChecker().checkNameOfCandidateElement(parseString(newValueExpr));
		}
		if(CandidateElement.TYPE_PROPERTY.equals(property)){
			userContext.getChecker().checkTypeOfCandidateElement(parseString(newValueExpr));
		}
		if(CandidateElement.IMAGE_PROPERTY.equals(property)){
			userContext.getChecker().checkImageOfCandidateElement(parseString(newValueExpr));
=======
		checkerOf(userContext).checkIdOfCandidateElement(candidateElementId);
		checkerOf(userContext).checkVersionOfCandidateElement( candidateElementVersion);
		

		if(CandidateElement.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfCandidateElement(parseString(newValueExpr));
		}
		if(CandidateElement.TYPE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTypeOfCandidateElement(parseString(newValueExpr));
		}
		if(CandidateElement.IMAGE_PROPERTY.equals(property)){
			checkerOf(userContext).checkImageOfCandidateElement(parseString(newValueExpr));
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}		

		
	
<<<<<<< HEAD
		userContext.getChecker().throwExceptionIfHasErrors(CandidateElementManagerException.class);
=======
		checkerOf(userContext).throwExceptionIfHasErrors(CandidateElementManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	
		
	}
	
	
	
	public CandidateElement clone(RetailscmUserContext userContext, String fromCandidateElementId) throws Exception{
		
<<<<<<< HEAD
		return userContext.getDAOGroup().getCandidateElementDAO().clone(fromCandidateElementId, this.allTokens());
=======
		return candidateElementDaoOf(userContext).clone(fromCandidateElementId, this.allTokens());
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}
	
	public CandidateElement internalSaveCandidateElement(RetailscmUserContext userContext, CandidateElement candidateElement) throws Exception 
	{
		return internalSaveCandidateElement(userContext, candidateElement, allTokens());

	}
	public CandidateElement internalSaveCandidateElement(RetailscmUserContext userContext, CandidateElement candidateElement, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingCandidateElement(userContext, candidateElementId, candidateElementVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(candidateElement){ 
			//will be good when the candidateElement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to CandidateElement.
			if (candidateElement.isChanged()){
			
			}
			candidateElement = saveCandidateElement(userContext, candidateElement, options);
			return candidateElement;
			
		}

	}
	
	public CandidateElement updateCandidateElement(RetailscmUserContext userContext,String candidateElementId, int candidateElementVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingCandidateElement(userContext, candidateElementId, candidateElementVersion, property, newValueExpr, tokensExpr);
		
		
		
		CandidateElement candidateElement = loadCandidateElement(userContext, candidateElementId, allTokens());
		if(candidateElement.getVersion() != candidateElementVersion){
			String message = "The target version("+candidateElement.getVersion()+") is not equals to version("+candidateElementVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(candidateElement){ 
			//will be good when the candidateElement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to CandidateElement.
			
			candidateElement.changeProperty(property, newValueExpr);
			candidateElement = saveCandidateElement(userContext, candidateElement, tokens().done());
			return present(userContext,candidateElement, mergedAllTokens(tokensExpr));
			//return saveCandidateElement(userContext, candidateElement, tokens().done());
		}

	}
	
	public CandidateElement updateCandidateElementProperty(RetailscmUserContext userContext,String candidateElementId, int candidateElementVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingCandidateElement(userContext, candidateElementId, candidateElementVersion, property, newValueExpr, tokensExpr);
		
		CandidateElement candidateElement = loadCandidateElement(userContext, candidateElementId, allTokens());
		if(candidateElement.getVersion() != candidateElementVersion){
			String message = "The target version("+candidateElement.getVersion()+") is not equals to version("+candidateElementVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(candidateElement){ 
			//will be good when the candidateElement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to CandidateElement.
			
			candidateElement.changeProperty(property, newValueExpr);
			
			candidateElement = saveCandidateElement(userContext, candidateElement, tokens().done());
			return present(userContext,candidateElement, mergedAllTokens(tokensExpr));
			//return saveCandidateElement(userContext, candidateElement, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected CandidateElementTokens tokens(){
		return CandidateElementTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return CandidateElementTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return CandidateElementTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherContainer(RetailscmUserContext userContext, String candidateElementId, String anotherContainerId) throws Exception
 	{
 		
<<<<<<< HEAD
 		userContext.getChecker().checkIdOfCandidateElement(candidateElementId);
 		userContext.getChecker().checkIdOfCandidateContainer(anotherContainerId);//check for optional reference
 		userContext.getChecker().throwExceptionIfHasErrors(CandidateElementManagerException.class);
=======
 		checkerOf(userContext).checkIdOfCandidateElement(candidateElementId);
 		checkerOf(userContext).checkIdOfCandidateContainer(anotherContainerId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(CandidateElementManagerException.class);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 		
 	}
 	public CandidateElement transferToAnotherContainer(RetailscmUserContext userContext, String candidateElementId, String anotherContainerId) throws Exception
 	{
 		checkParamsForTransferingAnotherContainer(userContext, candidateElementId,anotherContainerId);
 
		CandidateElement candidateElement = loadCandidateElement(userContext, candidateElementId, allTokens());	
		synchronized(candidateElement){
			//will be good when the candidateElement loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			CandidateContainer container = loadCandidateContainer(userContext, anotherContainerId, emptyOptions());		
			candidateElement.updateContainer(container);		
			candidateElement = saveCandidateElement(userContext, candidateElement, emptyOptions());
			
			return present(userContext,candidateElement, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateCandidateContainer requestCandidateContainer(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateCandidateContainer result = new CandidateCandidateContainer();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
<<<<<<< HEAD
		SmartList<CandidateContainer> candidateList = userContext.getDAOGroup().getCandidateContainerDAO().requestCandidateCandidateContainerForCandidateElement(userContext,ownerClass, id, filterKey, pageNo, pageSize);
=======
		SmartList<CandidateContainer> candidateList = candidateContainerDaoOf(userContext).requestCandidateCandidateContainerForCandidateElement(userContext,ownerClass, id, filterKey, pageNo, pageSize);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected CandidateContainer loadCandidateContainer(RetailscmUserContext userContext, String newContainerId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getCandidateContainerDAO().load(newContainerId, options);
=======
 		return candidateContainerDaoOf(userContext).load(newContainerId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String candidateElementId, int candidateElementVersion) throws Exception {
		//deleteInternal(userContext, candidateElementId, candidateElementVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String candidateElementId, int candidateElementVersion) throws Exception{
			
<<<<<<< HEAD
		userContext.getDAOGroup().getCandidateElementDAO().delete(candidateElementId, candidateElementVersion);
=======
		candidateElementDaoOf(userContext).delete(candidateElementId, candidateElementVersion);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}
	
	public CandidateElement forgetByAll(RetailscmUserContext userContext, String candidateElementId, int candidateElementVersion) throws Exception {
		return forgetByAllInternal(userContext, candidateElementId, candidateElementVersion);		
	}
	protected CandidateElement forgetByAllInternal(RetailscmUserContext userContext,
			String candidateElementId, int candidateElementVersion) throws Exception{
			
<<<<<<< HEAD
		return userContext.getDAOGroup().getCandidateElementDAO().disconnectFromAll(candidateElementId, candidateElementVersion);
	}
	
=======
		return candidateElementDaoOf(userContext).disconnectFromAll(candidateElementId, candidateElementVersion);
	}
	
	
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new CandidateElementManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
<<<<<<< HEAD
		return userContext.getDAOGroup().getCandidateElementDAO().deleteAll();
=======
		return candidateElementDaoOf(userContext).deleteAll();
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, CandidateElement newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}








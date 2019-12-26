
package com.doublechaintech.retailscm.originalvouchercreation;

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

import com.doublechaintech.retailscm.originalvoucher.OriginalVoucher;


import com.doublechaintech.retailscm.accountingdocument.AccountingDocument;
import com.doublechaintech.retailscm.originalvouchercreation.OriginalVoucherCreation;
import com.doublechaintech.retailscm.originalvoucherauditing.OriginalVoucherAuditing;
import com.doublechaintech.retailscm.originalvoucherconfirmation.OriginalVoucherConfirmation;






public class OriginalVoucherCreationManagerImpl extends CustomRetailscmCheckerManager implements OriginalVoucherCreationManager {
	
	private static final String SERVICE_TYPE = "OriginalVoucherCreation";
	@Override
	public OriginalVoucherCreationDAO daoOf(RetailscmUserContext userContext) {
		return originalVoucherCreationDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws OriginalVoucherCreationManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new OriginalVoucherCreationManagerException(message);

	}
	
	

 	protected OriginalVoucherCreation saveOriginalVoucherCreation(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, String [] tokensExpr) throws Exception{	
 		//return getOriginalVoucherCreationDAO().save(originalVoucherCreation, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens);
 	}
 	
 	protected OriginalVoucherCreation saveOriginalVoucherCreationDetail(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation) throws Exception{	

 		
 		return saveOriginalVoucherCreation(userContext, originalVoucherCreation, allTokens());
 	}
 	
 	public OriginalVoucherCreation loadOriginalVoucherCreation(RetailscmUserContext userContext, String originalVoucherCreationId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherCreationManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation( userContext, originalVoucherCreationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,originalVoucherCreation, tokens);
 	}
 	
 	
 	 public OriginalVoucherCreation searchOriginalVoucherCreation(RetailscmUserContext userContext, String originalVoucherCreationId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherCreationManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation( userContext, originalVoucherCreationId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,originalVoucherCreation, tokens);
 	}
 	
 	

 	protected OriginalVoucherCreation present(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,originalVoucherCreation,tokens);
		
		
		OriginalVoucherCreation  originalVoucherCreationToPresent = originalVoucherCreationDaoOf(userContext).present(originalVoucherCreation, tokens);
		
		List<BaseEntity> entityListToNaming = originalVoucherCreationToPresent.collectRefercencesFromLists();
		originalVoucherCreationDaoOf(userContext).alias(entityListToNaming);
		
		return  originalVoucherCreationToPresent;
		
		
	}
 
 	
 	
 	public OriginalVoucherCreation loadOriginalVoucherCreationDetail(RetailscmUserContext userContext, String originalVoucherCreationId) throws Exception{	
 		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation( userContext, originalVoucherCreationId, allTokens());
 		return present(userContext,originalVoucherCreation, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String originalVoucherCreationId) throws Exception{	
 		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation( userContext, originalVoucherCreationId, viewTokens());
 		return present(userContext,originalVoucherCreation, allTokens());
		
 	}
 	protected OriginalVoucherCreation saveOriginalVoucherCreation(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, Map<String,Object>tokens) throws Exception{	
 		return originalVoucherCreationDaoOf(userContext).save(originalVoucherCreation, tokens);
 	}
 	protected OriginalVoucherCreation loadOriginalVoucherCreation(RetailscmUserContext userContext, String originalVoucherCreationId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherCreationManagerException.class);

 
 		return originalVoucherCreationDaoOf(userContext).load(originalVoucherCreationId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, Map<String, Object> tokens){
		super.addActions(userContext, originalVoucherCreation, tokens);
		
		addAction(userContext, originalVoucherCreation, tokens,"@create","createOriginalVoucherCreation","createOriginalVoucherCreation/","main","primary");
		addAction(userContext, originalVoucherCreation, tokens,"@update","updateOriginalVoucherCreation","updateOriginalVoucherCreation/"+originalVoucherCreation.getId()+"/","main","primary");
		addAction(userContext, originalVoucherCreation, tokens,"@copy","cloneOriginalVoucherCreation","cloneOriginalVoucherCreation/"+originalVoucherCreation.getId()+"/","main","primary");
		
		addAction(userContext, originalVoucherCreation, tokens,"original_voucher_creation.addOriginalVoucher","addOriginalVoucher","addOriginalVoucher/"+originalVoucherCreation.getId()+"/","originalVoucherList","primary");
		addAction(userContext, originalVoucherCreation, tokens,"original_voucher_creation.removeOriginalVoucher","removeOriginalVoucher","removeOriginalVoucher/"+originalVoucherCreation.getId()+"/","originalVoucherList","primary");
		addAction(userContext, originalVoucherCreation, tokens,"original_voucher_creation.updateOriginalVoucher","updateOriginalVoucher","updateOriginalVoucher/"+originalVoucherCreation.getId()+"/","originalVoucherList","primary");
		addAction(userContext, originalVoucherCreation, tokens,"original_voucher_creation.copyOriginalVoucherFrom","copyOriginalVoucherFrom","copyOriginalVoucherFrom/"+originalVoucherCreation.getId()+"/","originalVoucherList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public OriginalVoucherCreation createOriginalVoucherCreation(RetailscmUserContext userContext, String who,String comments,Date makeDate) throws Exception
	//public OriginalVoucherCreation createOriginalVoucherCreation(RetailscmUserContext userContext,String who, String comments, Date makeDate) throws Exception
	{
		
		

		

		checkerOf(userContext).checkWhoOfOriginalVoucherCreation(who);
		checkerOf(userContext).checkCommentsOfOriginalVoucherCreation(comments);
		checkerOf(userContext).checkMakeDateOfOriginalVoucherCreation(makeDate);
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);


		OriginalVoucherCreation originalVoucherCreation=createNewOriginalVoucherCreation();	

		originalVoucherCreation.setWho(who);
		originalVoucherCreation.setComments(comments);
		originalVoucherCreation.setMakeDate(makeDate);

		originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, emptyOptions());
		
		onNewInstanceCreated(userContext, originalVoucherCreation);
		return originalVoucherCreation;

		
	}
	protected OriginalVoucherCreation createNewOriginalVoucherCreation() 
	{
		
		return new OriginalVoucherCreation();		
	}
	
	protected void checkParamsForUpdatingOriginalVoucherCreation(RetailscmUserContext userContext,String originalVoucherCreationId, int originalVoucherCreationVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).checkVersionOfOriginalVoucherCreation( originalVoucherCreationVersion);
		

		if(OriginalVoucherCreation.WHO_PROPERTY.equals(property)){
			checkerOf(userContext).checkWhoOfOriginalVoucherCreation(parseString(newValueExpr));
		}
		if(OriginalVoucherCreation.COMMENTS_PROPERTY.equals(property)){
			checkerOf(userContext).checkCommentsOfOriginalVoucherCreation(parseString(newValueExpr));
		}
		if(OriginalVoucherCreation.MAKE_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMakeDateOfOriginalVoucherCreation(parseDate(newValueExpr));
		}
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
	
		
	}
	
	
	
	public OriginalVoucherCreation clone(RetailscmUserContext userContext, String fromOriginalVoucherCreationId) throws Exception{
		
		return originalVoucherCreationDaoOf(userContext).clone(fromOriginalVoucherCreationId, this.allTokens());
	}
	
	public OriginalVoucherCreation internalSaveOriginalVoucherCreation(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation) throws Exception 
	{
		return internalSaveOriginalVoucherCreation(userContext, originalVoucherCreation, allTokens());

	}
	public OriginalVoucherCreation internalSaveOriginalVoucherCreation(RetailscmUserContext userContext, OriginalVoucherCreation originalVoucherCreation, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingOriginalVoucherCreation(userContext, originalVoucherCreationId, originalVoucherCreationVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(originalVoucherCreation){ 
			//will be good when the originalVoucherCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucherCreation.
			if (originalVoucherCreation.isChanged()){
			
			}
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, options);
			return originalVoucherCreation;
			
		}

	}
	
	public OriginalVoucherCreation updateOriginalVoucherCreation(RetailscmUserContext userContext,String originalVoucherCreationId, int originalVoucherCreationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingOriginalVoucherCreation(userContext, originalVoucherCreationId, originalVoucherCreationVersion, property, newValueExpr, tokensExpr);
		
		
		
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
		if(originalVoucherCreation.getVersion() != originalVoucherCreationVersion){
			String message = "The target version("+originalVoucherCreation.getVersion()+") is not equals to version("+originalVoucherCreationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(originalVoucherCreation){ 
			//will be good when the originalVoucherCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucherCreation.
			
			originalVoucherCreation.changeProperty(property, newValueExpr);
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().done());
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
			//return saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().done());
		}

	}
	
	public OriginalVoucherCreation updateOriginalVoucherCreationProperty(RetailscmUserContext userContext,String originalVoucherCreationId, int originalVoucherCreationVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingOriginalVoucherCreation(userContext, originalVoucherCreationId, originalVoucherCreationVersion, property, newValueExpr, tokensExpr);
		
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
		if(originalVoucherCreation.getVersion() != originalVoucherCreationVersion){
			String message = "The target version("+originalVoucherCreation.getVersion()+") is not equals to version("+originalVoucherCreationVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(originalVoucherCreation){ 
			//will be good when the originalVoucherCreation loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucherCreation.
			
			originalVoucherCreation.changeProperty(property, newValueExpr);
			
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().done());
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
			//return saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected OriginalVoucherCreationTokens tokens(){
		return OriginalVoucherCreationTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return OriginalVoucherCreationTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortOriginalVoucherListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return OriginalVoucherCreationTokens.mergeAll(tokens).done();
	}
	
//--------------------------------------------------------------
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String originalVoucherCreationId, int originalVoucherCreationVersion) throws Exception {
		//deleteInternal(userContext, originalVoucherCreationId, originalVoucherCreationVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String originalVoucherCreationId, int originalVoucherCreationVersion) throws Exception{
			
		originalVoucherCreationDaoOf(userContext).delete(originalVoucherCreationId, originalVoucherCreationVersion);
	}
	
	public OriginalVoucherCreation forgetByAll(RetailscmUserContext userContext, String originalVoucherCreationId, int originalVoucherCreationVersion) throws Exception {
		return forgetByAllInternal(userContext, originalVoucherCreationId, originalVoucherCreationVersion);		
	}
	protected OriginalVoucherCreation forgetByAllInternal(RetailscmUserContext userContext,
			String originalVoucherCreationId, int originalVoucherCreationVersion) throws Exception{
			
		return originalVoucherCreationDaoOf(userContext).disconnectFromAll(originalVoucherCreationId, originalVoucherCreationVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new OriginalVoucherCreationManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return originalVoucherCreationDaoOf(userContext).deleteAll();
	}


	//disconnect OriginalVoucherCreation with belongs_to in OriginalVoucher
	protected OriginalVoucherCreation breakWithOriginalVoucherByBelongsTo(RetailscmUserContext userContext, String originalVoucherCreationId, String belongsToId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());

			synchronized(originalVoucherCreation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				originalVoucherCreationDaoOf(userContext).planToRemoveOriginalVoucherListWithBelongsTo(originalVoucherCreation, belongsToId, this.emptyOptions());

				originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
				return originalVoucherCreation;
			}
	}
	//disconnect OriginalVoucherCreation with confirmation in OriginalVoucher
	protected OriginalVoucherCreation breakWithOriginalVoucherByConfirmation(RetailscmUserContext userContext, String originalVoucherCreationId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());

			synchronized(originalVoucherCreation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				originalVoucherCreationDaoOf(userContext).planToRemoveOriginalVoucherListWithConfirmation(originalVoucherCreation, confirmationId, this.emptyOptions());

				originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
				return originalVoucherCreation;
			}
	}
	//disconnect OriginalVoucherCreation with auditing in OriginalVoucher
	protected OriginalVoucherCreation breakWithOriginalVoucherByAuditing(RetailscmUserContext userContext, String originalVoucherCreationId, String auditingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());

			synchronized(originalVoucherCreation){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				originalVoucherCreationDaoOf(userContext).planToRemoveOriginalVoucherListWithAuditing(originalVoucherCreation, auditingId, this.emptyOptions());

				originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
				return originalVoucherCreation;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String belongsToId, String confirmationId, String auditingId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);

		
		checkerOf(userContext).checkTitleOfOriginalVoucher(title);
		
		checkerOf(userContext).checkMadeByOfOriginalVoucher(madeBy);
		
		checkerOf(userContext).checkReceivedByOfOriginalVoucher(receivedBy);
		
		checkerOf(userContext).checkVoucherTypeOfOriginalVoucher(voucherType);
		
		checkerOf(userContext).checkVoucherImageOfOriginalVoucher(voucherImage);
		
		checkerOf(userContext).checkBelongsToIdOfOriginalVoucher(belongsToId);
		
		checkerOf(userContext).checkConfirmationIdOfOriginalVoucher(confirmationId);
		
		checkerOf(userContext).checkAuditingIdOfOriginalVoucher(auditingId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);

	
	}
	public  OriginalVoucherCreation addOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String belongsToId, String confirmationId, String auditingId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingOriginalVoucher(userContext,originalVoucherCreationId,title, madeBy, receivedBy, voucherType, voucherImage, belongsToId, confirmationId, auditingId,tokensExpr);
		
		OriginalVoucher originalVoucher = createOriginalVoucher(userContext,title, madeBy, receivedBy, voucherType, voucherImage, belongsToId, confirmationId, auditingId);
		
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
		synchronized(originalVoucherCreation){ 
			//Will be good when the originalVoucherCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			originalVoucherCreation.addOriginalVoucher( originalVoucher );		
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
			
			userContext.getManagerGroup().getOriginalVoucherManager().onNewInstanceCreated(userContext, originalVoucher);
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingOriginalVoucherProperties(RetailscmUserContext userContext, String originalVoucherCreationId,String id,String title,String madeBy,String receivedBy,String voucherType,String voucherImage,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).checkIdOfOriginalVoucher(id);
		
		checkerOf(userContext).checkTitleOfOriginalVoucher( title);
		checkerOf(userContext).checkMadeByOfOriginalVoucher( madeBy);
		checkerOf(userContext).checkReceivedByOfOriginalVoucher( receivedBy);
		checkerOf(userContext).checkVoucherTypeOfOriginalVoucher( voucherType);
		checkerOf(userContext).checkVoucherImageOfOriginalVoucher( voucherImage);

		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
		
	}
	public  OriginalVoucherCreation updateOriginalVoucherProperties(RetailscmUserContext userContext, String originalVoucherCreationId, String id,String title,String madeBy,String receivedBy,String voucherType,String voucherImage, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingOriginalVoucherProperties(userContext,originalVoucherCreationId,id,title,madeBy,receivedBy,voucherType,voucherImage,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withOriginalVoucherListList()
				.searchOriginalVoucherListWith(OriginalVoucher.ID_PROPERTY, "is", id).done();
		
		OriginalVoucherCreation originalVoucherCreationToUpdate = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, options);
		
		if(originalVoucherCreationToUpdate.getOriginalVoucherList().isEmpty()){
			throw new OriginalVoucherCreationManagerException("OriginalVoucher is NOT FOUND with id: '"+id+"'");
		}
		
		OriginalVoucher item = originalVoucherCreationToUpdate.getOriginalVoucherList().first();
		
		item.updateTitle( title );
		item.updateMadeBy( madeBy );
		item.updateReceivedBy( receivedBy );
		item.updateVoucherType( voucherType );
		item.updateVoucherImage( voucherImage );

		
		//checkParamsForAddingOriginalVoucher(userContext,originalVoucherCreationId,name, code, used,tokensExpr);
		OriginalVoucherCreation originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreationToUpdate, tokens().withOriginalVoucherList().done());
		synchronized(originalVoucherCreation){ 
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected OriginalVoucher createOriginalVoucher(RetailscmUserContext userContext, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String belongsToId, String confirmationId, String auditingId) throws Exception{

		OriginalVoucher originalVoucher = new OriginalVoucher();
		
		
		originalVoucher.setTitle(title);		
		originalVoucher.setMadeBy(madeBy);		
		originalVoucher.setReceivedBy(receivedBy);		
		originalVoucher.setVoucherType(voucherType);		
		originalVoucher.setVoucherImage(voucherImage);		
		AccountingDocument  belongsTo = new AccountingDocument();
		belongsTo.setId(belongsToId);		
		originalVoucher.setBelongsTo(belongsTo);		
		OriginalVoucherConfirmation  confirmation = new OriginalVoucherConfirmation();
		confirmation.setId(confirmationId);		
		originalVoucher.setConfirmation(confirmation);		
		OriginalVoucherAuditing  auditing = new OriginalVoucherAuditing();
		auditing.setId(auditingId);		
		originalVoucher.setAuditing(auditing);
	
		
		return originalVoucher;
	
		
	}
	
	protected OriginalVoucher createIndexedOriginalVoucher(String id, int version){

		OriginalVoucher originalVoucher = new OriginalVoucher();
		originalVoucher.setId(id);
		originalVoucher.setVersion(version);
		return originalVoucher;			
		
	}
	
	protected void checkParamsForRemovingOriginalVoucherList(RetailscmUserContext userContext, String originalVoucherCreationId, 
			String originalVoucherIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		for(String originalVoucherIdItem: originalVoucherIds){
			userContext.getChecker().checkIdOfOriginalVoucher(originalVoucherIdItem);
=======
		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		for(String originalVoucherIdItem: originalVoucherIds){
			checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
		
	}
	public  OriginalVoucherCreation removeOriginalVoucherList(RetailscmUserContext userContext, String originalVoucherCreationId, 
			String originalVoucherIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingOriginalVoucherList(userContext, originalVoucherCreationId,  originalVoucherIds, tokensExpr);
			
			
			OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
			synchronized(originalVoucherCreation){ 
				//Will be good when the originalVoucherCreation loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				originalVoucherCreationDaoOf(userContext).planToRemoveOriginalVoucherList(originalVoucherCreation, originalVoucherIds, allTokens());
				originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
				deleteRelationListInGraph(userContext, originalVoucherCreation.getOriginalVoucherList());
				return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfOriginalVoucherCreation( originalVoucherCreationId);
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher(originalVoucherVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
	
	}
	public  OriginalVoucherCreation removeOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingOriginalVoucher(userContext,originalVoucherCreationId, originalVoucherId, originalVoucherVersion,tokensExpr);
		
		OriginalVoucher originalVoucher = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
		synchronized(originalVoucherCreation){ 
			//Will be good when the originalVoucherCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			originalVoucherCreation.removeOriginalVoucher( originalVoucher );		
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
			deleteRelationInGraph(userContext, originalVoucher);
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfOriginalVoucherCreation( originalVoucherCreationId);
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher(originalVoucherVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
	
	}
	public  OriginalVoucherCreation copyOriginalVoucherFrom(RetailscmUserContext userContext, String originalVoucherCreationId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingOriginalVoucher(userContext,originalVoucherCreationId, originalVoucherId, originalVoucherVersion,tokensExpr);
		
		OriginalVoucher originalVoucher = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, allTokens());
		synchronized(originalVoucherCreation){ 
			//Will be good when the originalVoucherCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			originalVoucherCreation.copyOriginalVoucherFrom( originalVoucher );		
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
			
			userContext.getManagerGroup().getOriginalVoucherManager().onNewInstanceCreated(userContext, (OriginalVoucher)originalVoucherCreation.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfOriginalVoucherCreation(originalVoucherCreationId);
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher(originalVoucherVersion);
		

		if(OriginalVoucher.TITLE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTitleOfOriginalVoucher(parseString(newValueExpr));
		}
		
		if(OriginalVoucher.MADE_BY_PROPERTY.equals(property)){
			checkerOf(userContext).checkMadeByOfOriginalVoucher(parseString(newValueExpr));
		}
		
		if(OriginalVoucher.RECEIVED_BY_PROPERTY.equals(property)){
			checkerOf(userContext).checkReceivedByOfOriginalVoucher(parseString(newValueExpr));
		}
		
		if(OriginalVoucher.VOUCHER_TYPE_PROPERTY.equals(property)){
			checkerOf(userContext).checkVoucherTypeOfOriginalVoucher(parseString(newValueExpr));
		}
		
		if(OriginalVoucher.VOUCHER_IMAGE_PROPERTY.equals(property)){
			checkerOf(userContext).checkVoucherImageOfOriginalVoucher(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherCreationManagerException.class);
	
	}
	
	public  OriginalVoucherCreation updateOriginalVoucher(RetailscmUserContext userContext, String originalVoucherCreationId, String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingOriginalVoucher(userContext, originalVoucherCreationId, originalVoucherId, originalVoucherVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withOriginalVoucherList().searchOriginalVoucherListWith(OriginalVoucher.ID_PROPERTY, "eq", originalVoucherId).done();
		
		
		
		OriginalVoucherCreation originalVoucherCreation = loadOriginalVoucherCreation(userContext, originalVoucherCreationId, loadTokens);
		
		synchronized(originalVoucherCreation){ 
			//Will be good when the originalVoucherCreation loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//originalVoucherCreation.removeOriginalVoucher( originalVoucher );	
			//make changes to AcceleraterAccount.
			OriginalVoucher originalVoucherIndex = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		
			OriginalVoucher originalVoucher = originalVoucherCreation.findTheOriginalVoucher(originalVoucherIndex);
			if(originalVoucher == null){
				throw new OriginalVoucherCreationManagerException(originalVoucher+" is NOT FOUND" );
			}
			
			originalVoucher.changeProperty(property, newValueExpr);
			
			originalVoucherCreation = saveOriginalVoucherCreation(userContext, originalVoucherCreation, tokens().withOriginalVoucherList().done());
			return present(userContext,originalVoucherCreation, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, OriginalVoucherCreation newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



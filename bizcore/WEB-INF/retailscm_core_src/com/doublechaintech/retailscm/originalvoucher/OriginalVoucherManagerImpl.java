
package com.doublechaintech.retailscm.originalvoucher;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.accountingdocument.AccountingDocument;

import com.doublechaintech.retailscm.accountingdocument.CandidateAccountingDocument;







public class OriginalVoucherManagerImpl extends CustomRetailscmCheckerManager implements OriginalVoucherManager {

  


	private static final String SERVICE_TYPE = "OriginalVoucher";
	@Override
	public OriginalVoucherDAO daoOf(RetailscmUserContext userContext) {
		return originalVoucherDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws OriginalVoucherManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new OriginalVoucherManagerException(message);

	}



 	protected OriginalVoucher saveOriginalVoucher(RetailscmUserContext userContext, OriginalVoucher originalVoucher, String [] tokensExpr) throws Exception{	
 		//return getOriginalVoucherDAO().save(originalVoucher, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveOriginalVoucher(userContext, originalVoucher, tokens);
 	}
 	
 	protected OriginalVoucher saveOriginalVoucherDetail(RetailscmUserContext userContext, OriginalVoucher originalVoucher) throws Exception{	

 		
 		return saveOriginalVoucher(userContext, originalVoucher, allTokens());
 	}
 	
 	public OriginalVoucher loadOriginalVoucher(RetailscmUserContext userContext, String originalVoucherId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		OriginalVoucher originalVoucher = loadOriginalVoucher( userContext, originalVoucherId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,originalVoucher, tokens);
 	}
 	
 	
 	 public OriginalVoucher searchOriginalVoucher(RetailscmUserContext userContext, String originalVoucherId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		OriginalVoucher originalVoucher = loadOriginalVoucher( userContext, originalVoucherId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,originalVoucher, tokens);
 	}
 	
 	

 	protected OriginalVoucher present(RetailscmUserContext userContext, OriginalVoucher originalVoucher, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,originalVoucher,tokens);
		
		
		OriginalVoucher  originalVoucherToPresent = originalVoucherDaoOf(userContext).present(originalVoucher, tokens);
		
		List<BaseEntity> entityListToNaming = originalVoucherToPresent.collectRefercencesFromLists();
		originalVoucherDaoOf(userContext).alias(entityListToNaming);
		
		return  originalVoucherToPresent;
		
		
	}
 
 	
 	
 	public OriginalVoucher loadOriginalVoucherDetail(RetailscmUserContext userContext, String originalVoucherId) throws Exception{	
 		OriginalVoucher originalVoucher = loadOriginalVoucher( userContext, originalVoucherId, allTokens());
 		return present(userContext,originalVoucher, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String originalVoucherId) throws Exception{	
 		OriginalVoucher originalVoucher = loadOriginalVoucher( userContext, originalVoucherId, viewTokens());
 		return present(userContext,originalVoucher, allTokens());
		
 	}
 	protected OriginalVoucher saveOriginalVoucher(RetailscmUserContext userContext, OriginalVoucher originalVoucher, Map<String,Object>tokens) throws Exception{	
 		return originalVoucherDaoOf(userContext).save(originalVoucher, tokens);
 	}
 	protected OriginalVoucher loadOriginalVoucher(RetailscmUserContext userContext, String originalVoucherId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).throwExceptionIfHasErrors( OriginalVoucherManagerException.class);

 
 		return originalVoucherDaoOf(userContext).load(originalVoucherId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OriginalVoucher originalVoucher, Map<String, Object> tokens){
		super.addActions(userContext, originalVoucher, tokens);
		
		addAction(userContext, originalVoucher, tokens,"@create","createOriginalVoucher","createOriginalVoucher/","main","primary");
		addAction(userContext, originalVoucher, tokens,"@update","updateOriginalVoucher","updateOriginalVoucher/"+originalVoucher.getId()+"/","main","primary");
		addAction(userContext, originalVoucher, tokens,"@copy","cloneOriginalVoucher","cloneOriginalVoucher/"+originalVoucher.getId()+"/","main","primary");
		
		addAction(userContext, originalVoucher, tokens,"original_voucher.transfer_to_belongs_to","transferToAnotherBelongsTo","transferToAnotherBelongsTo/"+originalVoucher.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, OriginalVoucher originalVoucher, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public OriginalVoucher createOriginalVoucher(RetailscmUserContext userContext, String title,String madeBy,String receivedBy,String voucherType,String voucherImage,String belongsToId) throws Exception
	//public OriginalVoucher createOriginalVoucher(RetailscmUserContext userContext,String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String belongsToId) throws Exception
	{

		

		

		checkerOf(userContext).checkTitleOfOriginalVoucher(title);
		checkerOf(userContext).checkMadeByOfOriginalVoucher(madeBy);
		checkerOf(userContext).checkReceivedByOfOriginalVoucher(receivedBy);
		checkerOf(userContext).checkVoucherTypeOfOriginalVoucher(voucherType);
		checkerOf(userContext).checkVoucherImageOfOriginalVoucher(voucherImage);
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherManagerException.class);


		OriginalVoucher originalVoucher=createNewOriginalVoucher();	

		originalVoucher.setTitle(title);
		originalVoucher.setMadeBy(madeBy);
		originalVoucher.setReceivedBy(receivedBy);
		originalVoucher.setVoucherType(voucherType);
		originalVoucher.setVoucherImage(voucherImage);
			
		AccountingDocument belongsTo = loadAccountingDocument(userContext, belongsToId,emptyOptions());
		originalVoucher.setBelongsTo(belongsTo);
		
		

		originalVoucher = saveOriginalVoucher(userContext, originalVoucher, emptyOptions());
		
		onNewInstanceCreated(userContext, originalVoucher);
		return originalVoucher;


	}
	protected OriginalVoucher createNewOriginalVoucher()
	{

		return new OriginalVoucher();
	}

	protected void checkParamsForUpdatingOriginalVoucher(RetailscmUserContext userContext,String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher( originalVoucherVersion);
		

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

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherManagerException.class);


	}



	public OriginalVoucher clone(RetailscmUserContext userContext, String fromOriginalVoucherId) throws Exception{

		return originalVoucherDaoOf(userContext).clone(fromOriginalVoucherId, this.allTokens());
	}

	public OriginalVoucher internalSaveOriginalVoucher(RetailscmUserContext userContext, OriginalVoucher originalVoucher) throws Exception
	{
		return internalSaveOriginalVoucher(userContext, originalVoucher, allTokens());

	}
	public OriginalVoucher internalSaveOriginalVoucher(RetailscmUserContext userContext, OriginalVoucher originalVoucher, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingOriginalVoucher(userContext, originalVoucherId, originalVoucherVersion, property, newValueExpr, tokensExpr);


		synchronized(originalVoucher){
			//will be good when the originalVoucher loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucher.
			if (originalVoucher.isChanged()){
			
			}
			originalVoucher = saveOriginalVoucher(userContext, originalVoucher, options);
			return originalVoucher;

		}

	}

	public OriginalVoucher updateOriginalVoucher(RetailscmUserContext userContext,String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingOriginalVoucher(userContext, originalVoucherId, originalVoucherVersion, property, newValueExpr, tokensExpr);



		OriginalVoucher originalVoucher = loadOriginalVoucher(userContext, originalVoucherId, allTokens());
		if(originalVoucher.getVersion() != originalVoucherVersion){
			String message = "The target version("+originalVoucher.getVersion()+") is not equals to version("+originalVoucherVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(originalVoucher){
			//will be good when the originalVoucher loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucher.
			
			originalVoucher.changeProperty(property, newValueExpr);
			originalVoucher = saveOriginalVoucher(userContext, originalVoucher, tokens().done());
			return present(userContext,originalVoucher, mergedAllTokens(tokensExpr));
			//return saveOriginalVoucher(userContext, originalVoucher, tokens().done());
		}

	}

	public OriginalVoucher updateOriginalVoucherProperty(RetailscmUserContext userContext,String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingOriginalVoucher(userContext, originalVoucherId, originalVoucherVersion, property, newValueExpr, tokensExpr);

		OriginalVoucher originalVoucher = loadOriginalVoucher(userContext, originalVoucherId, allTokens());
		if(originalVoucher.getVersion() != originalVoucherVersion){
			String message = "The target version("+originalVoucher.getVersion()+") is not equals to version("+originalVoucherVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(originalVoucher){
			//will be good when the originalVoucher loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to OriginalVoucher.

			originalVoucher.changeProperty(property, newValueExpr);
			
			originalVoucher = saveOriginalVoucher(userContext, originalVoucher, tokens().done());
			return present(userContext,originalVoucher, mergedAllTokens(tokensExpr));
			//return saveOriginalVoucher(userContext, originalVoucher, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected OriginalVoucherTokens tokens(){
		return OriginalVoucherTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return OriginalVoucherTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return OriginalVoucherTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherBelongsTo(RetailscmUserContext userContext, String originalVoucherId, String anotherBelongsToId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
 		checkerOf(userContext).checkIdOfAccountingDocument(anotherBelongsToId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(OriginalVoucherManagerException.class);

 	}
 	public OriginalVoucher transferToAnotherBelongsTo(RetailscmUserContext userContext, String originalVoucherId, String anotherBelongsToId) throws Exception
 	{
 		checkParamsForTransferingAnotherBelongsTo(userContext, originalVoucherId,anotherBelongsToId);
 
		OriginalVoucher originalVoucher = loadOriginalVoucher(userContext, originalVoucherId, allTokens());	
		synchronized(originalVoucher){
			//will be good when the originalVoucher loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocument belongsTo = loadAccountingDocument(userContext, anotherBelongsToId, emptyOptions());		
			originalVoucher.updateBelongsTo(belongsTo);		
			originalVoucher = saveOriginalVoucher(userContext, originalVoucher, emptyOptions());
			
			return present(userContext,originalVoucher, allTokens());
			
		}

 	}

	


	public CandidateAccountingDocument requestCandidateBelongsTo(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocument result = new CandidateAccountingDocument();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocument> candidateList = accountingDocumentDaoOf(userContext).requestCandidateAccountingDocumentForOriginalVoucher(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected AccountingDocument loadAccountingDocument(RetailscmUserContext userContext, String newBelongsToId, Map<String,Object> options) throws Exception
 	{

 		return accountingDocumentDaoOf(userContext).load(newBelongsToId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String originalVoucherId, int originalVoucherVersion) throws Exception {
		//deleteInternal(userContext, originalVoucherId, originalVoucherVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String originalVoucherId, int originalVoucherVersion) throws Exception{

		originalVoucherDaoOf(userContext).delete(originalVoucherId, originalVoucherVersion);
	}

	public OriginalVoucher forgetByAll(RetailscmUserContext userContext, String originalVoucherId, int originalVoucherVersion) throws Exception {
		return forgetByAllInternal(userContext, originalVoucherId, originalVoucherVersion);
	}
	protected OriginalVoucher forgetByAllInternal(RetailscmUserContext userContext,
			String originalVoucherId, int originalVoucherVersion) throws Exception{

		return originalVoucherDaoOf(userContext).disconnectFromAll(originalVoucherId, originalVoucherVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new OriginalVoucherManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return originalVoucherDaoOf(userContext).deleteAll();
	}








	public void onNewInstanceCreated(RetailscmUserContext userContext, OriginalVoucher newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



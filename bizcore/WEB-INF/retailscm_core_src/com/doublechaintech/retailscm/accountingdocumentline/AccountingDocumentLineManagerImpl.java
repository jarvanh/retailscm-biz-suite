
package com.doublechaintech.retailscm.accountingdocumentline;

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

import com.doublechaintech.retailscm.accountingdocument.AccountingDocument;
import com.doublechaintech.retailscm.accountingsubject.AccountingSubject;

import com.doublechaintech.retailscm.accountingdocument.CandidateAccountingDocument;
import com.doublechaintech.retailscm.accountingsubject.CandidateAccountingSubject;







public class AccountingDocumentLineManagerImpl extends CustomRetailscmCheckerManager implements AccountingDocumentLineManager {
	
	private static final String SERVICE_TYPE = "AccountingDocumentLine";
	@Override
	public AccountingDocumentLineDAO daoOf(RetailscmUserContext userContext) {
		return accountingDocumentLineDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws AccountingDocumentLineManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new AccountingDocumentLineManagerException(message);

	}
	
	

 	protected AccountingDocumentLine saveAccountingDocumentLine(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, String [] tokensExpr) throws Exception{	
 		//return getAccountingDocumentLineDAO().save(accountingDocumentLine, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveAccountingDocumentLine(userContext, accountingDocumentLine, tokens);
 	}
 	
 	protected AccountingDocumentLine saveAccountingDocumentLineDetail(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine) throws Exception{	

 		
 		return saveAccountingDocumentLine(userContext, accountingDocumentLine, allTokens());
 	}
 	
 	public AccountingDocumentLine loadAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentLineId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentLineManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine( userContext, accountingDocumentLineId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocumentLine, tokens);
 	}
 	
 	
 	 public AccountingDocumentLine searchAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentLineId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentLineManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine( userContext, accountingDocumentLineId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocumentLine, tokens);
 	}
 	
 	

 	protected AccountingDocumentLine present(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,accountingDocumentLine,tokens);
		
		
		AccountingDocumentLine  accountingDocumentLineToPresent = accountingDocumentLineDaoOf(userContext).present(accountingDocumentLine, tokens);
		
		List<BaseEntity> entityListToNaming = accountingDocumentLineToPresent.collectRefercencesFromLists();
		accountingDocumentLineDaoOf(userContext).alias(entityListToNaming);
		
		return  accountingDocumentLineToPresent;
		
		
	}
 
 	
 	
 	public AccountingDocumentLine loadAccountingDocumentLineDetail(RetailscmUserContext userContext, String accountingDocumentLineId) throws Exception{	
 		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine( userContext, accountingDocumentLineId, allTokens());
 		return present(userContext,accountingDocumentLine, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String accountingDocumentLineId) throws Exception{	
 		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine( userContext, accountingDocumentLineId, viewTokens());
 		return present(userContext,accountingDocumentLine, allTokens());
		
 	}
 	protected AccountingDocumentLine saveAccountingDocumentLine(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, Map<String,Object>tokens) throws Exception{	
 		return accountingDocumentLineDaoOf(userContext).save(accountingDocumentLine, tokens);
 	}
 	protected AccountingDocumentLine loadAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentLineId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentLineManagerException.class);

 
 		return accountingDocumentLineDaoOf(userContext).load(accountingDocumentLineId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, Map<String, Object> tokens){
		super.addActions(userContext, accountingDocumentLine, tokens);
		
		addAction(userContext, accountingDocumentLine, tokens,"@create","createAccountingDocumentLine","createAccountingDocumentLine/","main","primary");
		addAction(userContext, accountingDocumentLine, tokens,"@update","updateAccountingDocumentLine","updateAccountingDocumentLine/"+accountingDocumentLine.getId()+"/","main","primary");
		addAction(userContext, accountingDocumentLine, tokens,"@copy","cloneAccountingDocumentLine","cloneAccountingDocumentLine/"+accountingDocumentLine.getId()+"/","main","primary");
		
		addAction(userContext, accountingDocumentLine, tokens,"accounting_document_line.transfer_to_belongs_to","transferToAnotherBelongsTo","transferToAnotherBelongsTo/"+accountingDocumentLine.getId()+"/","main","primary");
		addAction(userContext, accountingDocumentLine, tokens,"accounting_document_line.transfer_to_accounting_subject","transferToAnotherAccountingSubject","transferToAnotherAccountingSubject/"+accountingDocumentLine.getId()+"/","main","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public AccountingDocumentLine createAccountingDocumentLine(RetailscmUserContext userContext, String name,String code,String direct,BigDecimal amount,String belongsToId,String accountingSubjectId) throws Exception
	//public AccountingDocumentLine createAccountingDocumentLine(RetailscmUserContext userContext,String name, String code, String direct, BigDecimal amount, String belongsToId, String accountingSubjectId) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfAccountingDocumentLine(name);
		checkerOf(userContext).checkCodeOfAccountingDocumentLine(code);
		checkerOf(userContext).checkDirectOfAccountingDocumentLine(direct);
		checkerOf(userContext).checkAmountOfAccountingDocumentLine(amount);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentLineManagerException.class);


		AccountingDocumentLine accountingDocumentLine=createNewAccountingDocumentLine();	

		accountingDocumentLine.setName(name);
		accountingDocumentLine.setCode(code);
		accountingDocumentLine.setDirect(direct);
		accountingDocumentLine.setAmount(amount);
			
		AccountingDocument belongsTo = loadAccountingDocument(userContext, belongsToId,emptyOptions());
		accountingDocumentLine.setBelongsTo(belongsTo);
		
		
			
		AccountingSubject accountingSubject = loadAccountingSubject(userContext, accountingSubjectId,emptyOptions());
		accountingDocumentLine.setAccountingSubject(accountingSubject);
		
		

		accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, emptyOptions());
		
		onNewInstanceCreated(userContext, accountingDocumentLine);
		return accountingDocumentLine;

		
	}
	protected AccountingDocumentLine createNewAccountingDocumentLine() 
	{
		
		return new AccountingDocumentLine();		
	}
	
	protected void checkParamsForUpdatingAccountingDocumentLine(RetailscmUserContext userContext,String accountingDocumentLineId, int accountingDocumentLineVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).checkVersionOfAccountingDocumentLine( accountingDocumentLineVersion);
		

		if(AccountingDocumentLine.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingDocumentLine(parseString(newValueExpr));
		}
		if(AccountingDocumentLine.CODE_PROPERTY.equals(property)){
			checkerOf(userContext).checkCodeOfAccountingDocumentLine(parseString(newValueExpr));
		}
		if(AccountingDocumentLine.DIRECT_PROPERTY.equals(property)){
			checkerOf(userContext).checkDirectOfAccountingDocumentLine(parseString(newValueExpr));
		}
		if(AccountingDocumentLine.AMOUNT_PROPERTY.equals(property)){
			checkerOf(userContext).checkAmountOfAccountingDocumentLine(parseBigDecimal(newValueExpr));
		}		

				

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentLineManagerException.class);
	
		
	}
	
	
	
	public AccountingDocumentLine clone(RetailscmUserContext userContext, String fromAccountingDocumentLineId) throws Exception{
		
		return accountingDocumentLineDaoOf(userContext).clone(fromAccountingDocumentLineId, this.allTokens());
	}
	
	public AccountingDocumentLine internalSaveAccountingDocumentLine(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine) throws Exception 
	{
		return internalSaveAccountingDocumentLine(userContext, accountingDocumentLine, allTokens());

	}
	public AccountingDocumentLine internalSaveAccountingDocumentLine(RetailscmUserContext userContext, AccountingDocumentLine accountingDocumentLine, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingAccountingDocumentLine(userContext, accountingDocumentLineId, accountingDocumentLineVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(accountingDocumentLine){ 
			//will be good when the accountingDocumentLine loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentLine.
			if (accountingDocumentLine.isChanged()){
			
			}
			accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, options);
			return accountingDocumentLine;
			
		}

	}
	
	public AccountingDocumentLine updateAccountingDocumentLine(RetailscmUserContext userContext,String accountingDocumentLineId, int accountingDocumentLineVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocumentLine(userContext, accountingDocumentLineId, accountingDocumentLineVersion, property, newValueExpr, tokensExpr);
		
		
		
		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine(userContext, accountingDocumentLineId, allTokens());
		if(accountingDocumentLine.getVersion() != accountingDocumentLineVersion){
			String message = "The target version("+accountingDocumentLine.getVersion()+") is not equals to version("+accountingDocumentLineVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocumentLine){ 
			//will be good when the accountingDocumentLine loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentLine.
			
			accountingDocumentLine.changeProperty(property, newValueExpr);
			accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, tokens().done());
			return present(userContext,accountingDocumentLine, mergedAllTokens(tokensExpr));
			//return saveAccountingDocumentLine(userContext, accountingDocumentLine, tokens().done());
		}

	}
	
	public AccountingDocumentLine updateAccountingDocumentLineProperty(RetailscmUserContext userContext,String accountingDocumentLineId, int accountingDocumentLineVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocumentLine(userContext, accountingDocumentLineId, accountingDocumentLineVersion, property, newValueExpr, tokensExpr);
		
		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine(userContext, accountingDocumentLineId, allTokens());
		if(accountingDocumentLine.getVersion() != accountingDocumentLineVersion){
			String message = "The target version("+accountingDocumentLine.getVersion()+") is not equals to version("+accountingDocumentLineVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocumentLine){ 
			//will be good when the accountingDocumentLine loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentLine.
			
			accountingDocumentLine.changeProperty(property, newValueExpr);
			
			accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, tokens().done());
			return present(userContext,accountingDocumentLine, mergedAllTokens(tokensExpr));
			//return saveAccountingDocumentLine(userContext, accountingDocumentLine, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected AccountingDocumentLineTokens tokens(){
		return AccountingDocumentLineTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return AccountingDocumentLineTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return AccountingDocumentLineTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherBelongsTo(RetailscmUserContext userContext, String accountingDocumentLineId, String anotherBelongsToId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
 		checkerOf(userContext).checkIdOfAccountingDocument(anotherBelongsToId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentLineManagerException.class);
 		
 	}
 	public AccountingDocumentLine transferToAnotherBelongsTo(RetailscmUserContext userContext, String accountingDocumentLineId, String anotherBelongsToId) throws Exception
 	{
 		checkParamsForTransferingAnotherBelongsTo(userContext, accountingDocumentLineId,anotherBelongsToId);
 
		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine(userContext, accountingDocumentLineId, allTokens());	
		synchronized(accountingDocumentLine){
			//will be good when the accountingDocumentLine loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocument belongsTo = loadAccountingDocument(userContext, anotherBelongsToId, emptyOptions());		
			accountingDocumentLine.updateBelongsTo(belongsTo);		
			accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, emptyOptions());
			
			return present(userContext,accountingDocumentLine, allTokens());
			
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
		SmartList<AccountingDocument> candidateList = accountingDocumentDaoOf(userContext).requestCandidateAccountingDocumentForAccountingDocumentLine(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherAccountingSubject(RetailscmUserContext userContext, String accountingDocumentLineId, String anotherAccountingSubjectId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
 		checkerOf(userContext).checkIdOfAccountingSubject(anotherAccountingSubjectId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentLineManagerException.class);
 		
 	}
 	public AccountingDocumentLine transferToAnotherAccountingSubject(RetailscmUserContext userContext, String accountingDocumentLineId, String anotherAccountingSubjectId) throws Exception
 	{
 		checkParamsForTransferingAnotherAccountingSubject(userContext, accountingDocumentLineId,anotherAccountingSubjectId);
 
		AccountingDocumentLine accountingDocumentLine = loadAccountingDocumentLine(userContext, accountingDocumentLineId, allTokens());	
		synchronized(accountingDocumentLine){
			//will be good when the accountingDocumentLine loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingSubject accountingSubject = loadAccountingSubject(userContext, anotherAccountingSubjectId, emptyOptions());		
			accountingDocumentLine.updateAccountingSubject(accountingSubject);		
			accountingDocumentLine = saveAccountingDocumentLine(userContext, accountingDocumentLine, emptyOptions());
			
			return present(userContext,accountingDocumentLine, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingSubject requestCandidateAccountingSubject(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingSubject result = new CandidateAccountingSubject();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("accountingSubjectCode");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingSubject> candidateList = accountingSubjectDaoOf(userContext).requestCandidateAccountingSubjectForAccountingDocumentLine(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected AccountingDocument loadAccountingDocument(RetailscmUserContext userContext, String newBelongsToId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getAccountingDocumentDAO().load(newBelongsToId, options);
=======
 		return accountingDocumentDaoOf(userContext).load(newBelongsToId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	 	
 	protected AccountingSubject loadAccountingSubject(RetailscmUserContext userContext, String newAccountingSubjectId, Map<String,Object> options) throws Exception
 	{
		
<<<<<<< HEAD
 		return userContext.getDAOGroup().getAccountingSubjectDAO().load(newAccountingSubjectId, options);
=======
 		return accountingSubjectDaoOf(userContext).load(newAccountingSubjectId, options);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String accountingDocumentLineId, int accountingDocumentLineVersion) throws Exception {
		//deleteInternal(userContext, accountingDocumentLineId, accountingDocumentLineVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String accountingDocumentLineId, int accountingDocumentLineVersion) throws Exception{
			
		accountingDocumentLineDaoOf(userContext).delete(accountingDocumentLineId, accountingDocumentLineVersion);
	}
	
	public AccountingDocumentLine forgetByAll(RetailscmUserContext userContext, String accountingDocumentLineId, int accountingDocumentLineVersion) throws Exception {
		return forgetByAllInternal(userContext, accountingDocumentLineId, accountingDocumentLineVersion);		
	}
	protected AccountingDocumentLine forgetByAllInternal(RetailscmUserContext userContext,
			String accountingDocumentLineId, int accountingDocumentLineVersion) throws Exception{
			
		return accountingDocumentLineDaoOf(userContext).disconnectFromAll(accountingDocumentLineId, accountingDocumentLineVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new AccountingDocumentLineManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return accountingDocumentLineDaoOf(userContext).deleteAll();
	}


	
	
	
	
	

	public void onNewInstanceCreated(RetailscmUserContext userContext, AccountingDocumentLine newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



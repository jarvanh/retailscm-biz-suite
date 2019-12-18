
package com.doublechaintech.retailscm.accountingdocument;

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

import com.doublechaintech.retailscm.accountingdocumentline.AccountingDocumentLine;
import com.doublechaintech.retailscm.accountingdocumentposting.AccountingDocumentPosting;
import com.doublechaintech.retailscm.accountingdocumentcreation.AccountingDocumentCreation;
import com.doublechaintech.retailscm.accountingdocumentauditing.AccountingDocumentAuditing;
import com.doublechaintech.retailscm.accountingdocumentconfirmation.AccountingDocumentConfirmation;
import com.doublechaintech.retailscm.originalvoucher.OriginalVoucher;
import com.doublechaintech.retailscm.accountingdocumenttype.AccountingDocumentType;
import com.doublechaintech.retailscm.accountingperiod.AccountingPeriod;

import com.doublechaintech.retailscm.accountingdocumentposting.CandidateAccountingDocumentPosting;
import com.doublechaintech.retailscm.accountingdocumentcreation.CandidateAccountingDocumentCreation;
import com.doublechaintech.retailscm.accountingdocumentauditing.CandidateAccountingDocumentAuditing;
import com.doublechaintech.retailscm.accountingdocumentconfirmation.CandidateAccountingDocumentConfirmation;
import com.doublechaintech.retailscm.accountingdocumenttype.CandidateAccountingDocumentType;
import com.doublechaintech.retailscm.accountingperiod.CandidateAccountingPeriod;

import com.doublechaintech.retailscm.accountingdocument.AccountingDocument;
import com.doublechaintech.retailscm.originalvouchercreation.OriginalVoucherCreation;
import com.doublechaintech.retailscm.originalvoucherauditing.OriginalVoucherAuditing;
import com.doublechaintech.retailscm.accountingsubject.AccountingSubject;
import com.doublechaintech.retailscm.originalvoucherconfirmation.OriginalVoucherConfirmation;






public class AccountingDocumentManagerImpl extends CustomRetailscmCheckerManager implements AccountingDocumentManager {
	
	private static final String SERVICE_TYPE = "AccountingDocument";
	@Override
	public AccountingDocumentDAO daoOf(RetailscmUserContext userContext) {
		return accountingDocumentDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws AccountingDocumentManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new AccountingDocumentManagerException(message);

	}
	
	

 	protected AccountingDocument saveAccountingDocument(RetailscmUserContext userContext, AccountingDocument accountingDocument, String [] tokensExpr) throws Exception{	
 		//return getAccountingDocumentDAO().save(accountingDocument, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveAccountingDocument(userContext, accountingDocument, tokens);
 	}
 	
 	protected AccountingDocument saveAccountingDocumentDetail(RetailscmUserContext userContext, AccountingDocument accountingDocument) throws Exception{	

 		
 		return saveAccountingDocument(userContext, accountingDocument, allTokens());
 	}
 	
 	public AccountingDocument loadAccountingDocument(RetailscmUserContext userContext, String accountingDocumentId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		AccountingDocument accountingDocument = loadAccountingDocument( userContext, accountingDocumentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocument, tokens);
 	}
 	
 	
 	 public AccountingDocument searchAccountingDocument(RetailscmUserContext userContext, String accountingDocumentId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		AccountingDocument accountingDocument = loadAccountingDocument( userContext, accountingDocumentId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocument, tokens);
 	}
 	
 	

 	protected AccountingDocument present(RetailscmUserContext userContext, AccountingDocument accountingDocument, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,accountingDocument,tokens);
		
		
		AccountingDocument  accountingDocumentToPresent = accountingDocumentDaoOf(userContext).present(accountingDocument, tokens);
		
		List<BaseEntity> entityListToNaming = accountingDocumentToPresent.collectRefercencesFromLists();
		accountingDocumentDaoOf(userContext).alias(entityListToNaming);
		
		return  accountingDocumentToPresent;
		
		
	}
 
 	
 	
 	public AccountingDocument loadAccountingDocumentDetail(RetailscmUserContext userContext, String accountingDocumentId) throws Exception{	
 		AccountingDocument accountingDocument = loadAccountingDocument( userContext, accountingDocumentId, allTokens());
 		return present(userContext,accountingDocument, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String accountingDocumentId) throws Exception{	
 		AccountingDocument accountingDocument = loadAccountingDocument( userContext, accountingDocumentId, viewTokens());
 		return present(userContext,accountingDocument, allTokens());
		
 	}
 	protected AccountingDocument saveAccountingDocument(RetailscmUserContext userContext, AccountingDocument accountingDocument, Map<String,Object>tokens) throws Exception{	
 		return accountingDocumentDaoOf(userContext).save(accountingDocument, tokens);
 	}
 	protected AccountingDocument loadAccountingDocument(RetailscmUserContext userContext, String accountingDocumentId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentManagerException.class);

 
 		return accountingDocumentDaoOf(userContext).load(accountingDocumentId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocument accountingDocument, Map<String, Object> tokens){
		super.addActions(userContext, accountingDocument, tokens);
		
		addAction(userContext, accountingDocument, tokens,"@create","createAccountingDocument","createAccountingDocument/","main","primary");
		addAction(userContext, accountingDocument, tokens,"@update","updateAccountingDocument","updateAccountingDocument/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"@copy","cloneAccountingDocument","cloneAccountingDocument/"+accountingDocument.getId()+"/","main","primary");
		
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_accounting_period","transferToAnotherAccountingPeriod","transferToAnotherAccountingPeriod/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_document_type","transferToAnotherDocumentType","transferToAnotherDocumentType/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_creation","transferToAnotherCreation","transferToAnotherCreation/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_confirmation","transferToAnotherConfirmation","transferToAnotherConfirmation/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_auditing","transferToAnotherAuditing","transferToAnotherAuditing/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.transfer_to_posting","transferToAnotherPosting","transferToAnotherPosting/"+accountingDocument.getId()+"/","main","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.addOriginalVoucher","addOriginalVoucher","addOriginalVoucher/"+accountingDocument.getId()+"/","originalVoucherList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.removeOriginalVoucher","removeOriginalVoucher","removeOriginalVoucher/"+accountingDocument.getId()+"/","originalVoucherList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.updateOriginalVoucher","updateOriginalVoucher","updateOriginalVoucher/"+accountingDocument.getId()+"/","originalVoucherList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.copyOriginalVoucherFrom","copyOriginalVoucherFrom","copyOriginalVoucherFrom/"+accountingDocument.getId()+"/","originalVoucherList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.addAccountingDocumentLine","addAccountingDocumentLine","addAccountingDocumentLine/"+accountingDocument.getId()+"/","accountingDocumentLineList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.removeAccountingDocumentLine","removeAccountingDocumentLine","removeAccountingDocumentLine/"+accountingDocument.getId()+"/","accountingDocumentLineList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.updateAccountingDocumentLine","updateAccountingDocumentLine","updateAccountingDocumentLine/"+accountingDocument.getId()+"/","accountingDocumentLineList","primary");
		addAction(userContext, accountingDocument, tokens,"accounting_document.copyAccountingDocumentLineFrom","copyAccountingDocumentLineFrom","copyAccountingDocumentLineFrom/"+accountingDocument.getId()+"/","accountingDocumentLineList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocument accountingDocument, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public AccountingDocument createAccountingDocument(RetailscmUserContext userContext, String name,Date accountingDocumentDate,String accountingPeriodId,String documentTypeId,String creationId,String confirmationId,String auditingId,String postingId) throws Exception
	//public AccountingDocument createAccountingDocument(RetailscmUserContext userContext,String name, Date accountingDocumentDate, String accountingPeriodId, String documentTypeId, String creationId, String confirmationId, String auditingId, String postingId) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfAccountingDocument(name);
		checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(accountingDocumentDate);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);


		AccountingDocument accountingDocument=createNewAccountingDocument();	

		accountingDocument.setName(name);
		accountingDocument.setAccountingDocumentDate(accountingDocumentDate);
			
		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId,emptyOptions());
		accountingDocument.setAccountingPeriod(accountingPeriod);
		
		
			
		AccountingDocumentType documentType = loadAccountingDocumentType(userContext, documentTypeId,emptyOptions());
		accountingDocument.setDocumentType(documentType);
		
		
			
		AccountingDocumentCreation creation = loadAccountingDocumentCreation(userContext, creationId,emptyOptions());
		accountingDocument.setCreation(creation);
		
		
			
		AccountingDocumentConfirmation confirmation = loadAccountingDocumentConfirmation(userContext, confirmationId,emptyOptions());
		accountingDocument.setConfirmation(confirmation);
		
		
			
		AccountingDocumentAuditing auditing = loadAccountingDocumentAuditing(userContext, auditingId,emptyOptions());
		accountingDocument.setAuditing(auditing);
		
		
			
		AccountingDocumentPosting posting = loadAccountingDocumentPosting(userContext, postingId,emptyOptions());
		accountingDocument.setPosting(posting);
		
		

		accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
		
		onNewInstanceCreated(userContext, accountingDocument);
		return accountingDocument;

		
	}
	protected AccountingDocument createNewAccountingDocument() 
	{
		
		return new AccountingDocument();		
	}
	
	protected void checkParamsForUpdatingAccountingDocument(RetailscmUserContext userContext,String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument( accountingDocumentVersion);
		

		if(AccountingDocument.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingDocument(parseString(newValueExpr));
		}
		if(AccountingDocument.ACCOUNTING_DOCUMENT_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(parseDate(newValueExpr));
		}		

				

				

				

				

				

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
		
	}
	
	
	
	public AccountingDocument clone(RetailscmUserContext userContext, String fromAccountingDocumentId) throws Exception{
		
		return accountingDocumentDaoOf(userContext).clone(fromAccountingDocumentId, this.allTokens());
	}
	
	public AccountingDocument internalSaveAccountingDocument(RetailscmUserContext userContext, AccountingDocument accountingDocument) throws Exception 
	{
		return internalSaveAccountingDocument(userContext, accountingDocument, allTokens());

	}
	public AccountingDocument internalSaveAccountingDocument(RetailscmUserContext userContext, AccountingDocument accountingDocument, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingAccountingDocument(userContext, accountingDocumentId, accountingDocumentVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(accountingDocument){ 
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocument.
			if (accountingDocument.isChanged()){
			
			}
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, options);
			return accountingDocument;
			
		}

	}
	
	public AccountingDocument updateAccountingDocument(RetailscmUserContext userContext,String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocument(userContext, accountingDocumentId, accountingDocumentVersion, property, newValueExpr, tokensExpr);
		
		
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		if(accountingDocument.getVersion() != accountingDocumentVersion){
			String message = "The target version("+accountingDocument.getVersion()+") is not equals to version("+accountingDocumentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocument){ 
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocument.
			
			accountingDocument.changeProperty(property, newValueExpr);
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().done());
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
			//return saveAccountingDocument(userContext, accountingDocument, tokens().done());
		}

	}
	
	public AccountingDocument updateAccountingDocumentProperty(RetailscmUserContext userContext,String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocument(userContext, accountingDocumentId, accountingDocumentVersion, property, newValueExpr, tokensExpr);
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		if(accountingDocument.getVersion() != accountingDocumentVersion){
			String message = "The target version("+accountingDocument.getVersion()+") is not equals to version("+accountingDocumentVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocument){ 
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocument.
			
			accountingDocument.changeProperty(property, newValueExpr);
			
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().done());
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
			//return saveAccountingDocument(userContext, accountingDocument, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected AccountingDocumentTokens tokens(){
		return AccountingDocumentTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return AccountingDocumentTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortOriginalVoucherListWith("id","desc")
		.sortAccountingDocumentLineListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return AccountingDocumentTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherAccountingPeriod(RetailscmUserContext userContext, String accountingDocumentId, String anotherAccountingPeriodId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingPeriod(anotherAccountingPeriodId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherAccountingPeriod(RetailscmUserContext userContext, String accountingDocumentId, String anotherAccountingPeriodId) throws Exception
 	{
 		checkParamsForTransferingAnotherAccountingPeriod(userContext, accountingDocumentId,anotherAccountingPeriodId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, anotherAccountingPeriodId, emptyOptions());		
			accountingDocument.updateAccountingPeriod(accountingPeriod);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingPeriod requestCandidateAccountingPeriod(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingPeriod result = new CandidateAccountingPeriod();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingPeriod> candidateList = accountingPeriodDaoOf(userContext).requestCandidateAccountingPeriodForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherDocumentType(RetailscmUserContext userContext, String accountingDocumentId, String anotherDocumentTypeId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingDocumentType(anotherDocumentTypeId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherDocumentType(RetailscmUserContext userContext, String accountingDocumentId, String anotherDocumentTypeId) throws Exception
 	{
 		checkParamsForTransferingAnotherDocumentType(userContext, accountingDocumentId,anotherDocumentTypeId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocumentType documentType = loadAccountingDocumentType(userContext, anotherDocumentTypeId, emptyOptions());		
			accountingDocument.updateDocumentType(documentType);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingDocumentType requestCandidateDocumentType(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocumentType result = new CandidateAccountingDocumentType();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocumentType> candidateList = accountingDocumentTypeDaoOf(userContext).requestCandidateAccountingDocumentTypeForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherCreation(RetailscmUserContext userContext, String accountingDocumentId, String anotherCreationId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingDocumentCreation(anotherCreationId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherCreation(RetailscmUserContext userContext, String accountingDocumentId, String anotherCreationId) throws Exception
 	{
 		checkParamsForTransferingAnotherCreation(userContext, accountingDocumentId,anotherCreationId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocumentCreation creation = loadAccountingDocumentCreation(userContext, anotherCreationId, emptyOptions());		
			accountingDocument.updateCreation(creation);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingDocumentCreation requestCandidateCreation(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocumentCreation result = new CandidateAccountingDocumentCreation();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("who");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocumentCreation> candidateList = accountingDocumentCreationDaoOf(userContext).requestCandidateAccountingDocumentCreationForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherConfirmation(RetailscmUserContext userContext, String accountingDocumentId, String anotherConfirmationId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingDocumentConfirmation(anotherConfirmationId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherConfirmation(RetailscmUserContext userContext, String accountingDocumentId, String anotherConfirmationId) throws Exception
 	{
 		checkParamsForTransferingAnotherConfirmation(userContext, accountingDocumentId,anotherConfirmationId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocumentConfirmation confirmation = loadAccountingDocumentConfirmation(userContext, anotherConfirmationId, emptyOptions());		
			accountingDocument.updateConfirmation(confirmation);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingDocumentConfirmation requestCandidateConfirmation(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocumentConfirmation result = new CandidateAccountingDocumentConfirmation();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("who");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocumentConfirmation> candidateList = accountingDocumentConfirmationDaoOf(userContext).requestCandidateAccountingDocumentConfirmationForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherAuditing(RetailscmUserContext userContext, String accountingDocumentId, String anotherAuditingId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingDocumentAuditing(anotherAuditingId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherAuditing(RetailscmUserContext userContext, String accountingDocumentId, String anotherAuditingId) throws Exception
 	{
 		checkParamsForTransferingAnotherAuditing(userContext, accountingDocumentId,anotherAuditingId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocumentAuditing auditing = loadAccountingDocumentAuditing(userContext, anotherAuditingId, emptyOptions());		
			accountingDocument.updateAuditing(auditing);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingDocumentAuditing requestCandidateAuditing(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocumentAuditing result = new CandidateAccountingDocumentAuditing();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("who");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocumentAuditing> candidateList = accountingDocumentAuditingDaoOf(userContext).requestCandidateAccountingDocumentAuditingForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 	protected void checkParamsForTransferingAnotherPosting(RetailscmUserContext userContext, String accountingDocumentId, String anotherPostingId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
 		checkerOf(userContext).checkIdOfAccountingDocumentPosting(anotherPostingId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
 		
 	}
 	public AccountingDocument transferToAnotherPosting(RetailscmUserContext userContext, String accountingDocumentId, String anotherPostingId) throws Exception
 	{
 		checkParamsForTransferingAnotherPosting(userContext, accountingDocumentId,anotherPostingId);
 
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());	
		synchronized(accountingDocument){
			//will be good when the accountingDocument loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountingDocumentPosting posting = loadAccountingDocumentPosting(userContext, anotherPostingId, emptyOptions());		
			accountingDocument.updatePosting(posting);		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, emptyOptions());
			
			return present(userContext,accountingDocument, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountingDocumentPosting requestCandidatePosting(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountingDocumentPosting result = new CandidateAccountingDocumentPosting();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("who");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountingDocumentPosting> candidateList = accountingDocumentPostingDaoOf(userContext).requestCandidateAccountingDocumentPostingForAccountingDocument(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected AccountingDocumentPosting loadAccountingDocumentPosting(RetailscmUserContext userContext, String newPostingId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingDocumentPostingDaoOf(userContext).load(newPostingId, options);
 	}
 	
 	
 	
	
	 	
 	protected AccountingDocumentConfirmation loadAccountingDocumentConfirmation(RetailscmUserContext userContext, String newConfirmationId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingDocumentConfirmationDaoOf(userContext).load(newConfirmationId, options);
 	}
 	
 	
 	
	
	 	
 	protected AccountingDocumentAuditing loadAccountingDocumentAuditing(RetailscmUserContext userContext, String newAuditingId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingDocumentAuditingDaoOf(userContext).load(newAuditingId, options);
 	}
 	
 	
 	
	
	 	
 	protected AccountingPeriod loadAccountingPeriod(RetailscmUserContext userContext, String newAccountingPeriodId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingPeriodDaoOf(userContext).load(newAccountingPeriodId, options);
 	}
 	
 	
 	
	
	 	
 	protected AccountingDocumentType loadAccountingDocumentType(RetailscmUserContext userContext, String newDocumentTypeId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingDocumentTypeDaoOf(userContext).load(newDocumentTypeId, options);
 	}
 	
 	
 	
	
	 	
 	protected AccountingDocumentCreation loadAccountingDocumentCreation(RetailscmUserContext userContext, String newCreationId, Map<String,Object> options) throws Exception
 	{
		
 		return accountingDocumentCreationDaoOf(userContext).load(newCreationId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String accountingDocumentId, int accountingDocumentVersion) throws Exception {
		//deleteInternal(userContext, accountingDocumentId, accountingDocumentVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String accountingDocumentId, int accountingDocumentVersion) throws Exception{
			
		accountingDocumentDaoOf(userContext).delete(accountingDocumentId, accountingDocumentVersion);
	}
	
	public AccountingDocument forgetByAll(RetailscmUserContext userContext, String accountingDocumentId, int accountingDocumentVersion) throws Exception {
		return forgetByAllInternal(userContext, accountingDocumentId, accountingDocumentVersion);		
	}
	protected AccountingDocument forgetByAllInternal(RetailscmUserContext userContext,
			String accountingDocumentId, int accountingDocumentVersion) throws Exception{
			
		return accountingDocumentDaoOf(userContext).disconnectFromAll(accountingDocumentId, accountingDocumentVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new AccountingDocumentManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return accountingDocumentDaoOf(userContext).deleteAll();
	}


	//disconnect AccountingDocument with creation in OriginalVoucher
	protected AccountingDocument breakWithOriginalVoucherByCreation(RetailscmUserContext userContext, String accountingDocumentId, String creationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());

			synchronized(accountingDocument){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentDaoOf(userContext).planToRemoveOriginalVoucherListWithCreation(accountingDocument, creationId, this.emptyOptions());

				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
				return accountingDocument;
			}
	}
	//disconnect AccountingDocument with confirmation in OriginalVoucher
	protected AccountingDocument breakWithOriginalVoucherByConfirmation(RetailscmUserContext userContext, String accountingDocumentId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());

			synchronized(accountingDocument){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentDaoOf(userContext).planToRemoveOriginalVoucherListWithConfirmation(accountingDocument, confirmationId, this.emptyOptions());

				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
				return accountingDocument;
			}
	}
	//disconnect AccountingDocument with auditing in OriginalVoucher
	protected AccountingDocument breakWithOriginalVoucherByAuditing(RetailscmUserContext userContext, String accountingDocumentId, String auditingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());

			synchronized(accountingDocument){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentDaoOf(userContext).planToRemoveOriginalVoucherListWithAuditing(accountingDocument, auditingId, this.emptyOptions());

				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
				return accountingDocument;
			}
	}
	//disconnect AccountingDocument with accounting_subject in AccountingDocumentLine
	protected AccountingDocument breakWithAccountingDocumentLineByAccountingSubject(RetailscmUserContext userContext, String accountingDocumentId, String accountingSubjectId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());

			synchronized(accountingDocument){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentDaoOf(userContext).planToRemoveAccountingDocumentLineListWithAccountingSubject(accountingDocument, accountingSubjectId, this.emptyOptions());

				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
				return accountingDocument;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String creationId, String confirmationId, String auditingId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);

		
		checkerOf(userContext).checkTitleOfOriginalVoucher(title);
		
		checkerOf(userContext).checkMadeByOfOriginalVoucher(madeBy);
		
		checkerOf(userContext).checkReceivedByOfOriginalVoucher(receivedBy);
		
		checkerOf(userContext).checkVoucherTypeOfOriginalVoucher(voucherType);
		
		checkerOf(userContext).checkVoucherImageOfOriginalVoucher(voucherImage);
		
		checkerOf(userContext).checkCreationIdOfOriginalVoucher(creationId);
		
		checkerOf(userContext).checkConfirmationIdOfOriginalVoucher(confirmationId);
		
		checkerOf(userContext).checkAuditingIdOfOriginalVoucher(auditingId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);

	
	}
	public  AccountingDocument addOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String creationId, String confirmationId, String auditingId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingOriginalVoucher(userContext,accountingDocumentId,title, madeBy, receivedBy, voucherType, voucherImage, creationId, confirmationId, auditingId,tokensExpr);
		
		OriginalVoucher originalVoucher = createOriginalVoucher(userContext,title, madeBy, receivedBy, voucherType, voucherImage, creationId, confirmationId, auditingId);
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocument.addOriginalVoucher( originalVoucher );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
			
			userContext.getManagerGroup().getOriginalVoucherManager().onNewInstanceCreated(userContext, originalVoucher);
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingOriginalVoucherProperties(RetailscmUserContext userContext, String accountingDocumentId,String id,String title,String madeBy,String receivedBy,String voucherType,String voucherImage,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkIdOfOriginalVoucher(id);
		
		checkerOf(userContext).checkTitleOfOriginalVoucher( title);
		checkerOf(userContext).checkMadeByOfOriginalVoucher( madeBy);
		checkerOf(userContext).checkReceivedByOfOriginalVoucher( receivedBy);
		checkerOf(userContext).checkVoucherTypeOfOriginalVoucher( voucherType);
		checkerOf(userContext).checkVoucherImageOfOriginalVoucher( voucherImage);

		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
		
	}
	public  AccountingDocument updateOriginalVoucherProperties(RetailscmUserContext userContext, String accountingDocumentId, String id,String title,String madeBy,String receivedBy,String voucherType,String voucherImage, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingOriginalVoucherProperties(userContext,accountingDocumentId,id,title,madeBy,receivedBy,voucherType,voucherImage,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withOriginalVoucherListList()
				.searchOriginalVoucherListWith(OriginalVoucher.ID_PROPERTY, "is", id).done();
		
		AccountingDocument accountingDocumentToUpdate = loadAccountingDocument(userContext, accountingDocumentId, options);
		
		if(accountingDocumentToUpdate.getOriginalVoucherList().isEmpty()){
			throw new AccountingDocumentManagerException("OriginalVoucher is NOT FOUND with id: '"+id+"'");
		}
		
		OriginalVoucher item = accountingDocumentToUpdate.getOriginalVoucherList().first();
		
		item.updateTitle( title );
		item.updateMadeBy( madeBy );
		item.updateReceivedBy( receivedBy );
		item.updateVoucherType( voucherType );
		item.updateVoucherImage( voucherImage );

		
		//checkParamsForAddingOriginalVoucher(userContext,accountingDocumentId,name, code, used,tokensExpr);
		AccountingDocument accountingDocument = saveAccountingDocument(userContext, accountingDocumentToUpdate, tokens().withOriginalVoucherList().done());
		synchronized(accountingDocument){ 
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected OriginalVoucher createOriginalVoucher(RetailscmUserContext userContext, String title, String madeBy, String receivedBy, String voucherType, String voucherImage, String creationId, String confirmationId, String auditingId) throws Exception{

		OriginalVoucher originalVoucher = new OriginalVoucher();
		
		
		originalVoucher.setTitle(title);		
		originalVoucher.setMadeBy(madeBy);		
		originalVoucher.setReceivedBy(receivedBy);		
		originalVoucher.setVoucherType(voucherType);		
		originalVoucher.setVoucherImage(voucherImage);		
		OriginalVoucherCreation  creation = new OriginalVoucherCreation();
		creation.setId(creationId);		
		originalVoucher.setCreation(creation);		
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
	
	protected void checkParamsForRemovingOriginalVoucherList(RetailscmUserContext userContext, String accountingDocumentId, 
			String originalVoucherIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		for(String originalVoucherIdItem: originalVoucherIds){
			checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
		
	}
	public  AccountingDocument removeOriginalVoucherList(RetailscmUserContext userContext, String accountingDocumentId, 
			String originalVoucherIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingOriginalVoucherList(userContext, accountingDocumentId,  originalVoucherIds, tokensExpr);
			
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
			synchronized(accountingDocument){ 
				//Will be good when the accountingDocument loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				accountingDocumentDaoOf(userContext).planToRemoveOriginalVoucherList(accountingDocument, originalVoucherIds, allTokens());
				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
				deleteRelationListInGraph(userContext, accountingDocument.getOriginalVoucherList());
				return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocument( accountingDocumentId);
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher(originalVoucherVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	public  AccountingDocument removeOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingOriginalVoucher(userContext,accountingDocumentId, originalVoucherId, originalVoucherVersion,tokensExpr);
		
		OriginalVoucher originalVoucher = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocument.removeOriginalVoucher( originalVoucher );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
			deleteRelationInGraph(userContext, originalVoucher);
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocument( accountingDocumentId);
		checkerOf(userContext).checkIdOfOriginalVoucher(originalVoucherId);
		checkerOf(userContext).checkVersionOfOriginalVoucher(originalVoucherVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	public  AccountingDocument copyOriginalVoucherFrom(RetailscmUserContext userContext, String accountingDocumentId, 
		String originalVoucherId, int originalVoucherVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingOriginalVoucher(userContext,accountingDocumentId, originalVoucherId, originalVoucherVersion,tokensExpr);
		
		OriginalVoucher originalVoucher = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			accountingDocument.copyOriginalVoucherFrom( originalVoucher );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
			
			userContext.getManagerGroup().getOriginalVoucherManager().onNewInstanceCreated(userContext, (OriginalVoucher)accountingDocument.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	
	public  AccountingDocument updateOriginalVoucher(RetailscmUserContext userContext, String accountingDocumentId, String originalVoucherId, int originalVoucherVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingOriginalVoucher(userContext, accountingDocumentId, originalVoucherId, originalVoucherVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withOriginalVoucherList().searchOriginalVoucherListWith(OriginalVoucher.ID_PROPERTY, "eq", originalVoucherId).done();
		
		
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, loadTokens);
		
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//accountingDocument.removeOriginalVoucher( originalVoucher );	
			//make changes to AcceleraterAccount.
			OriginalVoucher originalVoucherIndex = createIndexedOriginalVoucher(originalVoucherId, originalVoucherVersion);
		
			OriginalVoucher originalVoucher = accountingDocument.findTheOriginalVoucher(originalVoucherIndex);
			if(originalVoucher == null){
				throw new AccountingDocumentManagerException(originalVoucher+" is NOT FOUND" );
			}
			
			originalVoucher.changeProperty(property, newValueExpr);
			
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withOriginalVoucherList().done());
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	protected void checkParamsForAddingAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, String name, String code, String direct, BigDecimal amount, String accountingSubjectId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);

		
		checkerOf(userContext).checkNameOfAccountingDocumentLine(name);
		
		checkerOf(userContext).checkCodeOfAccountingDocumentLine(code);
		
		checkerOf(userContext).checkDirectOfAccountingDocumentLine(direct);
		
		checkerOf(userContext).checkAmountOfAccountingDocumentLine(amount);
		
		checkerOf(userContext).checkAccountingSubjectIdOfAccountingDocumentLine(accountingSubjectId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);

	
	}
	public  AccountingDocument addAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, String name, String code, String direct, BigDecimal amount, String accountingSubjectId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingAccountingDocumentLine(userContext,accountingDocumentId,name, code, direct, amount, accountingSubjectId,tokensExpr);
		
		AccountingDocumentLine accountingDocumentLine = createAccountingDocumentLine(userContext,name, code, direct, amount, accountingSubjectId);
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocument.addAccountingDocumentLine( accountingDocumentLine );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
			
			userContext.getManagerGroup().getAccountingDocumentLineManager().onNewInstanceCreated(userContext, accountingDocumentLine);
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingAccountingDocumentLineProperties(RetailscmUserContext userContext, String accountingDocumentId,String id,String name,String code,String direct,BigDecimal amount,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkIdOfAccountingDocumentLine(id);
		
		checkerOf(userContext).checkNameOfAccountingDocumentLine( name);
		checkerOf(userContext).checkCodeOfAccountingDocumentLine( code);
		checkerOf(userContext).checkDirectOfAccountingDocumentLine( direct);
		checkerOf(userContext).checkAmountOfAccountingDocumentLine( amount);

		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
		
	}
	public  AccountingDocument updateAccountingDocumentLineProperties(RetailscmUserContext userContext, String accountingDocumentId, String id,String name,String code,String direct,BigDecimal amount, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingAccountingDocumentLineProperties(userContext,accountingDocumentId,id,name,code,direct,amount,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withAccountingDocumentLineListList()
				.searchAccountingDocumentLineListWith(AccountingDocumentLine.ID_PROPERTY, "is", id).done();
		
		AccountingDocument accountingDocumentToUpdate = loadAccountingDocument(userContext, accountingDocumentId, options);
		
		if(accountingDocumentToUpdate.getAccountingDocumentLineList().isEmpty()){
			throw new AccountingDocumentManagerException("AccountingDocumentLine is NOT FOUND with id: '"+id+"'");
		}
		
		AccountingDocumentLine item = accountingDocumentToUpdate.getAccountingDocumentLineList().first();
		
		item.updateName( name );
		item.updateCode( code );
		item.updateDirect( direct );
		item.updateAmount( amount );

		
		//checkParamsForAddingAccountingDocumentLine(userContext,accountingDocumentId,name, code, used,tokensExpr);
		AccountingDocument accountingDocument = saveAccountingDocument(userContext, accountingDocumentToUpdate, tokens().withAccountingDocumentLineList().done());
		synchronized(accountingDocument){ 
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected AccountingDocumentLine createAccountingDocumentLine(RetailscmUserContext userContext, String name, String code, String direct, BigDecimal amount, String accountingSubjectId) throws Exception{

		AccountingDocumentLine accountingDocumentLine = new AccountingDocumentLine();
		
		
		accountingDocumentLine.setName(name);		
		accountingDocumentLine.setCode(code);		
		accountingDocumentLine.setDirect(direct);		
		accountingDocumentLine.setAmount(amount);		
		AccountingSubject  accountingSubject = new AccountingSubject();
		accountingSubject.setId(accountingSubjectId);		
		accountingDocumentLine.setAccountingSubject(accountingSubject);
	
		
		return accountingDocumentLine;
	
		
	}
	
	protected AccountingDocumentLine createIndexedAccountingDocumentLine(String id, int version){

		AccountingDocumentLine accountingDocumentLine = new AccountingDocumentLine();
		accountingDocumentLine.setId(id);
		accountingDocumentLine.setVersion(version);
		return accountingDocumentLine;			
		
	}
	
	protected void checkParamsForRemovingAccountingDocumentLineList(RetailscmUserContext userContext, String accountingDocumentId, 
			String accountingDocumentLineIds[],String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		for(String accountingDocumentLineIdItem: accountingDocumentLineIds){
			checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineIdItem);
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
		
	}
	public  AccountingDocument removeAccountingDocumentLineList(RetailscmUserContext userContext, String accountingDocumentId, 
			String accountingDocumentLineIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingAccountingDocumentLineList(userContext, accountingDocumentId,  accountingDocumentLineIds, tokensExpr);
			
			
			AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
			synchronized(accountingDocument){ 
				//Will be good when the accountingDocument loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				accountingDocumentDaoOf(userContext).planToRemoveAccountingDocumentLineList(accountingDocument, accountingDocumentLineIds, allTokens());
				accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
				deleteRelationListInGraph(userContext, accountingDocument.getAccountingDocumentLineList());
				return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, 
		String accountingDocumentLineId, int accountingDocumentLineVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocument( accountingDocumentId);
		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).checkVersionOfAccountingDocumentLine(accountingDocumentLineVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	public  AccountingDocument removeAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, 
		String accountingDocumentLineId, int accountingDocumentLineVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingAccountingDocumentLine(userContext,accountingDocumentId, accountingDocumentLineId, accountingDocumentLineVersion,tokensExpr);
		
		AccountingDocumentLine accountingDocumentLine = createIndexedAccountingDocumentLine(accountingDocumentLineId, accountingDocumentLineVersion);
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocument.removeAccountingDocumentLine( accountingDocumentLine );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
			deleteRelationInGraph(userContext, accountingDocumentLine);
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, 
		String accountingDocumentLineId, int accountingDocumentLineVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocument( accountingDocumentId);
		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).checkVersionOfAccountingDocumentLine(accountingDocumentLineVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	public  AccountingDocument copyAccountingDocumentLineFrom(RetailscmUserContext userContext, String accountingDocumentId, 
		String accountingDocumentLineId, int accountingDocumentLineVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingAccountingDocumentLine(userContext,accountingDocumentId, accountingDocumentLineId, accountingDocumentLineVersion,tokensExpr);
		
		AccountingDocumentLine accountingDocumentLine = createIndexedAccountingDocumentLine(accountingDocumentLineId, accountingDocumentLineVersion);
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, allTokens());
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			accountingDocument.copyAccountingDocumentLineFrom( accountingDocumentLine );		
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
			
			userContext.getManagerGroup().getAccountingDocumentLineManager().onNewInstanceCreated(userContext, (AccountingDocumentLine)accountingDocument.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, String accountingDocumentLineId, int accountingDocumentLineVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkIdOfAccountingDocumentLine(accountingDocumentLineId);
		checkerOf(userContext).checkVersionOfAccountingDocumentLine(accountingDocumentLineVersion);
		

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
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentManagerException.class);
	
	}
	
	public  AccountingDocument updateAccountingDocumentLine(RetailscmUserContext userContext, String accountingDocumentId, String accountingDocumentLineId, int accountingDocumentLineVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingAccountingDocumentLine(userContext, accountingDocumentId, accountingDocumentLineId, accountingDocumentLineVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withAccountingDocumentLineList().searchAccountingDocumentLineListWith(AccountingDocumentLine.ID_PROPERTY, "eq", accountingDocumentLineId).done();
		
		
		
		AccountingDocument accountingDocument = loadAccountingDocument(userContext, accountingDocumentId, loadTokens);
		
		synchronized(accountingDocument){ 
			//Will be good when the accountingDocument loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//accountingDocument.removeAccountingDocumentLine( accountingDocumentLine );	
			//make changes to AcceleraterAccount.
			AccountingDocumentLine accountingDocumentLineIndex = createIndexedAccountingDocumentLine(accountingDocumentLineId, accountingDocumentLineVersion);
		
			AccountingDocumentLine accountingDocumentLine = accountingDocument.findTheAccountingDocumentLine(accountingDocumentLineIndex);
			if(accountingDocumentLine == null){
				throw new AccountingDocumentManagerException(accountingDocumentLine+" is NOT FOUND" );
			}
			
			accountingDocumentLine.changeProperty(property, newValueExpr);
			
			accountingDocument = saveAccountingDocument(userContext, accountingDocument, tokens().withAccountingDocumentLineList().done());
			return present(userContext,accountingDocument, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, AccountingDocument newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}




package com.doublechaintech.retailscm.accountingdocumenttype;

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
import com.doublechaintech.retailscm.accountset.AccountSet;

import com.doublechaintech.retailscm.accountset.CandidateAccountSet;

import com.doublechaintech.retailscm.accountingdocumentposting.AccountingDocumentPosting;
import com.doublechaintech.retailscm.accountingdocumentcreation.AccountingDocumentCreation;
import com.doublechaintech.retailscm.accountingdocumentauditing.AccountingDocumentAuditing;
import com.doublechaintech.retailscm.accountingdocumentconfirmation.AccountingDocumentConfirmation;
import com.doublechaintech.retailscm.accountingdocumenttype.AccountingDocumentType;
import com.doublechaintech.retailscm.accountingperiod.AccountingPeriod;






public class AccountingDocumentTypeManagerImpl extends CustomRetailscmCheckerManager implements AccountingDocumentTypeManager {
	
	private static final String SERVICE_TYPE = "AccountingDocumentType";
	@Override
	public AccountingDocumentTypeDAO daoOf(RetailscmUserContext userContext) {
		return accountingDocumentTypeDaoOf(userContext);
	}
	
	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}
	
	
	protected void throwExceptionWithMessage(String value) throws AccountingDocumentTypeManagerException{
	
		Message message = new Message();
		message.setBody(value);
		throw new AccountingDocumentTypeManagerException(message);

	}
	
	

 	protected AccountingDocumentType saveAccountingDocumentType(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, String [] tokensExpr) throws Exception{	
 		//return getAccountingDocumentTypeDAO().save(accountingDocumentType, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveAccountingDocumentType(userContext, accountingDocumentType, tokens);
 	}
 	
 	protected AccountingDocumentType saveAccountingDocumentTypeDetail(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType) throws Exception{	

 		
 		return saveAccountingDocumentType(userContext, accountingDocumentType, allTokens());
 	}
 	
 	public AccountingDocumentType loadAccountingDocumentType(RetailscmUserContext userContext, String accountingDocumentTypeId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentTypeManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType( userContext, accountingDocumentTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocumentType, tokens);
 	}
 	
 	
 	 public AccountingDocumentType searchAccountingDocumentType(RetailscmUserContext userContext, String accountingDocumentTypeId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentTypeManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType( userContext, accountingDocumentTypeId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingDocumentType, tokens);
 	}
 	
 	

 	protected AccountingDocumentType present(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,accountingDocumentType,tokens);
		
		
		AccountingDocumentType  accountingDocumentTypeToPresent = accountingDocumentTypeDaoOf(userContext).present(accountingDocumentType, tokens);
		
		List<BaseEntity> entityListToNaming = accountingDocumentTypeToPresent.collectRefercencesFromLists();
		accountingDocumentTypeDaoOf(userContext).alias(entityListToNaming);
		
		return  accountingDocumentTypeToPresent;
		
		
	}
 
 	
 	
 	public AccountingDocumentType loadAccountingDocumentTypeDetail(RetailscmUserContext userContext, String accountingDocumentTypeId) throws Exception{	
 		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType( userContext, accountingDocumentTypeId, allTokens());
 		return present(userContext,accountingDocumentType, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String accountingDocumentTypeId) throws Exception{	
 		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType( userContext, accountingDocumentTypeId, viewTokens());
 		return present(userContext,accountingDocumentType, allTokens());
		
 	}
 	protected AccountingDocumentType saveAccountingDocumentType(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, Map<String,Object>tokens) throws Exception{	
 		return accountingDocumentTypeDaoOf(userContext).save(accountingDocumentType, tokens);
 	}
 	protected AccountingDocumentType loadAccountingDocumentType(RetailscmUserContext userContext, String accountingDocumentTypeId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingDocumentTypeManagerException.class);

 
 		return accountingDocumentTypeDaoOf(userContext).load(accountingDocumentTypeId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, Map<String, Object> tokens){
		super.addActions(userContext, accountingDocumentType, tokens);
		
		addAction(userContext, accountingDocumentType, tokens,"@create","createAccountingDocumentType","createAccountingDocumentType/","main","primary");
		addAction(userContext, accountingDocumentType, tokens,"@update","updateAccountingDocumentType","updateAccountingDocumentType/"+accountingDocumentType.getId()+"/","main","primary");
		addAction(userContext, accountingDocumentType, tokens,"@copy","cloneAccountingDocumentType","cloneAccountingDocumentType/"+accountingDocumentType.getId()+"/","main","primary");
		
		addAction(userContext, accountingDocumentType, tokens,"accounting_document_type.transfer_to_accounting_period","transferToAnotherAccountingPeriod","transferToAnotherAccountingPeriod/"+accountingDocumentType.getId()+"/","main","primary");
		addAction(userContext, accountingDocumentType, tokens,"accounting_document_type.addAccountingDocument","addAccountingDocument","addAccountingDocument/"+accountingDocumentType.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingDocumentType, tokens,"accounting_document_type.removeAccountingDocument","removeAccountingDocument","removeAccountingDocument/"+accountingDocumentType.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingDocumentType, tokens,"accounting_document_type.updateAccountingDocument","updateAccountingDocument","updateAccountingDocument/"+accountingDocumentType.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingDocumentType, tokens,"accounting_document_type.copyAccountingDocumentFrom","copyAccountingDocumentFrom","copyAccountingDocumentFrom/"+accountingDocumentType.getId()+"/","accountingDocumentList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public AccountingDocumentType createAccountingDocumentType(RetailscmUserContext userContext, String name,String description,String accountingPeriodId) throws Exception
	//public AccountingDocumentType createAccountingDocumentType(RetailscmUserContext userContext,String name, String description, String accountingPeriodId) throws Exception
	{
		
		

		

		checkerOf(userContext).checkNameOfAccountingDocumentType(name);
		checkerOf(userContext).checkDescriptionOfAccountingDocumentType(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);


		AccountingDocumentType accountingDocumentType=createNewAccountingDocumentType();	

		accountingDocumentType.setName(name);
		accountingDocumentType.setDescription(description);
			
		AccountSet accountingPeriod = loadAccountSet(userContext, accountingPeriodId,emptyOptions());
		accountingDocumentType.setAccountingPeriod(accountingPeriod);
		
		

		accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, emptyOptions());
		
		onNewInstanceCreated(userContext, accountingDocumentType);
		return accountingDocumentType;

		
	}
	protected AccountingDocumentType createNewAccountingDocumentType() 
	{
		
		return new AccountingDocumentType();		
	}
	
	protected void checkParamsForUpdatingAccountingDocumentType(RetailscmUserContext userContext,String accountingDocumentTypeId, int accountingDocumentTypeVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).checkVersionOfAccountingDocumentType( accountingDocumentTypeVersion);
		

		if(AccountingDocumentType.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingDocumentType(parseString(newValueExpr));
		}
		if(AccountingDocumentType.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfAccountingDocumentType(parseString(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
	
		
	}
	
	
	
	public AccountingDocumentType clone(RetailscmUserContext userContext, String fromAccountingDocumentTypeId) throws Exception{
		
		return accountingDocumentTypeDaoOf(userContext).clone(fromAccountingDocumentTypeId, this.allTokens());
	}
	
	public AccountingDocumentType internalSaveAccountingDocumentType(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType) throws Exception 
	{
		return internalSaveAccountingDocumentType(userContext, accountingDocumentType, allTokens());

	}
	public AccountingDocumentType internalSaveAccountingDocumentType(RetailscmUserContext userContext, AccountingDocumentType accountingDocumentType, Map<String,Object> options) throws Exception 
	{
		//checkParamsForUpdatingAccountingDocumentType(userContext, accountingDocumentTypeId, accountingDocumentTypeVersion, property, newValueExpr, tokensExpr);
		
		
		synchronized(accountingDocumentType){ 
			//will be good when the accountingDocumentType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentType.
			if (accountingDocumentType.isChanged()){
			
			}
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, options);
			return accountingDocumentType;
			
		}

	}
	
	public AccountingDocumentType updateAccountingDocumentType(RetailscmUserContext userContext,String accountingDocumentTypeId, int accountingDocumentTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocumentType(userContext, accountingDocumentTypeId, accountingDocumentTypeVersion, property, newValueExpr, tokensExpr);
		
		
		
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
		if(accountingDocumentType.getVersion() != accountingDocumentTypeVersion){
			String message = "The target version("+accountingDocumentType.getVersion()+") is not equals to version("+accountingDocumentTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocumentType){ 
			//will be good when the accountingDocumentType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentType.
			
			accountingDocumentType.changeProperty(property, newValueExpr);
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().done());
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
			//return saveAccountingDocumentType(userContext, accountingDocumentType, tokens().done());
		}

	}
	
	public AccountingDocumentType updateAccountingDocumentTypeProperty(RetailscmUserContext userContext,String accountingDocumentTypeId, int accountingDocumentTypeVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception 
	{
		checkParamsForUpdatingAccountingDocumentType(userContext, accountingDocumentTypeId, accountingDocumentTypeVersion, property, newValueExpr, tokensExpr);
		
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
		if(accountingDocumentType.getVersion() != accountingDocumentTypeVersion){
			String message = "The target version("+accountingDocumentType.getVersion()+") is not equals to version("+accountingDocumentTypeVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingDocumentType){ 
			//will be good when the accountingDocumentType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingDocumentType.
			
			accountingDocumentType.changeProperty(property, newValueExpr);
			
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().done());
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
			//return saveAccountingDocumentType(userContext, accountingDocumentType, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}
	
	protected AccountingDocumentTypeTokens tokens(){
		return AccountingDocumentTypeTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return AccountingDocumentTypeTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortAccountingDocumentListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return AccountingDocumentTypeTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherAccountingPeriod(RetailscmUserContext userContext, String accountingDocumentTypeId, String anotherAccountingPeriodId) throws Exception
 	{
 		
 		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
 		checkerOf(userContext).checkIdOfAccountSet(anotherAccountingPeriodId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
 		
 	}
 	public AccountingDocumentType transferToAnotherAccountingPeriod(RetailscmUserContext userContext, String accountingDocumentTypeId, String anotherAccountingPeriodId) throws Exception
 	{
 		checkParamsForTransferingAnotherAccountingPeriod(userContext, accountingDocumentTypeId,anotherAccountingPeriodId);
 
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());	
		synchronized(accountingDocumentType){
			//will be good when the accountingDocumentType loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountSet accountingPeriod = loadAccountSet(userContext, anotherAccountingPeriodId, emptyOptions());		
			accountingDocumentType.updateAccountingPeriod(accountingPeriod);		
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, emptyOptions());
			
			return present(userContext,accountingDocumentType, allTokens());
			
		}

 	}
 	
	 	
 	
 	
	public CandidateAccountSet requestCandidateAccountingPeriod(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateAccountSet result = new CandidateAccountSet();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");
		
		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<AccountSet> candidateList = accountSetDaoOf(userContext).requestCandidateAccountSetForAccountingDocumentType(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}
 	
 //--------------------------------------------------------------
	
	 	
 	protected AccountSet loadAccountSet(RetailscmUserContext userContext, String newAccountingPeriodId, Map<String,Object> options) throws Exception
 	{
		
 		return accountSetDaoOf(userContext).load(newAccountingPeriodId, options);
 	}
 	
 	
 	
	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String accountingDocumentTypeId, int accountingDocumentTypeVersion) throws Exception {
		//deleteInternal(userContext, accountingDocumentTypeId, accountingDocumentTypeVersion);		
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String accountingDocumentTypeId, int accountingDocumentTypeVersion) throws Exception{
			
		accountingDocumentTypeDaoOf(userContext).delete(accountingDocumentTypeId, accountingDocumentTypeVersion);
	}
	
	public AccountingDocumentType forgetByAll(RetailscmUserContext userContext, String accountingDocumentTypeId, int accountingDocumentTypeVersion) throws Exception {
		return forgetByAllInternal(userContext, accountingDocumentTypeId, accountingDocumentTypeVersion);		
	}
	protected AccountingDocumentType forgetByAllInternal(RetailscmUserContext userContext,
			String accountingDocumentTypeId, int accountingDocumentTypeVersion) throws Exception{
			
		return accountingDocumentTypeDaoOf(userContext).disconnectFromAll(accountingDocumentTypeId, accountingDocumentTypeVersion);
	}
	
	

	
	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new AccountingDocumentTypeManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}
	
	
	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return accountingDocumentTypeDaoOf(userContext).deleteAll();
	}


	//disconnect AccountingDocumentType with accounting_period in AccountingDocument
	protected AccountingDocumentType breakWithAccountingDocumentByAccountingPeriod(RetailscmUserContext userContext, String accountingDocumentTypeId, String accountingPeriodId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());

			synchronized(accountingDocumentType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentListWithAccountingPeriod(accountingDocumentType, accountingPeriodId, this.emptyOptions());

				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				return accountingDocumentType;
			}
	}
	//disconnect AccountingDocumentType with creation in AccountingDocument
	protected AccountingDocumentType breakWithAccountingDocumentByCreation(RetailscmUserContext userContext, String accountingDocumentTypeId, String creationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());

			synchronized(accountingDocumentType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentListWithCreation(accountingDocumentType, creationId, this.emptyOptions());

				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				return accountingDocumentType;
			}
	}
	//disconnect AccountingDocumentType with confirmation in AccountingDocument
	protected AccountingDocumentType breakWithAccountingDocumentByConfirmation(RetailscmUserContext userContext, String accountingDocumentTypeId, String confirmationId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());

			synchronized(accountingDocumentType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentListWithConfirmation(accountingDocumentType, confirmationId, this.emptyOptions());

				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				return accountingDocumentType;
			}
	}
	//disconnect AccountingDocumentType with auditing in AccountingDocument
	protected AccountingDocumentType breakWithAccountingDocumentByAuditing(RetailscmUserContext userContext, String accountingDocumentTypeId, String auditingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());

			synchronized(accountingDocumentType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentListWithAuditing(accountingDocumentType, auditingId, this.emptyOptions());

				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				return accountingDocumentType;
			}
	}
	//disconnect AccountingDocumentType with posting in AccountingDocument
	protected AccountingDocumentType breakWithAccountingDocumentByPosting(RetailscmUserContext userContext, String accountingDocumentTypeId, String postingId,  String [] tokensExpr)
		 throws Exception{
			
			//TODO add check code here
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());

			synchronized(accountingDocumentType){ 
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentListWithPosting(accountingDocumentType, postingId, this.emptyOptions());

				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				return accountingDocumentType;
			}
	}
	
	
	
	
	

	protected void checkParamsForAddingAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, String name, Date accountingDocumentDate, String accountingPeriodId, String creationId, String confirmationId, String auditingId, String postingId,String [] tokensExpr) throws Exception{
		
				checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);

		
		checkerOf(userContext).checkNameOfAccountingDocument(name);
		
		checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(accountingDocumentDate);
		
		checkerOf(userContext).checkAccountingPeriodIdOfAccountingDocument(accountingPeriodId);
		
		checkerOf(userContext).checkCreationIdOfAccountingDocument(creationId);
		
		checkerOf(userContext).checkConfirmationIdOfAccountingDocument(confirmationId);
		
		checkerOf(userContext).checkAuditingIdOfAccountingDocument(auditingId);
		
		checkerOf(userContext).checkPostingIdOfAccountingDocument(postingId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);

	
	}
	public  AccountingDocumentType addAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, String name, Date accountingDocumentDate, String accountingPeriodId, String creationId, String confirmationId, String auditingId, String postingId, String [] tokensExpr) throws Exception
	{	
		
		checkParamsForAddingAccountingDocument(userContext,accountingDocumentTypeId,name, accountingDocumentDate, accountingPeriodId, creationId, confirmationId, auditingId, postingId,tokensExpr);
		
		AccountingDocument accountingDocument = createAccountingDocument(userContext,name, accountingDocumentDate, accountingPeriodId, creationId, confirmationId, auditingId, postingId);
		
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
		synchronized(accountingDocumentType){ 
			//Will be good when the accountingDocumentType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocumentType.addAccountingDocument( accountingDocument );		
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
			
			userContext.getManagerGroup().getAccountingDocumentManager().onNewInstanceCreated(userContext, accountingDocument);
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingAccountingDocumentProperties(RetailscmUserContext userContext, String accountingDocumentTypeId,String id,String name,Date accountingDocumentDate,String [] tokensExpr) throws Exception {
		
		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).checkIdOfAccountingDocument(id);
		
		checkerOf(userContext).checkNameOfAccountingDocument( name);
		checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument( accountingDocumentDate);

		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
		
	}
	public  AccountingDocumentType updateAccountingDocumentProperties(RetailscmUserContext userContext, String accountingDocumentTypeId, String id,String name,Date accountingDocumentDate, String [] tokensExpr) throws Exception
	{	
		checkParamsForUpdatingAccountingDocumentProperties(userContext,accountingDocumentTypeId,id,name,accountingDocumentDate,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withAccountingDocumentListList()
				.searchAccountingDocumentListWith(AccountingDocument.ID_PROPERTY, "is", id).done();
		
		AccountingDocumentType accountingDocumentTypeToUpdate = loadAccountingDocumentType(userContext, accountingDocumentTypeId, options);
		
		if(accountingDocumentTypeToUpdate.getAccountingDocumentList().isEmpty()){
			throw new AccountingDocumentTypeManagerException("AccountingDocument is NOT FOUND with id: '"+id+"'");
		}
		
		AccountingDocument item = accountingDocumentTypeToUpdate.getAccountingDocumentList().first();
		
		item.updateName( name );
		item.updateAccountingDocumentDate( accountingDocumentDate );

		
		//checkParamsForAddingAccountingDocument(userContext,accountingDocumentTypeId,name, code, used,tokensExpr);
		AccountingDocumentType accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentTypeToUpdate, tokens().withAccountingDocumentList().done());
		synchronized(accountingDocumentType){ 
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
		}
	}
	
	
	protected AccountingDocument createAccountingDocument(RetailscmUserContext userContext, String name, Date accountingDocumentDate, String accountingPeriodId, String creationId, String confirmationId, String auditingId, String postingId) throws Exception{

		AccountingDocument accountingDocument = new AccountingDocument();
		
		
		accountingDocument.setName(name);		
		accountingDocument.setAccountingDocumentDate(accountingDocumentDate);		
		AccountingPeriod  accountingPeriod = new AccountingPeriod();
		accountingPeriod.setId(accountingPeriodId);		
		accountingDocument.setAccountingPeriod(accountingPeriod);		
		AccountingDocumentCreation  creation = new AccountingDocumentCreation();
		creation.setId(creationId);		
		accountingDocument.setCreation(creation);		
		AccountingDocumentConfirmation  confirmation = new AccountingDocumentConfirmation();
		confirmation.setId(confirmationId);		
		accountingDocument.setConfirmation(confirmation);		
		AccountingDocumentAuditing  auditing = new AccountingDocumentAuditing();
		auditing.setId(auditingId);		
		accountingDocument.setAuditing(auditing);		
		AccountingDocumentPosting  posting = new AccountingDocumentPosting();
		posting.setId(postingId);		
		accountingDocument.setPosting(posting);
	
		
		return accountingDocument;
	
		
	}
	
	protected AccountingDocument createIndexedAccountingDocument(String id, int version){

		AccountingDocument accountingDocument = new AccountingDocument();
		accountingDocument.setId(id);
		accountingDocument.setVersion(version);
		return accountingDocument;			
		
	}
	
	protected void checkParamsForRemovingAccountingDocumentList(RetailscmUserContext userContext, String accountingDocumentTypeId, 
			String accountingDocumentIds[],String [] tokensExpr) throws Exception {
		
<<<<<<< HEAD
		userContext.getChecker().checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		for(String accountingDocumentIdItem: accountingDocumentIds){
			userContext.getChecker().checkIdOfAccountingDocument(accountingDocumentIdItem);
=======
		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		for(String accountingDocumentIdItem: accountingDocumentIds){
			checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentIdItem);
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
		}
		
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
		
	}
	public  AccountingDocumentType removeAccountingDocumentList(RetailscmUserContext userContext, String accountingDocumentTypeId, 
			String accountingDocumentIds[],String [] tokensExpr) throws Exception{
			
			checkParamsForRemovingAccountingDocumentList(userContext, accountingDocumentTypeId,  accountingDocumentIds, tokensExpr);
			
			
			AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
			synchronized(accountingDocumentType){ 
				//Will be good when the accountingDocumentType loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				accountingDocumentTypeDaoOf(userContext).planToRemoveAccountingDocumentList(accountingDocumentType, accountingDocumentIds, allTokens());
				accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
				deleteRelationListInGraph(userContext, accountingDocumentType.getAccountingDocumentList());
				return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
			}
	}
	
	protected void checkParamsForRemovingAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, 
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocumentType( accountingDocumentTypeId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
	
	}
	public  AccountingDocumentType removeAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, 
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForRemovingAccountingDocument(userContext,accountingDocumentTypeId, accountingDocumentId, accountingDocumentVersion,tokensExpr);
		
		AccountingDocument accountingDocument = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
		synchronized(accountingDocumentType){ 
			//Will be good when the accountingDocumentType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingDocumentType.removeAccountingDocument( accountingDocument );		
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
			deleteRelationInGraph(userContext, accountingDocument);
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
		}
		
		
	}
	protected void checkParamsForCopyingAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, 
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingDocumentType( accountingDocumentTypeId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
	
	}
	public  AccountingDocumentType copyAccountingDocumentFrom(RetailscmUserContext userContext, String accountingDocumentTypeId, 
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkParamsForCopyingAccountingDocument(userContext,accountingDocumentTypeId, accountingDocumentId, accountingDocumentVersion,tokensExpr);
		
		AccountingDocument accountingDocument = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, allTokens());
		synchronized(accountingDocumentType){ 
			//Will be good when the accountingDocumentType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			
			
			
			accountingDocumentType.copyAccountingDocumentFrom( accountingDocument );		
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
			
			userContext.getManagerGroup().getAccountingDocumentManager().onNewInstanceCreated(userContext, (AccountingDocument)accountingDocumentType.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
		}
		
	}
	
	protected void checkParamsForUpdatingAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfAccountingDocumentType(accountingDocumentTypeId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		

		if(AccountingDocument.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingDocument(parseString(newValueExpr));
		}
		
		if(AccountingDocument.ACCOUNTING_DOCUMENT_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(parseDate(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingDocumentTypeManagerException.class);
	
	}
	
	public  AccountingDocumentType updateAccountingDocument(RetailscmUserContext userContext, String accountingDocumentTypeId, String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{
		
		checkParamsForUpdatingAccountingDocument(userContext, accountingDocumentTypeId, accountingDocumentId, accountingDocumentVersion, property, newValueExpr,  tokensExpr);
		
		Map<String,Object> loadTokens = this.tokens().withAccountingDocumentList().searchAccountingDocumentListWith(AccountingDocument.ID_PROPERTY, "eq", accountingDocumentId).done();
		
		
		
		AccountingDocumentType accountingDocumentType = loadAccountingDocumentType(userContext, accountingDocumentTypeId, loadTokens);
		
		synchronized(accountingDocumentType){ 
			//Will be good when the accountingDocumentType loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//accountingDocumentType.removeAccountingDocument( accountingDocument );	
			//make changes to AcceleraterAccount.
			AccountingDocument accountingDocumentIndex = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);
		
			AccountingDocument accountingDocument = accountingDocumentType.findTheAccountingDocument(accountingDocumentIndex);
			if(accountingDocument == null){
				throw new AccountingDocumentTypeManagerException(accountingDocument+" is NOT FOUND" );
			}
			
			accountingDocument.changeProperty(property, newValueExpr);
			
			accountingDocumentType = saveAccountingDocumentType(userContext, accountingDocumentType, tokens().withAccountingDocumentList().done());
			return present(userContext,accountingDocumentType, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/
	



	public void onNewInstanceCreated(RetailscmUserContext userContext, AccountingDocumentType newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);
	}

}



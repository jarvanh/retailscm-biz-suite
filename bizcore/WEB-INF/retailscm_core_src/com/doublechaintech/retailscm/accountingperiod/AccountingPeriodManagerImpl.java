
package com.doublechaintech.retailscm.accountingperiod;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.accountingdocument.AccountingDocument;
import com.doublechaintech.retailscm.accountset.AccountSet;

import com.doublechaintech.retailscm.accountset.CandidateAccountSet;

import com.doublechaintech.retailscm.accountingdocumenttype.AccountingDocumentType;
import com.doublechaintech.retailscm.accountingperiod.AccountingPeriod;






public class AccountingPeriodManagerImpl extends CustomRetailscmCheckerManager implements AccountingPeriodManager {

  


	private static final String SERVICE_TYPE = "AccountingPeriod";
	@Override
	public AccountingPeriodDAO daoOf(RetailscmUserContext userContext) {
		return accountingPeriodDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws AccountingPeriodManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new AccountingPeriodManagerException(message);

	}



 	protected AccountingPeriod saveAccountingPeriod(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, String [] tokensExpr) throws Exception{	
 		//return getAccountingPeriodDAO().save(accountingPeriod, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveAccountingPeriod(userContext, accountingPeriod, tokens);
 	}
 	
 	protected AccountingPeriod saveAccountingPeriodDetail(RetailscmUserContext userContext, AccountingPeriod accountingPeriod) throws Exception{	

 		
 		return saveAccountingPeriod(userContext, accountingPeriod, allTokens());
 	}
 	
 	public AccountingPeriod loadAccountingPeriod(RetailscmUserContext userContext, String accountingPeriodId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingPeriodManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		AccountingPeriod accountingPeriod = loadAccountingPeriod( userContext, accountingPeriodId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingPeriod, tokens);
 	}
 	
 	
 	 public AccountingPeriod searchAccountingPeriod(RetailscmUserContext userContext, String accountingPeriodId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingPeriodManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		AccountingPeriod accountingPeriod = loadAccountingPeriod( userContext, accountingPeriodId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,accountingPeriod, tokens);
 	}
 	
 	

 	protected AccountingPeriod present(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,accountingPeriod,tokens);
		
		
		AccountingPeriod  accountingPeriodToPresent = accountingPeriodDaoOf(userContext).present(accountingPeriod, tokens);
		
		List<BaseEntity> entityListToNaming = accountingPeriodToPresent.collectRefercencesFromLists();
		accountingPeriodDaoOf(userContext).alias(entityListToNaming);
		
		return  accountingPeriodToPresent;
		
		
	}
 
 	
 	
 	public AccountingPeriod loadAccountingPeriodDetail(RetailscmUserContext userContext, String accountingPeriodId) throws Exception{	
 		AccountingPeriod accountingPeriod = loadAccountingPeriod( userContext, accountingPeriodId, allTokens());
 		return present(userContext,accountingPeriod, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String accountingPeriodId) throws Exception{	
 		AccountingPeriod accountingPeriod = loadAccountingPeriod( userContext, accountingPeriodId, viewTokens());
 		return present(userContext,accountingPeriod, allTokens());
		
 	}
 	protected AccountingPeriod saveAccountingPeriod(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, Map<String,Object>tokens) throws Exception{	
 		return accountingPeriodDaoOf(userContext).save(accountingPeriod, tokens);
 	}
 	protected AccountingPeriod loadAccountingPeriod(RetailscmUserContext userContext, String accountingPeriodId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).throwExceptionIfHasErrors( AccountingPeriodManagerException.class);

 
 		return accountingPeriodDaoOf(userContext).load(accountingPeriodId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, Map<String, Object> tokens){
		super.addActions(userContext, accountingPeriod, tokens);
		
		addAction(userContext, accountingPeriod, tokens,"@create","createAccountingPeriod","createAccountingPeriod/","main","primary");
		addAction(userContext, accountingPeriod, tokens,"@update","updateAccountingPeriod","updateAccountingPeriod/"+accountingPeriod.getId()+"/","main","primary");
		addAction(userContext, accountingPeriod, tokens,"@copy","cloneAccountingPeriod","cloneAccountingPeriod/"+accountingPeriod.getId()+"/","main","primary");
		
		addAction(userContext, accountingPeriod, tokens,"accounting_period.transfer_to_account_set","transferToAnotherAccountSet","transferToAnotherAccountSet/"+accountingPeriod.getId()+"/","main","primary");
		addAction(userContext, accountingPeriod, tokens,"accounting_period.addAccountingDocument","addAccountingDocument","addAccountingDocument/"+accountingPeriod.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingPeriod, tokens,"accounting_period.removeAccountingDocument","removeAccountingDocument","removeAccountingDocument/"+accountingPeriod.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingPeriod, tokens,"accounting_period.updateAccountingDocument","updateAccountingDocument","updateAccountingDocument/"+accountingPeriod.getId()+"/","accountingDocumentList","primary");
		addAction(userContext, accountingPeriod, tokens,"accounting_period.copyAccountingDocumentFrom","copyAccountingDocumentFrom","copyAccountingDocumentFrom/"+accountingPeriod.getId()+"/","accountingDocumentList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public AccountingPeriod createAccountingPeriod(RetailscmUserContext userContext, String name,Date startDate,Date endDate,String accountSetId) throws Exception
	//public AccountingPeriod createAccountingPeriod(RetailscmUserContext userContext,String name, Date startDate, Date endDate, String accountSetId) throws Exception
	{

		

		

		checkerOf(userContext).checkNameOfAccountingPeriod(name);
		checkerOf(userContext).checkStartDateOfAccountingPeriod(startDate);
		checkerOf(userContext).checkEndDateOfAccountingPeriod(endDate);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);


		AccountingPeriod accountingPeriod=createNewAccountingPeriod();	

		accountingPeriod.setName(name);
		accountingPeriod.setStartDate(startDate);
		accountingPeriod.setEndDate(endDate);
			
		AccountSet accountSet = loadAccountSet(userContext, accountSetId,emptyOptions());
		accountingPeriod.setAccountSet(accountSet);
		
		

		accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, emptyOptions());
		
		onNewInstanceCreated(userContext, accountingPeriod);
		return accountingPeriod;


	}
	protected AccountingPeriod createNewAccountingPeriod()
	{

		return new AccountingPeriod();
	}

	protected void checkParamsForUpdatingAccountingPeriod(RetailscmUserContext userContext,String accountingPeriodId, int accountingPeriodVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).checkVersionOfAccountingPeriod( accountingPeriodVersion);
		

		if(AccountingPeriod.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingPeriod(parseString(newValueExpr));
		}
		if(AccountingPeriod.START_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkStartDateOfAccountingPeriod(parseDate(newValueExpr));
		}
		if(AccountingPeriod.END_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkEndDateOfAccountingPeriod(parseDate(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);


	}



	public AccountingPeriod clone(RetailscmUserContext userContext, String fromAccountingPeriodId) throws Exception{

		return accountingPeriodDaoOf(userContext).clone(fromAccountingPeriodId, this.allTokens());
	}

	public AccountingPeriod internalSaveAccountingPeriod(RetailscmUserContext userContext, AccountingPeriod accountingPeriod) throws Exception
	{
		return internalSaveAccountingPeriod(userContext, accountingPeriod, allTokens());

	}
	public AccountingPeriod internalSaveAccountingPeriod(RetailscmUserContext userContext, AccountingPeriod accountingPeriod, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingAccountingPeriod(userContext, accountingPeriodId, accountingPeriodVersion, property, newValueExpr, tokensExpr);


		synchronized(accountingPeriod){
			//will be good when the accountingPeriod loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingPeriod.
			if (accountingPeriod.isChanged()){
			
			}
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, options);
			return accountingPeriod;

		}

	}

	public AccountingPeriod updateAccountingPeriod(RetailscmUserContext userContext,String accountingPeriodId, int accountingPeriodVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingAccountingPeriod(userContext, accountingPeriodId, accountingPeriodVersion, property, newValueExpr, tokensExpr);



		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());
		if(accountingPeriod.getVersion() != accountingPeriodVersion){
			String message = "The target version("+accountingPeriod.getVersion()+") is not equals to version("+accountingPeriodVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingPeriod){
			//will be good when the accountingPeriod loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingPeriod.
			
			accountingPeriod.changeProperty(property, newValueExpr);
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().done());
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
			//return saveAccountingPeriod(userContext, accountingPeriod, tokens().done());
		}

	}

	public AccountingPeriod updateAccountingPeriodProperty(RetailscmUserContext userContext,String accountingPeriodId, int accountingPeriodVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingAccountingPeriod(userContext, accountingPeriodId, accountingPeriodVersion, property, newValueExpr, tokensExpr);

		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());
		if(accountingPeriod.getVersion() != accountingPeriodVersion){
			String message = "The target version("+accountingPeriod.getVersion()+") is not equals to version("+accountingPeriodVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(accountingPeriod){
			//will be good when the accountingPeriod loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to AccountingPeriod.

			accountingPeriod.changeProperty(property, newValueExpr);
			
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().done());
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
			//return saveAccountingPeriod(userContext, accountingPeriod, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected AccountingPeriodTokens tokens(){
		return AccountingPeriodTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return AccountingPeriodTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortAccountingDocumentListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return AccountingPeriodTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherAccountSet(RetailscmUserContext userContext, String accountingPeriodId, String anotherAccountSetId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
 		checkerOf(userContext).checkIdOfAccountSet(anotherAccountSetId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

 	}
 	public AccountingPeriod transferToAnotherAccountSet(RetailscmUserContext userContext, String accountingPeriodId, String anotherAccountSetId) throws Exception
 	{
 		checkParamsForTransferingAnotherAccountSet(userContext, accountingPeriodId,anotherAccountSetId);
 
		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());	
		synchronized(accountingPeriod){
			//will be good when the accountingPeriod loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			AccountSet accountSet = loadAccountSet(userContext, anotherAccountSetId, emptyOptions());		
			accountingPeriod.updateAccountSet(accountSet);		
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, emptyOptions());
			
			return present(userContext,accountingPeriod, allTokens());
			
		}

 	}

	


	public CandidateAccountSet requestCandidateAccountSet(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

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
		SmartList<AccountSet> candidateList = accountSetDaoOf(userContext).requestCandidateAccountSetForAccountingPeriod(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected AccountSet loadAccountSet(RetailscmUserContext userContext, String newAccountSetId, Map<String,Object> options) throws Exception
 	{

 		return accountSetDaoOf(userContext).load(newAccountSetId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String accountingPeriodId, int accountingPeriodVersion) throws Exception {
		//deleteInternal(userContext, accountingPeriodId, accountingPeriodVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String accountingPeriodId, int accountingPeriodVersion) throws Exception{

		accountingPeriodDaoOf(userContext).delete(accountingPeriodId, accountingPeriodVersion);
	}

	public AccountingPeriod forgetByAll(RetailscmUserContext userContext, String accountingPeriodId, int accountingPeriodVersion) throws Exception {
		return forgetByAllInternal(userContext, accountingPeriodId, accountingPeriodVersion);
	}
	protected AccountingPeriod forgetByAllInternal(RetailscmUserContext userContext,
			String accountingPeriodId, int accountingPeriodVersion) throws Exception{

		return accountingPeriodDaoOf(userContext).disconnectFromAll(accountingPeriodId, accountingPeriodVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new AccountingPeriodManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return accountingPeriodDaoOf(userContext).deleteAll();
	}


	//disconnect AccountingPeriod with document_type in AccountingDocument
	protected AccountingPeriod breakWithAccountingDocumentByDocumentType(RetailscmUserContext userContext, String accountingPeriodId, String documentTypeId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());

			synchronized(accountingPeriod){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				accountingPeriodDaoOf(userContext).planToRemoveAccountingDocumentListWithDocumentType(accountingPeriod, documentTypeId, this.emptyOptions());

				accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
				return accountingPeriod;
			}
	}






	protected void checkParamsForAddingAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId, String name, Date accountingDocumentDate, String documentTypeId,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);

		
		checkerOf(userContext).checkNameOfAccountingDocument(name);
		
		checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(accountingDocumentDate);
		
		checkerOf(userContext).checkDocumentTypeIdOfAccountingDocument(documentTypeId);
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);


	}
	public  AccountingPeriod addAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId, String name, Date accountingDocumentDate, String documentTypeId, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingAccountingDocument(userContext,accountingPeriodId,name, accountingDocumentDate, documentTypeId,tokensExpr);

		AccountingDocument accountingDocument = createAccountingDocument(userContext,name, accountingDocumentDate, documentTypeId);

		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, emptyOptions());
		synchronized(accountingPeriod){
			//Will be good when the accountingPeriod loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingPeriod.addAccountingDocument( accountingDocument );
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
			
			userContext.getManagerGroup().getAccountingDocumentManager().onNewInstanceCreated(userContext, accountingDocument);
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingAccountingDocumentProperties(RetailscmUserContext userContext, String accountingPeriodId,String id,String name,Date accountingDocumentDate,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).checkIdOfAccountingDocument(id);

		checkerOf(userContext).checkNameOfAccountingDocument( name);
		checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument( accountingDocumentDate);

		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

	}
	public  AccountingPeriod updateAccountingDocumentProperties(RetailscmUserContext userContext, String accountingPeriodId, String id,String name,Date accountingDocumentDate, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingAccountingDocumentProperties(userContext,accountingPeriodId,id,name,accountingDocumentDate,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withAccountingDocumentListList()
				.searchAccountingDocumentListWith(AccountingDocument.ID_PROPERTY, "is", id).done();

		AccountingPeriod accountingPeriodToUpdate = loadAccountingPeriod(userContext, accountingPeriodId, options);

		if(accountingPeriodToUpdate.getAccountingDocumentList().isEmpty()){
			throw new AccountingPeriodManagerException("AccountingDocument is NOT FOUND with id: '"+id+"'");
		}

		AccountingDocument item = accountingPeriodToUpdate.getAccountingDocumentList().first();

		item.updateName( name );
		item.updateAccountingDocumentDate( accountingDocumentDate );


		//checkParamsForAddingAccountingDocument(userContext,accountingPeriodId,name, code, used,tokensExpr);
		AccountingPeriod accountingPeriod = saveAccountingPeriod(userContext, accountingPeriodToUpdate, tokens().withAccountingDocumentList().done());
		synchronized(accountingPeriod){
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
		}
	}


	protected AccountingDocument createAccountingDocument(RetailscmUserContext userContext, String name, Date accountingDocumentDate, String documentTypeId) throws Exception{

		AccountingDocument accountingDocument = new AccountingDocument();
		
		
		accountingDocument.setName(name);		
		accountingDocument.setAccountingDocumentDate(accountingDocumentDate);		
		AccountingDocumentType  documentType = new AccountingDocumentType();
		documentType.setId(documentTypeId);		
		accountingDocument.setDocumentType(documentType);
	
		
		return accountingDocument;


	}

	protected AccountingDocument createIndexedAccountingDocument(String id, int version){

		AccountingDocument accountingDocument = new AccountingDocument();
		accountingDocument.setId(id);
		accountingDocument.setVersion(version);
		return accountingDocument;

	}

	protected void checkParamsForRemovingAccountingDocumentList(RetailscmUserContext userContext, String accountingPeriodId,
			String accountingDocumentIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		for(String accountingDocumentIdItem: accountingDocumentIds){
			checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

	}
	public  AccountingPeriod removeAccountingDocumentList(RetailscmUserContext userContext, String accountingPeriodId,
			String accountingDocumentIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingAccountingDocumentList(userContext, accountingPeriodId,  accountingDocumentIds, tokensExpr);


			AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());
			synchronized(accountingPeriod){
				//Will be good when the accountingPeriod loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				accountingPeriodDaoOf(userContext).planToRemoveAccountingDocumentList(accountingPeriod, accountingDocumentIds, allTokens());
				accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
				deleteRelationListInGraph(userContext, accountingPeriod.getAccountingDocumentList());
				return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId,
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingPeriod( accountingPeriodId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

	}
	public  AccountingPeriod removeAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId,
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingAccountingDocument(userContext,accountingPeriodId, accountingDocumentId, accountingDocumentVersion,tokensExpr);

		AccountingDocument accountingDocument = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);
		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());
		synchronized(accountingPeriod){
			//Will be good when the accountingPeriod loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			accountingPeriod.removeAccountingDocument( accountingDocument );
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
			deleteRelationInGraph(userContext, accountingDocument);
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId,
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfAccountingPeriod( accountingPeriodId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

	}
	public  AccountingPeriod copyAccountingDocumentFrom(RetailscmUserContext userContext, String accountingPeriodId,
		String accountingDocumentId, int accountingDocumentVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingAccountingDocument(userContext,accountingPeriodId, accountingDocumentId, accountingDocumentVersion,tokensExpr);

		AccountingDocument accountingDocument = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);
		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, allTokens());
		synchronized(accountingPeriod){
			//Will be good when the accountingPeriod loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			

			accountingPeriod.copyAccountingDocumentFrom( accountingDocument );
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
			
			userContext.getManagerGroup().getAccountingDocumentManager().onNewInstanceCreated(userContext, (AccountingDocument)accountingPeriod.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId, String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfAccountingPeriod(accountingPeriodId);
		checkerOf(userContext).checkIdOfAccountingDocument(accountingDocumentId);
		checkerOf(userContext).checkVersionOfAccountingDocument(accountingDocumentVersion);
		

		if(AccountingDocument.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfAccountingDocument(parseString(newValueExpr));
		}
		
		if(AccountingDocument.ACCOUNTING_DOCUMENT_DATE_PROPERTY.equals(property)){
			checkerOf(userContext).checkAccountingDocumentDateOfAccountingDocument(parseDate(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(AccountingPeriodManagerException.class);

	}

	public  AccountingPeriod updateAccountingDocument(RetailscmUserContext userContext, String accountingPeriodId, String accountingDocumentId, int accountingDocumentVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingAccountingDocument(userContext, accountingPeriodId, accountingDocumentId, accountingDocumentVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withAccountingDocumentList().searchAccountingDocumentListWith(AccountingDocument.ID_PROPERTY, "eq", accountingDocumentId).done();



		AccountingPeriod accountingPeriod = loadAccountingPeriod(userContext, accountingPeriodId, loadTokens);

		synchronized(accountingPeriod){
			//Will be good when the accountingPeriod loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//accountingPeriod.removeAccountingDocument( accountingDocument );
			//make changes to AcceleraterAccount.
			AccountingDocument accountingDocumentIndex = createIndexedAccountingDocument(accountingDocumentId, accountingDocumentVersion);

			AccountingDocument accountingDocument = accountingPeriod.findTheAccountingDocument(accountingDocumentIndex);
			if(accountingDocument == null){
				throw new AccountingPeriodManagerException(accountingDocument+" is NOT FOUND" );
			}

			accountingDocument.changeProperty(property, newValueExpr);
			
			accountingPeriod = saveAccountingPeriod(userContext, accountingPeriod, tokens().withAccountingDocumentList().done());
			return present(userContext,accountingPeriod, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, AccountingPeriod newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



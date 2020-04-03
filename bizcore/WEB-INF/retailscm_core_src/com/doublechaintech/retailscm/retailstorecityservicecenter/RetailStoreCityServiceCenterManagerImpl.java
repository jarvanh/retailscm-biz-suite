
package com.doublechaintech.retailscm.retailstorecityservicecenter;

import java.util.Date;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.math.BigDecimal;
import com.terapico.caf.DateTime;

import com.doublechaintech.retailscm.*;

import com.doublechaintech.retailscm.retailstore.RetailStore;
import com.doublechaintech.retailscm.retailstoreprovincecenter.RetailStoreProvinceCenter;
import com.doublechaintech.retailscm.potentialcustomer.PotentialCustomer;
import com.doublechaintech.retailscm.cityevent.CityEvent;
import com.doublechaintech.retailscm.citypartner.CityPartner;

import com.doublechaintech.retailscm.retailstoreprovincecenter.CandidateRetailStoreProvinceCenter;

import com.doublechaintech.retailscm.retailstorecountrycenter.RetailStoreCountryCenter;
import com.doublechaintech.retailscm.retailstoreclosing.RetailStoreClosing;
import com.doublechaintech.retailscm.retailstoreinvestmentinvitation.RetailStoreInvestmentInvitation;
import com.doublechaintech.retailscm.retailstoredecoration.RetailStoreDecoration;
import com.doublechaintech.retailscm.retailstorecreation.RetailStoreCreation;
import com.doublechaintech.retailscm.citypartner.CityPartner;
import com.doublechaintech.retailscm.retailstoreopening.RetailStoreOpening;
import com.doublechaintech.retailscm.retailstorecityservicecenter.RetailStoreCityServiceCenter;
import com.doublechaintech.retailscm.retailstorefranchising.RetailStoreFranchising;






public class RetailStoreCityServiceCenterManagerImpl extends CustomRetailscmCheckerManager implements RetailStoreCityServiceCenterManager {

  


	private static final String SERVICE_TYPE = "RetailStoreCityServiceCenter";
	@Override
	public RetailStoreCityServiceCenterDAO daoOf(RetailscmUserContext userContext) {
		return retailStoreCityServiceCenterDaoOf(userContext);
	}

	@Override
	public String serviceFor(){
		return SERVICE_TYPE;
	}


	protected void throwExceptionWithMessage(String value) throws RetailStoreCityServiceCenterManagerException{

		Message message = new Message();
		message.setBody(value);
		throw new RetailStoreCityServiceCenterManagerException(message);

	}



 	protected RetailStoreCityServiceCenter saveRetailStoreCityServiceCenter(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, String [] tokensExpr) throws Exception{	
 		//return getRetailStoreCityServiceCenterDAO().save(retailStoreCityServiceCenter, tokens);
 		
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		return saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens);
 	}
 	
 	protected RetailStoreCityServiceCenter saveRetailStoreCityServiceCenterDetail(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter) throws Exception{	

 		
 		return saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, allTokens());
 	}
 	
 	public RetailStoreCityServiceCenter loadRetailStoreCityServiceCenter(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCityServiceCenterManagerException.class);

 			
 		Map<String,Object>tokens = parseTokens(tokensExpr);
 		
 		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter( userContext, retailStoreCityServiceCenterId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreCityServiceCenter, tokens);
 	}
 	
 	
 	 public RetailStoreCityServiceCenter searchRetailStoreCityServiceCenter(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String textToSearch,String [] tokensExpr) throws Exception{				
 
 		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCityServiceCenterManagerException.class);

 		
 		Map<String,Object>tokens = tokens().allTokens().searchEntireObjectText("startsWith", textToSearch).initWithArray(tokensExpr);
 		
 		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter( userContext, retailStoreCityServiceCenterId, tokens);
 		//do some calc before sent to customer?
 		return present(userContext,retailStoreCityServiceCenter, tokens);
 	}
 	
 	

 	protected RetailStoreCityServiceCenter present(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, Map<String, Object> tokens) throws Exception {
		
		
		addActions(userContext,retailStoreCityServiceCenter,tokens);
		
		
		RetailStoreCityServiceCenter  retailStoreCityServiceCenterToPresent = retailStoreCityServiceCenterDaoOf(userContext).present(retailStoreCityServiceCenter, tokens);
		
		List<BaseEntity> entityListToNaming = retailStoreCityServiceCenterToPresent.collectRefercencesFromLists();
		retailStoreCityServiceCenterDaoOf(userContext).alias(entityListToNaming);
		
		return  retailStoreCityServiceCenterToPresent;
		
		
	}
 
 	
 	
 	public RetailStoreCityServiceCenter loadRetailStoreCityServiceCenterDetail(RetailscmUserContext userContext, String retailStoreCityServiceCenterId) throws Exception{	
 		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter( userContext, retailStoreCityServiceCenterId, allTokens());
 		return present(userContext,retailStoreCityServiceCenter, allTokens());
		
 	}
 	
 	public Object view(RetailscmUserContext userContext, String retailStoreCityServiceCenterId) throws Exception{	
 		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter( userContext, retailStoreCityServiceCenterId, viewTokens());
 		return present(userContext,retailStoreCityServiceCenter, allTokens());
		
 	}
 	protected RetailStoreCityServiceCenter saveRetailStoreCityServiceCenter(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, Map<String,Object>tokens) throws Exception{	
 		return retailStoreCityServiceCenterDaoOf(userContext).save(retailStoreCityServiceCenter, tokens);
 	}
 	protected RetailStoreCityServiceCenter loadRetailStoreCityServiceCenter(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, Map<String,Object>tokens) throws Exception{	
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).throwExceptionIfHasErrors( RetailStoreCityServiceCenterManagerException.class);

 
 		return retailStoreCityServiceCenterDaoOf(userContext).load(retailStoreCityServiceCenterId, tokens);
 	}

	


 	


 	
 	
 	protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, Map<String, Object> tokens){
		super.addActions(userContext, retailStoreCityServiceCenter, tokens);
		
		addAction(userContext, retailStoreCityServiceCenter, tokens,"@create","createRetailStoreCityServiceCenter","createRetailStoreCityServiceCenter/","main","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"@update","updateRetailStoreCityServiceCenter","updateRetailStoreCityServiceCenter/"+retailStoreCityServiceCenter.getId()+"/","main","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"@copy","cloneRetailStoreCityServiceCenter","cloneRetailStoreCityServiceCenter/"+retailStoreCityServiceCenter.getId()+"/","main","primary");
		
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.transfer_to_belongs_to","transferToAnotherBelongsTo","transferToAnotherBelongsTo/"+retailStoreCityServiceCenter.getId()+"/","main","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.addCityPartner","addCityPartner","addCityPartner/"+retailStoreCityServiceCenter.getId()+"/","cityPartnerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.removeCityPartner","removeCityPartner","removeCityPartner/"+retailStoreCityServiceCenter.getId()+"/","cityPartnerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.updateCityPartner","updateCityPartner","updateCityPartner/"+retailStoreCityServiceCenter.getId()+"/","cityPartnerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.copyCityPartnerFrom","copyCityPartnerFrom","copyCityPartnerFrom/"+retailStoreCityServiceCenter.getId()+"/","cityPartnerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.addPotentialCustomer","addPotentialCustomer","addPotentialCustomer/"+retailStoreCityServiceCenter.getId()+"/","potentialCustomerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.removePotentialCustomer","removePotentialCustomer","removePotentialCustomer/"+retailStoreCityServiceCenter.getId()+"/","potentialCustomerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.updatePotentialCustomer","updatePotentialCustomer","updatePotentialCustomer/"+retailStoreCityServiceCenter.getId()+"/","potentialCustomerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.copyPotentialCustomerFrom","copyPotentialCustomerFrom","copyPotentialCustomerFrom/"+retailStoreCityServiceCenter.getId()+"/","potentialCustomerList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.addCityEvent","addCityEvent","addCityEvent/"+retailStoreCityServiceCenter.getId()+"/","cityEventList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.removeCityEvent","removeCityEvent","removeCityEvent/"+retailStoreCityServiceCenter.getId()+"/","cityEventList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.updateCityEvent","updateCityEvent","updateCityEvent/"+retailStoreCityServiceCenter.getId()+"/","cityEventList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.copyCityEventFrom","copyCityEventFrom","copyCityEventFrom/"+retailStoreCityServiceCenter.getId()+"/","cityEventList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.addRetailStore","addRetailStore","addRetailStore/"+retailStoreCityServiceCenter.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.removeRetailStore","removeRetailStore","removeRetailStore/"+retailStoreCityServiceCenter.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.updateRetailStore","updateRetailStore","updateRetailStore/"+retailStoreCityServiceCenter.getId()+"/","retailStoreList","primary");
		addAction(userContext, retailStoreCityServiceCenter, tokens,"retail_store_city_service_center.copyRetailStoreFrom","copyRetailStoreFrom","copyRetailStoreFrom/"+retailStoreCityServiceCenter.getId()+"/","retailStoreList","primary");
	
		
		
	}// end method of protected<T extends BaseEntity> void addActions(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, Map<String, Object> tokens){
	
 	
 	
 
 	
 	

	public RetailStoreCityServiceCenter createRetailStoreCityServiceCenter(RetailscmUserContext userContext, String name,Date founded,String belongsToId) throws Exception
	//public RetailStoreCityServiceCenter createRetailStoreCityServiceCenter(RetailscmUserContext userContext,String name, Date founded, String belongsToId) throws Exception
	{

		

		

		checkerOf(userContext).checkNameOfRetailStoreCityServiceCenter(name);
		checkerOf(userContext).checkFoundedOfRetailStoreCityServiceCenter(founded);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


		RetailStoreCityServiceCenter retailStoreCityServiceCenter=createNewRetailStoreCityServiceCenter();	

		retailStoreCityServiceCenter.setName(name);
		retailStoreCityServiceCenter.setFounded(founded);
			
		RetailStoreProvinceCenter belongsTo = loadRetailStoreProvinceCenter(userContext, belongsToId,emptyOptions());
		retailStoreCityServiceCenter.setBelongsTo(belongsTo);
		
		
		retailStoreCityServiceCenter.setLastUpdateTime(userContext.now());

		retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, emptyOptions());
		
		onNewInstanceCreated(userContext, retailStoreCityServiceCenter);
		return retailStoreCityServiceCenter;


	}
	protected RetailStoreCityServiceCenter createNewRetailStoreCityServiceCenter()
	{

		return new RetailStoreCityServiceCenter();
	}

	protected void checkParamsForUpdatingRetailStoreCityServiceCenter(RetailscmUserContext userContext,String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion, String property, String newValueExpr,String [] tokensExpr)throws Exception
	{
		

		
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkVersionOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterVersion);
		

		if(RetailStoreCityServiceCenter.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStoreCityServiceCenter(parseString(newValueExpr));
		}
		if(RetailStoreCityServiceCenter.FOUNDED_PROPERTY.equals(property)){
			checkerOf(userContext).checkFoundedOfRetailStoreCityServiceCenter(parseDate(newValueExpr));
		}		

		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


	}



	public RetailStoreCityServiceCenter clone(RetailscmUserContext userContext, String fromRetailStoreCityServiceCenterId) throws Exception{

		return retailStoreCityServiceCenterDaoOf(userContext).clone(fromRetailStoreCityServiceCenterId, this.allTokens());
	}

	public RetailStoreCityServiceCenter internalSaveRetailStoreCityServiceCenter(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter) throws Exception
	{
		return internalSaveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, allTokens());

	}
	public RetailStoreCityServiceCenter internalSaveRetailStoreCityServiceCenter(RetailscmUserContext userContext, RetailStoreCityServiceCenter retailStoreCityServiceCenter, Map<String,Object> options) throws Exception
	{
		//checkParamsForUpdatingRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion, property, newValueExpr, tokensExpr);


		synchronized(retailStoreCityServiceCenter){
			//will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCityServiceCenter.
			if (retailStoreCityServiceCenter.isChanged()){
			retailStoreCityServiceCenter.updateLastUpdateTime(userContext.now());
			}
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, options);
			return retailStoreCityServiceCenter;

		}

	}

	public RetailStoreCityServiceCenter updateRetailStoreCityServiceCenter(RetailscmUserContext userContext,String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion, property, newValueExpr, tokensExpr);



		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		if(retailStoreCityServiceCenter.getVersion() != retailStoreCityServiceCenterVersion){
			String message = "The target version("+retailStoreCityServiceCenter.getVersion()+") is not equals to version("+retailStoreCityServiceCenterVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreCityServiceCenter){
			//will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCityServiceCenter.
			retailStoreCityServiceCenter.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter.changeProperty(property, newValueExpr);
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			//return saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().done());
		}

	}

	public RetailStoreCityServiceCenter updateRetailStoreCityServiceCenterProperty(RetailscmUserContext userContext,String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion, property, newValueExpr, tokensExpr);

		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		if(retailStoreCityServiceCenter.getVersion() != retailStoreCityServiceCenterVersion){
			String message = "The target version("+retailStoreCityServiceCenter.getVersion()+") is not equals to version("+retailStoreCityServiceCenterVersion+") provided";
			throwExceptionWithMessage(message);
		}
		synchronized(retailStoreCityServiceCenter){
			//will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			//make changes to RetailStoreCityServiceCenter.

			retailStoreCityServiceCenter.changeProperty(property, newValueExpr);
			retailStoreCityServiceCenter.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			//return saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().done());
		}

	}
	protected Map<String,Object> emptyOptions(){
		return tokens().done();
	}

	protected RetailStoreCityServiceCenterTokens tokens(){
		return RetailStoreCityServiceCenterTokens.start();
	}
	protected Map<String,Object> parseTokens(String [] tokensExpr){
		return tokens().initWithArray(tokensExpr);
	}
	protected Map<String,Object> allTokens(){
		return RetailStoreCityServiceCenterTokens.all();
	}
	protected Map<String,Object> viewTokens(){
		return tokens().allTokens()
		.sortCityPartnerListWith("id","desc")
		.sortPotentialCustomerListWith("id","desc")
		.sortCityEventListWith("id","desc")
		.sortRetailStoreListWith("id","desc")
		.analyzeAllLists().done();

	}
	protected Map<String,Object> mergedAllTokens(String []tokens){
		return RetailStoreCityServiceCenterTokens.mergeAll(tokens).done();
	}
	
	protected void checkParamsForTransferingAnotherBelongsTo(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String anotherBelongsToId) throws Exception
 	{

 		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
 		checkerOf(userContext).checkIdOfRetailStoreProvinceCenter(anotherBelongsToId);//check for optional reference
 		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

 	}
 	public RetailStoreCityServiceCenter transferToAnotherBelongsTo(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String anotherBelongsToId) throws Exception
 	{
 		checkParamsForTransferingAnotherBelongsTo(userContext, retailStoreCityServiceCenterId,anotherBelongsToId);
 
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());	
		synchronized(retailStoreCityServiceCenter){
			//will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//also good when there is a ram based DAO implementation
			RetailStoreProvinceCenter belongsTo = loadRetailStoreProvinceCenter(userContext, anotherBelongsToId, emptyOptions());		
			retailStoreCityServiceCenter.updateBelongsTo(belongsTo);		
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, emptyOptions());
			
			return present(userContext,retailStoreCityServiceCenter, allTokens());
			
		}

 	}

	


	public CandidateRetailStoreProvinceCenter requestCandidateBelongsTo(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo) throws Exception {

		CandidateRetailStoreProvinceCenter result = new CandidateRetailStoreProvinceCenter();
		result.setOwnerClass(ownerClass);
		result.setOwnerId(id);
		result.setFilterKey(filterKey==null?"":filterKey.trim());
		result.setPageNo(pageNo);
		result.setValueFieldName("id");
		result.setDisplayFieldName("name");

		pageNo = Math.max(1, pageNo);
		int pageSize = 20;
		//requestCandidateProductForSkuAsOwner
		SmartList<RetailStoreProvinceCenter> candidateList = retailStoreProvinceCenterDaoOf(userContext).requestCandidateRetailStoreProvinceCenterForRetailStoreCityServiceCenter(userContext,ownerClass, id, filterKey, pageNo, pageSize);
		result.setCandidates(candidateList);
		int totalCount = candidateList.getTotalCount();
		result.setTotalPage(Math.max(1, (totalCount + pageSize -1)/pageSize ));
		return result;
	}

 //--------------------------------------------------------------
	

 	protected RetailStoreProvinceCenter loadRetailStoreProvinceCenter(RetailscmUserContext userContext, String newBelongsToId, Map<String,Object> options) throws Exception
 	{

 		return retailStoreProvinceCenterDaoOf(userContext).load(newBelongsToId, options);
 	}
 	


	
	//--------------------------------------------------------------

	public void delete(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion) throws Exception {
		//deleteInternal(userContext, retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion);
	}
	protected void deleteInternal(RetailscmUserContext userContext,
			String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion) throws Exception{

		retailStoreCityServiceCenterDaoOf(userContext).delete(retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion);
	}

	public RetailStoreCityServiceCenter forgetByAll(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion) throws Exception {
		return forgetByAllInternal(userContext, retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion);
	}
	protected RetailStoreCityServiceCenter forgetByAllInternal(RetailscmUserContext userContext,
			String retailStoreCityServiceCenterId, int retailStoreCityServiceCenterVersion) throws Exception{

		return retailStoreCityServiceCenterDaoOf(userContext).disconnectFromAll(retailStoreCityServiceCenterId, retailStoreCityServiceCenterVersion);
	}




	public int deleteAll(RetailscmUserContext userContext, String secureCode) throws Exception
	{
		/*
		if(!("dElEtEaLl".equals(secureCode))){
			throw new RetailStoreCityServiceCenterManagerException("Your secure code is not right, please guess again");
		}
		return deleteAllInternal(userContext);
		*/
		return 0;
	}


	protected int deleteAllInternal(RetailscmUserContext userContext) throws Exception{
		return retailStoreCityServiceCenterDaoOf(userContext).deleteAll();
	}


	//disconnect RetailStoreCityServiceCenter with city_partner in PotentialCustomer
	protected RetailStoreCityServiceCenter breakWithPotentialCustomerByCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String cityPartnerId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemovePotentialCustomerListWithCityPartner(retailStoreCityServiceCenter, cityPartnerId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with retail_store_country_center in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByRetailStoreCountryCenter(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String retailStoreCountryCenterId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithRetailStoreCountryCenter(retailStoreCityServiceCenter, retailStoreCountryCenterId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with creation in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByCreation(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String creationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithCreation(retailStoreCityServiceCenter, creationId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with investment_invitation in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByInvestmentInvitation(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String investmentInvitationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithInvestmentInvitation(retailStoreCityServiceCenter, investmentInvitationId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with franchising in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByFranchising(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String franchisingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithFranchising(retailStoreCityServiceCenter, franchisingId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with decoration in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByDecoration(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String decorationId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithDecoration(retailStoreCityServiceCenter, decorationId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with opening in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByOpening(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String openingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithOpening(retailStoreCityServiceCenter, openingId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}
	//disconnect RetailStoreCityServiceCenter with closing in RetailStore
	protected RetailStoreCityServiceCenter breakWithRetailStoreByClosing(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String closingId,  String [] tokensExpr)
		 throws Exception{

			//TODO add check code here

			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());

			synchronized(retailStoreCityServiceCenter){
				//Will be good when the thread loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation

				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreListWithClosing(retailStoreCityServiceCenter, closingId, this.emptyOptions());

				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				return retailStoreCityServiceCenter;
			}
	}






	protected void checkParamsForAddingCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String description,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);

		
		checkerOf(userContext).checkNameOfCityPartner(name);
		
		checkerOf(userContext).checkMobileOfCityPartner(mobile);
		
		checkerOf(userContext).checkDescriptionOfCityPartner(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


	}
	public  RetailStoreCityServiceCenter addCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String description, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingCityPartner(userContext,retailStoreCityServiceCenterId,name, mobile, description,tokensExpr);

		CityPartner cityPartner = createCityPartner(userContext,name, mobile, description);

		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, emptyOptions());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.addCityPartner( cityPartner );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityPartnerList().done());
			
			userContext.getManagerGroup().getCityPartnerManager().onNewInstanceCreated(userContext, cityPartner);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingCityPartnerProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,String id,String name,String mobile,String description,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityPartner(id);

		checkerOf(userContext).checkNameOfCityPartner( name);
		checkerOf(userContext).checkMobileOfCityPartner( mobile);
		checkerOf(userContext).checkDescriptionOfCityPartner( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter updateCityPartnerProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String id,String name,String mobile,String description, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingCityPartnerProperties(userContext,retailStoreCityServiceCenterId,id,name,mobile,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withCityPartnerListList()
				.searchCityPartnerListWith(CityPartner.ID_PROPERTY, "is", id).done();

		RetailStoreCityServiceCenter retailStoreCityServiceCenterToUpdate = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, options);

		if(retailStoreCityServiceCenterToUpdate.getCityPartnerList().isEmpty()){
			throw new RetailStoreCityServiceCenterManagerException("CityPartner is NOT FOUND with id: '"+id+"'");
		}

		CityPartner item = retailStoreCityServiceCenterToUpdate.getCityPartnerList().first();

		item.updateName( name );
		item.updateMobile( mobile );
		item.updateDescription( description );


		//checkParamsForAddingCityPartner(userContext,retailStoreCityServiceCenterId,name, code, used,tokensExpr);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterToUpdate, tokens().withCityPartnerList().done());
		synchronized(retailStoreCityServiceCenter){
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}


	protected CityPartner createCityPartner(RetailscmUserContext userContext, String name, String mobile, String description) throws Exception{

		CityPartner cityPartner = new CityPartner();
		
		
		cityPartner.setName(name);		
		cityPartner.setMobile(mobile);		
		cityPartner.setDescription(description);		
		cityPartner.setLastUpdateTime(userContext.now());
	
		
		return cityPartner;


	}

	protected CityPartner createIndexedCityPartner(String id, int version){

		CityPartner cityPartner = new CityPartner();
		cityPartner.setId(id);
		cityPartner.setVersion(version);
		return cityPartner;

	}

	protected void checkParamsForRemovingCityPartnerList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String cityPartnerIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		for(String cityPartnerIdItem: cityPartnerIds){
			checkerOf(userContext).checkIdOfCityPartner(cityPartnerIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeCityPartnerList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String cityPartnerIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingCityPartnerList(userContext, retailStoreCityServiceCenterId,  cityPartnerIds, tokensExpr);


			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
			synchronized(retailStoreCityServiceCenter){
				//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveCityPartnerList(retailStoreCityServiceCenter, cityPartnerIds, allTokens());
				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityPartnerList().done());
				deleteRelationListInGraph(userContext, retailStoreCityServiceCenter.getCityPartnerList());
				return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityPartnerId, int cityPartnerVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityPartner(cityPartnerId);
		checkerOf(userContext).checkVersionOfCityPartner(cityPartnerVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityPartnerId, int cityPartnerVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingCityPartner(userContext,retailStoreCityServiceCenterId, cityPartnerId, cityPartnerVersion,tokensExpr);

		CityPartner cityPartner = createIndexedCityPartner(cityPartnerId, cityPartnerVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.removeCityPartner( cityPartner );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityPartnerList().done());
			deleteRelationInGraph(userContext, cityPartner);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityPartnerId, int cityPartnerVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityPartner(cityPartnerId);
		checkerOf(userContext).checkVersionOfCityPartner(cityPartnerVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter copyCityPartnerFrom(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityPartnerId, int cityPartnerVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingCityPartner(userContext,retailStoreCityServiceCenterId, cityPartnerId, cityPartnerVersion,tokensExpr);

		CityPartner cityPartner = createIndexedCityPartner(cityPartnerId, cityPartnerVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			cityPartner.updateLastUpdateTime(userContext.now());

			retailStoreCityServiceCenter.copyCityPartnerFrom( cityPartner );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityPartnerList().done());
			
			userContext.getManagerGroup().getCityPartnerManager().onNewInstanceCreated(userContext, (CityPartner)retailStoreCityServiceCenter.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String cityPartnerId, int cityPartnerVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityPartner(cityPartnerId);
		checkerOf(userContext).checkVersionOfCityPartner(cityPartnerVersion);
		

		if(CityPartner.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfCityPartner(parseString(newValueExpr));
		}
		
		if(CityPartner.MOBILE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobileOfCityPartner(parseString(newValueExpr));
		}
		
		if(CityPartner.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfCityPartner(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}

	public  RetailStoreCityServiceCenter updateCityPartner(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String cityPartnerId, int cityPartnerVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingCityPartner(userContext, retailStoreCityServiceCenterId, cityPartnerId, cityPartnerVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withCityPartnerList().searchCityPartnerListWith(CityPartner.ID_PROPERTY, "eq", cityPartnerId).done();



		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, loadTokens);

		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreCityServiceCenter.removeCityPartner( cityPartner );
			//make changes to AcceleraterAccount.
			CityPartner cityPartnerIndex = createIndexedCityPartner(cityPartnerId, cityPartnerVersion);

			CityPartner cityPartner = retailStoreCityServiceCenter.findTheCityPartner(cityPartnerIndex);
			if(cityPartner == null){
				throw new RetailStoreCityServiceCenterManagerException(cityPartner+" is NOT FOUND" );
			}

			cityPartner.changeProperty(property, newValueExpr);
			cityPartner.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityPartnerList().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingPotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String cityPartnerId, String description,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);

		
		checkerOf(userContext).checkNameOfPotentialCustomer(name);
		
		checkerOf(userContext).checkMobileOfPotentialCustomer(mobile);
		
		checkerOf(userContext).checkCityPartnerIdOfPotentialCustomer(cityPartnerId);
		
		checkerOf(userContext).checkDescriptionOfPotentialCustomer(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


	}
	public  RetailStoreCityServiceCenter addPotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String cityPartnerId, String description, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingPotentialCustomer(userContext,retailStoreCityServiceCenterId,name, mobile, cityPartnerId, description,tokensExpr);

		PotentialCustomer potentialCustomer = createPotentialCustomer(userContext,name, mobile, cityPartnerId, description);

		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, emptyOptions());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.addPotentialCustomer( potentialCustomer );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
			
			userContext.getManagerGroup().getPotentialCustomerManager().onNewInstanceCreated(userContext, potentialCustomer);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingPotentialCustomerProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,String id,String name,String mobile,String description,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfPotentialCustomer(id);

		checkerOf(userContext).checkNameOfPotentialCustomer( name);
		checkerOf(userContext).checkMobileOfPotentialCustomer( mobile);
		checkerOf(userContext).checkDescriptionOfPotentialCustomer( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter updatePotentialCustomerProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String id,String name,String mobile,String description, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingPotentialCustomerProperties(userContext,retailStoreCityServiceCenterId,id,name,mobile,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withPotentialCustomerListList()
				.searchPotentialCustomerListWith(PotentialCustomer.ID_PROPERTY, "is", id).done();

		RetailStoreCityServiceCenter retailStoreCityServiceCenterToUpdate = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, options);

		if(retailStoreCityServiceCenterToUpdate.getPotentialCustomerList().isEmpty()){
			throw new RetailStoreCityServiceCenterManagerException("PotentialCustomer is NOT FOUND with id: '"+id+"'");
		}

		PotentialCustomer item = retailStoreCityServiceCenterToUpdate.getPotentialCustomerList().first();

		item.updateName( name );
		item.updateMobile( mobile );
		item.updateDescription( description );


		//checkParamsForAddingPotentialCustomer(userContext,retailStoreCityServiceCenterId,name, code, used,tokensExpr);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterToUpdate, tokens().withPotentialCustomerList().done());
		synchronized(retailStoreCityServiceCenter){
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}


	protected PotentialCustomer createPotentialCustomer(RetailscmUserContext userContext, String name, String mobile, String cityPartnerId, String description) throws Exception{

		PotentialCustomer potentialCustomer = new PotentialCustomer();
		
		
		potentialCustomer.setName(name);		
		potentialCustomer.setMobile(mobile);		
		CityPartner  cityPartner = new CityPartner();
		cityPartner.setId(cityPartnerId);		
		potentialCustomer.setCityPartner(cityPartner);		
		potentialCustomer.setDescription(description);		
		potentialCustomer.setLastUpdateTime(userContext.now());
	
		
		return potentialCustomer;


	}

	protected PotentialCustomer createIndexedPotentialCustomer(String id, int version){

		PotentialCustomer potentialCustomer = new PotentialCustomer();
		potentialCustomer.setId(id);
		potentialCustomer.setVersion(version);
		return potentialCustomer;

	}

	protected void checkParamsForRemovingPotentialCustomerList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String potentialCustomerIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		for(String potentialCustomerIdItem: potentialCustomerIds){
			checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removePotentialCustomerList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String potentialCustomerIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingPotentialCustomerList(userContext, retailStoreCityServiceCenterId,  potentialCustomerIds, tokensExpr);


			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
			synchronized(retailStoreCityServiceCenter){
				//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreCityServiceCenterDaoOf(userContext).planToRemovePotentialCustomerList(retailStoreCityServiceCenter, potentialCustomerIds, allTokens());
				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
				deleteRelationListInGraph(userContext, retailStoreCityServiceCenter.getPotentialCustomerList());
				return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingPotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String potentialCustomerId, int potentialCustomerVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkVersionOfPotentialCustomer(potentialCustomerVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removePotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String potentialCustomerId, int potentialCustomerVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingPotentialCustomer(userContext,retailStoreCityServiceCenterId, potentialCustomerId, potentialCustomerVersion,tokensExpr);

		PotentialCustomer potentialCustomer = createIndexedPotentialCustomer(potentialCustomerId, potentialCustomerVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.removePotentialCustomer( potentialCustomer );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
			deleteRelationInGraph(userContext, potentialCustomer);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingPotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String potentialCustomerId, int potentialCustomerVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkVersionOfPotentialCustomer(potentialCustomerVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter copyPotentialCustomerFrom(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String potentialCustomerId, int potentialCustomerVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingPotentialCustomer(userContext,retailStoreCityServiceCenterId, potentialCustomerId, potentialCustomerVersion,tokensExpr);

		PotentialCustomer potentialCustomer = createIndexedPotentialCustomer(potentialCustomerId, potentialCustomerVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			potentialCustomer.updateLastUpdateTime(userContext.now());

			retailStoreCityServiceCenter.copyPotentialCustomerFrom( potentialCustomer );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
			
			userContext.getManagerGroup().getPotentialCustomerManager().onNewInstanceCreated(userContext, (PotentialCustomer)retailStoreCityServiceCenter.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingPotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String potentialCustomerId, int potentialCustomerVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfPotentialCustomer(potentialCustomerId);
		checkerOf(userContext).checkVersionOfPotentialCustomer(potentialCustomerVersion);
		

		if(PotentialCustomer.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfPotentialCustomer(parseString(newValueExpr));
		}
		
		if(PotentialCustomer.MOBILE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobileOfPotentialCustomer(parseString(newValueExpr));
		}
		
		if(PotentialCustomer.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfPotentialCustomer(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}

	public  RetailStoreCityServiceCenter updatePotentialCustomer(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String potentialCustomerId, int potentialCustomerVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingPotentialCustomer(userContext, retailStoreCityServiceCenterId, potentialCustomerId, potentialCustomerVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withPotentialCustomerList().searchPotentialCustomerListWith(PotentialCustomer.ID_PROPERTY, "eq", potentialCustomerId).done();



		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, loadTokens);

		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreCityServiceCenter.removePotentialCustomer( potentialCustomer );
			//make changes to AcceleraterAccount.
			PotentialCustomer potentialCustomerIndex = createIndexedPotentialCustomer(potentialCustomerId, potentialCustomerVersion);

			PotentialCustomer potentialCustomer = retailStoreCityServiceCenter.findThePotentialCustomer(potentialCustomerIndex);
			if(potentialCustomer == null){
				throw new RetailStoreCityServiceCenterManagerException(potentialCustomer+" is NOT FOUND" );
			}

			potentialCustomer.changeProperty(property, newValueExpr);
			potentialCustomer.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withPotentialCustomerList().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String description,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);

		
		checkerOf(userContext).checkNameOfCityEvent(name);
		
		checkerOf(userContext).checkMobileOfCityEvent(mobile);
		
		checkerOf(userContext).checkDescriptionOfCityEvent(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


	}
	public  RetailStoreCityServiceCenter addCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String mobile, String description, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingCityEvent(userContext,retailStoreCityServiceCenterId,name, mobile, description,tokensExpr);

		CityEvent cityEvent = createCityEvent(userContext,name, mobile, description);

		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, emptyOptions());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.addCityEvent( cityEvent );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityEventList().done());
			
			userContext.getManagerGroup().getCityEventManager().onNewInstanceCreated(userContext, cityEvent);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingCityEventProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,String id,String name,String mobile,String description,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityEvent(id);

		checkerOf(userContext).checkNameOfCityEvent( name);
		checkerOf(userContext).checkMobileOfCityEvent( mobile);
		checkerOf(userContext).checkDescriptionOfCityEvent( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter updateCityEventProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String id,String name,String mobile,String description, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingCityEventProperties(userContext,retailStoreCityServiceCenterId,id,name,mobile,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withCityEventListList()
				.searchCityEventListWith(CityEvent.ID_PROPERTY, "is", id).done();

		RetailStoreCityServiceCenter retailStoreCityServiceCenterToUpdate = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, options);

		if(retailStoreCityServiceCenterToUpdate.getCityEventList().isEmpty()){
			throw new RetailStoreCityServiceCenterManagerException("CityEvent is NOT FOUND with id: '"+id+"'");
		}

		CityEvent item = retailStoreCityServiceCenterToUpdate.getCityEventList().first();

		item.updateName( name );
		item.updateMobile( mobile );
		item.updateDescription( description );


		//checkParamsForAddingCityEvent(userContext,retailStoreCityServiceCenterId,name, code, used,tokensExpr);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterToUpdate, tokens().withCityEventList().done());
		synchronized(retailStoreCityServiceCenter){
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}


	protected CityEvent createCityEvent(RetailscmUserContext userContext, String name, String mobile, String description) throws Exception{

		CityEvent cityEvent = new CityEvent();
		
		
		cityEvent.setName(name);		
		cityEvent.setMobile(mobile);		
		cityEvent.setDescription(description);		
		cityEvent.setLastUpdateTime(userContext.now());
	
		
		return cityEvent;


	}

	protected CityEvent createIndexedCityEvent(String id, int version){

		CityEvent cityEvent = new CityEvent();
		cityEvent.setId(id);
		cityEvent.setVersion(version);
		return cityEvent;

	}

	protected void checkParamsForRemovingCityEventList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String cityEventIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		for(String cityEventIdItem: cityEventIds){
			checkerOf(userContext).checkIdOfCityEvent(cityEventIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeCityEventList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String cityEventIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingCityEventList(userContext, retailStoreCityServiceCenterId,  cityEventIds, tokensExpr);


			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
			synchronized(retailStoreCityServiceCenter){
				//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveCityEventList(retailStoreCityServiceCenter, cityEventIds, allTokens());
				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityEventList().done());
				deleteRelationListInGraph(userContext, retailStoreCityServiceCenter.getCityEventList());
				return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityEventId, int cityEventVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityEvent(cityEventId);
		checkerOf(userContext).checkVersionOfCityEvent(cityEventVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityEventId, int cityEventVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingCityEvent(userContext,retailStoreCityServiceCenterId, cityEventId, cityEventVersion,tokensExpr);

		CityEvent cityEvent = createIndexedCityEvent(cityEventId, cityEventVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.removeCityEvent( cityEvent );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityEventList().done());
			deleteRelationInGraph(userContext, cityEvent);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityEventId, int cityEventVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityEvent(cityEventId);
		checkerOf(userContext).checkVersionOfCityEvent(cityEventVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter copyCityEventFrom(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String cityEventId, int cityEventVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingCityEvent(userContext,retailStoreCityServiceCenterId, cityEventId, cityEventVersion,tokensExpr);

		CityEvent cityEvent = createIndexedCityEvent(cityEventId, cityEventVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			cityEvent.updateLastUpdateTime(userContext.now());

			retailStoreCityServiceCenter.copyCityEventFrom( cityEvent );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityEventList().done());
			
			userContext.getManagerGroup().getCityEventManager().onNewInstanceCreated(userContext, (CityEvent)retailStoreCityServiceCenter.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String cityEventId, int cityEventVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfCityEvent(cityEventId);
		checkerOf(userContext).checkVersionOfCityEvent(cityEventVersion);
		

		if(CityEvent.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfCityEvent(parseString(newValueExpr));
		}
		
		if(CityEvent.MOBILE_PROPERTY.equals(property)){
			checkerOf(userContext).checkMobileOfCityEvent(parseString(newValueExpr));
		}
		
		if(CityEvent.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfCityEvent(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}

	public  RetailStoreCityServiceCenter updateCityEvent(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String cityEventId, int cityEventVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingCityEvent(userContext, retailStoreCityServiceCenterId, cityEventId, cityEventVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withCityEventList().searchCityEventListWith(CityEvent.ID_PROPERTY, "eq", cityEventId).done();



		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, loadTokens);

		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreCityServiceCenter.removeCityEvent( cityEvent );
			//make changes to AcceleraterAccount.
			CityEvent cityEventIndex = createIndexedCityEvent(cityEventId, cityEventVersion);

			CityEvent cityEvent = retailStoreCityServiceCenter.findTheCityEvent(cityEventIndex);
			if(cityEvent == null){
				throw new RetailStoreCityServiceCenterManagerException(cityEvent+" is NOT FOUND" );
			}

			cityEvent.changeProperty(property, newValueExpr);
			cityEvent.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withCityEventList().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	protected void checkParamsForAddingRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String telephone, String owner, String retailStoreCountryCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description,String [] tokensExpr) throws Exception{

				checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);

		
		checkerOf(userContext).checkNameOfRetailStore(name);
		
		checkerOf(userContext).checkTelephoneOfRetailStore(telephone);
		
		checkerOf(userContext).checkOwnerOfRetailStore(owner);
		
		checkerOf(userContext).checkRetailStoreCountryCenterIdOfRetailStore(retailStoreCountryCenterId);
		
		checkerOf(userContext).checkCreationIdOfRetailStore(creationId);
		
		checkerOf(userContext).checkInvestmentInvitationIdOfRetailStore(investmentInvitationId);
		
		checkerOf(userContext).checkFranchisingIdOfRetailStore(franchisingId);
		
		checkerOf(userContext).checkDecorationIdOfRetailStore(decorationId);
		
		checkerOf(userContext).checkOpeningIdOfRetailStore(openingId);
		
		checkerOf(userContext).checkClosingIdOfRetailStore(closingId);
		
		checkerOf(userContext).checkFoundedOfRetailStore(founded);
		
		checkerOf(userContext).checkLatitudeOfRetailStore(latitude);
		
		checkerOf(userContext).checkLongitudeOfRetailStore(longitude);
		
		checkerOf(userContext).checkDescriptionOfRetailStore(description);
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);


	}
	public  RetailStoreCityServiceCenter addRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String name, String telephone, String owner, String retailStoreCountryCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description, String [] tokensExpr) throws Exception
	{

		checkParamsForAddingRetailStore(userContext,retailStoreCityServiceCenterId,name, telephone, owner, retailStoreCountryCenterId, creationId, investmentInvitationId, franchisingId, decorationId, openingId, closingId, founded, latitude, longitude, description,tokensExpr);

		RetailStore retailStore = createRetailStore(userContext,name, telephone, owner, retailStoreCountryCenterId, creationId, investmentInvitationId, franchisingId, decorationId, openingId, closingId, founded, latitude, longitude, description);

		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, emptyOptions());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.addRetailStore( retailStore );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, retailStore);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}
	protected void checkParamsForUpdatingRetailStoreProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,String id,String name,String telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description,String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfRetailStore(id);

		checkerOf(userContext).checkNameOfRetailStore( name);
		checkerOf(userContext).checkTelephoneOfRetailStore( telephone);
		checkerOf(userContext).checkOwnerOfRetailStore( owner);
		checkerOf(userContext).checkFoundedOfRetailStore( founded);
		checkerOf(userContext).checkLatitudeOfRetailStore( latitude);
		checkerOf(userContext).checkLongitudeOfRetailStore( longitude);
		checkerOf(userContext).checkDescriptionOfRetailStore( description);

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter updateRetailStoreProperties(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String id,String name,String telephone,String owner,Date founded,BigDecimal latitude,BigDecimal longitude,String description, String [] tokensExpr) throws Exception
	{
		checkParamsForUpdatingRetailStoreProperties(userContext,retailStoreCityServiceCenterId,id,name,telephone,owner,founded,latitude,longitude,description,tokensExpr);

		Map<String, Object> options = tokens()
				.allTokens()
				//.withRetailStoreListList()
				.searchRetailStoreListWith(RetailStore.ID_PROPERTY, "is", id).done();

		RetailStoreCityServiceCenter retailStoreCityServiceCenterToUpdate = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, options);

		if(retailStoreCityServiceCenterToUpdate.getRetailStoreList().isEmpty()){
			throw new RetailStoreCityServiceCenterManagerException("RetailStore is NOT FOUND with id: '"+id+"'");
		}

		RetailStore item = retailStoreCityServiceCenterToUpdate.getRetailStoreList().first();

		item.updateName( name );
		item.updateTelephone( telephone );
		item.updateOwner( owner );
		item.updateFounded( founded );
		item.updateLatitude( latitude );
		item.updateLongitude( longitude );
		item.updateDescription( description );


		//checkParamsForAddingRetailStore(userContext,retailStoreCityServiceCenterId,name, code, used,tokensExpr);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterToUpdate, tokens().withRetailStoreList().done());
		synchronized(retailStoreCityServiceCenter){
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}
	}


	protected RetailStore createRetailStore(RetailscmUserContext userContext, String name, String telephone, String owner, String retailStoreCountryCenterId, String creationId, String investmentInvitationId, String franchisingId, String decorationId, String openingId, String closingId, Date founded, BigDecimal latitude, BigDecimal longitude, String description) throws Exception{

		RetailStore retailStore = new RetailStore();
		
		
		retailStore.setName(name);		
		retailStore.setTelephone(telephone);		
		retailStore.setOwner(owner);		
		RetailStoreCountryCenter  retailStoreCountryCenter = new RetailStoreCountryCenter();
		retailStoreCountryCenter.setId(retailStoreCountryCenterId);		
		retailStore.setRetailStoreCountryCenter(retailStoreCountryCenter);		
		RetailStoreCreation  creation = new RetailStoreCreation();
		creation.setId(creationId);		
		retailStore.setCreation(creation);		
		RetailStoreInvestmentInvitation  investmentInvitation = new RetailStoreInvestmentInvitation();
		investmentInvitation.setId(investmentInvitationId);		
		retailStore.setInvestmentInvitation(investmentInvitation);		
		RetailStoreFranchising  franchising = new RetailStoreFranchising();
		franchising.setId(franchisingId);		
		retailStore.setFranchising(franchising);		
		RetailStoreDecoration  decoration = new RetailStoreDecoration();
		decoration.setId(decorationId);		
		retailStore.setDecoration(decoration);		
		RetailStoreOpening  opening = new RetailStoreOpening();
		opening.setId(openingId);		
		retailStore.setOpening(opening);		
		RetailStoreClosing  closing = new RetailStoreClosing();
		closing.setId(closingId);		
		retailStore.setClosing(closing);		
		retailStore.setFounded(founded);		
		retailStore.setLatitude(latitude);		
		retailStore.setLongitude(longitude);		
		retailStore.setDescription(description);		
		retailStore.setLastUpdateTime(userContext.now());
	
		
		return retailStore;


	}

	protected RetailStore createIndexedRetailStore(String id, int version){

		RetailStore retailStore = new RetailStore();
		retailStore.setId(id);
		retailStore.setVersion(version);
		return retailStore;

	}

	protected void checkParamsForRemovingRetailStoreList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String retailStoreIds[],String [] tokensExpr) throws Exception {

		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		for(String retailStoreIdItem: retailStoreIds){
			checkerOf(userContext).checkIdOfRetailStore(retailStoreIdItem);
		}

		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeRetailStoreList(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
			String retailStoreIds[],String [] tokensExpr) throws Exception{

			checkParamsForRemovingRetailStoreList(userContext, retailStoreCityServiceCenterId,  retailStoreIds, tokensExpr);


			RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
			synchronized(retailStoreCityServiceCenter){
				//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
				//Also good when there is a RAM based DAO implementation
				retailStoreCityServiceCenterDaoOf(userContext).planToRemoveRetailStoreList(retailStoreCityServiceCenter, retailStoreIds, allTokens());
				retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
				deleteRelationListInGraph(userContext, retailStoreCityServiceCenter.getRetailStoreList());
				return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
			}
	}

	protected void checkParamsForRemovingRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter removeRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{

		checkParamsForRemovingRetailStore(userContext,retailStoreCityServiceCenterId, retailStoreId, retailStoreVersion,tokensExpr);

		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			retailStoreCityServiceCenter.removeRetailStore( retailStore );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
			deleteRelationInGraph(userContext, retailStore);
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}


	}
	protected void checkParamsForCopyingRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{
		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter( retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}
	public  RetailStoreCityServiceCenter copyRetailStoreFrom(RetailscmUserContext userContext, String retailStoreCityServiceCenterId,
		String retailStoreId, int retailStoreVersion,String [] tokensExpr) throws Exception{

		checkParamsForCopyingRetailStore(userContext,retailStoreCityServiceCenterId, retailStoreId, retailStoreVersion,tokensExpr);

		RetailStore retailStore = createIndexedRetailStore(retailStoreId, retailStoreVersion);
		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, allTokens());
		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation

			retailStore.updateLastUpdateTime(userContext.now());

			retailStoreCityServiceCenter.copyRetailStoreFrom( retailStore );
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
			
			userContext.getManagerGroup().getRetailStoreManager().onNewInstanceCreated(userContext, (RetailStore)retailStoreCityServiceCenter.getFlexiableObjects().get(BaseEntity.COPIED_CHILD));
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}

	protected void checkParamsForUpdatingRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception{
		

		
		checkerOf(userContext).checkIdOfRetailStoreCityServiceCenter(retailStoreCityServiceCenterId);
		checkerOf(userContext).checkIdOfRetailStore(retailStoreId);
		checkerOf(userContext).checkVersionOfRetailStore(retailStoreVersion);
		

		if(RetailStore.NAME_PROPERTY.equals(property)){
			checkerOf(userContext).checkNameOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.TELEPHONE_PROPERTY.equals(property)){
			checkerOf(userContext).checkTelephoneOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.OWNER_PROPERTY.equals(property)){
			checkerOf(userContext).checkOwnerOfRetailStore(parseString(newValueExpr));
		}
		
		if(RetailStore.FOUNDED_PROPERTY.equals(property)){
			checkerOf(userContext).checkFoundedOfRetailStore(parseDate(newValueExpr));
		}
		
		if(RetailStore.LATITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLatitudeOfRetailStore(parseBigDecimal(newValueExpr));
		}
		
		if(RetailStore.LONGITUDE_PROPERTY.equals(property)){
			checkerOf(userContext).checkLongitudeOfRetailStore(parseBigDecimal(newValueExpr));
		}
		
		if(RetailStore.DESCRIPTION_PROPERTY.equals(property)){
			checkerOf(userContext).checkDescriptionOfRetailStore(parseString(newValueExpr));
		}
		
	
		checkerOf(userContext).throwExceptionIfHasErrors(RetailStoreCityServiceCenterManagerException.class);

	}

	public  RetailStoreCityServiceCenter updateRetailStore(RetailscmUserContext userContext, String retailStoreCityServiceCenterId, String retailStoreId, int retailStoreVersion, String property, String newValueExpr,String [] tokensExpr)
			throws Exception{

		checkParamsForUpdatingRetailStore(userContext, retailStoreCityServiceCenterId, retailStoreId, retailStoreVersion, property, newValueExpr,  tokensExpr);

		Map<String,Object> loadTokens = this.tokens().withRetailStoreList().searchRetailStoreListWith(RetailStore.ID_PROPERTY, "eq", retailStoreId).done();



		RetailStoreCityServiceCenter retailStoreCityServiceCenter = loadRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenterId, loadTokens);

		synchronized(retailStoreCityServiceCenter){
			//Will be good when the retailStoreCityServiceCenter loaded from this JVM process cache.
			//Also good when there is a RAM based DAO implementation
			//retailStoreCityServiceCenter.removeRetailStore( retailStore );
			//make changes to AcceleraterAccount.
			RetailStore retailStoreIndex = createIndexedRetailStore(retailStoreId, retailStoreVersion);

			RetailStore retailStore = retailStoreCityServiceCenter.findTheRetailStore(retailStoreIndex);
			if(retailStore == null){
				throw new RetailStoreCityServiceCenterManagerException(retailStore+" is NOT FOUND" );
			}

			retailStore.changeProperty(property, newValueExpr);
			retailStore.updateLastUpdateTime(userContext.now());
			retailStoreCityServiceCenter = saveRetailStoreCityServiceCenter(userContext, retailStoreCityServiceCenter, tokens().withRetailStoreList().done());
			return present(userContext,retailStoreCityServiceCenter, mergedAllTokens(tokensExpr));
		}

	}
	/*

	*/




	public void onNewInstanceCreated(RetailscmUserContext userContext, RetailStoreCityServiceCenter newCreated) throws Exception{
		ensureRelationInGraph(userContext, newCreated);
		sendCreationEvent(userContext, newCreated);

    
	}

  
  


}



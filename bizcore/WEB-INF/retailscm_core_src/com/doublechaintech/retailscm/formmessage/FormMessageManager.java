
package com.doublechaintech.retailscm.formmessage;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import com.terapico.caf.DateTime;
import com.terapico.caf.Images;
import com.doublechaintech.retailscm.RetailscmUserContext;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.BaseManager;
import com.doublechaintech.retailscm.SmartList;

public interface FormMessageManager extends BaseManager{

		

	public FormMessage createFormMessage(RetailscmUserContext userContext, String title,String formId,String level) throws Exception;
	public FormMessage updateFormMessage(RetailscmUserContext userContext,String formMessageId, int formMessageVersion, String property, String newValueExpr,String [] tokensExpr) throws Exception;
	public FormMessage loadFormMessage(RetailscmUserContext userContext, String formMessageId, String [] tokensExpr) throws Exception;
	public FormMessage internalSaveFormMessage(RetailscmUserContext userContext, FormMessage formMessage) throws Exception;
	public FormMessage internalSaveFormMessage(RetailscmUserContext userContext, FormMessage formMessage,Map<String,Object>option) throws Exception;

	public FormMessage transferToAnotherForm(RetailscmUserContext userContext, String formMessageId, String anotherFormId)  throws Exception;
 

	public void delete(RetailscmUserContext userContext, String formMessageId, int version) throws Exception;
	public int deleteAll(RetailscmUserContext userContext, String secureCode ) throws Exception;
	public void onNewInstanceCreated(RetailscmUserContext userContext, FormMessage newCreated)throws Exception;

	/*======================================================DATA MAINTENANCE===========================================================*/



	public Object listByForm(RetailscmUserContext userContext,String formId) throws Exception;
	public Object listPageByForm(RetailscmUserContext userContext,String formId, int start, int count) throws Exception;
  

}



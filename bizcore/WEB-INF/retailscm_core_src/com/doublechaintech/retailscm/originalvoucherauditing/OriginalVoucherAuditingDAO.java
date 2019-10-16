
package com.doublechaintech.retailscm.originalvoucherauditing;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.SmartList;
import com.doublechaintech.retailscm.MultipleAccessKey;
import com.doublechaintech.retailscm.RetailscmUserContext;
<<<<<<< HEAD
=======

import com.doublechaintech.retailscm.originalvoucher.OriginalVoucher;

>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
import com.doublechaintech.retailscm.originalvoucher.OriginalVoucherDAO;


public interface OriginalVoucherAuditingDAO{

	
	public OriginalVoucherAuditing load(String id, Map<String,Object> options) throws Exception;
	public void enhanceList(List<OriginalVoucherAuditing> originalVoucherAuditingList);
	public void collectAndEnhance(BaseEntity ownerEntity);
	
	public void alias(List<BaseEntity> entityList);
	
	
	
	
	public OriginalVoucherAuditing present(OriginalVoucherAuditing originalVoucherAuditing,Map<String,Object> options) throws Exception;
	public OriginalVoucherAuditing clone(String id, Map<String,Object> options) throws Exception;
	
	
	
	public OriginalVoucherAuditing save(OriginalVoucherAuditing originalVoucherAuditing,Map<String,Object> options);
	public SmartList<OriginalVoucherAuditing> saveOriginalVoucherAuditingList(SmartList<OriginalVoucherAuditing> originalVoucherAuditingList,Map<String,Object> options);
	public SmartList<OriginalVoucherAuditing> removeOriginalVoucherAuditingList(SmartList<OriginalVoucherAuditing> originalVoucherAuditingList,Map<String,Object> options);
	public SmartList<OriginalVoucherAuditing> findOriginalVoucherAuditingWithKey(MultipleAccessKey key,Map<String, Object> options);
	public int countOriginalVoucherAuditingWithKey(MultipleAccessKey key,Map<String, Object> options);
	public Map<String, Integer> countOriginalVoucherAuditingWithGroupKey(String groupKey, MultipleAccessKey filterKey,
			Map<String, Object> options);
	public void delete(String originalVoucherAuditingId, int version) throws Exception;
	public OriginalVoucherAuditing disconnectFromAll(String originalVoucherAuditingId, int version) throws Exception;
	public int deleteAll() throws Exception;

	public OriginalVoucherDAO getOriginalVoucherDAO();
		
	
 	public SmartList<OriginalVoucherAuditing> requestCandidateOriginalVoucherAuditingForOriginalVoucher(RetailscmUserContext userContext, String ownerClass, String id, String filterKey, int pageNo, int pageSize) throws Exception;
		
	
	public OriginalVoucherAuditing planToRemoveOriginalVoucherList(OriginalVoucherAuditing originalVoucherAuditing, String originalVoucherIds[], Map<String,Object> options)throws Exception;


	//disconnect OriginalVoucherAuditing with belongs_to in OriginalVoucher
	public OriginalVoucherAuditing planToRemoveOriginalVoucherListWithBelongsTo(OriginalVoucherAuditing originalVoucherAuditing, String belongsToId, Map<String,Object> options)throws Exception;
	public int countOriginalVoucherListWithBelongsTo(String originalVoucherAuditingId, String belongsToId, Map<String,Object> options)throws Exception;
	
	
	public SmartList<OriginalVoucherAuditing> queryList(String sql, Object ... parmeters);
<<<<<<< HEAD
=======

	// 需要一个加载引用我的对象的enhance方法:OriginalVoucher的auditing的OriginalVoucherList
	public SmartList<OriginalVoucher> loadOurOriginalVoucherList(RetailscmUserContext userContext, List<OriginalVoucherAuditing> us, Map<String,Object> options) throws Exception;
	
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}



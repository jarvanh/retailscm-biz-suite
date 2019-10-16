
package com.doublechaintech.retailscm.consumerorderprocessing;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.SmartList;
import com.doublechaintech.retailscm.MultipleAccessKey;
import com.doublechaintech.retailscm.RetailscmUserContext;


<<<<<<< HEAD
=======


>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
public interface ConsumerOrderProcessingDAO{

	
	public ConsumerOrderProcessing load(String id, Map<String,Object> options) throws Exception;
	public void enhanceList(List<ConsumerOrderProcessing> consumerOrderProcessingList);
	public void collectAndEnhance(BaseEntity ownerEntity);
	
	public void alias(List<BaseEntity> entityList);
	
	
	
	
	public ConsumerOrderProcessing present(ConsumerOrderProcessing consumerOrderProcessing,Map<String,Object> options) throws Exception;
	public ConsumerOrderProcessing clone(String id, Map<String,Object> options) throws Exception;
	
	
	
	public ConsumerOrderProcessing save(ConsumerOrderProcessing consumerOrderProcessing,Map<String,Object> options);
	public SmartList<ConsumerOrderProcessing> saveConsumerOrderProcessingList(SmartList<ConsumerOrderProcessing> consumerOrderProcessingList,Map<String,Object> options);
	public SmartList<ConsumerOrderProcessing> removeConsumerOrderProcessingList(SmartList<ConsumerOrderProcessing> consumerOrderProcessingList,Map<String,Object> options);
	public SmartList<ConsumerOrderProcessing> findConsumerOrderProcessingWithKey(MultipleAccessKey key,Map<String, Object> options);
	public int countConsumerOrderProcessingWithKey(MultipleAccessKey key,Map<String, Object> options);
	public Map<String, Integer> countConsumerOrderProcessingWithGroupKey(String groupKey, MultipleAccessKey filterKey,
			Map<String, Object> options);
	public void delete(String consumerOrderProcessingId, int version) throws Exception;
	public ConsumerOrderProcessing disconnectFromAll(String consumerOrderProcessingId, int version) throws Exception;
	public int deleteAll() throws Exception;

	
	
	
	public SmartList<ConsumerOrderProcessing> queryList(String sql, Object ... parmeters);
<<<<<<< HEAD
=======

>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}



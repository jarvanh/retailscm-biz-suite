package com.skynet.infrastructure;

import java.util.HashMap;
<<<<<<< HEAD
=======
import java.util.List;
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
import java.util.Map;

public class InMemoryCacheService  extends InfraBaseService implements CacheService {
	
	Map<String, Object> cacheMap;
	public InMemoryCacheService() {
		
	}

	public Object get(String key,Class<?> clazz) {
		ensureCacheMap();
		synchronized(cacheMap){//protect HashMap as it is not a thread safe class
			return cacheMap.get(key);
		}
	}
<<<<<<< HEAD
=======
	public List<Object> mget(List<String >keys,Class<?> clazz) {
		throw new IllegalStateException("InMemoryCacheService not implemented mget(List<String >keys,Class<?> clazz)");
	}
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
	
	public void put(String key, Object value,int ttlInSeconds) {
		ensureCacheMap();
		synchronized(cacheMap){
			cacheMap.put(key,value);
		}
		
	}
	protected void ensureCacheMap(){
		if(cacheMap != null){
			return;
		}
		cacheMap = new HashMap<String, Object>();
	}

	public void remove(String key) {
		// TODO Auto-generated method stub
		ensureCacheMap();
		synchronized(cacheMap){
			cacheMap.remove(key);
		}
	}

}



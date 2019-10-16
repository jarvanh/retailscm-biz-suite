package com.skynet.infrastructure;

import java.util.Map;

public interface StorageService {
<<<<<<< HEAD
	public Map<String,Object> genToken(Object context);
=======
    public Map<String, Object> genToken(Object context);

    public String upload(String objName, byte[] content);
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}

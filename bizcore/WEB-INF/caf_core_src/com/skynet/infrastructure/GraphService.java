package com.skynet.infrastructure;

<<<<<<< HEAD
=======

import com.skynet.infrastructure.graphservice.BaseQuery;
import com.skynet.infrastructure.graphservice.ResultList;

>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
import java.util.List;

public interface GraphService {

	List<String[]> relationsOf(String projectName, String fromLabel, String fromId, String toLable, String toId);

<<<<<<< HEAD
=======
	default  <T> ResultList<T> query(BaseQuery query, Class<T> clazz) throws Exception {
		return null;
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}

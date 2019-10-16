
package com.doublechaintech.retailscm.transporttask;
import com.doublechaintech.retailscm.AccessKey;


public class TransportTaskTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="transport_task_data";
=======
	public static final String TABLE_NAME="transport_task_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_NAME = "name";
	static final String COLUMN_START = "start";
	static final String COLUMN_BEGIN_TIME = "begin_time";
	static final String COLUMN_END = "end";
	static final String COLUMN_DRIVER = "driver";
	static final String COLUMN_TRUCK = "truck";
	static final String COLUMN_BELONGS_TO = "belongs_to";
	static final String COLUMN_LATITUDE = "latitude";
	static final String COLUMN_LONGITUDE = "longitude";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_START, COLUMN_BEGIN_TIME, COLUMN_END, COLUMN_DRIVER, COLUMN_TRUCK, COLUMN_BELONGS_TO, COLUMN_LATITUDE, COLUMN_LONGITUDE, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_START, COLUMN_BEGIN_TIME, COLUMN_END, COLUMN_DRIVER, COLUMN_TRUCK, COLUMN_BELONGS_TO, COLUMN_LATITUDE, COLUMN_LONGITUDE, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_NAME, COLUMN_START, COLUMN_BEGIN_TIME, COLUMN_END, COLUMN_DRIVER, COLUMN_TRUCK, COLUMN_BELONGS_TO, COLUMN_LATITUDE, COLUMN_LONGITUDE
		};
	
	
}



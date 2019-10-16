
package com.doublechaintech.retailscm.citypartner;
import com.doublechaintech.retailscm.AccessKey;


public class CityPartnerTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="city_partner_data";
=======
	public static final String TABLE_NAME="city_partner_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_NAME = "name";
	static final String COLUMN_MOBILE = "mobile";
	static final String COLUMN_CITY_SERVICE_CENTER = "city_service_center";
	static final String COLUMN_DESCRIPTION = "description";
	static final String COLUMN_LAST_UPDATE_TIME = "last_update_time";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_MOBILE, COLUMN_CITY_SERVICE_CENTER, COLUMN_DESCRIPTION, COLUMN_LAST_UPDATE_TIME, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_MOBILE, COLUMN_CITY_SERVICE_CENTER, COLUMN_DESCRIPTION, COLUMN_LAST_UPDATE_TIME, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_NAME, COLUMN_MOBILE, COLUMN_CITY_SERVICE_CENTER, COLUMN_DESCRIPTION, COLUMN_LAST_UPDATE_TIME
		};
	
	
}



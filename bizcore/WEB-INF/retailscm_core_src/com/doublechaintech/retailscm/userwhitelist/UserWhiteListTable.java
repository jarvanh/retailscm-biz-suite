
package com.doublechaintech.retailscm.userwhitelist;
import com.doublechaintech.retailscm.AccessKey;


public class UserWhiteListTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="user_white_list_data";
=======
	public static final String TABLE_NAME="user_white_list_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_USER_IDENTITY = "user_identity";
	static final String COLUMN_USER_SPECIAL_FUNCTIONS = "user_special_functions";
	static final String COLUMN_DOMAIN = "domain";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_USER_IDENTITY, COLUMN_USER_SPECIAL_FUNCTIONS, COLUMN_DOMAIN, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_USER_IDENTITY, COLUMN_USER_SPECIAL_FUNCTIONS, COLUMN_DOMAIN, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_USER_IDENTITY, COLUMN_USER_SPECIAL_FUNCTIONS, COLUMN_DOMAIN
		};
	
	
}



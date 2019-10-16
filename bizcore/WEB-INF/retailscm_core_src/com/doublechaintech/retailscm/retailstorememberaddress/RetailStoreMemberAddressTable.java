
package com.doublechaintech.retailscm.retailstorememberaddress;
import com.doublechaintech.retailscm.AccessKey;


public class RetailStoreMemberAddressTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="retail_store_member_address_data";
=======
	public static final String TABLE_NAME="retail_store_member_address_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_NAME = "name";
	static final String COLUMN_OWNER = "owner";
	static final String COLUMN_MOBILE_PHONE = "mobile_phone";
	static final String COLUMN_ADDRESS = "address";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_OWNER, COLUMN_MOBILE_PHONE, COLUMN_ADDRESS, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_OWNER, COLUMN_MOBILE_PHONE, COLUMN_ADDRESS, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_NAME, COLUMN_OWNER, COLUMN_MOBILE_PHONE, COLUMN_ADDRESS
		};
	
	
}



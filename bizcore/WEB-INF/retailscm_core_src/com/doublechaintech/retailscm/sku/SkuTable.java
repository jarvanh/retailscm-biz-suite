
package com.doublechaintech.retailscm.sku;
import com.doublechaintech.retailscm.AccessKey;


public class SkuTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="sku_data";
=======
	public static final String TABLE_NAME="sku_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_NAME = "name";
	static final String COLUMN_SIZE = "size";
	static final String COLUMN_PRODUCT = "product";
	static final String COLUMN_BARCODE = "barcode";
	static final String COLUMN_PACKAGE_TYPE = "package_type";
	static final String COLUMN_NET_CONTENT = "net_content";
	static final String COLUMN_PRICE = "price";
	static final String COLUMN_PICTURE = "picture";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_SIZE, COLUMN_PRODUCT, COLUMN_BARCODE, COLUMN_PACKAGE_TYPE, COLUMN_NET_CONTENT, COLUMN_PRICE, COLUMN_PICTURE, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_SIZE, COLUMN_PRODUCT, COLUMN_BARCODE, COLUMN_PACKAGE_TYPE, COLUMN_NET_CONTENT, COLUMN_PRICE, COLUMN_PICTURE, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_NAME, COLUMN_SIZE, COLUMN_PRODUCT, COLUMN_BARCODE, COLUMN_PACKAGE_TYPE, COLUMN_NET_CONTENT, COLUMN_PRICE, COLUMN_PICTURE
		};
	
	
}



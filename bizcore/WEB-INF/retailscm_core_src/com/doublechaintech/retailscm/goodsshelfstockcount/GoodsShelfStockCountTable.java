
package com.doublechaintech.retailscm.goodsshelfstockcount;
import com.doublechaintech.retailscm.AccessKey;


public class GoodsShelfStockCountTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="goods_shelf_stock_count_data";
=======
	public static final String TABLE_NAME="goods_shelf_stock_count_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_TITLE = "title";
	static final String COLUMN_COUNT_TIME = "count_time";
	static final String COLUMN_SUMMARY = "summary";
	static final String COLUMN_SHELF = "shelf";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_SHELF, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_SHELF, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_SHELF
		};
	
	
}



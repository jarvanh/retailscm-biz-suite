
package com.doublechaintech.retailscm.stockcountissuetrack;
import com.doublechaintech.retailscm.AccessKey;


public class StockCountIssueTrackTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="stock_count_issue_track_data";
=======
	public static final String TABLE_NAME="stock_count_issue_track_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_TITLE = "title";
	static final String COLUMN_COUNT_TIME = "count_time";
	static final String COLUMN_SUMMARY = "summary";
	static final String COLUMN_STOCK_COUNT = "stock_count";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_STOCK_COUNT, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_STOCK_COUNT, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_TITLE, COLUMN_COUNT_TIME, COLUMN_SUMMARY, COLUMN_STOCK_COUNT
		};
	
	
}



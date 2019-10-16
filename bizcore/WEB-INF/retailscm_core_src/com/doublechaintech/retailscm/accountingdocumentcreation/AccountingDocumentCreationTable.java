
package com.doublechaintech.retailscm.accountingdocumentcreation;
import com.doublechaintech.retailscm.AccessKey;


public class AccountingDocumentCreationTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="accounting_document_creation_data";
=======
	public static final String TABLE_NAME="accounting_document_creation_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_WHO = "who";
	static final String COLUMN_COMMENTS = "comments";
	static final String COLUMN_MAKE_DATE = "make_date";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_WHO, COLUMN_COMMENTS, COLUMN_MAKE_DATE, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_WHO, COLUMN_COMMENTS, COLUMN_MAKE_DATE, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_WHO, COLUMN_COMMENTS, COLUMN_MAKE_DATE
		};
	
	
}




package com.doublechaintech.retailscm.instructor;
import com.doublechaintech.retailscm.AccessKey;


public class InstructorTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="instructor_data";
=======
	public static final String TABLE_NAME="instructor_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_TITLE = "title";
	static final String COLUMN_FAMILY_NAME = "family_name";
	static final String COLUMN_GIVEN_NAME = "given_name";
	static final String COLUMN_CELL_PHONE = "cell_phone";
	static final String COLUMN_EMAIL = "email";
	static final String COLUMN_COMPANY = "company";
	static final String COLUMN_INTRODUCTION = "introduction";
	static final String COLUMN_LAST_UPDATE_TIME = "last_update_time";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_FAMILY_NAME, COLUMN_GIVEN_NAME, COLUMN_CELL_PHONE, COLUMN_EMAIL, COLUMN_COMPANY, COLUMN_INTRODUCTION, COLUMN_LAST_UPDATE_TIME, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_TITLE, COLUMN_FAMILY_NAME, COLUMN_GIVEN_NAME, COLUMN_CELL_PHONE, COLUMN_EMAIL, COLUMN_COMPANY, COLUMN_INTRODUCTION, COLUMN_LAST_UPDATE_TIME, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_TITLE, COLUMN_FAMILY_NAME, COLUMN_GIVEN_NAME, COLUMN_CELL_PHONE, COLUMN_EMAIL, COLUMN_COMPANY, COLUMN_INTRODUCTION, COLUMN_LAST_UPDATE_TIME
		};
	
	
}



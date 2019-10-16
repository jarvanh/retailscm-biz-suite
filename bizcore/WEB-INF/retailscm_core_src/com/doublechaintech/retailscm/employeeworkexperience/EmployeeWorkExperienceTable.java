
package com.doublechaintech.retailscm.employeeworkexperience;
import com.doublechaintech.retailscm.AccessKey;


public class EmployeeWorkExperienceTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="employee_work_experience_data";
=======
	public static final String TABLE_NAME="employee_work_experience_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_EMPLOYEE = "employee";
	static final String COLUMN_START = "start";
	static final String COLUMN_END = "end";
	static final String COLUMN_COMPANY = "company";
	static final String COLUMN_DESCRIPTION = "description";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_EMPLOYEE, COLUMN_START, COLUMN_END, COLUMN_COMPANY, COLUMN_DESCRIPTION, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_EMPLOYEE, COLUMN_START, COLUMN_END, COLUMN_COMPANY, COLUMN_DESCRIPTION, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_EMPLOYEE, COLUMN_START, COLUMN_END, COLUMN_COMPANY, COLUMN_DESCRIPTION
		};
	
	
}



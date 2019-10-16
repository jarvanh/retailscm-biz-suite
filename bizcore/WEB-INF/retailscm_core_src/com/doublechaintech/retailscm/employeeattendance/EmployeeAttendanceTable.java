
package com.doublechaintech.retailscm.employeeattendance;
import com.doublechaintech.retailscm.AccessKey;


public class EmployeeAttendanceTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="employee_attendance_data";
=======
	public static final String TABLE_NAME="employee_attendance_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_EMPLOYEE = "employee";
	static final String COLUMN_ENTER_TIME = "enter_time";
	static final String COLUMN_LEAVE_TIME = "leave_time";
	static final String COLUMN_DURATION_HOURS = "duration_hours";
	static final String COLUMN_REMARK = "remark";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_EMPLOYEE, COLUMN_ENTER_TIME, COLUMN_LEAVE_TIME, COLUMN_DURATION_HOURS, COLUMN_REMARK, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_EMPLOYEE, COLUMN_ENTER_TIME, COLUMN_LEAVE_TIME, COLUMN_DURATION_HOURS, COLUMN_REMARK, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_EMPLOYEE, COLUMN_ENTER_TIME, COLUMN_LEAVE_TIME, COLUMN_DURATION_HOURS, COLUMN_REMARK
		};
	
	
}



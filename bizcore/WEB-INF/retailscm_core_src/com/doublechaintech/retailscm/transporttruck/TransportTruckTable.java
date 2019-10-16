
package com.doublechaintech.retailscm.transporttruck;
import com.doublechaintech.retailscm.AccessKey;


public class TransportTruckTable{


	public static AccessKey withId(Object value){
		AccessKey accessKey = new AccessKey();
		accessKey.setColumnName(COLUMN_ID);
		accessKey.setValue(value);
		return accessKey;
	}
	//Add extra identifiers
	

	//only this package can use this, so the scope is default, not public, not private either nor protected
<<<<<<< HEAD
	static final String TABLE_NAME="transport_truck_data";
=======
	public static final String TABLE_NAME="transport_truck_data";
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	static final String COLUMN_ID = "id";
	static final String COLUMN_NAME = "name";
	static final String COLUMN_PLATE_NUMBER = "plate_number";
	static final String COLUMN_CONTACT_NUMBER = "contact_number";
	static final String COLUMN_VEHICLE_LICENSE_NUMBER = "vehicle_license_number";
	static final String COLUMN_ENGINE_NUMBER = "engine_number";
	static final String COLUMN_MAKE_DATE = "make_date";
	static final String COLUMN_MILEAGE = "mileage";
	static final String COLUMN_BODY_COLOR = "body_color";
	static final String COLUMN_OWNER = "owner";
	static final String COLUMN_VERSION = "version";
 
<<<<<<< HEAD
	static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_PLATE_NUMBER, COLUMN_CONTACT_NUMBER, COLUMN_VEHICLE_LICENSE_NUMBER, COLUMN_ENGINE_NUMBER, COLUMN_MAKE_DATE, COLUMN_MILEAGE, COLUMN_BODY_COLOR, COLUMN_OWNER, 
		COLUMN_VERSION};
	static final String []NORMAL_CLOUMNS = {
=======
	public static final String []ALL_CLOUMNS = {COLUMN_ID, 
		COLUMN_NAME, COLUMN_PLATE_NUMBER, COLUMN_CONTACT_NUMBER, COLUMN_VEHICLE_LICENSE_NUMBER, COLUMN_ENGINE_NUMBER, COLUMN_MAKE_DATE, COLUMN_MILEAGE, COLUMN_BODY_COLOR, COLUMN_OWNER, 
		COLUMN_VERSION};
	public static final String []NORMAL_CLOUMNS = {
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
		COLUMN_NAME, COLUMN_PLATE_NUMBER, COLUMN_CONTACT_NUMBER, COLUMN_VEHICLE_LICENSE_NUMBER, COLUMN_ENGINE_NUMBER, COLUMN_MAKE_DATE, COLUMN_MILEAGE, COLUMN_BODY_COLOR, COLUMN_OWNER
		};
	
	
}



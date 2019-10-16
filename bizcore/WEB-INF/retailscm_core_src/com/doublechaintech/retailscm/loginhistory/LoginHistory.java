
package com.doublechaintech.retailscm.loginhistory;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
<<<<<<< HEAD
=======
import java.util.stream.Collectors;
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
import java.math.BigDecimal;
import com.terapico.caf.DateTime;
import com.doublechaintech.retailscm.BaseEntity;
import com.doublechaintech.retailscm.SmartList;
import com.doublechaintech.retailscm.KeyValuePair;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.doublechaintech.retailscm.secuser.SecUser;

@JsonSerialize(using = LoginHistorySerializer.class)
public class LoginHistory extends BaseEntity implements  java.io.Serializable{

	
	public static final String ID_PROPERTY                    = "id"                ;
	public static final String LOGIN_TIME_PROPERTY            = "loginTime"         ;
	public static final String FROM_IP_PROPERTY               = "fromIp"            ;
	public static final String DESCRIPTION_PROPERTY           = "description"       ;
	public static final String SEC_USER_PROPERTY              = "secUser"           ;
	public static final String VERSION_PROPERTY               = "version"           ;


	public static final String INTERNAL_TYPE="LoginHistory";
	public String getInternalType(){
		return INTERNAL_TYPE;
	}
	
	public String getDisplayName(){
	
		String displayName = getFromIp();
		if(displayName!=null){
			return displayName;
		}
		
		return super.getDisplayName();
		
	}

	private static final long serialVersionUID = 1L;
	

	protected		String              	mId                 ;
	protected		DateTime            	mLoginTime          ;
	protected		String              	mFromIp             ;
	protected		String              	mDescription        ;
	protected		SecUser             	mSecUser            ;
	protected		int                 	mVersion            ;
	
	
	
		
	public 	LoginHistory(){
<<<<<<< HEAD
		//lazy load for all the properties
	}
	//disconnect from all, 中文就是一了百了，跟所有一切尘世断绝往来藏身于茫茫数据海洋
=======
		// lazy load for all the properties
	}
	public 	static LoginHistory withId(String id){
		LoginHistory loginHistory = new LoginHistory();
		loginHistory.setId(id);
		loginHistory.setVersion(Integer.MAX_VALUE);
		return loginHistory;
	}
	public 	static LoginHistory refById(String id){
		return withId(id);
	}
	
	// disconnect from all, 中文就是一了百了，跟所有一切尘世断绝往来藏身于茫茫数据海洋
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	public 	void clearFromAll(){
		setSecUser( null );

		this.changed = true;
	}
	
	public 	LoginHistory(DateTime loginTime, String fromIp, String description, SecUser secUser)
	{
		setLoginTime(loginTime);
		setFromIp(fromIp);
		setDescription(description);
		setSecUser(secUser);
	
	}
	
	//Support for changing the property
	
	public void changeProperty(String property, String newValueExpr) {
     	
		if(LOGIN_TIME_PROPERTY.equals(property)){
			changeLoginTimeProperty(newValueExpr);
		}
		if(FROM_IP_PROPERTY.equals(property)){
			changeFromIpProperty(newValueExpr);
		}
		if(DESCRIPTION_PROPERTY.equals(property)){
			changeDescriptionProperty(newValueExpr);
		}

      
	}
    
    
	protected void changeLoginTimeProperty(String newValueExpr){
		DateTime oldValue = getLoginTime();
		DateTime newValue = parseTimestamp(newValueExpr);
		if(equalsTimestamp(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
		//they are surely different each other
		updateLoginTime(newValue);
		this.onChangeProperty(LOGIN_TIME_PROPERTY, oldValue, newValue);
		return;
  
	}
			
			
			
	protected void changeFromIpProperty(String newValueExpr){
		String oldValue = getFromIp();
		String newValue = parseString(newValueExpr);
		if(equalsString(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
		//they are surely different each other
		updateFromIp(newValue);
		this.onChangeProperty(FROM_IP_PROPERTY, oldValue, newValue);
		return;
  
	}
			
			
			
	protected void changeDescriptionProperty(String newValueExpr){
		String oldValue = getDescription();
		String newValue = parseString(newValueExpr);
		if(equalsString(oldValue , newValue)){
			return;//they can be both null, or exact the same object, this is much faster than equals function
		}
		//they are surely different each other
		updateDescription(newValue);
		this.onChangeProperty(DESCRIPTION_PROPERTY, oldValue, newValue);
		return;
  
	}
			
			
			


	
<<<<<<< HEAD
=======
	public Object propertyOf(String property) {
     	
		if(LOGIN_TIME_PROPERTY.equals(property)){
			return getLoginTime();
		}
		if(FROM_IP_PROPERTY.equals(property)){
			return getFromIp();
		}
		if(DESCRIPTION_PROPERTY.equals(property)){
			return getDescription();
		}
		if(SEC_USER_PROPERTY.equals(property)){
			return getSecUser();
		}

    		//other property not include here
		return super.propertyOf(property);
	}
    
    


	
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void setId(String id){
		this.mId = trimString(id);;
	}
	public String getId(){
		return this.mId;
	}
	public LoginHistory updateId(String id){
		this.mId = trimString(id);;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeId(String id){
		if(id != null) { setId(id);}
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void setLoginTime(DateTime loginTime){
		this.mLoginTime = loginTime;;
	}
	public DateTime getLoginTime(){
		return this.mLoginTime;
	}
	public LoginHistory updateLoginTime(DateTime loginTime){
		this.mLoginTime = loginTime;;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeLoginTime(DateTime loginTime){
		setLoginTime(loginTime);
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void setFromIp(String fromIp){
		this.mFromIp = trimString(fromIp);;
	}
	public String getFromIp(){
		return this.mFromIp;
	}
	public LoginHistory updateFromIp(String fromIp){
		this.mFromIp = trimString(fromIp);;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeFromIp(String fromIp){
		if(fromIp != null) { setFromIp(fromIp);}
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void setDescription(String description){
		this.mDescription = trimString(description);;
	}
	public String getDescription(){
		return this.mDescription;
	}
	public LoginHistory updateDescription(String description){
		this.mDescription = trimString(description);;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeDescription(String description){
		if(description != null) { setDescription(description);}
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void setSecUser(SecUser secUser){
		this.mSecUser = secUser;;
	}
	public SecUser getSecUser(){
		return this.mSecUser;
	}
	public LoginHistory updateSecUser(SecUser secUser){
		this.mSecUser = secUser;;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeSecUser(SecUser secUser){
		if(secUser != null) { setSecUser(secUser);}
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	
	public void clearSecUser(){
		setSecUser ( null );
		this.changed = true;
	}
	
	public void setVersion(int version){
		this.mVersion = version;;
	}
	public int getVersion(){
		return this.mVersion;
	}
	public LoginHistory updateVersion(int version){
		this.mVersion = version;;
		this.changed = true;
		return this;
	}
<<<<<<< HEAD
=======
	public void mergeVersion(int version){
		setVersion(version);
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	

	public void collectRefercences(BaseEntity owner, List<BaseEntity> entityList, String internalType){

		addToEntityList(this, entityList, getSecUser(), internalType);

		
	}
	
	public List<BaseEntity>  collectRefercencesFromLists(String internalType){
		
		List<BaseEntity> entityList = new ArrayList<BaseEntity>();

		return entityList;
	}
	
	public  List<SmartList<?>> getAllRelatedLists() {
		List<SmartList<?>> listOfList = new ArrayList<SmartList<?>>();
		
			

		return listOfList;
	}

	
	public List<KeyValuePair> keyValuePairOf(){
		List<KeyValuePair> result =  super.keyValuePairOf();

		appendKeyValuePair(result, ID_PROPERTY, getId());
		appendKeyValuePair(result, LOGIN_TIME_PROPERTY, getLoginTime());
		appendKeyValuePair(result, FROM_IP_PROPERTY, getFromIp());
		appendKeyValuePair(result, DESCRIPTION_PROPERTY, getDescription());
		appendKeyValuePair(result, SEC_USER_PROPERTY, getSecUser());
		appendKeyValuePair(result, VERSION_PROPERTY, getVersion());

		
		return result;
	}
	
	
	public BaseEntity copyTo(BaseEntity baseDest){
		
		
		if(baseDest instanceof LoginHistory){
		
		
			LoginHistory dest =(LoginHistory)baseDest;
		
			dest.setId(getId());
			dest.setLoginTime(getLoginTime());
			dest.setFromIp(getFromIp());
			dest.setDescription(getDescription());
			dest.setSecUser(getSecUser());
			dest.setVersion(getVersion());

		}
		super.copyTo(baseDest);
		return baseDest;
	}
<<<<<<< HEAD
=======
	public BaseEntity mergeDataTo(BaseEntity baseDest){
		
		
		if(baseDest instanceof LoginHistory){
		
			
			LoginHistory dest =(LoginHistory)baseDest;
		
			dest.mergeId(getId());
			dest.mergeLoginTime(getLoginTime());
			dest.mergeFromIp(getFromIp());
			dest.mergeDescription(getDescription());
			dest.mergeSecUser(getSecUser());
			dest.mergeVersion(getVersion());

		}
		super.copyTo(baseDest);
		return baseDest;
	}
	
	public BaseEntity mergePrimitiveDataTo(BaseEntity baseDest){
		
		
		if(baseDest instanceof LoginHistory){
		
			
			LoginHistory dest =(LoginHistory)baseDest;
		
			dest.mergeId(getId());
			dest.mergeLoginTime(getLoginTime());
			dest.mergeFromIp(getFromIp());
			dest.mergeDescription(getDescription());
			dest.mergeVersion(getVersion());

		}
		return baseDest;
	}
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
	
	public String toString(){
		StringBuilder stringBuilder=new StringBuilder(128);

		stringBuilder.append("LoginHistory{");
		stringBuilder.append("\tid='"+getId()+"';");
		stringBuilder.append("\tloginTime='"+getLoginTime()+"';");
		stringBuilder.append("\tfromIp='"+getFromIp()+"';");
		stringBuilder.append("\tdescription='"+getDescription()+"';");
		if(getSecUser() != null ){
 			stringBuilder.append("\tsecUser='SecUser("+getSecUser().getId()+")';");
 		}
		stringBuilder.append("\tversion='"+getVersion()+"';");
		stringBuilder.append("}");

		return stringBuilder.toString();
	}
	
	//provide number calculation function
	

}


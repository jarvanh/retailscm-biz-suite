package com.doublechaintech.retailscm;

public interface RetailscmUserContext extends UserContext{
    //define the domain specific user model
	String getLocaleKey(String subject);
<<<<<<< HEAD
	void setChecker(RetailscmChecker checker);
	RetailscmChecker getChecker();
=======
	void setChecker(RetailscmObjectChecker checker);
	RetailscmObjectChecker getChecker();
	
	void saveAccessInfo(String beanName, String methodName, Object[] parameters);
	void addFootprint(FootprintProducer helper) throws Exception;
	Object getPreviousViewPage() throws Exception;
	Object getLastViewPage() throws Exception;
	Object goback() throws Exception;
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}


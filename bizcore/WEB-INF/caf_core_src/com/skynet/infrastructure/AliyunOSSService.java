package com.skynet.infrastructure;

<<<<<<< HEAD
import java.util.LinkedHashMap;
import java.util.Map;

=======
import com.aliyun.oss.OSSClient;
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.http.ProtocolType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.aliyuncs.sts.model.v20150401.AssumeRoleRequest;
import com.aliyuncs.sts.model.v20150401.AssumeRoleResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

<<<<<<< HEAD
public class AliyunOSSService extends AliyunBaseService implements StorageService{

	public String getBucket() {
		return bucket;
	}

	public void setBucket(String bucket) {
		this.bucket = bucket;
	}

	public String getRoleArn() {
		return roleArn;
	}

	public void setRoleArn(String roleArn) {
		this.roleArn = roleArn;
	}

	public long getDurationSeconds() {
		return durationSeconds;
	}

	public void setDurationSeconds(long durationSeconds) {
		this.durationSeconds = durationSeconds;
	}

	public String getEndpoint() {
		return endpoint;
	}

	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}

	public void setObjectMapper(ObjectMapper objectMapper) {
		this.objectMapper = objectMapper;
	}

	private String bucket = "xubai-public";
	
	/*
	 * AccessKeyID：
LTAIrYbbC132oMSc	AccessKeySecret：
kJnR8rziXpv7ar5Rm9Sd0e2lqdLLst

	 * 
	 * */
	//
	private String roleArn = "acs:ram::1258829570663551:role/fileuploader";
	
	//private String roleArn = "acs:ram::1326970669628900:role/aliyunosstokengeneratorrole";
	private long durationSeconds = 3600;
	private String policy = "{\n" + "  \"Statement\": [\n" + "    {\n" + "      \"Action\": [\n"
			+ "        \"oss:PutObject\"\n" + "      ],\n" + "      \"Effect\": \"Allow\",\n"
			+ "      \"Resource\": [\"acs:oss:*:*:BUCKET_ID/USER_HOME/*\"]\n" + "    }\n" + "  ],\n"
			+ "  \"Version\": \"1\"\n" + "}";

	
	
	
	private String endpoint = "oss-cn-beijing.aliyuncs.com";

	/*
	 * <!-- oss sts --> <property name="bucket" value="bbt-img" /> <property
	 * name="staticURL" value="https://bbt-img.oss-cn-shanghai.aliyuncs.com/" />
	 * <property name="accessKeyId" value="LTAIMKVss0W82mO9" /> <property
	 * name="accessKeySecret" value="dKIBjhaS2xLuGJHPt4vKvqmHYNSRxH" /> <property
	 * name="roleArn"
	 * value="acs:ram::1326970669628900:role/aliyunosstokengeneratorrole" />
	 * <property name="durationSeconds" value="3600" /> <property name="policy">
	 * <value> <![CDATA[ { "Statement": [ { "Action": [ "oss:PutObject" ], "Effect":
	 * "Allow", "Resource": ["acs:oss:*:*:BUCKET_ID/USER_HOME/*"] } ], "Version":
	 * "1" } ]]> </value> </property>
	 * 
	 * 
	 */

	private ObjectMapper objectMapper = null;

	protected ObjectMapper getObjectMapper() {
		if (objectMapper == null) {
			objectMapper = new ObjectMapper();
		}

		return objectMapper;

	}

	public void tryOne(Object context) throws JsonProcessingException {

		Map x = testoss(context);
		this.log(getObjectMapper().writeValueAsString(x));

	}

	private void log(String writeValueAsString) {
		// TODO Auto-generated method stub
		System.out.println(writeValueAsString);
	}
	//image.ycinfotech.cn
	public Map<String, Object> testoss(Object context) {
		// String roleSessionName = userContext.communityUserId();
		String userHome = String.valueOf(context);
		String userPolicy = policy.replaceAll("BUCKET_ID", bucket).replaceAll("USER_HOME", userHome);

		// 此处必须为 HTTPS
		ProtocolType protocolType = ProtocolType.HTTPS;

		try {
			final AssumeRoleResponse stsResponse = assumeRole(getAccessKeyId(), getAccessKeySecret(), roleArn, "CU000002",
					userPolicy, protocolType, durationSeconds);

			Map<String, Object> respMap = new LinkedHashMap<String, Object>();
			respMap.put("status", "200");
			respMap.put("accessKeyId", stsResponse.getCredentials().getAccessKeyId());
			respMap.put("accessKeySecret", stsResponse.getCredentials().getAccessKeySecret());
			respMap.put("securityToken", stsResponse.getCredentials().getSecurityToken());
			respMap.put("expiration", stsResponse.getCredentials().getExpiration());
			respMap.put("userHome", userHome);
			respMap.put("endpoint", "https://"+endpoint);
			respMap.put("prefix", "https://"+bucket+"."+endpoint);//"https://image.ycinfotech.cn");
			
			
			respMap.put("StatusCode", 200);
			respMap.put("AccessKeyId", stsResponse.getCredentials().getAccessKeyId());
			respMap.put("AccessKeySecret", stsResponse.getCredentials().getAccessKeySecret());
			respMap.put("SecurityToken", stsResponse.getCredentials().getSecurityToken());
			respMap.put("Expiration", stsResponse.getCredentials().getExpiration());
			respMap.put("UserHome", userHome);
			respMap.put("Endpoint", "https://"+endpoint);
			respMap.put("Prefix", "https://"+bucket+"."+endpoint);//"https://image.ycinfotech.cn");
			
			
			
			//respMap.put("prefix", );
			
			respMap.put("region", REGION_CN_BEIJING);

			respMap.put("bucket", bucket);

			return respMap;

		} catch (ClientException e) {
			e.printStackTrace();
			Map<String, Object> respMap = new LinkedHashMap<String, Object>();
			respMap.put("status", e.getErrCode());
			respMap.put("accessKeyId", "");
			respMap.put("accessKeySecret", "");
			respMap.put("securityToken", "");
			respMap.put("expiration", "");
			respMap.put("region", REGION_CN_BEIJING);
			respMap.put("userHome", userHome);
			respMap.put("endpoint", endpoint);
			respMap.put("prefix", "https://"+bucket+"."+endpoint);
			
			return respMap;
		}

	}
	
	public static final String REGION_CN_SHENZHEN = "cn-shenzhen";
	public static final String REGION_CN_BEIJING = "cn-beijing";
	
	
	public static final String STS_API_VERSION = "2015-04-01";

	protected AssumeRoleResponse assumeRole(String accessKeyId, String accessKeySecret, String roleArn,
			String roleSessionName, String policy, ProtocolType protocolType, long durationSeconds)
			throws ClientException {

		// 创建一个 Aliyun Acs Client, 用于发起 OpenAPI 请求
		IClientProfile profile = DefaultProfile.getProfile(REGION_CN_SHENZHEN, accessKeyId, accessKeySecret);
		DefaultAcsClient client = new DefaultAcsClient(profile);

		// 创建一个 AssumeRoleRequest 并设置请求参数
		final AssumeRoleRequest request = new AssumeRoleRequest();
		request.setVersion(STS_API_VERSION);
		request.setMethod(MethodType.POST);
		request.setProtocol(protocolType);

		request.setRoleArn(roleArn);
		request.setRoleSessionName(roleSessionName);
		// System.out.println(policy);
		request.setPolicy(policy);
		request.setDurationSeconds(durationSeconds);

		// 发起请求，并得到response
		final AssumeRoleResponse response = client.getAcsResponse(request);
	
		return response;

	}

	public static void main(String args[]) throws JsonProcessingException {

		AliyunOSSService service = new AliyunOSSService();
		String test = "upload/MoyiUser/MU000001";
		service.tryOne(test);
	}

	@Override
	public Map<String,Object> genToken(Object context) {
		// TODO Auto-generated method stub
		return this.testoss(context);
	}

=======
import java.io.ByteArrayInputStream;
import java.util.LinkedHashMap;
import java.util.Map;

public class AliyunOSSService implements StorageService {
    protected AliyunServiceConfiguration config = new AliyunServiceConfiguration();
    public AliyunServiceConfiguration getConfig() {
        return config;
    }
    public void setConfig(AliyunServiceConfiguration config) {
        this.config = config;
    }


    protected ObjectMapper getObjectMapper() {
        return new ObjectMapper();
    }

    public void tryOne(Object context) throws JsonProcessingException {

        Map x = testossByHome(String.valueOf(context));
        this.log(getObjectMapper().writeValueAsString(x));

    }

    private void log(String writeValueAsString) {
        System.out.println(writeValueAsString);
    }

    //image.ycinfotech.cn
    public Map<String, Object> testoss() {
        String userHome = "images";
        return testossByHome(userHome);
    }

    public Map<String, Object> testossByHome(String userHome) {
        // String roleSessionName = userContext.communityUserId();
        String ossPolicy = config.getPolicy();
        String userPolicy = ossPolicy.replaceAll("BUCKET_ID", config.getOssBucket()).replaceAll("USER_HOME", userHome);

        // 此处必须为 HTTPS
        ProtocolType protocolType = ProtocolType.HTTPS;

        try {
            final AssumeRoleResponse stsResponse = assumeRole(config.getAccessKeyId(), config.getAccessKeySecret(), config.getRoleArn(), "CU000002",
                    userPolicy, protocolType, config.getDurationSeconds());

            Map<String, Object> respMap = new LinkedHashMap<String, Object>();
            respMap.put("status", "200");
            respMap.put("accessKeyId", stsResponse.getCredentials().getAccessKeyId());
            respMap.put("accessKeySecret", stsResponse.getCredentials().getAccessKeySecret());
            respMap.put("securityToken", stsResponse.getCredentials().getSecurityToken());
            respMap.put("expiration", stsResponse.getCredentials().getExpiration());
            respMap.put("userHome", userHome);
            respMap.put("endpoint", "https://" + config.getEndpoint());
            respMap.put("prefix", "https://" + config.getOssBucket() + "." + config.getEndpoint());//"https://image.ycinfotech.cn");


            respMap.put("StatusCode", 200);
            respMap.put("AccessKeyId", stsResponse.getCredentials().getAccessKeyId());
            respMap.put("AccessKeySecret", stsResponse.getCredentials().getAccessKeySecret());
            respMap.put("SecurityToken", stsResponse.getCredentials().getSecurityToken());
            respMap.put("Expiration", stsResponse.getCredentials().getExpiration());
            respMap.put("UserHome", userHome);
            respMap.put("Endpoint", "https://" + config.getEndpoint());
            respMap.put("Prefix", "https://" + config.getOssBucket() + "." + config.getEndpoint());//"https://image.ycinfotech.cn");


            //respMap.put("prefix", );

            respMap.put("region", config.getRegion());

            respMap.put("bucket", config.getOssBucket());

            return respMap;

        } catch (ClientException e) {
            e.printStackTrace();
            Map<String, Object> respMap = new LinkedHashMap<String, Object>();
            respMap.put("status", e.getErrCode());
            respMap.put("accessKeyId", "");
            respMap.put("accessKeySecret", "");
            respMap.put("securityToken", "");
            respMap.put("expiration", "");
            respMap.put("region", config.getRegion());
            respMap.put("userHome", userHome);
            respMap.put("endpoint", config.getEndpoint());
            respMap.put("prefix", "https://" + config.getOssBucket() + "." + config.getEndpoint());

            return respMap;
        }

    }


    protected AssumeRoleResponse assumeRole(String accessKeyId, String accessKeySecret, String roleArn,
                                            String roleSessionName, String policy, ProtocolType protocolType, long durationSeconds)
            throws ClientException {

        // 创建一个 Aliyun Acs Client, 用于发起 OpenAPI 请求
        IClientProfile profile = DefaultProfile.getProfile(config.getRegion(), accessKeyId, accessKeySecret);
        DefaultAcsClient client = new DefaultAcsClient(profile);

        // 创建一个 AssumeRoleRequest 并设置请求参数
        final AssumeRoleRequest request = new AssumeRoleRequest();
        request.setVersion(config.getStsVersion());
        request.setMethod(MethodType.POST);
        request.setProtocol(protocolType);

        request.setRoleArn(roleArn);
        request.setRoleSessionName(roleSessionName);
        // System.out.println(policy);
        request.setPolicy(policy);
        request.setDurationSeconds(durationSeconds);

        // 发起请求，并得到response
        final AssumeRoleResponse response = client.getAcsResponse(request);

        return response;

    }


    @Override
    public Map<String, Object> genToken(Object context) {
        if (context instanceof String) {
            return this.testossByHome((String) context);
        }
        return this.testoss();
    }

    public String upload(String objName, byte[] content) {
        // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，请登录 https://ram.console.aliyun.com 创建RAM账号。
        String accessKeyId = getConfig().getAccessKeyId();
        String accessKeySecret = getConfig().getAccessKeySecret();

        // 创建OSSClient实例。
        OSSClient ossClient = new OSSClient("https://" + getConfig().getEndpoint(), accessKeyId, accessKeySecret);

        // 上传Byte数组。
        ossClient.putObject(getConfig().getOssBucket(), objName, new ByteArrayInputStream(content));

        // 关闭OSSClient。
        ossClient.shutdown();

        return "https://" + getConfig().getOssBucket() + "." + getConfig().getEndpoint() + "/" + objName;
    }
>>>>>>> 502e8b8dfc403300a992b5083e79c722e85d1854
}

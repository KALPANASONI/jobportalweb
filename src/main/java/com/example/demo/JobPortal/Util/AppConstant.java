package com.example.demo.JobPortal.Util;

public class AppConstant {

	// public final static String API_URL = "http://10.8.3.15:8082/"; //DEEPAK vpn
	// public final static String API_URL = "http://10.8.3.18:8082/"; //UTKARSH vpn
	// public final static String API_URL = "http://localhost:8082/deskapi/";
	// //build
	// public final static String API_URL= "http://103.55.91.195:8082/deskapi/";
	// //PULIC IP
	// public final static String API_URL = "http://10.8.3.19:8082/"; //manisha vpn
	// public final static String API_URL = "http://10.8.3.39:8082/"; // NIKHIL SIR

	// public final static String API_URL = "http://10.8.3.2:8082/"; // NIKHIL SIR
	// public final static String API_URL = "http://10.8.3.19:8089/"; // manisha vpn
	// public final static String API_URL = "http://10.8.3.5:8089/"; //for public
	
	  // public final static String API_URL = "http://localhost:8089/"; //apigateway accessing local apigateway
 	    // public final static String API_URL = "http://10.8.3.5:8089/"; // use for build using vpn ip
 	     
 	  //  public final static String API_URL = "http://103.55.91.195:8089/"; // use for build using public ip
	  
	public final static String API_URL = "http://localhost:8084/"; //apigateway accessing local apigateway
	
	public final static int SUCCESS_STATUS_CODE = 1;
	public final static int ERROR_STATUS_CODE = 0;
	public static final int ERROR = 11;
	public static final int INFO = 12;
	public static final int DEBUG = 13;
	public final static int INVALID_ACCESS_CODE = 4;
	// Directories
	public final static String ROOT_DIRECTORY = "ETMCS-DIR";
	public final static String MOBLIE_ROOT_DIRECTORY = "Mobile-Dir";
	public final static String WEB_ROOT_DIRECTORY = "Web-Dir";
	public final static String CHALLAN_DIRECTORY = "Challan-PDF";
	public final static String FONT_DIRECTORY = "fonts";
	public final static String LOGO_DIRECTORY = "Logo";

	public final static String CONFIG_DIRECTORY = "config";

	public final static String LOG_DIRECTORY = "log";

	public static final String DATA_TAG = "data";
	public static final String SESSION_TOKKEN = "sessionTokken";
	public static final String USER_ID = "userID";

	public static final int STATUS_OK = 1;

	public static final String AES_KEY = "B374A26A71490437AA024E4FADD5B497FDFF1A8EA6FF12F6FB65AF2720B59CCF";

	public static final String WINDOW = "Window";
	public static final String LINUX = "Linux";

	// TODO Config
	public static final boolean isLocalHost = true; // if not localhost change this

	// violation type
	public final static String ISPEED = "ISPEED";
	public final static String ENPLATE = "ENPLATE"; // or ANPR
	public final static String RLVD = "RED";
	public final static String RED_STOPLINE = "RED_STOPLINE";
	public final static String WRONGDIR = "WRONGDIR";
	public final static String RED_ZEBRACROSS = "RED_ZEBRACROSS";
	public final static String WRONGLANE = "WRONGLANE";

	// VAHAN
	public static final String VEHICLE_API_KEY = "abc@123";
	public static final String SOAP_END_POINT_URL = "http://203.122.44.159:480/vAPI/VahanAPI.asmx";
	public static final String SOAP_ACTION = "http://tempuri.org/GetVehicleDetails";
	public static final String NAMESPACE = "http://tempuri.org/";
}

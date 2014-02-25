<%@page import="java.io.*" %>
<%@page import="java.net.*" %>
<%@page import="com.sectooladdict.encoders.HtmlEncoder" %>
<%@page import="com.sectooladdict.constants.SystemConstants" %>
<%@page import="com.sectooladdict.constants.FileConstants" %>
<%@page import="com.sectooladdict.constants.ContentConstants" %>
<%@page import="com.sectooladdict.enums.VulnerabilityType" %>
<%@page import="com.sectooladdict.enums.ResponseType" %>
<%@page import="com.sectooladdict.enums.DefaultInputType" %>
<%@page import="com.sectooladdict.enums.FileAccessMethod" %>
<%@page import="com.sectooladdict.enums.FileAccessRestriction" %>
<%@page import="com.sectooladdict.enums.FileInjectionContext" %>
<%@page import="com.sectooladdict.enums.PrefixRequirement" %>
<%@page import="com.sectooladdict.enums.OsType" %>
<%@page import="com.sectooladdict.enums.PathType" %>

<%
//set debug flag from main config
boolean debugMode = SystemConstants.DEBUG_FLAG_DEFAULT_STATE;

//begin setting group definitions
//--------------------------------

//*** Set Default File Access Type ***
//CONTEXT_STREAM, FILE_CLASS, URL_CLASS, FTP_CLASS, INCLUDE, REDIRECT, FORWARD
FileAccessMethod fileAccessMethod = FileAccessMethod.URL_CLASS;

//** Set File Access Restriction ***
//NONE, WHITE_LIST,	LOCAL_FOLDER_ONLY, PERMISSIONS, 
//UNIX_TRAVESAL_INPUT_VALIDATION, UNIX_TRAVESAL_INPUT_REMOVAL, 
//WINDOWS_TRAVESAL_INPUT_VALIDATION, WINDOWS_TRAVESAL_INPUT_REMOVAL,
//SLASH_INPUT_VALIDATION, SLASH_INPUT_REMOVAL,
//BACKSLASH_INPUT_VALIDATION, BACKSLASH_INPUT_REMOVAL,
FileAccessRestriction accessRestriction = FileAccessRestriction.NONE;

//** Set Default Input Format ***
//FULL_PATH_INPUT, RELATIVE_INPUT, INVALID_INPUT, EMPTY_INPUT
DefaultInputType defaultInputType = DefaultInputType.FULL_PATH_INPUT;

//*** Set Default Injection Context ***
/*
FULL_FILENAME, //filename.extension (nothing appended)
FILENAME_ONLY, //filename (fixed extension appended)
DIRECTORY, //directory (fixed filename & extension appended)
EXTENSION; //extension (nothing appended, *NOT IMPLEMENTED*)
*/
FileInjectionContext injectionContext = FileInjectionContext.FULL_FILENAME; 

//set path requirement
//ANY, NONE, SLASH_PREFIX, BACKSLASH_PREFIX,
//FTP_DIRECTIVE, HTTP_DIRECTIVE, 
PrefixRequirement prefixRequired = PrefixRequirement.ANY;							 

//*** set OS simulation (unix default) ***
//WINDOWS, UNIX
//OsType osSimulated = OsType.WINDOWS;

//*** Set Default Response Type ***
//ERROR_500, ERROR_404, REDIRECT_302, ERROR_200, VALID_200, Identical_200
ResponseType invalidResponseType = ResponseType.ERROR_500;
                                  		 
//*** Set Default Content Type ***
//CONTENT_TYPE_TEXT_HTML ("text/html"), CONTENT_TYPE_STREAM ("application/octet-stream")
String validResposeStream = ContentConstants.CONTENT_TYPE_STREAM; 

//** Set Default File Path/URL Type **
//OS_PATH, FILE_DIRECTIVE_URL, FTP_URL, HTTP_URL 
PathType pathType = PathType.HTTP_URL;

//*** Set Vulnerability Type ***
//LFI, RFI, DIRECTORY_TRAVERSAL, CODE_LFI, CODE_RFI, FALSE_POSITIVE
VulnerabilityType vulnerability = VulnerabilityType.RFI;



//final String URL_TYPE_FTP = "ftp://"; //new URL(new String("ftp://"+user+":"+password+"@"+host+"/"+remotefile+";type=i"));
//*** Set Default Prefix String ***
String prefix = ""; //"",[FULLPATH], "http://","file:/","ftp://"

//obtain deliminters and path information
String fileDelimiter = System.getProperty("file.separator");
String lineDelimiter = System.getProperty("line.separator");

//Initial Path/URL:
String DefaultInitialPath = ""; //Empty
//Current User Directory File Object
File directory = new File (".");
//User Directory Path - Absolute
String userPath = System.getProperty("user.dir");
///Deployement Path Root - Absolute
String documentRootPath =
	getServletConfig().getServletContext().getRealPath("");
//Relative path of current file - Absolute
String currentFilePath = request.getRealPath(request.getServletPath());
//Relative path of current directory - Absolute - No Final Line Delimiter
String currentDirPath = request.getRealPath(
		(request.getServletPath()).split("/Case")[0]);
//Web Path of Root - Relative
String contextPath = this.getServletContext().getContextPath();
//Web Path of File - Relative and *NOT* including ROOT (!)
String contextPathFile = request.getServletPath();
//Web Path of Dir - Relative and *NOT* including ROOT or File Delimiter(!)
String contextRelativeDirPath = (request.getServletPath()).split("/Case")[0];

if (debugMode == true) {
	String BR = "<BR>";
	String FontStart = "<B>";
	String FontEnd = "</B>";
	
	System.out.println ("File delimiter: " + fileDelimiter);
	out.println (FontStart + "File delimiter: " + FontEnd + fileDelimiter + BR);
	System.out.println ("Line delimiter (encoded):" + HtmlEncoder.htmlEncode(lineDelimiter));
	out.println (FontStart + "Line delimiter (encoded): " + FontEnd 
			+ HtmlEncoder.htmlEncode(HtmlEncoder.htmlEncode(lineDelimiter)) + BR);
	
	//User Directory Path - Absolute
	System.out.println ("User Directory Path (Absolute): " + userPath);
	out.println (FontStart + "User Directory Path (Absolute): " + FontEnd + userPath + BR);
	///Deployement Path Root - Absolute
	System.out.println ("Deployment Path Root (Absolute): " + documentRootPath);
	out.println (FontStart + "Deployment Path Root (Absolute): " + FontEnd + documentRootPath + BR);
	//Relative path of current file - Absolute
	System.out.println ("Deployment Path Current File (Absolute): " + currentFilePath);		
	out.println (FontStart + "Deployment Path Current File (Absolute): " + FontEnd + currentFilePath + BR);
	//Relative path of current directory - Absolute
	System.out.println ("Deployment Path Current Directory (Absolute): " + currentDirPath);
	out.println (FontStart + "Deployment Path Current Directory (Absolute): " + FontEnd + currentDirPath + BR);
	//Web Path of Root - Relative
	System.out.println ("Web Path Root (Relative): " + contextPath);
	out.println (FontStart + "Web Path Root (Relative): " + FontEnd + contextPath + BR);
	//Web Path of File - Relative and *NOT* including ROOT (!)
	System.out.println ("Web Path of File (Relative-no-root): " + contextPathFile);
	out.println (FontStart + "Web Path of File (Relative-no-root): " + FontEnd + contextPathFile + BR);
	//Web Path of Dir - Relative and *NOT* including ROOT or File Delimiter(!)
	System.out.println ("Web Path of Dir (Relative-no-root): " + contextRelativeDirPath);
	out.println (FontStart + "Web Path of Dir (Relative-no-root): " + FontEnd + contextRelativeDirPath + BR);
	//Full URL:
	System.out.println("request URL: " + request.getRequestURL());
	out.println(FontStart + "request URL: " + FontEnd + request.getRequestURL() + BR);
	
	//System.out.println(request.getRealPath("/"));
	
	try {
		System.out.println ("Current directory's canonical path: " 
  			+ directory.getCanonicalPath()); 
		out.println (FontStart + "Current directory's canonical path: " 
		    + FontEnd + directory.getCanonicalPath() + BR); 
	   	System.out.println ("Current directory's absolute path: " 
	   		+ directory.getAbsolutePath());
	   	out.println (FontStart + "Current directory's absolute  path: " 
	   	    + FontEnd + directory.getAbsolutePath() + BR);
	} catch(Exception e) {
		System.out.println("Exceptione is =" + e.getMessage());
	}
	
	out.println(BR + BR);
} // end of debug if

//****ways to get the file ****
//1)context.getRequestDispatcher("/").forward(request, response);
//2)File file = new File (currentDirPath + targetFile);
//3)is = getServletContext().getResourceAsStream(contextRelativeDirPath + targetFile);
//4)is = new FileInputStream(currentDirPath + targetFile);
//5)URL url = new URL(URLInitialPath + targetFile);
//   URLConnection urlconn = url.openConnection();
//6)FORWARD (FP)
//6)REDIRECT (FP)

%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Unvalidated Redirect Detection Accuracy (JS) - HTTP GET Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<%
 String baseURL = FileConstants.HTTP_PREFIX + request.getServerName() + ":" + request.getServerPort() 
 				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
 String baseUrlWithoutProtocol = request.getServerName() + ":" + request.getServerPort() 
  				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
%>

<center><font size="5">Unvalidated Redirect Test Cases - GET - HTTP 200 Valid Responses with Javascript Redirect:</font></center><br><br>

  <B><a href="Case01-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE%>">
   Case01-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default full path input, without path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (custom failure/404)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="http://www.google.com" %> <br>
  <B>Independent Exploit 2:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  <B><a href="Case02-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case02-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default relative path input, without path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>None</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="http://www.google.com" %> <br>
  <B>Independent Exploit 2:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case03-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_URL_INVALID_REDIRECT %>">
   Case03-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default invalid path input, without path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="http://www.google.com" %> <br>
  <B>Independent Exploit 1:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case04-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp?target=<%=FileConstants.EMPTY_INPUT %>">
   Case04-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default empty path input, without path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="http://www.google.com" %> <br>
  <B>Independent Exploit 1:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case05-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp?target=<%= baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE%>">
   Case05-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default partial path input, with protocol-less path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>None</TD><TD>Partial Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> None<BR><B>Full Path:</B> Not Supported</TD><TD>Path Without Protocol<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case06-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-PartialPathReq-Read.jsp?target=<%= baseURL + FileConstants.DEFAULT_TARGET_FILE_INVALID%>">
   Case06-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-PartialPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default invalid path input, with protocol-less path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>None</TD><TD><b>Invalid</b> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> None<BR><B>Full Path:</B> Not Supported</TD><TD>Path Without Protocol<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case07-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-PartialPathReq-Read.jsp?target=<%= FileConstants.EMPTY_INPUT%>">
   Case07-Redirect-RedirectMethod-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-PartialPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an unrestricted HTTP URL, default empty input, with protocol-less path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>None</TD><TD><b>Empty Input</b></TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> None<BR><B>Full Path:</B> Not Supported</TD><TD>Path Without Protocol<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case08-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp?target=<%= baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE%>">
   Case08-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text validation, default partial path input, with protocol-less path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Validation</TD><TD>Partial Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> None<BR><B>Full Path:</B> Not Supported</TD><TD>Path Without Protocol<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  [invalid URL/filename] (failure) and http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case09-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case09-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text validation, default relative path input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Validation</TD><TD>Relative Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case10-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp?target=<%= baseURL + FileConstants.DEFAULT_TARGET_FILE_INVALID%>">
   Case10-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text validation, default invalid path input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Validation</TD><TD>Invalid Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case11-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp?target=<%= FileConstants.EMPTY_INPUT%>">
   Case11-Redirect-RedirectMethod-FilenameContext-HttpInputValidation-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text validation, default empty input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Validation</TD><TD>Empty Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case12-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp?target=<%= baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE%>">
   Case12-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultPartialInput-PartialPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text removal, default partial path input, with protocol-less path requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Removal</TD><TD>Partial Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> None<BR><B>Full Path:</B> Not Supported</TD><TD>Path Without Protocol<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  [invalid URL/filename] (failure) and http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case13-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case13-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text removal, default relative path input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Removal</TD><TD>Relative Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case14-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp?target=<%= baseURL + FileConstants.DEFAULT_TARGET_FILE_INVALID%>">
   Case14-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text removal, default invalid path input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Removal</TD><TD>Invalid Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case15-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp?target=<%= FileConstants.EMPTY_INPUT%>">
   Case15-Redirect-RedirectMethod-FilenameContext-HttpInputRemoval-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  Unvalidated Redirect attack: injection into a filename/url context, using an HTTP URL with flawed http text removal, default empty input, with any prefix requirements.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>HTTP Input<br>Removal</TD><TD>Empty Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
  <TD>Text/Html</TD><TD>200 Valid<br>(JS Redirect)</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  hTTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br> vs. </b>
  http://[URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: hTTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="hTTp://www.google.com" %> <br>
  </TD></TR>
  </TABLE>  
  <br>  

</body>
</html>
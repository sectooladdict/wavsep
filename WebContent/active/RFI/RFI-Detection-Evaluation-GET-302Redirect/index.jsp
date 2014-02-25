<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Remote File Inclusion Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<%
 String baseURL = FileConstants.HTTP_PREFIX + request.getServerName() + ":" + request.getServerPort() 
 				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
 String baseUrlWithoutProtocol = request.getServerName() + ":" + request.getServerPort() 
  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
%>

<center><font size="5">RFI Test Cases - HTTP 302 Responses with Redirect Behavior:</font></center><br><br>

  <B><a href="Case01-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE%>">
   Case01-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default full path input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
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
  
  
  <B><a href="Case02-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case02-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default full path input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
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
  
  
  <B><a href="Case03-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE_INVALID %>">
   Case03-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default invalid input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
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
  
  
  <B><a href="Case04-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp?target=<%=FileConstants.EMPTY_INPUT %>">
   Case04-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default empty input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
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
  
  
  <B><a href="Case05-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-NoProtocolReq-Read.jsp?target=<%=baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE %>">
   Case05-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultFullInput-NoProtocolReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default full path input, without application full path support (no-path requirement), and in the scope of a page with redirect behavior.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(No Protocol/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
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
  <B>Independent Exploit 1:</B> <%="www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case06-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-NoProtocolReq-Read.jsp?target=<%=baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE_INVALID %>">
   Case06-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultInvalidInput-NoProtocolReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default invalid input, without application full path support (no-path requirement), and in the scope of a page with redirect behavior.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(No Protocol/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
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
  <B>Independent Exploit 1:</B> <%="www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case07-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-NoProtocolReq-Read.jsp?target=<%=FileConstants.EMPTY_INPUT %>">
   Case07-RFI-UrlClass-FilenameContext-Unrestricted-HttpURL-DefaultEmptyInput-NoProtocolReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default empty input, without application full path support (no-path requirement), and in the scope of a page with redirect behavior.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(No Protocol/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
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
  <B>Independent Exploit 1:</B> <%="www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
    <B><a href="Case08-RFI-UrlClass-FilenameContext-HttpInputValidation-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case08-RFI-UrlClass-FilenameContext-HttpInputValidation-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an HTTP URL with flawed http text validation, default full path input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>HTTP Input<br>Validation</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  htTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: htTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="htTp://www.google.com" %> <br>
  <B>Independent Exploit 1:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case09-RFI-UrlClass-FilenameContext-HttpInputRemoval-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case09-RFI-UrlClass-FilenameContext-HttpInputRemoval-HttpURL-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  RFI attack abusing the URL Class: injection into a filename context, using an HTTP URL with flawed http text removal, default full path input, without path requirements, and in the scope of a page with redirect behavior.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>URL Class (Read)</TD><TD>HTTP Input<br>Removal</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>302 Redirect</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  htTp://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> or </b>
  https://[external-domain]:[port]/[path]/[file].[extension] (success)<br><b> vs. </b>
  [invalid URL/filename] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: htTp://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="htTp://www.google.com" %> <br>
  <B>Independent Exploit 1:</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  

</body>
</html>
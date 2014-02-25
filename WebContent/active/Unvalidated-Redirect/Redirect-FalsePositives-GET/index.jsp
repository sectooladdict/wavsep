<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Unvalidated Redirect Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<%
 String baseURL = FileConstants.HTTP_PREFIX + request.getServerName() + ":" + request.getServerPort() 
 				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
 String baseUrlWithoutProtocol = request.getServerName() + ":" + request.getServerPort() 
  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
%>

<center><font size="5">False Positive Unvalidated Redirect Test Cases:</font></center><br><br>

<B><a href="Case01-Redirect-FalsePositive-Forward-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>">
  Case01-Redirect-FalsePositive-Forward-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect using the Forward Servlet feature: injection into a filename context, using an unrestricted HTTP URL, default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  The user-controlled forward can still be used for file enumeration attacks, unvalidated forward attacks (but not for actual redirect attacks), and might also generate 404 and 500 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet<br>Forward</TD><TD>None</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://www.google.com" %>
  </TD></TR>
  </TABLE>
  <br>
  
  
  <B><a href="Case02-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultFullInput-NoPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE %>">
  Case02-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page without any redirection logic: no injection actually takes place, and a default full path is sent in the input, with no path requirements, and in the scope of a page with valid responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>No Logic</TD><TD>No Logic</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> None<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://www.google.com" %>
  </TD></TR>
  </TABLE>
  <br>
  
  
   <B><a href="Case03-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE %>">
  Case03-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page without any redirection logic: no injection actually takes place, and a default relative path is sent in the input, with no path requirements, and in the scope of a page with valid responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>No Logic</TD><TD>No Logic</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> None<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://www.google.com" %>
  </TD></TR>
  </TABLE>
  <br>
  
  
   <B><a href="Case04-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultPartialInput-NoPathReq-Read.jsp?target=<%=baseUrlWithoutProtocol + FileConstants.DEFAULT_TARGET_FILE %>">
  Case04-Redirect-FalsePositive-NoLogic-TextHtmlValidResponse-NoContext-Unrestricted-NoPath-DefaultPartialInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page without any redirection logic: no injection actually takes place, and a default partial path is sent in the input, with no path requirements, and in the scope of a page with valid responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>No Logic</TD><TD>No Logic</TD><TD>Partial Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> None<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  [external-domain]:[port]/[path]/[file].[extension] (success)<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://www.google.com" %><br>
  <B>False Positive Sample 4:</B> <%="www.google.com" %>
  </TD></TR>
  </TABLE>
  <br>
  
  
    <B><a href="Case05-Redirect-FalsePositive-InactiveJavascriptRedirect-FilenameContext-InputValidation-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE %>">
  Case05-Redirect-FalsePositive-InactiveJavascriptRedirect-FilenameContext-InputValidation-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page with an *INACTIVE* javascript redirect method, and a default full path is sent in the input, with no path requirements, and in the scope of a page with valid responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Inactive JS Redirect</TD><TD>Inactive JS Redirect</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> None<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Valid</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  http://[external-domain]:[port]/[path]/[file].[extension] (success)<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://www.google.com" %>
  </TD></TR>
  </TABLE>
  <br>
  
  
  <B><a href="Case06-Redirect-FalsePositive-RFI-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE%>">
   Case06-Redirect-FalsePositive-RFI-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Redirect: RFI attack abusing the URL Class: injection into a filename context, using an unrestricted HTTP URL, default full path input, without path requirements, and in the scope of a page with erroneous responses.<br>
  
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
  <TD>Text/Html</TD><TD>200 Error</TD>
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
  <B>Independent Exploit 1 (real RFI, False Positive Redirect):</B> <%="http://www.google.com" %> <br>
  <B>Independent Exploit 1 (real RFI, False Positive Redirect):</B> <%="https://www.google.com" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case07-Redirect-FalsePositive-LFI-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE %>">
   Case07-Redirect-FalsePositive-LFI-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive Redirect: LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default full path input, without path requirements, and in the scope of a page with erroneous responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[original-file-name] (success)<br><b> vs. </b>
  ../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]/[target-file]<br>
  Web: /[full-path]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1(real LFI, False Positive Redirect):</B> <%=(contextRelativeDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2(real LFI, False Positive Redirect):</B> <%="WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3(real LFI, False Positive Redirect):</B> <%="WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case08-Redirect-FalsePositive-RedirectMethod-FilenameContext-WhiteList-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp?target=<%=baseURL + FileConstants.DEFAULT_TARGET_FILE%>">
   Case08-Redirect-FalsePositive-RedirectMethod-FilenameContext-WhiteList-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page that restricts the input to a white list of domains/URLs, a default input of an HTTP URL, and in the scope of a page with 302 responses.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>White List</TD><TD>Full Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
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
  [invalid URL/filename] (custom failure/404)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of FP Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Exploit 1 (real Redirect, Limited to current domain):</B> <%="http://localhost:8080/" %> <br>
  <B>False Positive Exploit 2 (real Redirect, Limited to current domain):</B> <%="https://localhost:8080" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case09-Redirect-FalsePositive-RedirectMethod-FilenameContext-DomainConcat-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp?target=<%=FileConstants.DEFAULT_TARGET_FILE%>">
   Case09-Redirect-FalsePositive-RedirectMethod-FilenameContext-DomainConcat-HttpURL-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  False Positive Unvalidated Redirect in a page that concats a predefined domain URL to the input received: a default input of a relative path, and in the scope of a page with 302 responses.<br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Initial Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Redirect </TD><TD>Domain Concat</TD><TD>Relative Path Input</TD>
  <TD>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>No Prefix<BR>(Full Path / Relative Path / None / Partial Path)</TD>
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
  [invalid URL/filename] (custom failure/404)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: http://[external-domain]:[port]/[path to malicious XSS/Phishing/CSRF/Clickjacking file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of FP Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Exploit 1 (real Redirect, Limited to current domain):</B> <%="http://localhost:8080/" %> <br>
  <B>False Positive Exploit 2 (real Redirect, Limited to current domain):</B> <%="https://localhost:8080" %>
  </TD></TR>
  </TABLE>  
  <br>
    

</body>
</html>
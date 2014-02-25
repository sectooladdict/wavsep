<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Directory Traversal / Local File Inclusion Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<center><font size="5">False Positive Directory Traversal/LFI Test Cases:</font></center><br><br>

<B><a href="Case01-LFI-FalsePositive-Forward-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>">
  Case01-LFI-FalsePositive-Forward-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the Forward Servlet feature: injection into a filename context, using an unrestricted OS path, default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  The user-controlled forward can still be used for file enumeration attacks (but not for actual LFI/Traversal attacks), and might also generate 404 and 500 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet<br>Forward</TD><TD>None</TD><TD>Relative Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[full-path]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case02-LFI-FalsePositive-OpenRedirect-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%="/wavsep" + contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>">
  Case02-LFI-FalsePositive-OpenRedirect-TextHtmlValidResponse-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the Redirect Servlet feature: injection into a filename context, using an unrestricted OS path, default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  The user-controlled redirect can still be used for External/Open Redirect attacks (but not for actual LFI/Traversal attacks), and might also generate 404 and 500 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet<br>Redirect</TD><TD>None</TD><TD>Relative Path Input</TD>
  <TD>Full/Partial<br>HTTP URL</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Web Server Root<BR><B>Full Path:</B> Supported</TD><TD>No Prefix<BR>(Full Path/Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[full-path]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%="/wavsep" + contextRelativeDirPath.replace("index.jsp","") + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="/wavsep/active/WEB-INF/web.xml" %><br>
  <B>False Positive Sample 3:</B> <%="http://" + request.getLocalAddr() + ":" + request.getLocalPort() +"/wavsep" + contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case03-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-WhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%="validfile1.jsp" %>">
  Case03-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-WhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the File Class, but with an extremely limited white list: injection into a filename context, using an OS path (white list of files), default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class</TD><TD>White List</TD><TD>Relative Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  [original-file-name] (success)<br><b> vs. </b>
  [other-valid-file-name-in-whitelist] (success)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%="validfile2.jsp" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case04-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-TraversalRemovalAndWhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%="validfile1.jsp" %>">
  Case04-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-TraversalRemovalAndWhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the File Class, but with an extremely limited white list & traversal removal: injection into a filename context, using an OS path (traversal removal and then white list of files), default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  Might confuse scanners that compare input with local directory traversal characters (./,/./) to the original input, without performing additional verifications. 
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class</TD><TD>Traversal Removal<br>And White List</TD><TD>Relative Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  [original-file-name] (success)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%="validfile2.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%="./validfile1.jsp" %> <br>
  <B>False Positive Sample 3:</B> <%="/./validfile1.jsp" %> <br>
  <B>False Positive Sample 4:</B> <%="../validfile1.jsp" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case05-LFI-FalsePositive-ContextStream-TextHtmlValidResponse-FilenameContext-WhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>">
  Case05-LFI-FalsePositive-ContextStream-TextHtmlValidResponse-FilenameContext-WhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the Servlet Context Stream method, but with an extremely limited white list: injection into a filename context, using an OS path (white list of files), default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream</TD><TD>White List</TD><TD>Context Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path/Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  [original-file-name] (success)<br><b> vs. </b>
  [other-valid-file-name-in-whitelist] (success)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[full-path]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "validfile2.jsp" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case06-LFI-FalsePositive-ContextStream-TextHtmlValidResponse-FilenameContext-TraversalRemovalAndWhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=contextRelativeDirPath.replace("index.jsp","") + "validfile1.jsp" %>">
  Case06-LFI-FalsePositive-ContextStream-TextHtmlValidResponse-FilenameContext-TraversalRemovalAndWhiteList-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the Servlet Context Stream method, but with an extremely limited white list & traversal removal: injection into a filename context, using an OS path (traversal removal and then white list of files), default relative path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  Might confuse scanners that compare input with local directory traversal characters (./,/./) to the original input, without performing additional verifications. 
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream</TD><TD>Traversal Removal<br>And White List</TD><TD>Context Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path/Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  [original-file-name] (success)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[full-path]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "validfile2.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "./validfile1.jsp" %> <br>
  <B>False Positive Sample 3:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "/./validfile1.jsp" %> <br>
  <B>False Positive Sample 4:</B> <%=contextRelativeDirPath.replace("index.jsp","") + "../validfile1.jsp" %> <br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case07-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-EnumerationResponseOnly-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=((currentDirPath.replace("index.jsp","")) + FileConstants.DEFAULT_TARGET_FILE)%>">
  Case07-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-EnumerationResponseOnly-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the File Class, but without actually presenting the file content: injection into a filename context, using an unrestricted OS path, default full path input, with no path requirements, and in the scope of a page with erroneous responses.<br>
  The user-controlled traversal input can still be used for file enumeration attacks (but not for actual LFI/Traversal attacks), and might also generate 404 and 500 responses.<br>
  Might confuse scanners that focus on the path but never compare the content in the various results (or the effect on the server, in the case of Code File Inclusion).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class</TD><TD>File Enumeration Only</TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full Path/Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  ./[original-file-name] (success)<br><b> vs. </b>
  ../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]/[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case08-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-InputNotUsed-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp?target=<%=((currentDirPath.replace("index.jsp","")) + FileConstants.DEFAULT_TARGET_FILE)%>">
  Case08-LFI-FalsePositive-FileClass-TextHtmlValidResponse-FilenameContext-InputNotUsed-OSPath-DefaultRelativeInput-NoPathReq-Read.jsp</a></B><br>
  False Positive LFI using the File Class, but without any actual affect of the user input (server controlled default value): no injection, using an unrestricted OS path, default full path input, without path requirements, and in the scope of a page with erroneous responses.<br>
  The test case still discloses sensitive information (default input/exceptions).<br>
  Might confuse scanners that focus on analyzing the original input,  but don't perform sufficient validations to verify the input has any effect (valid vs. invalid).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class</TD><TD>Ignore Input</TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> None<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Irrelevant</TD><TD>Any Prefix<BR>(Full Path/Relative Path/ None)</TD>
  <TD>Text/Html</TD><TD>200 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Detection Methods:</B></U>
  </TD></TR>
  <TR><TD>
  ./[original-file-name] (success)<br><b> vs. </b>
  [original-file-name] (success)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample False Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]/[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Misleading False Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>False Positive Sample 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>False Positive Sample 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Directory Traversal / Local File Inclusion Detection Accuracy - HTTP POST Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<center><font size="5">Directory Traversal/LFI Test Cases - HTTP 404 Responses with Erroneous Text:</font></center><br><br>

<B><a href="Case01-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case01-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Windows: c:\boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case02-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-AnyPathReq-Read.jsp">
   Case02-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Not Supported<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  file:/./[original-file-name] (success)<br><b> vs. </b>
  file:/../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: file:/[full-path]/[target-file]<br>
  Windows: file:/c:/boot.ini<br>
  Unix/Linux: file:/etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3:</B> <%=FileConstants.FILE_PREFIX + (((currentDirPath.replace("index.jsp",""))).replace("\\","/")).substring(3) + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case03-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-AnyPathReq-Read.jsp">
   Case03-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default relative input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: ../[target-file]<br>
  Windows: ../boot.ini<br>
  Unix/Linux: ../../etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1 (Win):</B> ../boot.ini <br>
  <B>Independent Exploit 2 (Linux):</B> ../../etc/passwd
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case04-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultRelativeInput-AnyPathReq-Read.jsp">
   Case04-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultRelativeInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default relative input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Not Supported<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  file:/./[original-file-name] (success)<br><b> vs. </b>
  file:/../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: file:/[full-path]/[target-file]<br>
  Windows: file:/c:/boot.ini<br>
  Unix/Linux: file:/etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3:</B> <%=FileConstants.FILE_PREFIX + (((currentDirPath.replace("index.jsp",""))).replace("\\","/")).substring(3) + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case05-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-AnyPathReq-Read.jsp">
   Case05-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default invalid input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]/[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case06-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-AnyPathReq-Read.jsp">
   Case06-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default invalid input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Not Supported<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  file:/./[valid-file-name] (success)<br><b> vs. </b>
  file:/../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: file:/[full-path]/[target-file]<br>
  Windows: file:/c:/boot.ini<br>
  Unix/Linux: file:/etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3:</B> <%=FileConstants.FILE_PREFIX + (((currentDirPath.replace("index.jsp",""))).replace("\\","/")).substring(3) + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case07-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-AnyPathReq-Read.jsp">
   Case07-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default empty input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]/[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case08-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-AnyPathReq-Read.jsp">
   Case08-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default empty input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Not Supported<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  file:/./[valid-file-name] (success)<br><b> vs. </b>
  file:/../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: file:/[full-path]/[target-file]<br>
  Windows: file:/c:/boot.ini<br>
  Unix/Linux: file:/etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=FileConstants.FILE_PREFIX + ((currentDirPath.replace("index.jsp",""))).replace("\\","/") + "../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3:</B> <%=FileConstants.FILE_PREFIX + (((currentDirPath.replace("index.jsp",""))).replace("\\","/")).substring(3) + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case09-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case09-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relavite (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case10-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-NoPathReq-Read.jsp">
   Case10-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative (Full) Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
<B><a href="Case11-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-NoPathReq-Read.jsp">
   Case11-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default invalid input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case12-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-NoPathReq-Read.jsp">
   Case12-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default invalid input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>


<B><a href="Case13-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-NoPathReq-Read.jsp">
   Case13-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default empty input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case14-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-NoPathReq-Read.jsp">
   Case14-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default empty input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case15-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
   Case15-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case16-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-SlashPathReq-Read.jsp">
   Case16-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative (Full) Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
<B><a href="Case17-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-SlashPathReq-Read.jsp">
   Case17-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default invalid input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[valid-file-name] (success)<br><b> vs. </b>
  /../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case18-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-SlashPathReq-Read.jsp">
   Case18-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultInvalidInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default invalid input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>


<B><a href="Case19-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-SlashPathReq-Read.jsp">
   Case19-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default empty input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[valid-file-name] (success)<br><b> vs. </b>
  /../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case20-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-SlashPathReq-Read.jsp">
   Case20-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultEmptyInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default empty input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case21-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case21-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under linux the required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case22-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-BackslashPathReq-Read.jsp">
   Case22-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default invalid input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under linux the required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[valid-file-name] (success)<br><b> vs. </b>
  \..\[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case23-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-BackslashPathReq-Read.jsp">
   Case23-LFI-FileClass-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted OS path, default empty input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under linux the required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[valid-file-name] (success)<br><b> vs. </b>
  \..\[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case24-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case24-LFI-FileClass-FilenameContext-Unrestricted-FileDirective-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an unrestricted file URL, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though in file URLs the required char is actually slash, the backslash char ("\") will still work since it is converted to slash ("/") by the test case code, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD>None</TD><TD>Relative (Full) Input</TD>
  <TD>File URL - rfc1738</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\../../WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case25-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case25-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
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
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case26-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-AnyPathReq-Read.jsp">
   Case26-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default invalid input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
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
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case27-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-AnyPathReq-Read.jsp">
   Case27-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default empty input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
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
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case28-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case28-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default full path input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
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
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case29-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-NoPathReq-Read.jsp">
   Case29-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default invalid input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case30-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-NoPathReq-Read.jsp">
   Case30-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default empty input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  ./[valid-file-name] (success)<br><b> vs. </b>
  ../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>


  <B><a href="Case31-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
  Case31-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default full path input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
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
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case32-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-SlashPathReq-Read.jsp">
  Case32-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default invalid input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[valid-file-name] (success)<br><b> vs. </b>
  /../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case33-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-SlashPathReq-Read.jsp">
  Case33-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default empty input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[valid-file-name] (success)<br><b> vs. </b>
  /../[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case34-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
  Case34-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default full path input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="\\../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case35-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-BackslashPathReq-Read.jsp">
  Case35-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultInvalidInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default invalid input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Invalid</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \\.\\[valid-file-name] (success)<br><b> vs. </b>
  \\..\\[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \\[traversal]\\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="\\../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case36-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-BackslashPathReq-Read.jsp">
  Case36-LFI-ContextStream-FilenameContext-Unrestricted-OSPath-DefaultEmptyInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an unrestricted OS path, default empty input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD>None</TD><TD><B>Empty</B> Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[valid-file-name] (success)<br><b> vs. </b>
  \..\[valid-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="\\../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
   
  <B><a href="Case37-LFI-FileClass-FilenameContext-SlashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case37-LFI-FileClass-FilenameContext-SlashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with slash validation, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Slash<BR>Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]\[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: \etc\passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case38-LFI-FileClass-FilenameContext-BackslashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case38-LFI-FileClass-FilenameContext-BackslashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with backslash validation, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Backslash<BR>Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Windows: c:/boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")).replace("\\","/") + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case39-LFI-FileClass-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case39-LFI-FileClass-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal validation, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Relavite (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case40-LFI-FileClass-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case40-LFI-FileClass-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal validation, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Relavite (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case41-LFI-FileClass-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
   Case41-LFI-FileClass-FilenameContext-SlashTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal validation, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case42-LFI-FileClass-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
   Case42-LFI-FileClass-FilenameContext-BackslashTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal validation, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case43-LFI-FileClass-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case43-LFI-FileClass-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal validation, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case44-LFI-FileClass-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case44-LFI-FileClass-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal validation, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  

  <B><a href="Case45-LFI-ContextStream-FilenameContext-SlashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case45-LFI-ContextStream-FilenameContext-SlashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with slash validation, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Slash<BR>Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]\[target-file]<br>
  Web: \[full-path]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")).replace("/","\\") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF\\web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case46-LFI-ContextStream-FilenameContext-BackslashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case46-LFI-ContextStream-FilenameContext-BackslashTraversalValidation-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with backslash validation, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Backslash<BR>Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case47-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case47-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal validation, default full path input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case48-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case48-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal validation, default full path input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 3:</B> <%="../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>


  <B><a href="Case49-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
  Case49-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal validation, default full path input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case50-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
  Case50-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal validation, default full path input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case51-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
  Case51-LFI-ContextStream-FilenameContext-UnixTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal validation, default full path input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3:</B> <%="\\..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case52-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
  Case52-LFI-ContextStream-FilenameContext-WindowsTraversalValidation-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal validation, default full path input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Validation</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case53-LFI-FileClass-FilenameContext-SlashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case53-LFI-FileClass-FilenameContext-SlashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with slash removal, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Slash<BR>Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]\[target-file]<br>
  Windows: c:\boot.ini<br>
  Unix/Linux: \etc\passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")) + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")) + "..\\..\\WEB-INF\\web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case54-LFI-FileClass-FilenameContext-BackslashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case54-LFI-FileClass-FilenameContext-BackslashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with backslash removal, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Backslash<BR>Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Execution Folder<BR><B>Full Path:</B> Supported</TD><TD>Any Prefix<BR>(Full path / Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Windows: c:/boot.ini<br>
  Unix/Linux: /etc/passwd
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(currentDirPath.replace("index.jsp","")).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%=(currentDirPath.replace("index.jsp","")).replace("\\","/") + "../../WEB-INF/web.xml" %>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case55-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case55-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal removal, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Relavite (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="....//....//WEB-INF/web.xml" %> (After removal of "../": "....//" turns to "../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case56-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case56-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal removal, default full path input, without full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the injection of full path / protocol directives.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Relavite (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "..\": "....\\" turns to "..\")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case57-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
   Case57-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal removal, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="//../....//....//WEB-INF/web.xml" %> (After removal of "/../" & "../": "//../....//" turns to "/../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case58-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
   Case58-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal removal, default full path input, with slash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("/") to the input received - preventing the injection of full path / protocol directives.<br>
  Clarification: Even though under windows the required char is actually backslash, the slash char ("/") will still work, and this case might confuse some scanners.<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="\\\\..\\....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "\..\" & "..\": "\\..\....\\" turns to "\..\")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case59-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case59-LFI-FileClass-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with unix traversal removal, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="//../....//....//WEB-INF/web.xml" %> (After removal of "/../" & "../": "//../....//" turns to "/../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case60-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
   Case60-LFI-FileClass-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the File class: injection into a filename context, using an OS path with windows traversal removal, default full path input, with backslash prefix requirement (no full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>File Class (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Relative (Full) Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="/../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="\\\\..\\....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "\..\" & "..\": "\\..\....\\" turns to "\..\")
  </TD></TR>
  </TABLE>  
  <br>
  

  <B><a href="Case61-LFI-ContextStream-FilenameContext-SlashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case61-LFI-ContextStream-FilenameContext-SlashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with slash removal, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Slash<BR>Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [full-path]\[target-file]<br>
  Web: \[full-path]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")).replace("/","\\") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF\\web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case62-LFI-ContextStream-FilenameContext-BackslashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp">
   Case62-LFI-ContextStream-FilenameContext-BackslashTraversalRemoval-OSPath-DefaultFullInput-AnyPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with backslash removal, default full path input, without path requirements, and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Backslash<BR>Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Root Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Any Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  <B>Independent Exploit 1:</B> <%=(contextRelativeDirPath.replace("index.jsp","")).replace("\\","/") + "include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="WEB-INF/web.xml" %><br>
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case63-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case63-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal removal, default full path input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  .\[original-file-name] (success)<br><b> vs. </b>
  ..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="....//....//WEB-INF/web.xml" %> (After removal of "../": "....//" turns to "../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case64-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp">
   Case64-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-NoPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal removal, default full path input, without application full path support (no-path requirement), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix to the input received - preventing the direct injection of full application path (without traversal characters)<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>No Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
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
  Web: [traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "..\": "....\\" turns to "..\")
  </TD></TR>
  </TABLE>  
  <br>


  <B><a href="Case65-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
  Case65-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal removal, default full path input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="//../....//....//WEB-INF/web.xml" %> (After removal of "/../" & "../": "//../....//" turns to "/../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case66-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp">
  Case66-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-SlashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal removal, default full path input, with slash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing slash char ("/") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Slash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="\\\\..\\....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "\..\" & "..\": "\\..\....\\" turns to "\..\")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case67-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
  Case67-LFI-ContextStream-FilenameContext-UnixTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with unix traversal removal, default full path input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Unix<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  \.\[original-file-name] (success)<br><b> vs. </b>
  \..\[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: \[traversal]\[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="\\include.jsp" %> <br>
  <B>Independent Exploit 2:</B> <%="\\..\\..\\WEB-INF\\web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="//../....//....//WEB-INF/web.xml" %> (After removal of "/../" & "../": "//../....//" turns to "/../")
  </TD></TR>
  </TABLE>  
  <br>
  
  
  <B><a href="Case68-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp">
  Case68-LFI-ContextStream-FilenameContext-WindowsTraversalRemoval-OSPath-DefaultFullInput-BackslashPathReq-Read.jsp</a></B><br>
  LFI attack abusing the getContextStream servlet method: injection into a filename context, using an OS path with windows traversal removal, default full path input, with backslash prefix requirement (no application full path support), and in the scope of a page with erroneous 404 responses.<br>
  Clarification: The test case concatenates a default full path prefix with a missing backslash char ("\") to the input received - preventing the direct injection of full application path (without traversal characters).<br>
  Clarification: The getContextStream servlet method is partially restricted from accessing OS files outside the application context (<B>permissions simulation</B>).<br>
  Clarification: Even though the context stream required char is actually slash, the backslash char ("\") should still work, and this case might confuse some scanners (character conversion simulation).<br>
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>File Access Method:</B></U></TD><TD><U><B>Barriers:</B></U><br></TD>
  <TD><U><B>Default Input:</B></U></TD><TD><U><B>Path Type:</B></U></TD>
  <TD><U><B>File Injection Context:</B></U></TD><TD><U><B>Prefix Requirement:</B></U></TD>
  <TD><U><B>Valid Response Stream:</B></U></TD><TD><U><B>Erroneous Response Type:</B></U></TD>
  </TR>
  <TR>
  <TD>Servlet Context Stream (Read)</TD><TD><CENTER>Windows<BR>Traversal Removal</CENTER></TD><TD>Full Path Input</TD>
  <TD>Local OS Path (URL)</TD><TD><B>Injection Into:</B> Full Filename<br><B>Relative Path:</B> Application Folder<BR><B>Full Path:</B> Not Supported</TD><TD>Backslash Prefix<BR>(Relative path/ None)</TD>
  <TD>Octet-Stream</TD><TD>404 Error</TD>
  </TR>
  </TABLE>
  <TABLE cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Detection Structures:</B></U>
  </TD></TR>
  <TR><TD>
  /./[original-file-name] (success)<br><b> vs. </b>
  /../[original-file-name] (failure)
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Sample Exploit Structures:</B></U>
  </TD></TR>
  <TR><TD>
  Web: /[traversal]/[target-file]<br>
  </TD></TR>
  <TR bgcolor='#1AC6FF'><TD>
  <U><B>Examples of Exploits:</B></U>
  </TD></TR>
  <TR><TD>
  <B>Independent Exploit 1:</B> <%="/include.jsp" %> <br>
  <B>Independent Exploit 3:</B> <%="/../../WEB-INF/web.xml" %><br>
  <B>Independent Exploit 3 (Simple Evasion):</B> <%="\\\\..\\....\\\\....\\\\WEB-INF\\web.xml" %> (After removal of "\..\" & "..\": "\\..\....\\" turns to "\..\")
  </TD></TR>
  </TABLE>  
  <br>


</body>
</html>
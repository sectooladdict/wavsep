<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Obsolete and Hidden Files Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<%@ include file="include.jsp"%>

<%
 String baseURL = FileConstants.HTTP_PREFIX + request.getServerName() + ":" + request.getServerPort() 
 				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
 String baseUrlWithoutProtocol = request.getServerName() + ":" + request.getServerPort() 
  				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
%>

  <center><H1>Old, Backup and Unreferenced Files - Test Cases - Custom 200 Errors:</H1></center>

  <H2>Copied Files</H2>
  
  <a href="Login.jsp">File I: Login.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
 
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 1</B></TD>
  <TD><B>Login (copy)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> (copy)</b>.[extension]</TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>An initial copy of login created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 2</B></TD>
  <TD><B>Login (another copy)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> (another copy)</b>.[extension]</TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>A second copy of login created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 3</B></TD>
  <TD><B>Login (3rd copy)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> (3rd copy)</b>.[extension]</TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11)</TD>
  <TD>A third copy of login created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 4</B></TD>
  <TD><B>Login (third copy)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> (third copy)</b>.[extension]</TD>
  <TD><b>Ubuntu Linux</b> Only (12.04 TLS)</TD>
  <TD>A third copy of login created in Ubuntu (behaves different)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 5</B></TD>
  <TD><B>Login (4th copy)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> (4th copy)</b>.[extension]</TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>A 4th copy of login created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 6</B></TD>
  <TD><B>Login</B></TD>
  <TD><B>jsp~</B></TD>
  <TD>[Filename].[extension]<b>~</b></TD>
  <TD><b>Linux</b> (Verified: Fedora 11)</TD>
  <TD>A temporary backup file of login created in linux (fedora/redhat/centOS)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 7</B></TD>
  <TD><B>Copy of Login</B></TD>
  <TD><B>.jsp</B></TD>
  <TD><b>Copy of </b>[Filename].[extension]</TD>
  <TD><b>Windows XP</b></TD>
  <TD>An initial copy of login created in windows XP</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 8</B></TD>
  <TD><B>Copy (2) of Login</B></TD>
  <TD><B>jsp</B></TD>
  <TD><b>Copy (2)</b> of [Filename].[extension]</TD>
  <TD><b>Windows XP</b></TD>
  <TD>A secondary copy of login created in windows XP</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 9</B></TD>
  <TD><B>Copy of Copy of Login</B></TD>
  <TD><B>jsp</B></TD>
  <TD><b>Copy of </b>[Filename].[extension]</TD>
  <TD><b>Windows XP</b></TD>
  <TD>A copy to the copy of login created in windows XP</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 10</B></TD>
  <TD><B>Login - Copy</B></TD>
  <TD><B>.jsp</B></TD>
  <TD>[Filename]<b> - Copy</b>.[extension]</TD>
  <TD><b>Windows 7</b></TD>
  <TD>An initial copy of login created in windows 7</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 11</B></TD>
  <TD><B>Login - Copy (2)</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> - Copy (2)</b>.[extension]</TD>
  <TD><b>Windows 7</b></TD>
  <TD>A secondary copy of login created in windows 7</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 12</B></TD>
  <TD><B>Login - Copy - Copy</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b> - Copy</b>.[extension]</TD>
  <TD><b>Windows 7</b></TD>
  <TD>A copy to the copy of login created in windows 7</TD>
  </TR> 
  </TABLE>
  <BR>
  
  
  <H2>Copied Directories</H2>
    
  <a href="private/">Directory I: /private/</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>Directory Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 13</B></TD>
  <TD><B>private (copy)</B></TD>
  <TD><B></B></TD>
  <TD>[directory name]<b> (copy)</b></TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>An initial copy of the "private" directory created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 14</B></TD>
  <TD><B>private - Copy</B></TD>
  <TD><B></B></TD>
  <TD>[directory name]<b> - Copy</b></TD>
  <TD><b>Windows 7</b></TD>
  <TD>An initial copy of the "private" directory created in Windows 7</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 15</B></TD>
  <TD><B>Copy of private</B></TD>
  <TD><B></B></TD>
  <TD><b>Copy of </b>[directory name]</TD>
  <TD><b>Windows XP</b></TD>
  <TD>An initial copy of the "private" directory created in Windows XP</TD>
  </TR>
  </TABLE>
  <BR>

  <H2>Copied Technology Specific Protected Directories</H2>
  This section <b>intentionally</b> focuses only on the simplest <b>Java</b> web application files/directories.<BR>
  The copied directories and their (web.xml in this example) content should be accessible from the web, unlike the content of the original protected directories.<br>
  <b>Verify by accessing [dir-name]/web.xml - the web server may not return 403 responses for directory root access. </b><br>
  <br>  
  <a href="/wavsep/WEB-INF/">Directory I: /wavsep/WEB-INF/</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>Directory Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 16</B></TD>
  <TD><B>WEB-INF (copy)</B></TD>
  <TD><B></B></TD>
  <TD>WEB-INF<b> (copy)</b></TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>An initial copy of the "WEB-INF" directory created in Linux (mint/fedora/ubuntu)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 17</B></TD>
  <TD><B>WEB-INF - Copy</B></TD>
  <TD><B></B></TD>
  <TD>WEB-INF<b> - Copy</b></TD>
  <TD><b>Windows 7</b></TD>
  <TD>An initial copy of the "WEB-INF" directory created in Windows 7</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 18</B></TD>
  <TD><B>Copy of WEB-INF</B></TD>
  <TD><B></B></TD>
  <TD><b>Copy of </b>WEB-INF</TD>
  <TD><b>Windows XP</b></TD>
  <TD>An initial copy of the "WEB-INF" directory created in Windows XP</TD>
  </TR>
  </TABLE>
  <BR>


  
  <H2>Archive Files</H2>
  
  <a href="Login.jsp">File I: Login.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>Compression/OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
 
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 19</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>7z</B></TD>
  <TD>[Filename].[extension]<b>.7z</b></TD>
  <TD><b>Linux</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>7-zip compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 20</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>ar</B></TD>
  <TD>[Filename].[extension]<b>.ar</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>archiver (ar) Unix/Linux utility - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 21</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>bz2</B></TD>
  <TD>[Filename].[extension]<b>.bz2</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>bzip2 compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 22</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>cbz</B></TD>
  <TD>[Filename].[extension]<b>.cbz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>cbz compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 23</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>exe</B></TD>
  <TD>[Filename].[extension]<b>.exe</b></TD>
  <TD><b>Linux/Unix/Windows</b> (Verified: Mint 14/Unbunto 12.04)</TD>
  <TD>self extracting archive EXE file generated in Linux (yes, in Linux)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 24</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>gz</B></TD>
  <TD>[Filename].[extension]<b>.gz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>gzip compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 25</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>jar</B></TD>
  <TD>[Filename].[extension]<b>.jar</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>jar (zip) archive in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 26</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>lzma</B></TD>
  <TD>[Filename].[extension]<b>.lzma</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>lzma compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 27</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar</B></TD>
  <TD>[Filename].[extension]<b>.tar</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar compression in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 28</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar.7z</B></TD>
  <TD>[Filename].[extension]<b>.tar.7z</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/7z compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 29</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar.bz2</B></TD>
  <TD>[Filename].[extension]<b>.tar.bz2</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/bz2 compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 30</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar.gz</B></TD>
  <TD>[Filename].[extension]<b>.tar.gz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/gz compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 31</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar.lzma</B></TD>
  <TD>[Filename].[extension]<b>.tar.lzma</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/lzma compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 32</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>tar.xz</B></TD>
  <TD>[Filename].[extension]<b>.tar.xz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/xz compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 33</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>xz</B></TD>
  <TD>[Filename].[extension]<b>.xz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>xz compressions in Linux - includes original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 34</B></TD>
  <TD><B>Login.jsp</B></TD>
  <TD><B>zip</B></TD>
  <TD>[Filename].[extension]<b>.zip</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>zip compressions in Linux - includes original extension by default</TD>
  </TR>
  </TABLE>
  <BR>
  
  <a href="ContactUs.jsp">File II: ContactUs.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>Compression/OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 35</B></TD>
  <TD><B>ContactUs</B></TD>
  <TD><B>zip</B></TD>
  <TD>[Filename]<b>.zip</b></TD>
  <TD><b>Windows 7/XP</b></TD>
  <TD>zip compression in Windows - does <b>NOT</b> include original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 36</B></TD>
  <TD><B>ContactUs</B></TD>
  <TD><B>rar</B></TD>
  <TD>[Filename]<b>.rar</b></TD>
  <TD><b>Windows 7/XP</b></TD>
  <TD>rar compression in Windows - does <b>NOT</b> include original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 37</B></TD>
  <TD><B>ContactUs</B></TD>
  <TD><B>wim</B></TD>
  <TD>[Filename]<b>.wim</b></TD>
  <TD><b>Windows 7/XP (7-zip Archiver)</b></TD>
  <TD>windows imaging format (wim) in Windows - does <b>NOT</b> include original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 38</B></TD>
  <TD><B>ContactUs</B></TD>
  <TD><B>7z</B></TD>
  <TD>[Filename]<b>.7z</b></TD>
  <TD><b>Windows 7/XP (7-zip Archiver)</b></TD>
  <TD>7-zip compression in Windows - does <b>NOT</b> include original extension by default</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 39</B></TD>
  <TD><B>ContactUs</B></TD>
  <TD><B>tar</B></TD>
  <TD>[Filename]<b>.tar</b></TD>
  <TD><b>Windows 7/XP (7-zip Archiver)</b></TD>
  <TD>tar compression in Windows - does <b>NOT</b> include original extension by default</TD>
  </TR>
  </TABLE>
  <BR>
  
  
  <H2>Archive Directories</H2>
  
  
  <a href="private/">Directory I: /private/</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>Directory Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>Compression/OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
 
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 40</B></TD>
  <TD><B>private</B></TD>
  <TD><B>7z</B></TD>
  <TD>[Directory Name]<b>.7z</b></TD>
  <TD><b>Linux / Windows (7z Archiver)</b> (Verified: Mint 14/Windows XP/Windows 7)</TD>
  <TD>7-zip compression in Windows/Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 41</B></TD>
  <TD><B>private</B></TD>
  <TD><B>zip</B></TD>
  <TD>[Directory Name]<b>.zip</b></TD>
  <TD><b>Linux / Windows</b> (Verified: Mint 14/Windows XP/Windows 7)</TD>
  <TD>zip compression in Windows/Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 42</B></TD>
  <TD><B>private</B></TD>
  <TD><B>rar</B></TD>
  <TD>[Directory Name]<b>.rar</b></TD>
  <TD><b>Windows 7/XP</b></TD>
  <TD>rar compression in Windows</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 43</B></TD>
  <TD><B>private</B></TD>
  <TD><B>wim</B></TD>
  <TD>[Directory Name]<b>.wim</b></TD>
  <TD><b>Windows 7/XP</b></TD>
  <TD>windows imaging format (wim) in Windows</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 44</B></TD>
  <TD><B>private</B></TD>
  <TD><B>war</B></TD>
  <TD>[Application Directory Name]<b>.war</b></TD>
  <TD><b>Any (Java Application Server)</b> (Verified: Mint 14/Windows XP/Windows 7)</TD>
  <TD>Java Web application ARchive file (war)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 45</B></TD>
  <TD><B>private</B></TD>
  <TD><B>ear</B></TD>
  <TD>[Application Directory Name]<b>.ear</b></TD>
  <TD><b>Any (Java EE Server)</b> (Verified: Mint 14/Windows XP/Windows 7)</TD>
  <TD>Java Enterprise ARchive file (ear)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 46</B></TD>
  <TD><B>private</B></TD>
  <TD><B>jar</B></TD>
  <TD>[Directory Name]<b>.jar</b></TD>
  <TD><b>Any (Java)</b> (Verified: Mint 14/Windows XP/Windows 7)</TD>
  <TD>Java ARchive file (jar)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 47</B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar</B></TD>
  <TD>[Directory Name]<b>.tar</b></TD>
  <TD><b>Windows 7/XP (7-zip Archiver)</b></TD>
  <TD>tar compression in Windows</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 48</B></TD>
  <TD><B>private</B></TD>
  <TD><B>ar</B></TD>
  <TD>[Directory Name]<b>.ar</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>archiver (ar) Unix/Linux utility</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 49</B></TD>
  <TD><B>private</B></TD>
  <TD><B>cbz</B></TD>
  <TD>[Directory Name]<b>.cbz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>cbz compression in Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 50</B></TD>
  <TD><B>private</B></TD>
  <TD><B>exe</B></TD>
  <TD>[Directory Name]<b>.exe</b></TD>
  <TD><b>Linux/Unix/Windows</b> (Verified: Mint 14/Unbunto 12.04)</TD>
  <TD>self extracting archive EXE file generated in Linux (yes, in Linux)</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 51</B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar.bz2</B></TD>
  <TD>[Directory Name]<b>.tar.bz2</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/bzip2 compression in Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 52<B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar.gz</B></TD>
  <TD>[Directory Name]<b>.tar.gz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/gzip compression in Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 53</B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar.lzma</B></TD>
  <TD>[Directory Name]<b>.tar.lzma</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/lzma compression in Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 54</B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar.7z</B></TD>
  <TD>[Directory Name]<b>.tar.7z</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/7-zip compression in Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 55</B></TD>
  <TD><B>private</B></TD>
  <TD><B>tar.xz</B></TD>
  <TD>[Directory Name]<b>.tar.xz</b></TD>
  <TD><b>Linux/Unix</b> (Verified: Mint 14/Fedora 11/Unbunto 12.04)</TD>
  <TD>tar/xz compressions in Linux</TD>
  </TR>
  </TABLE>
  <BR>
  
  <H2>Archived Technology Specific Protected Directories</H2>
  This section <b>intentionally</b> focuses only on the simplest <b>Java</b> web application files/directories.<BR>
  The archived directories and their (web.xml in this example) content should be downloadable, unlike the content of the original protected directories.<br>
  <br>  
  <a href="/wavsep/WEB-INF/">Directory I: /wavsep/WEB-INF/</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>Directory Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 56</B></TD>
  <TD><B>WEB-INF</B></TD>
  <TD><B>zip</B></TD>
  <TD>WEB-INF<b>.zip</b></TD>
  <TD><b>Linux/Windows</b> (Verified: Mint 14/Windows 7/Windows XP)</TD>
  <TD>A zip archive of the "WEB-INF" directory created in Windows/Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 57</B></TD>
  <TD><B>WEB-INF</B></TD>
  <TD><B>7z</B></TD>
  <TD>WEB-INF<b>.7z</b></TD>
  <TD><b>Linux/Windows (7-zip Archiver)</b> (Verified: Mint 14/Windows 7/Windows XP)</TD>
  <TD>A 7-zip archive of the "WEB-INF" directory created in Windows/Linux</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 58</B></TD>
  <TD><B>WEB-INF</B></TD>
  <TD><B>rar</B></TD>
  <TD>WEB-INF<b>.rar</b></TD>
  <TD><b>Windows 7/XP</b></TD>
  <TD>A rar archive of the "WEB-INF" directory created in Windows</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 59</B></TD>
  <TD><B>WEB-INF</B></TD>
  <TD><B>tar</B></TD>
  <TD>WEB-INF<b>.tar</b></TD>
  <TD><b>Linux/Windows (7-zip Archiver)</b> (Verified: Mint 14/Windows 7/Windows XP)</TD>
  <TD>A tar archive of the "WEB-INF" directory created in Windows/Linux</TD>
  </TR>
  </TABLE>
  <BR>
  
  
  
  <H2>Backup Files</H2>
  WAVSEP currently covers only relatively common and <b>source code relevant</b> basic test cases, due to the sheer amount and diversity of backup files.<br>
  The commonality of most of the extensions was verified in google (filetype query), and in default scanner configurations.<br>
  Many additional extensions are listed in file-extensions (dot) org under "/filetype/extension/name/backup-files".<br>
  <br>
  <a href="private/inner.jsp">File III: inner.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 60</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>old</B></TD>
  <TD>[Filename]<b>.old</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 61</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>bak</B></TD>
  <TD>[Filename]<b>.bak</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 62</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>bac</B></TD>
  <TD>[Filename]<b>.bac</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 63</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>backup</B></TD>
  <TD>[Filename]<b>.backup</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 64</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>1</B></TD>
  <TD>[Filename]<b>.1</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR> 
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 65</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>a</B></TD>
  <TD>[Filename]<b>.a</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 66</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>inc</B></TD>
  <TD>[Filename]<b>.inc</b></TD>
  <TD><b>Any</b></TD>
  <TD>An include file</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 67</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>include</B></TD>
  <TD>[Filename]<b>.include</b></TD>
  <TD><b>Any</b></TD>
  <TD>An include file</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 68</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.old</B></TD>
  <TD>[Filename].[Extension]<b>.old</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 69</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.bak</B></TD>
  <TD>[Filename].[Extension]<b>.bak</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 70</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.bac</B></TD>
  <TD>[Filename].[Extension]<b>.bac</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 71</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.backup</B></TD>
  <TD>[Filename].[Extension]<b>.backup</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 72</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.1</B></TD>
  <TD>[Filename].[Extension]<b>.1</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR> 
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 73</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp.a</B></TD>
  <TD>[Filename].[Extension]<b>.a</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 74</B></TD>
  <TD><B>old_inner</B></TD>
  <TD><B>jsp</B></TD>
  <TD><b>old_</b>[Filename].[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 75</B></TD>
  <TD><B>inner_old</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename].[Extension]<b>_old</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 76</B></TD>
  <TD><B>bak_inner</B></TD>
  <TD><B>jsp</B></TD>
  <TD><b>bak_</b>[Filename].[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 77</B></TD>
  <TD><B>inner_bak</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b>_bak</b>.[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 78</B></TD>
  <TD><B>backup_inner</B></TD>
  <TD><B>jsp</B></TD>
  <TD><b>backup_</b>[Filename].[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 79</B></TD>
  <TD><B>inner_backup</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b>_backup</b>.[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 80</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp_old</B></TD>
  <TD>[Filename].[Extension]<b>_old</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 81</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspold</B></TD>
  <TD>[Filename].[Extension]<b>old</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 82</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp_bak</B></TD>
  <TD>[Filename].[Extension]<b>_bak</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 83</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspbak</B></TD>
  <TD>[Filename].[Extension]<b>bak</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 84</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jsp_backup</B></TD>
  <TD>[Filename].[Extension]<b>_backup</b></TD>
  <TD><b>Any</b></TD>
  <TD>A backup file of the file "inner.jsp"</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 85</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspinc</B></TD>
  <TD>[Filename].[Extension]<b>inc</b></TD>
  <TD><b>Any</b></TD>
  <TD>An include file</TD>
  </TR>
  </TABLE>
  <BR>
  
  
  <H2>Files with Potentially Non-Executable Technology Specific Extensions</H2>
  This section <b>intentionally</b> focuses only on the simplest <b>Java</b> spcific poentaily non-executable extensions.<BR>
  These files might (if there is some sort of mis-configuration) allow attackers to download the source code stored within them.<br>
  <br>  
 
  <a href="private/inner.jsp">File III: inner.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 86</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspf</B></TD>
  <TD>[Filename]<b>.jspf</b></TD>
  <TD><b>Any</b></TD>
  <TD>A JSP Page Fragment file</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 87</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspx</B></TD>
  <TD>[Filename]<b>.jspx</b></TD>
  <TD><b>Any</b></TD>
  <TD>XML Java Server Page</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 88</B></TD>
  <TD><B>inner</B></TD>
  <TD><B>jspa</B></TD>
  <TD>[Filename]<b>.jspa</b></TD>
  <TD><b>Any</b></TD>
  <TD>Framework JSP Action</TD>
  </TR>
  </TABLE>
  <BR>
  
  
  <H2>Incremental File Names</H2>

  <a href="index.jsp">File IV: index.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 89</B></TD>
  <TD><B>index1</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b>1</b>.[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>Incremental file name</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 90</B></TD>
  <TD><B>index2</B></TD>
  <TD><B>jsp</B></TD>
  <TD>[Filename]<b>2</b>.[Extension]</TD>
  <TD><b>Any</b></TD>
  <TD>Incremental file name</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 91</B></TD>
  <TD><B>index</B></TD>
  <TD><B>jsp1</B></TD>
  <TD>[Filename].[Extension]<b>1</b></TD>
  <TD><b>Any</b></TD>
  <TD>Incremental file extension name</TD>
  </TR>
  <TR>
  <TD bgcolor='#1AC6FF'><B>Case 92</B></TD>
  <TD><B>index</B></TD>
  <TD><B>jsp2</B></TD>
  <TD>[Filename].[Extension]<b>2</b></TD>
  <TD><b>Any</b></TD>
  <TD>Incremental file extension name</TD>
  </TR>

  
  </TABLE>
  <BR>

  
  <H2>Hidden Files</H2>
  
  <a href="private/inner.jsp">File III: inner.jsp</a><br><br>
  
  <TABLE border=1 cellspacing=0 cellpadding=2>
  <TR bgcolor='#1AC6FF'>
  <TD><U><B>#</B></U></TD>
  <TD><U><B>File Name</B></U></TD>
  <TD><U><B>Extension</B></U></TD>
  <TD><U><B>Structure</B></U></TD>
  <TD><U><B>OS</B></U></TD>
  <TD><U><B>Description</B></U></TD>
  </TR>
  
  </TABLE>
  <BR>
  

</body>
</html>
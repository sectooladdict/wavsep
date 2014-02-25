<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Web Application Scanners Detection Accuracy</title>
</head>
<body>
<H2>False Positive Old, Hidden and Unreferenced Files Test Cases</H2>

<a href="custom/index.jsp">Fake Hidden Files - GET - Customized 200 Responses to *Any* Access </a><br><br>

<a href="default/index.jsp">Fake Hidden Files - GET - Default 200 Responses with Content to Any *Invalid* File Access</a><br><br>
&nbsp;&nbsp;<a href="default/index.jsp"> File I: index.jsp </a> 
&nbsp;&nbsp;<a href="default/Login.jsp">File II: Login.jsp</a><br><br>

<a href="dynamic/index.jsp">Fake Hidden Files - GET - Dynamic 200 Responses with Content to Any *Invalid* File Access</a><br><br>

</body>
</html>
<%@page import="org.apache.catalina.connector.Connector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 1 - RXSS via tag injection into the scope of an HTML page (Cookie Input Vector)</title>
</head>
<body>

<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->

<%

String userinput = null;
String cookieName = "userinput";
boolean foundFlag = false;

//Display the cookie, if supplied
Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		if (cookies [i].getName().equals (cookieName)) {
			myCookie = cookies[i];
			foundFlag = true;
			userinput = myCookie.getValue();
			myCookie.getName();
			
			break;
		}
	}
	
	if(foundFlag == false) {
		//Create a cookie, if not supplied
		response.addHeader("Set-Cookie", cookieName + "=EmptyValue; HTTPOnly");
		userinput = "EmptyValue";
	}
}

%>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
	  	    //userinput is populated from cookie 
     		out.println("The reflected value: " + userinput);
	  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
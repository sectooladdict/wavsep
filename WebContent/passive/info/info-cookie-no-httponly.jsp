<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->
<%@ page import="java.util.*" %>
<head>
<title>Info Cookie no HTTPOnly flag (Originally part of ZAP-WAVE)</title>
</head>
<body>
<H2>Setting a cookie without the HTTPOnly flag (Originally part of ZAP-WAVE)</H2>
<H3>Description</H3>
The 'info-cookie-no-http-only' cookie is set without the HTTPOnly flag being set.<br>
This means that the cookie can be accessed by client side scripts, which is usually a bad idea.<br>
Note that some servers may add this flag anyway, depending on their configuration! 
<H3>Example</H3>
<%
	String cookieName = "info-cookie-no-http-only";
	response.setHeader("Set-Cookie", cookieName + "=test");

	// Display the cookie, if supplied
	Cookie cookies [] = request.getCookies ();
	Cookie myCookie = null;
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies [i].getName().equals (cookieName)) {
				myCookie = cookies[i];
				out.println("The cookie '" + cookieName + "' is " + myCookie.getValue() + "<br/><br/>");
				break;
			}
		}
	}
%>

</body>


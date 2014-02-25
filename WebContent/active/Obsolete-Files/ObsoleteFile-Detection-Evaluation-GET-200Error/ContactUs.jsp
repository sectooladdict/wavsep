<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sectooladdict.database.ConnectionPoolManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact page with hard-coded administrative credentials</title>
</head>
<body>

<!-- <%@ include file="include.jsp"%> -->


<%
if (request.getParameter("contact") == null) {
%>
	Contact Us:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="contact" id="contact"><br>
		<input type=submit value="submit">
	</form>
<%
} else {
	
	String contact = request.getParameter("contact");
	
	
	//if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("1234abcd"))
	out.println("Thank you, we will contact your email soon.<br>");
	out.println("<a href='Login.jsp'>Back to Login</a>");
	
} //end of if/else block
%>

</body>
</html>
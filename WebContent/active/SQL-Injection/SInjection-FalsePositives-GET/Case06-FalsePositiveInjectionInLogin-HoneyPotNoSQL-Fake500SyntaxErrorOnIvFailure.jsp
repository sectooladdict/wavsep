<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 6 - False Positive Injection in a Honeypot (login) page that responds with erroneous fake-sql containing 500 HTTP responses to input validation failures</title>
</head>
<body>

<%
if (request.getParameter("username") == null
	&& request.getParameter("password") == null	) {
%>
	Login Page:<br><br>
	<form name="frmInput" id="frmInput" action="Case06-FalsePositiveInjectionInLogin-HoneyPotNoSQL-Fake500SyntaxErrorOnIvFailure.jsp" method="POST">
		<input type="text" name="username" id="username"><br>
		<input type="password" name="password" id="password"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
  	    String username = request.getParameter("username");
  	    String password = request.getParameter("password");
  	    
  	    if (InputValidator.validateAll(username)) {
  	    	throw new SQLException("Invalid Input for SQL");
  	    }
  	    if (InputValidator.validateAll(password)) {
	    	throw new SQLException("Invalid Input for SQL");
	    }

 		out.println("login failed");
 	 	
	  	out.flush();
	  	
    } catch (SQLException e) {
        response.sendError(500,"Exception SQL MySQL SQL Server Oracle Invalid Syntax why did the monkey fell out of the tree?" + e);
    } catch (Exception e) {
        response.sendError(500,"Exception SQL MySQL SQL Server Oracle Invalid Syntax why did the monkey fell out of the tree?" + e);
    }
} //end of if/else block
%>

</body>
</html>
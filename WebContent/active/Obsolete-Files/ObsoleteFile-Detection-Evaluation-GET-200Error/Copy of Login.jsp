<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sectooladdict.database.ConnectionPoolManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page with hard-coded administrative credentials</title>
</head>
<body>

<!-- <%@ include file="include.jsp"%> -->


<%
if (request.getParameter("username") == null
	&& request.getParameter("password") == null	) {
%>
	Login Page:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="username" id="username"><br>
		<input type="password" name="password" id="password"><br>
		<input type=submit value="submit">
	</form>
<%
} else {
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("1234abcd")) {
		out.println("hello admin <br>");
		out.println("<a href='private/inner.jsp'>system status</a>");
	} else {
		Connection conn = null;
    	try {
        	conn = ConnectionPoolManager.getConnection();

 	    	String SqlString = 
	            "SELECT username, password " +
 	        	"FROM users " +
 	        	"WHERE username = ? AND password = ? ";
 			PreparedStatement pstmt = conn.prepareStatement(SqlString);
 			pstmt.setString(1, username);
 			pstmt.setString(2, password);
 			
 			ResultSet rs = pstmt.executeQuery();
 		 
 			if(rs.next()) {
	 			out.println("hello " + rs.getString(1) + "<br>");
	 			out.println("<a href='private/inner.jsp'>system status</a>");
 	    	} else {
	 	 		out.println("login failed");
 	 		}
 	 	
	  		out.flush();
	  		if(conn != null) {
	        	ConnectionPoolManager.closeConnection(conn);
        	}
    	} catch (Exception e) {
	        out.println("Exception details: " + e);
        	if(!(e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException)) {
	  	        System.out.println("Exception details: " + e);
        	} 
        	if(conn != null) {
	        	ConnectionPoolManager.closeConnection(conn);
        	}
    	} //end of inner try-catch
    	
	} //end of middle if/else block
} //end of if/else block
%>

</body>
</html>
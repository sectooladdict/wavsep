<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 1 - Injection into string values in a login page with different valid responses</title>
</head>
<body>

<%
if (request.getParameter("username") == null
	&& request.getParameter("password") == null	) {
%>
	Login Page:<br><br>
	<form name="frmInput" id="frmInput" action="Case01-InjectionInLogin-String-LoginBypass-WithDifferent200Responses.jsp" method="POST">
		<input type="text" name="username" id="username"><br>
		<input type="password" name="password" id="password"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String username = request.getParameter("username");
  	    String password = request.getParameter("password");

  	  	conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

 	    String SqlString = 
            "SELECT username, password " +
 	        "FROM users " +
 	        "WHERE username='" + username + "'" +
 	        " AND password='" + password + "'";
 		Statement stmt = conn.createStatement();
 		ResultSet rs = stmt.executeQuery(SqlString);
 		 
 		if(rs.next()) {
 			out.println("hello " + rs.getString(1));
 	    } else {
 	 		out.println("login failed");
 	 	}
 	 	
	  	out.flush();
	  	
	  	if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
    } catch (Exception e) {
        out.println("Information is unavailable");
        
        if(!(e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException)) {
  	        System.out.println("Exception details: " + e);
        } 

		if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
    }
} //end of if/else block
%>

</body>
</html>
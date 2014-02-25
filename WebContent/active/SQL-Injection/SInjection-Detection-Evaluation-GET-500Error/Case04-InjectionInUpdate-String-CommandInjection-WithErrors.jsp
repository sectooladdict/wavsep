<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 4 - Injection into string values in an update page with erroneous responses</title>
</head>
<body>

<%
if (request.getParameter("msg") == null) {
%>
	Update Your Message:<br><br>
	<form name="frmInput" id="frmInput" action="Case04-InjectionInUpdate-String-CommandInjection-WithErrors.jsp" method="POST">
		<input type="text" name="msg" id="msg"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String msg = request.getParameter("msg");

  	    conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

 	    String SqlString = 
            "UPDATE messages " +
 	        "SET message='" + msg + "' " +
 	        "WHERE msgid=1";
 		Statement stmt = conn.createStatement();
 		int result = stmt.executeUpdate(SqlString);
 		 
 		out.println("Query executed");
	  	out.flush();
	  	
	  	if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
	  	
    } catch (Exception e) {
        response.sendError(500,"Exception details: " + e);
        
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
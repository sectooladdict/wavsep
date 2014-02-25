<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 19 - Injection into numeric values in an update page with erroneous responses and quote validation</title>
</head>
<body>

<%
if (request.getParameter("msgid") == null) {
%>
	Update Message Number:<br><br>
	<form name="frmInput" id="frmInput" action="Case19-InjectionInUpdate-NumericWithoutQuotes-CommandInjection-With200Errors.jsp" method="POST">
		<input type="text" name="msgid" id="msgid" value="1"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String msgid = request.getParameter("msgid");

  	    if (InputValidator.validateQuotes(msgid)) {
  	    	out.println("Invalid Input");
  	    }
  	    else {
  	  	    conn = ConnectionPoolManager.getConnection();
     
  	  	    System.out.print("Connection Opened Successfully\n");

 	    	String SqlString = 
	            "UPDATE messages " +
 	        	"SET message='Hello World' " +
 	        	"WHERE msgid=" + msgid;
 			Statement stmt = conn.createStatement();
 			int result = stmt.executeUpdate(SqlString);
 		 
 			out.println("Query executed");
 		
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
    }
} //end of if/else block
%>

</body>
</html>
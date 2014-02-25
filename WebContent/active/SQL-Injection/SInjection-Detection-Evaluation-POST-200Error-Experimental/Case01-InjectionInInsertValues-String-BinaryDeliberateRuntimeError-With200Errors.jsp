<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Random" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 1 - Injection into string values in an insert (values) statement with erroneous responses</title>
</head>
<body>

<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->

<%
if (request.getParameter("msg") == null || request.getParameter("target") == null ) {
%>
	Send a New Message:<br><br>
	<form name="frmInput" id="frmInput" method="POST">
		Message Text: <input type="text" name="msg" id="msg" value="readme"><br>
		Target Email: <input type="text" name="target" id="target" value="a@a.com"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String msg = request.getParameter("msg");
  	    String target = request.getParameter("target");

  	    conn = ConnectionPoolManager.getConnection();
  	    
  	    System.out.print("Connection Opened Successfully\n");
  	    
  	    //generate a random table name number, as a foundation 
  	    //for databases without a connection pool.
  	    //Should be replaced by something more sophisticated in future versions.
  	  	Random generator = new Random(48394592);
  	  	Long tempTableAppendix = generator.nextLong();
  	    if(tempTableAppendix < 0) {
  	    	tempTableAppendix = tempTableAppendix * -1;
  	    }
  	  	
  	  	//create a temporary table for the connection (close=remove)
  	    String SqlString = "CREATE TEMPORARY TABLE IF NOT EXISTS " +
  	    				   "tblInjection" + tempTableAppendix +
  	    				   "(msg VARCHAR(50),target VARCHAR(100));";
  	    Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate(SqlString);
			    
		//injectable insert (values) statement
		//can be exploited in several, including deliberate runtime payloads:
		//'+(select 'b' from users where username='admin')+'
 	    SqlString = 
 	    	"INSERT INTO tblInjection" + tempTableAppendix + "(msg,target) " +
 	    	"VALUES('" + msg + "','" + target + "')";
 		stmt = conn.createStatement();
 		result = stmt.executeUpdate(SqlString);
 		
 		out.println("Query executed");
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
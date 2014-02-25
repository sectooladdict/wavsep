<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 2 - Injection into a string value in a private resource view page with default valid response on exception</title>
</head>
<body>


<%
if (request.getParameter("username") == null) {
%>
	Search Users:<br><br>
	<form name="frmInput" id="frmInput" action="Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<input type="text" name="username" id="username" value="user1"><br>
		<input type=submit value="submit">
	</form><br>
	
	Search Users:<br><br>
	<form name="frmInput2" id="frmInput2" action="Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<input type="text" name="username" id="username" value="david"><br>
		<input type=submit value="submit">
	</form><br>
<%
} 
else {  	    
	Connection conn = null;
	
    long defaultUserId = 0;
    String defaultUserName = null;
    
    try {
    	String username = request.getParameter("username");

    	conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");
        
      //restrict the output presented to the first user output
 	    String SqlString = 
 	    	"SELECT userid, username " +
 	        "FROM users " +
 	        "WHERE username='user1'";
 		Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(SqlString);
        
		while(rs.next()) {
			defaultUserId = rs.getLong(1);
			defaultUserName = rs.getString(2);
 	    } 
		
 		out.println("The list of users:");
 		out.println("<TABLE>"); 		
 		out.println("<TR>");
		out.println("<TD>");
		out.println("<B>");
		out.println("UserId");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("UserName");
		out.println("</B>");
		out.println("</TD>");
		out.println("</TR>");
		
		//restrict the output presented to the first user output
 	    SqlString = 
 	    	"SELECT userid, username " +
 	        "FROM users " +
 	        "WHERE username='" + username + "'";
 		stmt = conn.createStatement();
        rs = stmt.executeQuery(SqlString);
        
 		while(rs.next()) {
 			
 		    out.println("<TR>");
 		    out.println("<TD>");
 			out.println(rs.getLong(1));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getString(2));
 			out.println("</TD>");
 			out.println("</TR>");
 	    } 
 		out.println("</TABLE>");
 	 	
	  	out.flush();
	  	
	  	if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
	  	
    } catch (Exception e) {
		out.println("<TR>");
 		out.println("<TD>");
 		out.println(defaultUserId);
 		out.println("</TD>");
 		out.println("<TD>");
 		out.println(defaultUserName);
 		out.println("</TD>");
 		out.println("</TR>");
    	out.println("</TABLE>");
    	
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 11 - Injection into a date value in a private resource view page with erroneous responses</title>
</head>
<body>

<%
if (request.getParameter("transactionDate") == null) {
%>
	View Transactions in the Follwing Date (YYYY-MM-DD):<br><br>
	<form name="frmInput" id="frmInput" action="Case11-InjectionInView-Date-PermissionBypass-WithErrors.jsp" method="POST">
		<input type="text" name="transactionDate" id="transactionDate" value="2010-01-01"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
	
    try {
  	    String date = request.getParameter("transactionDate");    
  	    String currentUserId="1";

  	    conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

      //restrict the output presented to the first user output
 	    String SqlString = 
 	    	"SELECT transactionId, sum, description, transactionDate " +
 	        "FROM transactions " +
 	        "WHERE transactionDate='" + date + "'" +
 	        " AND userId=" + currentUserId;
 		Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(SqlString);
 		
 		out.println("The list of transactions:");
 		out.println("<TABLE>"); 		
 		out.println("<TR>");
		out.println("<TD>");
		out.println("<B>");
		out.println("transactionId");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("sum");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("description");
		out.println("</B>");
		out.println("</TD>");
		out.println("<TD>");
		out.println("<B>");
		out.println("transactionDate");
		out.println("</B>");
		out.println("</TD>");
		out.println("</TR>");
		
 		while(rs.next()) {
 			
 		    out.println("<TR>");
 		    out.println("<TD>");
 			out.println(rs.getLong(1));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getLong(2));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getString(3));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getDate(4));
 			out.println("</TD>");
 			out.println("</TR>");
 	    } 
 		out.println("</TABLE>");
 	 	
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
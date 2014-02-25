<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 3 - Injection into a date value in a private resource view page with default valid response on exception</title>
</head>
<body>


<%
if (request.getParameter("transactionDate") == null) {
%>
	Search Transaction by Date (YYYY-MM-YY):<br><br>
	<form name="frmInput" id="frmInput" action="Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<input type="text" name="transactionDate" id="transactionDate" value=2010-01-01><br>
		<input type=submit value="submit">
	</form><br>
	
	Search Transaction by Date (YYYY-MM-YY):<br><br>
	<form name="frmInput2" id="frmInput2" action="Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<input type="text" name="transactionDate" id="transactionDate" value=2010-02-02><br>
		<input type=submit value="submit">
	</form><br>
	
<%
} 
else {  	   
	Connection conn = null;
	
    long defaultTransId = 0;
    long defaultTransSum = 0;
    
    try {
    	String transactionDate = request.getParameter("transactionDate");

    	conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");
        
      //restrict the output presented to the first user output
 	    String SqlString = 
 	    	"SELECT transactionId, sum " +
 	        "FROM transactions " +
 	        "WHERE transactionDate='2010-01-01' " +
 	        "LIMIT 1";
 		Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(SqlString);
        
		while(rs.next()) {
			defaultTransId = rs.getLong(1);
			defaultTransSum = rs.getLong(2);
 	    } 
		
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
		out.println("Sum");
		out.println("</B>");
		out.println("</TD>");
		out.println("</TR>");
		
		//restrict the output presented to the first user output
		SqlString = 
 	    	"SELECT transactionId, sum " +
 	        "FROM transactions " +
 	        "WHERE transactionDate='" + transactionDate + "' " +
 	        "LIMIT 1";

 		stmt = conn.createStatement();
        rs = stmt.executeQuery(SqlString);
        
 		while(rs.next()) {
 			
 		    out.println("<TR>");
 		    out.println("<TD>");
 			out.println(rs.getLong(1));
 			out.println("</TD>");
 		    out.println("<TD>");
 			out.println(rs.getLong(2));
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
 		out.println(defaultTransId);
 		out.println("</TD>");
 		out.println("<TD>");
 		out.println(defaultTransSum);
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
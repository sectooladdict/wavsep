<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 1 - Injection into a numeric value in a private resource view page with default valid response on exception</title>
</head>
<body>

<%
if (request.getParameter("transactionId") == null) {
%>
	Select a Transaction to View:<br><br>
	<form name="frmInput" id="frmInput" action="Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<SELECT name="transactionId" id="transactionId">
			<option value="132" selected="selected">132</option>
		</SELECT>
		<br>
		<input type=submit value="submit">
	</form><br>
	
	Select a Transaction to View:<br><br>
	<form name="frmInput2" id="frmInput2" action="Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp" method="POST">
		<SELECT name="transactionId" id="transactionId">
			<option value="133" selected="selected">133</option>
		</SELECT>
		<br>
		<input type=submit value="submit">
	</form>
	
	
<%
} 
else {
	Connection conn = null;
	
    long defaultLong1 = 0;
    long defaultLong2 = 0;
    String defaultString = null;
    java.sql.Date defaultDate = null;
    
    try {
  	    String transactionId = request.getParameter("transactionId");

  	    conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

        //restrict the output presented to the first user output
 	    String SqlString = 
 	    	"SELECT transactionId, sum, description, transactionDate " +
 	        "FROM transactions " +
 	        "WHERE transactionId=132";
 		Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(SqlString);
        
		while(rs.next()) {
			defaultLong1 = rs.getLong(1);
			defaultLong2 = rs.getLong(2);
			defaultString = rs.getString(3);
			defaultDate = rs.getDate(4);
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
		
		//restrict the output presented to the first user output
 	    SqlString = 
 	    	"SELECT transactionId, sum, description, transactionDate " +
 	        "FROM transactions " +
 	        "WHERE transactionId=" + transactionId;
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
 		out.println("<TR>");
 		out.println("<TD>");
 		out.println(defaultLong1);
 		out.println("</TD>");
 		out.println("<TD>");
 		out.println(defaultLong2);
 		out.println("</TD>");
 		out.println("<TD>");
 		out.println(defaultString);
 		out.println("</TD>");
 		out.println("<TD>");
 		out.println(defaultDate);
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
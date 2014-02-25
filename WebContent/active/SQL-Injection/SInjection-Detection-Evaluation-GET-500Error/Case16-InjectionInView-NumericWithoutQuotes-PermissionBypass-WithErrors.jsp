<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 16 - Injection into a numeric value in a private resource view page with erroneous responses and quote validation</title>
</head>
<body>

<%
if (request.getParameter("transactionId") == null) {
%>
	Select a Transaction to View:<br><br>
	<form name="frmInput" id="frmInput" action="Case16-InjectionInView-NumericWithoutQuotes-PermissionBypass-WithErrors.jsp" method="POST">
		<SELECT name="transactionId" id="transactionId">
			<option value="1" selected="selected">1</option>
		</SELECT>
		<br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String transactionId = request.getParameter("transactionId");    
  	    String currentUserId="1";

  	    if (InputValidator.validateQuotes(transactionId)) {
  	    	out.println("Invalid Input");
  	    }
  	    else {
  	    	conn = ConnectionPoolManager.getConnection();
     
            System.out.print("Connection Opened Successfully\n");

            //restrict the output presented to the first user output
     	    String SqlString = 
     	    	"SELECT transactionId, sum, description, transactionDate " +
     	        "FROM transactions " +
     	        "WHERE transactionId=" + transactionId +
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
 	 	 	
  	    } //end of if-else block

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
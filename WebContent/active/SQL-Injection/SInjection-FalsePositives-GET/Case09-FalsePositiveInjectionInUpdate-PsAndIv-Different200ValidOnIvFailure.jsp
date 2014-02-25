<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.sectooladdict.database.ConnectionPoolManager" %>
<%@ page import="com.sectooladdict.validators.InputValidator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 9 - False Positive Injection in an update page that responds with different 200 HTTP responses to input validation failures</title>
</head>
<body>

<%
if (request.getParameter("transactionDate") == null) {
%>
	Update The Description of Transactions in the Following Date:<br><br>
	<form name="frmInput" id="frmInput" action="Case09-FalsePositiveInjectionInUpdate-PsAndIv-Different200ValidOnIvFailure.jsp" method="POST">
		<input type="text" name="transactionDate" id="transactionDate" value="2010-02-02"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
	Connection conn = null;
    try {
  	    String transactionDate = request.getParameter("transactionDate");

  	    if (InputValidator.validateQuotes(transactionDate)) {
  	    	throw new Exception("Invalid Input");
  	    }
  	    if (InputValidator.validateSemicolon(transactionDate)) {
	    	throw new Exception("Invalid Input");
	    }
  	    
  	  	conn = ConnectionPoolManager.getConnection();
     
        System.out.print("Connection Opened Successfully\n");

 	    String SqlString = 
            "UPDATE transactions " +
 	        "SET description='Hello World' " +
 	        "WHERE transactionDate=?";
 		PreparedStatement pstmt = conn.prepareStatement(SqlString);
 		pstmt.setDate(1,java.sql.Date.valueOf(transactionDate));
 		int result = pstmt.executeUpdate();
 		 
 		out.println("Query executed");
 		
 		if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
	  	out.flush();
    } catch (Exception e) {

    	if(!(e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException)) {
  	        System.out.println("Exception details: " + e);
    	} 
    	if(conn != null) {
        	ConnectionPoolManager.closeConnection(conn);
        }
        out.println("Update failed");
    }
} //end of if/else block
%>

</body>
</html>
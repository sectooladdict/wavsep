<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 31 - RXSS via tag injection into the scope of an HTML page (during an exception)</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case31-Tag2HtmlPageScopeDuringException.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
	  	    String userinput = request.getParameter("userinput");
	  	    if (userinput.contains("'")) {
	  	    	throw new Exception("The value "
	  	    		+ userinput + " is invalid");
	  	    }
	  	    out.println("The value is valid");
	    	out.flush();
	  	    
    } catch (Exception e) {
    	//response.sendError(500,"Exception details: " + e);
    	out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
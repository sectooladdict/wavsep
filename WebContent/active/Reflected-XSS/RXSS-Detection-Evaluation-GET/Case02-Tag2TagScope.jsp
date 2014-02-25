<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 2 - RXSS via tag injection into the scope of an HTML tag</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case02-Tag2TagScope.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
	  	    String userinput = request.getParameter("userinput"); 
     		out.println("<TEXTAREA>The reflected value: " + userinput + "</TEXTAREA>");
	  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
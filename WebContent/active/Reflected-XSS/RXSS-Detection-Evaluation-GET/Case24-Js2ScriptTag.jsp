<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sectooladdict.encoders.HtmlEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 24 - RXSS via Javascript injection into the scope of a script tag (Javascript, No String Delimiter)</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case24-Js2ScriptTag.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {	
    try {
	  	    String userinput = request.getParameter("userinput"); 
	  	    //only encode Angle brackets, single quotes and double quotes
	  	    userinput = HtmlEncoder.htmlEncodeAngleBracketsAndQuotes(userinput);
     		out.println("<script language='javascript'>\n"
     			+ "var orderId = " + userinput + ";\n" 
     			+ " alert('Order Number ' + orderId + ' Was Approved');\n"
     			+ "</script> ");
	  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sectooladdict.encoders.HtmlEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 3 - False Positive RXSS - encoded (double quotes, equality sign and angle brackets) input relfection into an HTML property </title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case03-DoubleQuotesEqualityAndBracketsEncodingInProperty.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
	  	    String userinput = request.getParameter("userinput");
	  	    userinput = HtmlEncoder.htmlEncodeAngleBracketsAndDoubleQuotes(userinput);
	  	    userinput = HtmlEncoder.htmlEncodeEqualitySign(userinput);
     		out.println("<input type=\"text\" value=\"The reflected value: " + userinput +"\">");
	  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
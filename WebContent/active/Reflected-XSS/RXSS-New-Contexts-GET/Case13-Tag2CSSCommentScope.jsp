<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 13 - RXSS via tag injection into the scope of a CSS quoted string</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case13-Tag2CSSCommentScope.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
%>
	<style>
	<% out.print("/* this appends _link after any <a> tag. " + request.getParameter("userinput") + " */"); %>
	a::after {
  		content: "_link";
	}
	</style>
	
	<a href="#">Empty Link </a>	

<%
} //end of if/else block
%>

</body>
</html>

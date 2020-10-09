<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 9 - RXSS via tag injection into the scope of a JavaScript code</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case09-Tag2HtmlJavaScriptCodeScope.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
%>
	
    <script>
	function myFunction(p1) {
  		return p1.toString();
	}
	var input = myFunction(<% out.print(request.getParameter("userinput")); %>);
	var foo = input;
	</script>
<%
} //end of if/else block
%>

</body>
</html>

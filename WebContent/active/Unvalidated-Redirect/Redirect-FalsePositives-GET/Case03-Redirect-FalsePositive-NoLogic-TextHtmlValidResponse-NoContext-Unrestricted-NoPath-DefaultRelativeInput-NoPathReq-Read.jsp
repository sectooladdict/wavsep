<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>False Positive Unvalidated Redirect Test Case</title>
</head>
<body>
<%@ include file="include.jsp"%>

<%
 String baseURL = FileConstants.HTTP_PREFIX + request.getServerName() + ":" + request.getServerPort() 
 				  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
 String baseUrlWithoutProtocol = request.getServerName() + ":" + request.getServerPort() 
  + request.getContextPath() + (contextRelativeDirPath.replace("index.jsp",""));
%>

	<%
	   if (request.getParameter("target") == null) {
	%>

	Show Log:
	<br>
	<br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="target" id="target"
			value="<%=FileConstants.DEFAULT_TARGET_FILE%>"><br> <input type=submit
			value="Get It!">
	</form>
	
	<% } %>

</body>
</html>
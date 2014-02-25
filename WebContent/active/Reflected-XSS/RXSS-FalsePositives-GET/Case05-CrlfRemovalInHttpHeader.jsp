<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.sectooladdict.encoders.HtmlEncoder" %>
<%
if (request.getParameter("userinput") != null) {
    try {
    	//the servlet/JSP implementation of tomcat (version 6.0.x+)
    	//should not be vulnerable to CrLf injection
  	    String userinput = request.getParameter("userinput");
  	    userinput = HtmlEncoder.htmlEncodeCrLf(userinput);
  	    response.addHeader("Server-Info", userinput);
  	  	Cookie cookie = new Cookie("parameter", userinput);
  	    cookie.setMaxAge(0);
  	    response.addCookie(cookie);
  	  	
 		out.println("Empty Page");
  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} 
else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 5 - False Positive RXSS - input relfection (after CrLf removal) into the scope of an HTTP header/cookie </title>
</head>
<body>

	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case05-CrlfRemovalInHttpHeader.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>

</body>
</html>
<%
} //end of if/else block
%>


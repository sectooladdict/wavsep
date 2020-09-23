<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 32 - RXSS via tag injection into the scope of an HTML page (Viewstate Required)</title>
</head>
<body>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case32-Tag2HtmlPageScopeValidViewstateRequired.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUENTM4MWRkhsjF+62gWnhYUcEyuRwTHxGDVzA=" /> 
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
	  	    String userinput = request.getParameter("userinput");
	  	    String viewstate = request.getParameter("__VIEWSTATE");
	  	    viewstate = viewstate.replace("+"," ");
	  	    if (viewstate.equals("/wEPDwUENTM4MWRkhsjF 62gWnhYUcEyuRwTHxGDVzA=")) {
	  	    	out.println("The reflected value: " + userinput);
		  	    out.flush();
	  	    } else {
	  	        response.sendError(500,"Invalid Viewstate");
	  	    }
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
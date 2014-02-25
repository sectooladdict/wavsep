<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 4 - RXSS via tag injection into the scope of an HTML page that requires an expiring one-use session stored AntiCSRF token</title>
</head>
<body>

<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->

<%
if (request.getParameter("userinput") != null) {
    try {
    		
    	
    		String inputAntiCSRF = request.getParameter("newAnticsrfToken");
    		if(inputAntiCSRF != null) {
    			if(inputAntiCSRF.equals(request.getSession().getAttribute("newAnticsrfToken"))){
    				String userinput = request.getParameter("userinput"); 
    	     		out.println("The reflected value: " + userinput);
    		  	    out.flush();
    			}
    		}
	  	    
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
}

String newAnticsrfToken = "" + Math.random();
request.getSession().setAttribute("newAnticsrfToken", newAnticsrfToken);

if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" method="GET">
		<input type="text" name="userinput" id="userinput"><br>
		<input type="hidden" name="newAnticsrfToken" id="newAnticsrfToken" value=<%=newAnticsrfToken%>><br>
		<input type=submit value="submit">
	</form>

<%} //end of if/else block %>

</body>
</html>
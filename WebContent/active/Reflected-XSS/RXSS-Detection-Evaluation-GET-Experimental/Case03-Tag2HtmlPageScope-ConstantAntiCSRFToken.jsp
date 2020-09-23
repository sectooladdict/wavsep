<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 3 - RXSS via tag injection into the scope of an HTML page that requires a constant session stored AntiCSRF token</title>
</head>
<body>

<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->

<%
String anticsrf = (String)request.getSession().getAttribute("anticsrf");
if(anticsrf == null) {
	//Generate and store a new token
	anticsrf = "" + Math.random();
	request.getSession().setAttribute("anticsrf", anticsrf);
}
%>

<%
if (request.getParameter("userinput") == null) {
%>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type="hidden" name="anticsrf" id="anticsrf" value=<%=anticsrf%>><br>
		<input type=submit value="submit">
	</form>
<%
} 
else {
    try {
    		
    	
    		String inputAntiCSRF = request.getParameter("anticsrf");
    		if(inputAntiCSRF != null) {
    			if(inputAntiCSRF.equals(request.getSession().getAttribute("anticsrf"))){
    				String userinput = request.getParameter("userinput"); 
    	     		out.println("The reflected value: " + userinput);
    		  	    out.flush();
    			}
    		}
	  	    
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>

</body>
</html>
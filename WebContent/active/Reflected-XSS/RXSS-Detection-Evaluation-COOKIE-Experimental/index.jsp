<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Reflected XSS Detection Accuracy - HTTP Cookie Input Vector - Experimental</title>
</head>
<body>

<%
	String anticsrf = (String)request.getSession().getAttribute("anticsrf");
	if(anticsrf == null) {
		//Generate and store a new token
		anticsrf = "" + Math.random();
		request.getSession().setAttribute("anticsrf", anticsrf);
	}

String cookieName = "userinput";
boolean foundFlag = false;

Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null) {
	for (int i = 0; i < cookies.length; i++) {
		if (cookies [i].getName().equals (cookieName)) {		
			foundFlag = true;
			break;
		}
	}
	if(foundFlag == false) {
		//Create a cookie, if not supplied
		response.addHeader("Set-Cookie", cookieName + "=EmptyValue; HTTPOnly");
	}
}

%>

<font size="5">Test Cases:</font><br><br>

<B><a href="Case01-Tag2HtmlPageScope.jsp?userinput=textvalue">Case01-Tag2HtmlPageScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML page.<br>
  <U>Barriers:</U><br>
  None (Cookie)<br>
  <U>Sample Exploit Structures:</U><br>
  &lt;script&gt;[exploit code]&lt;/script&gt;<br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples:</U><br>
  Exploit: &#60;script&#62;document&#46;title&#61;&#34;Exploit&#34;&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
  
</body>
</html>

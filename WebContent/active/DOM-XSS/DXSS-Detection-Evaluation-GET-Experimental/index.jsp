<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of Reflected XSS Detection Accuracy - HTTP GET Method</title>
</head>
<body>
<font size="5">Test Cases:</font><br><br>
<B><a href="Case01-InjectionDirectlyInToDomXssSinkEval.jsp?userinput=textvalue">Case01-InjectionDirectlyInToDomXssSinkEval.jsp</a></B><br>
  JavaScript Injection in DOM XSS Sink eval()<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  <U>Sample Exploit Structures:</U><br>
  [malicious_js]<br>
  <U>Examples:</U><br>
  Exploit: alert(123)<br>
  <br>  
<B><a href="Case02-InjectionDirectlyInToDomXssSinkLocation.jsp?userinput=textvalue">Case02-InjectionDirectlyInToDomXssSinkLocation.jsp</a></B><br>
  JavaScript Injection in DOM XSS Sink document.location<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  <U>Sample Exploit Structures:</U><br>
  javascript:[malicious_js]<br>
  <U>Examples:</U><br>
  Exploit: javascript:alert(123)<br>
  <br>  
<B><a href="Case03-InjectionInToVariableBeingAssignedToDomXssSinkEval.jsp?userinput=textvalue">Case03-InjectionInToVariableBeingAssignedToDomXssSinkEval.jsp</a></B><br>
  JavaScript Injection in Variable being assigned to DOM XSS Sink eval()<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  <U>Sample Exploit Structures:</U><br>
  [malicious_js]<br>
  <U>Examples:</U><br>
  Exploit: alert(123)<br>
  <br>  
<B><a href="Case04-InjectionInToVariableBeingAssignedToDomXssSinkLocation.jsp?userinput=textvalue">Case04-InjectionInToVariableBeingAssignedToDomXssSinkLocation.jsp</a></B><br>
  JavaScript Injection in Variable being assigned to DOM XSS Sink document.location<br>
  (Contributed by the <b>IronWASP project</b>, via Lavakumar Kuppan)<br>
  <U>Barriers:</U><br>
  Partial HTML encoding (angle brackets)<br>
  Partial HTML encoding (double quote)<br>
  Partial HTML encoding (single quote)<br>
  <U>Sample Exploit Structures:</U><br>
  javascript:[malicious_js]<br>
  <U>Examples:</U><br>
  Exploit: javascript:alert(123)<br>
  <br>
<br><br>
</body>
</html>
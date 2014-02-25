<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of SQL Injection False Positive Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<center><font size="5">False Positive Injection Test Cases</font></center><br><br>

<B><a href="Case01-FalsePositiveInjectionInLogin-PsAndIv-500ErrorOnIvFailure.jsp">Case01-FalsePositiveInjectionInLogin-PsAndIv-500ErrorOnIvFailure.jsp</a></B><br>
  False Positive Injection in a login page that responds with erroneous 500 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in 500 errornous responses.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on exceptions (HTTP 500 response)
  that derives from SQL characters might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case02-FalsePositiveInjectionInLogin-PsAndIv-500SyntaxErrorOnIvFailure.jsp">Case02-FalsePositiveInjectionInLogin-PsAndIv-500SyntaxErrorOnIvFailure.jsp</a></B><br>
  False Positive Injection in a login page that responds with erroneous syntax containing 500 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in 500 errornous responses with SQL keywords.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on SQL exceptions (HTTP 500 response)
  that derives from SQL characters might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case03-FalsePositiveInjectionInLogin-PsAndIv-200ErrorOnIvFailure.jsp">Case03-FalsePositiveInjectionInLogin-PsAndIv-200ErrorOnIvFailure.jsp</a></B><br>
  False Positive Injection in a login page that responds with erroneous 200 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in 200 errornous responses.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on exception text (HTTP 200 response)
  that derives from SQL characters might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case04-FalsePositiveInjectionInLogin-PsAndIv-200SyntaxErrorOnIvFailure.jsp">Case04-FalsePositiveInjectionInLogin-PsAndIv-200SyntaxErrorOnIvFailure.jsp</a></B><br>
  False Positive Injection in a login page that responds with erroneous syntax containing 200 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in 200 errornous responses with SQL keywords.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on SQL exception text (HTTP 200 response)
  that derives from SQL characters might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case05-FalsePositiveInjectionInLogin-PsAndIv-Different200ValidOnIvFailure.jsp">Case05-FalsePositiveInjectionInLogin-PsAndIv-Different200ValidOnIvFailure.jsp</a></B><br>
  False Positive Injection in a login page that responds with different valid 200 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in different valid HTTP 200 responses.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely response differentiation
  (that is caused when SQL characters are sent in the input), might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case06-FalsePositiveInjectionInLogin-HoneyPotNoSQL-Fake500SyntaxErrorOnIvFailure.jsp">Case06-FalsePositiveInjectionInLogin-HoneyPotNoSQL-Fake500SyntaxErrorOnIvFailure.jsp</a></B><br>
  False Positive Injection in a Honeypot (login) page that responds with erroneous fake-sql containing 500 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in 500 errornous responses with SQL keywords.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on exceptions (HTTP 500 response),
  SQL or keywords that derives from sending SQL characters might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
  
  <B><a href="Case07-FalsePositiveInjectionInLogin-PsAndIv-500ErrorOnUnrelatedSyntaxError.jsp">Case07-FalsePositiveInjectionInLogin-PsAndIv-500ErrorOnUnrelatedSyntaxError.jsp</a></B><br>
  False Positive Injection in a login page that always responds with erroneous 500 HTTP response since it has an internal unrelated syntax error.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  An unrelated SQL implementation flaw will always throw syntax exceptions upon execution, which result in errornous 500 HTTP responses that contain SQL syntax.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on exceptions (HTTP 500 response)
  with SQL syntax might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Any input <br>
  <br>
  
  <B><a href="Case08-FalsePositiveInjectionInLogin-PsAndIv-200ErrorOnUnrelatedSyntaxError.jsp">Case08-FalsePositiveInjectionInLogin-PsAndIv-200ErrorOnUnrelatedSyntaxError.jsp</a></B><br>
  False Positive Injection in a login page that always responds with erroneous 200 HTTP response since it has an internal unrelated syntax error.<br>
  <U>Barriers:</U><br>
  Quotes, Comments and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  An unrelated SQL implementation flaw will always throw syntax exceptions upon execution, which result in errornous 200 HTTP responses that contain SQL syntax.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on exception text (HTTP 200 response)
  with SQL syntax might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Any input <br>
  <br>
  
  <B><a href="Case09-FalsePositiveInjectionInUpdate-PsAndIv-Different200ValidOnIvFailure.jsp">Case09-FalsePositiveInjectionInUpdate-PsAndIv-Different200ValidOnIvFailure.jsp</a></B><br>
  False Positive Injection in an update page that responds with different 200 HTTP responses to input validation failures.<br>
  <U>Barriers:</U><br>
  Quotes and Semicolon Input Validation<br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  Input validation failures throw exceptions, which result in valid 200 different responses.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on valid 200 reponse differentiation
  (that derives from sending SQL characters), might detect this case as vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' <br>
  SQL Comment Example:  -- <br>
  <br>
 
  <B><a href="Case10-FalsePositiveInjectionInUpdate-PsAndIv-Identical200Response.jsp">Case10-FalsePositiveInjectionInUpdate-PsAndIv-Identical200Response.jsp</a></B><br>
  False Positive Injection in an update page that always responds with an identical 200 response.<br>
  <U>Barriers:</U><br>
  Prepared Statements<br>
  <U>False Leads:</U><br>
  This page will always present an identical 200 response.<br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier Injection identification solely on valid SQL syntax injection
  (and on the lack of exceptions in the process of injecting this input) might find this page vulnerable.<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Any input <br>
  <br>
  
</body>
</html>
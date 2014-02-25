<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of RXSS False Positive Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<center><font size="5">False Positive Reflected XSS Test Cases</font></center><br><br>

<B><a href="Case01-DoubleQuotesAndCrLfEncodingInProperty.jsp?userinput=abcd">Case01-DoubleQuotesAndCrLfEncodingInProperty.jsp</a></B><br>
  Case 1 - False Positive RXSS - encoded (double quotes and CrLf) input relfection into an HTML property.<br>
  <U>Barriers:</U><br>
  Double Quote Encoding (double quote delimiter) <br>
  CrlF Removal <br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTML property, <br>
  after undergoing a partial encoding process (for double quotes and CrLf). <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output context,
  without verifying the encoding status of characters necessary for breaking delimiters (in order to get to execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Bracket Example: &lt;script&gt;alert(document.cookie);&lt;/script&gt; <br>
  Single Quote Example: ' onClick='alert(document.cookie) <br>
  <br>
  
  <B><a href="Case02-SingleQuotesAndCrLfEncodingInProperty.jsp?userinput=abcd">Case02-SingleQuotesAndCrLfEncodingInProperty.jsp</a></B><br>
  Case 2 - False Positive RXSS - encoded (single quotes and CrLf) input relfection into an HTML property.<br>
  <U>Barriers:</U><br>
  Single Quote Encoding (single quote delimiter) <br>
  CrlF Removal <br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTML property, <br>
  after undergoing a partial encoding process (for single quotes and CrLf). <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output context,
  without verifying the encoding status of characters necessary for breaking delimiters (in order to get to execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Bracket Example: &lt;script&gt;alert(document.cookie);&lt;/script&gt; <br>
  Double Quote Example: " onClick="alert(document.cookie) <br>
  <br>
  
  <B><a href="Case03-DoubleQuotesEqualityAndBracketsEncodingInProperty.jsp?userinput=abcd">Case03-DoubleQuotesEqualityAndBracketsEncodingInProperty.jsp</a></B><br>
  Case 3 - False Positive RXSS - encoded (double quotes, equality sign and angle brackets) input relfection into an HTML property.<br>
  <U>Barriers:</U><br>
  Double Quote Encoding (double quote delimiter) <br>
  Equality Sign Encoding <br>
  Angle Brackets Encoding <br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTML property, <br>
  after undergoing a partial encoding process (for double quotes, equality sign and angle brackets). <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output context,
  without verifying the encoding status of characters necessary for breaking delimiters (in order to get to execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Example: javascript:alert(document.cookie) <br>
  <br>
  
  <B><a href="Case04-SingleQuotesEqualityAndBracketsEncodingInProperty.jsp?userinput=abcd">Case04-SingleQuotesEqualityAndBracketsEncodingInProperty.jsp</a></B><br>
  Case 4 - False Positive RXSS - encoded (single quotes, equality sign and angle brackets) input relfection into an HTML property.<br>
  <U>Barriers:</U><br>
  Double Quote (single quote delimiter) <br>
  Equality Sign Encoding <br>
  Angle Brackets Encoding <br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTML property, <br>
  after undergoing a partial encoding process (for single quotes, equality sign and angle brackets). <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output context,
  without verifying the encoding status of characters necessary for breaking delimiters (in order to get to execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Example: javascript:alert(document.cookie) <br>
  <br>
  
  <B><a href="Case05-CrlfRemovalInHttpHeader.jsp?userinput=abcd">Case05-CrlfRemovalInHttpHeader.jsp</a></B><br>
  Case 5 - False Positive RXSS - input relfection (after CrLf removal) into the scope of an HTTP header/cookie.<br>
  <U>Barriers:</U><br>
  CrLf Removal<br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTTP header/cookie, <br>
  after the removal of CrLf characters but without any encoding. <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output string reflection,<br>
  without analyzing the presentation context (or attempting to test characters necessary <br>
  for breaking delimiters in order to get to an execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Example: %0A%0D%0A%0D&lt;script&gt;alert('xss')&lt;/script&gt; <br>
  <br>
  
  <B><a href="Case06-QuotesBracketsAndCrLfEncodingInTextProperty.jsp?userinput=abcd">Case06-QuotesBracketsAndCrLfEncodingInTextProperty.jsp</a></B><br>
  Case 6 - False Positive RXSS - encoded (all quotes and CrLf) input relfection into an HTML property.<br>
  <U>Barriers:</U><br>
  Double & Single Quote Encoding (double quote delimiter) <br>
  Angle Brackets Encoding <br>
  CrlF Removal <br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into an HTML property, <br>
  after undergoing a partial encoding process (for quotes, brackets and CrLf). <br>
  <U>False Detection Potential:</U><br>
  Scanners that base thier injection identification solely on output context,
  without verifying the encoding status of characters necessary for breaking delimiters (in order to get to execution context).<br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Bracket Example: &lt;script&gt;alert(document.cookie);&lt;/script&gt; <br>
  Single Quote Example: ' onClick='alert(document.cookie) <br>
  <br>
  
  <B><a href="Case07-AngleBracketsEncodingInBody.jsp?userinput=abcd">Case07-AngleBracketsEncodingInBody.jsp</a></B><br>
  Case 7 - False Positive RXSS - encoded (angle brackets) input relfection into the HTML body.<br>
  <U>Barriers:</U><br>
  Angle Brackets Encoding<br>
  <U>False Leads:</U><br>
  User-Affected Output is embedded directly into the HTML body, <br>
  after undergoing a partial encoding process (for angle brackets). <br>
  <U>False Detection Potential:</U><br>
  Scanners that don't verify that all the scope-dependent required <br>
  characters are not encoded. <br>
  <U>Sample False Positive Detection Triggers:</U><br>
  Single Quote Example: ' onClick='alert(document.cookie) <br>
  <br>
  
</body>
</html>
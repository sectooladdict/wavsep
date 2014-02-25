<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of SQL Injection Detection Accuracy - HTTP GET Method</title>
</head>
<body>
<center><font size="5">Test Cases - Identical HTTP 200 Responses And Blind Cases</font></center><br><br>

<B><a href="Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp?transactionId=132">Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp - Value 1</a></B><br>
<B><a href="Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp?transactionId=133">Case01-InjectionInView-Numeric-Blind-200ValidResponseWithDefaultOnException.jsp - Value 2</a></B><br>
  Case 1 - Injection into a numeric value in a private resource view page with default valid response on exception.<br>
  <U>Barriers:</U><br>
  Exceptions cause a default value to be displayed (132)<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br> 
  <U>Sample Detection Structure:</U><br>
  <B>Phase 1 - Locate values that change in the responses to identical requests </B><br>
  <B>Phase 2 - obtain the following reponses: </B><br>
  	(1) [Valid Value 1] <br>
  	(2) [Valid Value 2] <br>
  	(3) Invalid Syntax Injection <br>
  	(4) Valid Mathematical Syntax Injection that is Equal to Value 1 <br>
  	    ([Bigger Valid Value]-/+ Diff[Valid Value 1],[Valid Value 2])])<br>
  	(5) Valid Mathematical Syntax Injection that is Equal to Value 2 <br>
  	    ([Bigger Valid Value]-/+ Diff[Valid Value 1],[Valid Value 2])])<br>
  <B>Phase 3 - Ignore values located in phase 1 when comparing responses </B><br>
  <B>Phase 4 - Compare the responses and conclude: </B><br>
  The location should be vulnerable to SQL injection (or other syntax executing injection)
  if the following statement is true:<br>
       (valid value 1 response) != (valid value 2 response) && <br>
       ( (invalid syntax response)!= (valid value 1 response) || <br>
         (invalid syntax response)!= (valid value 2 response) ) && <br>
       (Valid Mathematical Syntax Injection response 1) == [Valid Value 1 response] && <br>
       (Valid Mathematical Syntax Injection response 2) == [Valid Value 2 response] <br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: 1 and exists ([time delay function])[comment][space]<br>
  <U>Examples for Detection Inputs:</U><br>
  Request 1: 132 <br>
  Request 2: 133 <br>
  Request 3: ' <br>
  Request 4: 134-1 <br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 1 and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  
  <B><a href="Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp?username=user1">Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp - Value 1</a></B><br>
  <B><a href="Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp?username=david">Case02-InjectionInView-String-Blind-200ValidResponseWithDefaultOnException.jsp - Value 2</a></B><br>
  Case 2 - Injection into a string value in a private resource view page with default valid response on exception.<br>
  <U>Barriers:</U><br>
  Exceptions cause a default value to be displayed (user1)<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br> 
  <U>Sample Detection Structure:</U><br>
  <B>Phase 1 - Locate values that change in the responses to identical requests </B><br>
  <B>Phase 2 - obtain the following reponses: </B><br>
  	(1) [Valid Value 1] <br>
  	(2) [Valid Value 2] <br>
  	(3) Invalid Syntax Injection <br>
  	    ([Value2]''')<br>
  	(4) Valid Syntax Injection that is Equal to Value 1 <br>
  	    ([Valid Value 1]'[comment][space]<br>
  	     OR [Value 1 Part 1 of 2]'[Concat operator]'[Value 1 Part 2 of 2])<br>
  	(5) Valid Syntax Injection that is Equal to Value 2 <br>  	    
  	     ([Valid Value 2]'[comment][space]<br>
  	     OR [Value 2 Part 1 of 2]'[Concat operator]'[Value 2 Part 2 of 2])<br>
  <B>Phase 3 - Ignore values located in phase 1 when comparing responses </B><br>
  <B>Phase 4 - Compare the responses and conclude: </B><br>
  The location should be vulnerable to SQL injection (or other syntax executing injection)
  if the following statement is true:<br>
       (valid value 1 response) != (valid value 2 response) && <br>
       ( (invalid syntax response)!= (valid value 1 response) || <br>
         (invalid syntax response)!= (valid value 2 response) ) && <br>
       (Valid Syntax Injection response 1) == [Valid Value 1 response] && <br>
       (Valid Syntax Injection response 2) == [Valid Value 2 response] <br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: value' and exists ([time delay function])[comment][space]<br>
  <U>Examples for Detection Inputs:</U><br>
  Request 1: user1 <br>
  Request 2: david <br>
  Request 3: david''' <br>
  Request 4: david'--%20 <br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: user1' and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  <B><a href="Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp?transactionDate=2010-01-01">Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp - Value 1</a></B><br>
  <B><a href="Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp?transactionDate=2010-02-02">Case03-InjectionInView-Date-Blind-200ValidResponseWithDefaultOnException.jsp - Value 2</a></B><br>
  Case 3 - Injection into a date value in a private resource view page with default valid response on exception.<br>
  <U>Barriers:</U><br>
  Exceptions cause a default value to be displayed (user1)<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br> 
  <U>Sample Detection Structure:</U><br>
  <B>Phase 1 - Locate values that change in the responses to identical requests </B><br>
  <B>Phase 2 - obtain the following reponses: </B><br>
  	(1) [Valid Value 1] <br>
  	(2) [Valid Value 2] <br>
  	(3) Invalid Syntax Injection <br>
  	    ([Value2]''')<br>
  	(4) Valid Syntax Injection that is Equal to Value 1 <br>
  	    ([Valid Value 1]'[comment][space])<br>
  	(5) Valid Syntax Injection that is Equal to Value 2 <br>  	    
  	     ([Valid Value 2]'[comment][space])<br>
  <B>Phase 3 - Ignore values located in phase 1 when comparing responses </B><br>
  <B>Phase 4 - Compare the responses and conclude: </B><br>
  The location should be vulnerable to SQL injection (or other syntax executing injection)
  if the following statement is true:<br>
       (valid value 1 response) != (valid value 2 response) && <br>
       ( (invalid syntax response)!= (valid value 1 response) || <br>
         (invalid syntax response)!= (valid value 2 response) ) && <br>
       (Valid Syntax Injection response 1) == [Valid Value 1 response] && <br>
       (Valid Syntax Injection response 2) == [Valid Value 2 response] <br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: [date value]' and exists ([time delay function])[comment][space]<br>
  <U>Examples for Detection Inputs:</U><br>
  Request 1: 2010-01-01 <br>
  Request 2: 2010-02-02 <br>
  Request 3: 2010-02-02''' <br>
  Request 4: 2010-02-02'--%20 <br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 2010-01-01' and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  <B><a href="Case04-InjectionInUpdate-Numeric-TimeDelayExploit-200Identical.jsp?transactionId=895">Case04-InjectionInUpdate-Numeric-TimeDelayExploit-200Identical.jsp</a></B><br>
  Injection into a numeric value in an update page with identical responses.<br>
  <U>Barriers:</U><br>
  Identical Responses<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: 1 and exists ([time delay function])[comment][space]<br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 895 and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  <B><a href="Case05-InjectionInUpdate-String-TimeDelayExploit-200Identical.jsp?description=empty">Case05-InjectionInUpdate-String-TimeDelayExploit-200Identical.jsp</a></B><br>
  Injection into a string value in an update page with identical responses.<br>
  <U>Barriers:</U><br>
  Identical Responses<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: value' and exists ([time delay function])[comment][space]<br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: empty' and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  <B><a href="Case06-InjectionInUpdate-Date-TimeDelayExploit-200Identical.jsp?transactionDate=2010-02-02">Case06-InjectionInUpdate-Date-TimeDelayExploit-200Identical.jsp</a></B><br>
  Injection into a date value in an update page with identical responses.<br>
  <U>Barriers:</U><br>
  Identical Responses<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: [date value]' and exists ([time delay function])[comment][space]<br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 2010-02-02' and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
  <B><a href="Case07-InjectionInUpdate-NumericWithoutQuotes-TimeDelayExploit-200Identical.jsp?transactionId=895">Case07-InjectionInUpdate-NumericWithoutQuotes-TimeDelayExploit-200Identical.jsp</a></B><br>
  Injection into a numeric value in an update page with quote validation and identical responses.<br>
  <U>Barriers:</U><br>
  Identical Responses<br>
  Quote Validation<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: 1 and exists ([time delay function])[comment][space]<br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 895 and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>

  <B><a href="Case08-InjectionInUpdate-DateWithoutQuotes-TimeDelayExploit-200Identical.jsp?transactionDate=2010-02-02">Case08-InjectionInUpdate-DateWithoutQuotes-TimeDelayExploit-200Identical.jsp</a></B><br>
  Injection into a date value in an update page with quote validation and identical responses.<br>
  <U>Barriers:</U><br>
  Identical Responses<br>
  Quote Validation<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Time Based Detection Structures:</U><br>
  MySQL Detection: [date value] and exists ([time delay function])[comment][space]<br>
  <U>Examples of Time Based Detection Inputs:</U><br>
  MySQL: 2010-02-02 and 1 in (select BENCHMARK(20000000,MD5(CHAR(97))) ) --%20 <br>
  <br>
  
</body>
</html>
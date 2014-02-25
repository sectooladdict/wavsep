<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<!--
	Inspired by a vulnerable test case originally written for the OWASP Zed Attack Proxy (ZAP) project
	(http://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) 
	Original Author: psiinon (psiinon@gmail.com).
-->
<head>
<title>Password Autocomplete (Originally part of ZAP-WAVE)</title>
</head>
<body>

<H2>Password field with autocomplete enabled (Originally part of ZAP-WAVE)</H2>
<H3>Description</H3>
The 'password' parameter in the form does not have autocomplete disabled.<br>
<H3>Example</H3>
<form method="POST">
	<table>
	<tr>
		<td>Username:</td>
		<td><input id="username"></input></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input id="password" type="password"></input></td>
	</tr>
	<tr>
		<td></td>
		<td><input id="submit" type="submit"></input></td>
	</tr>
	</table>
</form>

</body>


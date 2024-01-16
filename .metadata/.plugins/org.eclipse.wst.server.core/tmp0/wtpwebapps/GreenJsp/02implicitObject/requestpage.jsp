<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  02implicitObject폴더 requestpage.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>내장객체 request</h2>
	<a href="requestinfo.jsp?username=green&userpass=1234">get방식 전송</a>
	
	<h2>폼태그를 이용한 post전송</h2>
	<form method="post" action="requestinfo.jsp">
		<p>아이디 <input type="text" name="userId" /></p>
		<p>패스워드 <input type="text" name="userPw" /></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>
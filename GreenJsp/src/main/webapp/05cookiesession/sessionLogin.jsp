<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션을 활용한 로그인</h2>
	<form action="sessionLogin_process.jsp" method="post">
		<p>아이디 : <input type="text"  name="userId" /></p>
		<p>패스워드 : <input type="text"  name="userPw" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String loginerr = request.getParameter("loginerr");
		if(loginerr!=null) {
			out.println("로그인실패");
		}
		String contextPath = request.getContextPath();
		out.println(contextPath);
	%>
	<h2>로그인하기</h2>
	<form method="post" action="login_process.jsp">
		<p>아이디 : <input type="text" name="userId" /></p>
		<p>패스워드 : <input type="text" name="userPw" /></p>
		<p><input type="submit" value="로그인" /></p>
	</form>
</body>
</html>
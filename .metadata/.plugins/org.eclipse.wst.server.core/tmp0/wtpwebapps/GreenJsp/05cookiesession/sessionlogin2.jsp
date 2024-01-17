<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	out.println("session의 userId속성: " + session.getAttribute("userId"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//session.getAttribute("userId") 값이 null이면 로그인안된상태
		//로그인 안된 상태면 로그인창을 나타내고 로그인이 된상태는 환영합니다 나타내기
		if(session.getAttribute("userId")==null){
	%>
	<form action="sessionLogin_process2.jsp" method="post">
		<p>아이디 : <input type="text"  name="userId" /></p>
		<p>패스워드 : <input type="text"  name="userPw" /></p>
		<p><input type="submit" value="전송" /></p>
	</form>
	<% 		
		}
		//로그인 상태 
		else {
	%>
	<!-- session속성중 이름이 username인 값을 조회 -->
	<p><%=session.getAttribute("userName")%>회원님 로그인 하셨습니다.</p>
	<p><a href="logout_process.jsp">로그아웃</a></p>
	<%		
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--   requestinfo -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
	%>
	<h2>요청 정보 읽기</h2>
	<p>전송된값(username) : <%= userId %></p>
	<p>전송된값(userpass) : <%= request.getParameter("userPw") %></p>
	<p>데이터 전송방식 : <%= request.getMethod() %></p>
	<p>url : <%= request.getRequestURL() %></p>
	<p>프로토콜 : <%= request.getProtocol() %></p>
	<p>서버명 : <%= request.getServerName() %></p>
	<p>서버포트 : <%= request.getServerPort() %></p>
	<p>쿼리스트링 : <%= request.getQueryString() %></p>
</body>
</html>
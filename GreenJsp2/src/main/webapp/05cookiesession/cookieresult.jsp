<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- cookieresult.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 확인하기</h2>
	<%
		Cookie[] cookies = request.getCookies();
		for(Cookie c: cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println("쿠키이름 :"+cookieName+" , 쿠키값 : "+cookieValue);
		}
	%>
</body>
</html>
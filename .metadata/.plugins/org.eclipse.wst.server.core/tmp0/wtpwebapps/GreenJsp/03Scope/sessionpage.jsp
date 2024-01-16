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
	session.setAttribute("sessionStr", "green");
%>
<h2>session영역</h2>
<p>session속성값 <%=session.getAttribute("sessionStr") %></p>
<a href="sessionpage2.jsp">페이지이동</a>
</body>
</html>
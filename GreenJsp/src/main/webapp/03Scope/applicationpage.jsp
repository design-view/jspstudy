<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%   application.setAttribute("str", "application"); %>
<h2>application 속성지정</h2>
<p>str속성값 : <%=application.getAttribute("str") %></p>
<a href="applicationpage2.jsp">페이지이동</a>
</body>
</html>
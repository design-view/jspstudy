<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<%
		Person ps = (Person) request.getAttribute("rePerson");
	%>
	<p>person객체 : <%=ps.getName() %> , <%=ps.getAge() %></p>
</body>
</html>
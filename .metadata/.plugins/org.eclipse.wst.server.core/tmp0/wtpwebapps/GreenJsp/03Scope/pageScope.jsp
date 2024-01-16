<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pageInteger", 100);
	pageContext.setAttribute("pageStr", "green");
	pageContext.setAttribute("pagePerson", new Person("김그린",22));
%>
<%@ include file="pageinclude.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>page영역 속성값 읽기</H2>
	<%
		int pageint = (Integer) pageContext.getAttribute("pageInteger");
		String str = (String) pageContext.getAttribute("pageStr");
		Person p1 = (Person) pageContext.getAttribute("pagePerson");
	%>
	<ul>
		<li>int타입값 : <%=pageint%></li>
		<li>str타입값 : <%=str%></li>
		<li>person타입값 : <%=p1.getName()%> , <%=p1.getAge()%></li>
	</ul>
	<a href="pageScope2.jsp">다른페이지 이동</a>
</body>
</html>
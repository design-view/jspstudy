<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--    requestScope -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("reStr", "랄랄라");
		request.setAttribute("rePerson", new Person("rere",30));
	%>
	<h2>request영역의 속성값 읽기</h2>
	<%
		String str = request.getAttribute("reStr").toString();
		Person p1 = (Person) request.getAttribute("rePerson");
	%>
	<ul>
		<li>reStr속성값 : <%=str%></li>
		<li>rePerson속성값 : <%=p1.getName()%> , <%=p1.getAge()%></li>
	</ul>
	<%
		request.getRequestDispatcher("forword.jsp")
		.forward(request, response);
	%>
</body>
</html>
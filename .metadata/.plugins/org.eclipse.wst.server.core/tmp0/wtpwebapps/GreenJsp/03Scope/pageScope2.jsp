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
		Object intnum = pageContext.getAttribute("pageInteger");
	%>
	<p>int타입 값 : <%=intnum%></p>
</body>
</html>
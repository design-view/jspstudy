<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- pageinclude.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	   int intnum = (Integer) pageContext.getAttribute("pageInteger");
	%>
	<p>include파일은 페이지영역에 포함 <%=intnum%></p>
</body>
</html>
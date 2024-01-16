<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- connectionTest -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jdbc테스트</h2>
	<%
		JDBCConnect jdbc1 = new JDBCConnect(
				application.getInitParameter("OracleDriver"),
				application.getInitParameter("OracleURL"),
				application.getInitParameter("OracleId"),
				application.getInitParameter("OraclePwd")
				);
		jdbc1.close();
	%>
</body>
</html>
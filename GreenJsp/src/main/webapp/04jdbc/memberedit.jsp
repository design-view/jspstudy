<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송받은 데이터
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO(application);
	MemberDTO member =  dao.detailView(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
	<h2>수정하기</h2>
	<form method="post" action="edit_process.jsp">
		<input type="hidden" name="oldid" value="<%=member.getId()%>" />
		<p>id <input type="text" name="id" value="<%=member.getId()%>"/></p>
		<p>password <input type="text" name="pw" value="<%=member.getPass()%>"/></p>
		<p>name <input type="text" name="username" value="<%=member.getName()%>"/></p>
		<p><input type="submit" value="수정"/></p>
	</form>
</body>
</html>
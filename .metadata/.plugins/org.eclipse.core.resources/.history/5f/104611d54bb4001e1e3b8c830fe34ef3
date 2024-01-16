<%@page import="member.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBCConnect"%>
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
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("id");
	MemberDAO dao = new MemberDAO(application);
	int result = dao.deleteMember(userid);
	if(result==1){
		JSFunction.alertLocation("삭제되었습니다.", "memberlist.jsp", out);
	}else {
		JSFunction.alertLocation("실패했습니다.", "memberlist.jsp", out);
	}
	dao.close();
%>
</body>
</html>
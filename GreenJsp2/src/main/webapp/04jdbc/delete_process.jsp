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
	//문자인코딩 utf-8로지정
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("id");
	//dao생성 
	MemberDAO dao = new MemberDAO();
	//dao객체의 deleteMember(userid)호출
	//실행결과를 result에 담기
	int result = dao.deleteMember(userid);
	//result가 1이면 실행 
	if(result==1){
		//JSFunction클래스의 정적메소드 호출 
		JSFunction.alertLocation("삭제되었습니다.", "memberlist.jsp", response);
	}else {
		//JSFunction클래스의 정적메소드 호출 
		JSFunction.alertLocation("실패했습니다.", "memberlist.jsp", response);
	}
	
	
%>
</body>
</html>
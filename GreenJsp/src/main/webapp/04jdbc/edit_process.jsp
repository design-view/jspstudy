<%@page import="member.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청정보 변수에 할당
	request.setCharacterEncoding("utf-8");
	String oldid = request.getParameter("oldid");
	out.println(oldid);
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("username");
	
	//오라클 접속
	MemberDAO dao = new MemberDAO(application);
	
	//쿼리실행
	int result = dao.updateMember(id, pw, name, oldid);
	if(result==1){
		JSFunction.alertLocation("회원정보가 수정되었습니다.","memberlist.jsp", out);
	}else {
		JSFunction.alertLocation("수정에 문제가 있습니다.","memberlist.jsp", out);
	} 
	dao.close();
	
%>
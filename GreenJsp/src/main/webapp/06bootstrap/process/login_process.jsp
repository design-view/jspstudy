<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//요청데이터 한글인코딩 utf-8로지정
	request.setCharacterEncoding("utf-8");
	//요청 데이터 확인
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	out.println(id);
	out.println(pw);
	//DAO객체 생성
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto =  dao.logincheck(id, pw);
	out.print(dto.getId());
%>

<%@page import="common.JSFunction"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDAO객체 생성
	//오라클접속 (MemberDAO클래스는 JDBCConnect상속받고 있음)
	//MemberDAO객체가 생성될때 JDBCCennect객체도 생성됨 
	MemberDAO dao = new MemberDAO(application);
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	MemberDTO dto = dao.logincheck(userId,userPw);
	out.println(dto.getId()+"<br/>");
	
	
	//로그인 성공 여부처리 
	//dto객체의 id필드에값이 null이아니면 정상적인 로그인
	//session에 속성추가 --> "userId", "userName"추가 
	//dto.getId() id리턴
	if(dto.getId() != null){
		//session속성추가
		session.setAttribute("userId", dto.getId());
		session.setAttribute("userName", dto.getName());
		//페이지이동 sessionlogin2.jsp
		//경고창 출력후 페이지 이동 
		JSFunction.alertLocation("로그인되었습니다.", "sessionlogin2.jsp", out);
	}else {
		//경고창 출력후 페이지 이동 
		JSFunction.alertLocation("로그인 실패", "sessionlogin2.jsp", out);
	}

%>
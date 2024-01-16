<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String idsave = request.getParameter("idsave");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.logincheck(id, pw);
	//id "green" pw "1234" 
	
	if(dto.getId() != null){
		//아이디 저장하기가 체크 되었다면 쿠키를 생성
		if(idsave!=null && idsave.equals("true")){
			Cookie cookie = new Cookie("idsave",id);
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("idsave",id);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		JSFunction.alertLocation("로그인 되었습니다.", "cookielogin.jsp", out);
	}else {
		JSFunction.alertLocation("로그인되지 않았습니다.", "cookielogin.jsp", out);
	}
%>
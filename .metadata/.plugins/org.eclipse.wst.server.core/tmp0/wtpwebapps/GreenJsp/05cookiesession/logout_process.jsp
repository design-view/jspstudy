<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//session속성제거
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	
	//세션의 모든속성제거
	//session.invalidate();
	//페이지이동
	JSFunction.alertLocation("로그아웃되었습니다.", "sessionlogin2.jsp", out);
	//response.sendRedirect("sessionlogin2.jsp");
%>
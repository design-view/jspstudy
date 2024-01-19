<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 속성 제거
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	JSFunction.alertLocation("로그아웃", "../login.jsp", out);
%>
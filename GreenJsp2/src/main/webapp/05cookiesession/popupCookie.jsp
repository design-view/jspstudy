<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String chkVal = request.getParameter("checkCookie");
	//값이 null이아니고 "1"일때
	if(chkVal != null && chkVal.equals("1")){
		Cookie cookie = new Cookie("popupClose","off");
		cookie.setMaxAge(60*60*24); //유지시간 하루로 설정
		response.addCookie(cookie);
	}
%>
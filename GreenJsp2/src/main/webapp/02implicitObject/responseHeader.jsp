<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- responseHeader -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		//응답 헤더에 추가할 값 준비
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//date타입을 밀리초로 반환
		long add_date = sdf.parse("2024-01-02 11:30").getTime();
		
		//응답 헤더에 값추가
		//add계열 메소드 : 새로운 헤더명으로 값을 추가
		//동일한 헤더명이 있으면 동일한 이름으로 값을 추가
		//set계열 메소드 : 기존의 헤더값을 수정 
		response.addDateHeader("mydate", add_date);
		response.addIntHeader("myNum", 200);
		response.addIntHeader("myNum", 100);
		response.addHeader("myStr", "green");
		response.setHeader("myStr", "green2");
	%>
	<h2>응답헤더 정보 출력하기</h2>
	<ul>
	<%
		Collection<String> headerNames = response.getHeaderNames();
		for(String str: headerNames){
			String hvalue = response.getHeader(str);
	%>
		<li><%=str%> : <%=hvalue%></li>
	<% 
		}
	%>
	</ul>
</body>
</html>
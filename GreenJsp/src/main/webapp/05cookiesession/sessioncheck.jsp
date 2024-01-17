<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	//세션 유지시간 설정
	session.setMaxInactiveInterval(1200); //20분 1 * 60 * 20
	//최초 요청시간 리턴(long) 
	//1970년 1월 1일 0시 0분 0초 기준 현재까지 시간을 밀리초로 반환
	long createTime = session.getCreationTime();
	//최초 요청시간을 인자로 전달해 Date객체 생성
	Date createDate = new Date(createTime);
	//날짜표시형식 객체 생성 ("시간:분:초")
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
	//Date타입을 매개변수로 전달하면 날짜표시형식되로 된 문자를 리턴
	String createTimeStr =  sdf.format(createDate);
	//마지막 요청시간 리턴(long) getLastAccessedTime()
	long lastTime = session.getLastAccessedTime();
	//format()메소드 요출시 Date객체생성해서 매개변수로 전달 
	//날짜표시형식으로된 문자를 리턴 
	String lastTimeStr = sdf.format(new Date(lastTime));
%>
<h2>Session설정 확인</h2>
<p> 세션 아이디 : <%=session.getId()%></p>
<p> 세션 유지사간  : <%=session.getMaxInactiveInterval() %></p>
<p> 세션 최조 요청 시간 : <%=createTimeStr%></p>
<p> 세션 마지막 요청 시간 : <%=lastTimeStr%></p>

</body>
</html>
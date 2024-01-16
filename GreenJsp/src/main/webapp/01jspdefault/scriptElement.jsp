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
	<h1>스크립트 요소</h1>
	<p>선언문태그를 사용하면 변수와 메소드 정의할수있음</p>
	<%-- jsp주석 컴파일 --%>
	<%! 
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String nowstr = sdf.format(now);
		int count=3; 
		String makeItLower(String str){
			int len = str.length();
			return str.toLowerCase();
		}
	%>
	<h2>스크립틀릿 태그로 자바 로직 코드 작성</h2>
	<%
		for(int i=1; i<=count; i++){
			out.println("java server pages " + i + "<br>");
		}
	%>
	<h2>값을 출력하는 표현식 태그</h2>
	<p>count변수 값 : <%=count%></p>
	<p>오늘날짜 : <%=nowstr%></p>
</body>
</html>
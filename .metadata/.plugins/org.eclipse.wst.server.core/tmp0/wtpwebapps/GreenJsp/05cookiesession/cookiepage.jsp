<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 05cookiesession폴더 cookiepage.jsp 파일 생성--> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 설정하기</h2>
	<%
		//쿠키 객체 생성 
		Cookie cookie = new Cookie("myCookie","쿠키입니다.");
		response.addCookie(cookie);
	%>
	<p>쿠키확인</p>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length> 0){
			for(Cookie c: cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.println("쿠키이름 :"+cookieName+" , 쿠키값 : "+cookieValue);
			}
		}
		
	%>
	<a href="cookieresult.jsp">쿠키 확인하기 </a>
</body>
</html>
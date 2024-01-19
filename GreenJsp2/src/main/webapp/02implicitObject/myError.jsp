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
		int state = response.getStatus();
		if(state==500){
			out.println("500번 에러 코드에 문제가 있습니다.");
		}else if(state==404){
			out.println("404번 페이지를 찾을수 없습니다.");
		}
	%>
	<p>에러페이지 입니다.</p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cookielogin.jsp -->
<%
	//idsave쿠키가 있는지 확인 --> 값이 true면 해당아이디 지정하기
	String saveId="";
	Cookie[] cookies =  request.getCookies();
	if(cookies!=null && cookies.length>0){
		for(Cookie c: cookies){
			String cname = c.getName();
			String cvalue = c.getValue();
			if(cname.equals("idsave")){
				saveId=cvalue;
			}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인페이지</h2>
	<div>
		<form method="post" action="cookielogin_process.jsp">
			<p>아이디 <input type="text" name="userId" value="<%=saveId%>"/>
			<input type="checkbox" name="idsave" value="true">아이디 저장하기
			</p>
			<p>패스워드 <input type="text" name="userPw" /></p>
			<p><button type="submit">로그인하기</button></p>
		</form>
	</div>
</body>
</html>
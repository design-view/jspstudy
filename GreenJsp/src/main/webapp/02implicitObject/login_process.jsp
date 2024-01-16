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
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		//아이디는 green이고 비밀번호는 1234
		if(userId.equals("green") && userPw.equals("1234")){
			response.sendRedirect("login_success.jsp");
		}else {
			response.sendRedirect("login.jsp?loginerr=g");
		}
	%>
</body>
</html>
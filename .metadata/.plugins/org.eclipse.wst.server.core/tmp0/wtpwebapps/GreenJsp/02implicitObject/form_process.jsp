<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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
		//{ userName: "green",
		//  userEmail:"aa@naver.com",
		// gender: "woman",
		//	hobby : "독서",
		// 	hobby : "dd"	
		// }
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String gender = request.getParameter("gender");
		String[] hobbys =  request.getParameterValues("hobby");
		Map<String,String[]> users = request.getParameterMap();
		Set<String> keyset = users.keySet();
		for(String key: keyset){
			out.println(Arrays.toString(users.get(key)));
		}
		
		String hobbystgr ="";
		for(String s: hobbys){
			hobbystgr += s + ",";
		}
	%>
	<h2>요청정보출력</h2>
	<ul>
		<li>이름 : <% out.print(userId); %></li>
		<li>이메일 : <%=userEmail %></li>
		<li>성별 : <%=gender %></li>
		<li>취미 : <%=hobbystgr %></li>
	</ul>
</body>
</html>
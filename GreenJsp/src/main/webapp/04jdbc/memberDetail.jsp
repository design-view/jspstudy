<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBCConnect"%>
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
		String userid = request.getParameter("id");
		MemberDAO dao = new MemberDAO(application);
		MemberDTO dto = dao.detailView(userid);
		dao.close();
	%>
	<h2>회원 상세 보기</h2>
	<p>아이디 : <%=dto.getId()%></p>
	<p>이름 : <%=dto.getName()%></p>
	<p>비밀번호 : <%=dto.getPass()%></p>
	<button onclick="location.href='memberlist.jsp'">목록가기</button>
	<form action="delete_process.jsp" method="post">
		<input type="hidden" value="<%=dto.getId()%>" name="id" />
		<button type="submit">삭제하기</button>
	</form>
	<form action="memberedit.jsp" method="post">
		<input type="hidden" value="<%=dto.getId()%>" name="id" />
		<button type="submit">수정하기</button>
	</form>
	
</body>
</html>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
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
	<h2>회원 목록 조회</h2>
	<%
		MemberDAO dao = new MemberDAO(application);
		List<MemberDTO> memberlist = dao.selectList();
		dao.close();
	%>
	<table border="1" cellpadding="10" cellspacing="0">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>등록일</td>
		</tr>
		<%
			if(memberlist.isEmpty()){
		%>
		<tr>
			<td colspan="4">게시글이 없습니다.</td>
		</tr>
		<% 		
			}else {
				for(MemberDTO m: memberlist){
		%>
		<tr>
			<td><%=m.getId()%></td>
			<td><%=m.getPass()%></td>
			<td>
				<a href="memberDetail.jsp?id=<%=m.getId()%>">
				<%=m.getName()%>
				</a>
			</td>
			<td><%=m.getRegidate()%></td>
		</tr>
		<% 
				}
			}
		%>
	</table>
	<button onclick="location.href='join.jsp'">멤버가입하기</button>
</body>
</html>
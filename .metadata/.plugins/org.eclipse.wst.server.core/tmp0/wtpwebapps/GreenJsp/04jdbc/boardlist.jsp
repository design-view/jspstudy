<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//db에 있는 board테이블의 데이터를 조회해서 받기
	BoardDAO dao = new BoardDAO(application);
	List<BoardDTO> boardlist = dao.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 리스트 입니다.</h2>
	<table>
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>글쓴이</td>
			<td>등록일</td>
			<td>조회수</td>
		</tr>
		<% 
			if(boardlist.isEmpty()){
		%>
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
		<% 
			}
			else{
				for(BoardDTO board: boardlist
						){
		%>
		<tr>
			<td><%=board.getNum()%></td>
			<td><%=board.getTitle()%></td>
			<td><%=board.getId()%></td>
			<td><%=board.getPostdate()%></td>
			<td><%=board.getVisitcount()%></td>
		</tr>
		<%	
				}	
			}
		%>
	</table>
</body>
</html>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//db에 있는 board테이블의 데이터를 조회해서 받기
	BoardDAO dao = new BoardDAO(application);
	//dao객체의 selectList()메소드를 호출하면 List<BoardDTO>
	//타입을 리턴받아 boardlist변수에 할당
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
			//boardlist가 비었다면 
			if(boardlist.isEmpty()){
		%>
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
		<% 
			}
			//boardlist가 항목이 있다면
			else{
				//리스트에 담긴 만큼 반복한다.
				for(BoardDTO board: boardlist
						){
		%>
		<tr>
			<%-- 
			표현식 <%= %> 값을 출력할때 사용한다. 
			board객체의 getNum()메소드를 호출하여 num값을 반환
			board객체의 getTitle()메소드를 호출하여 title값을 반환
			board객체의 getId()메소드를 호출하여 id값을 반환
			--%>
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
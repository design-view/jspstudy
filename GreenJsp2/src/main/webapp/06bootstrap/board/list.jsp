<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%   List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list"); %>
<div>
	<h2>게시글 페이지 입니다.</h2>
	<table class="table">
    <thead class="thead-dark">
      <tr>
        <th>글번호</th>
        <th>글제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
      </tr>
    </thead>
    
    <tbody>
     <%
     	/* 리스트가 비어있을때 */
     	if(list.isEmpty()){
     %>
     	<tr>
     		<td colspan="5">게시글이 없습니다.</td>
     	</tr>
     <% 		
     	}else {
     		for(BoardDTO b: list){
     			%>
     			
     			 <tr>
			        <td><%=b.getNum()%></td>
			        <td><%=b.getTitle() %></td>
			        <td><%=b.getId() %></td>
			        <td><%=b.getPostdate() %></td>
			        <td><%=b.getVisitcount() %></td>
      			</tr>
     			<% 
     		}
     	}
     %>
     
    </tbody>
  </table>
</div>
<%@ include file="../include/footer.jsp" %>
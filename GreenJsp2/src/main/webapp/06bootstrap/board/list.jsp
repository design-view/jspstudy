<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%   
 List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list"); 
 int total = (Integer) request.getAttribute("total");
%>
<script>
	function searchclick(){
		//콘솔에 input에 담긴 value값 출력
		let search = document.querySelector("#search").value;
		location.href="/GreenJsp2/board?cmd=list&search="+search;
	}
</script>
<div>
	<h2>게시글 페이지 입니다.</h2>
	<div>
		<input name="search" id="search"/>
		<button onclick="searchclick()">검색</button>
	</div>
	<p><%=total%></p>
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
			        <td><a href="/GreenJsp2/board?cmd=view&num=<%=b.getNum()%>"><%=b.getTitle() %></a></td>
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
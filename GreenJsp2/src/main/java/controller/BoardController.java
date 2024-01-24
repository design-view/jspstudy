package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO3;
import board.BoardDTO;
import common.JSFunction;

//http://localhost:8090/GreenJsp2/board
@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//DAO타입의 필드 생성 
    public BoardDAO3 dao; 
   
    public BoardController() {
        super();
      
    }
    //get,post구분없이 처리
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String cmd = request.getParameter("cmd");
    	System.out.println(cmd);
    	//http://localhost:8090/GreenJsp2/board?cmd=list일때 응답
    	if(cmd.equals("list")) {
    		dao = new BoardDAO3();
    		List<BoardDTO> list = null;
    		//search파라미터 존재하는지 체크
    		if(request.getParameter("search")!=null) {
    			String search = request.getParameter("search");
    			System.out.println(search);
    			list = dao.searchList(search);
    		}else {
    			list = dao.selectList();
    		}
    		int total = dao.selectCount(request.getParameter("search"));
    		System.out.println("토탈은 " + total);
			
			request.setAttribute("list", list);
			request.setAttribute("total", total);
			request.getRequestDispatcher("/06bootstrap/board/list.jsp") .forward(request,
			response);
			
    	//상세보기 페이지 요청 (get요청)
    	//http://localhost:8090/GreenJsp2/board?cmd=view
    	}else if(cmd.equals("view")) {
    		String num = request.getParameter("num");
    		//dao 객체 생성해서 할당 
    		dao = new BoardDAO3();
    		//조회수 업데이트 하고 결과를 updateresult할당 
    		int updateresult = dao.visitcountUpdate(Integer.parseInt(num));
    		System.out.println(updateresult);
    		//getBoard()호출해서 BoardDTO타입 리턴 받음
    	
    		BoardDTO dto = dao.getBoard(Integer.parseInt(num));
    		//request속성 추가 dto속성에 dto객체를 저장 
    		request.setAttribute("dto", dto);
    		//페이지 이동 
    		request.getRequestDispatcher("/06bootstrap/board/view.jsp")
    		.forward(request, response);
    	//주소창에 http://localhost:8090/GreenJsp2/board?cmd=write
    	}else if(cmd.equals("write")) {
    		//세션속성 userId가 없으면 
    		//리스트페이지로 로그인한 사용자만 글쓰기가 가능합니다.
    		if(request.getSession().getAttribute("userId")!=null) {
    			//페이지 이동 
            	request.getRequestDispatcher("/06bootstrap/board/write.jsp")
            	.forward(request, response);
    		}else {
    			JSFunction.alertLocation("로그인한 사용자만 글쓰기가 가능합니다.", "/GreenJsp2/board?cmd=list", response);
    		}	
    	//글쓰기 등록 처리
    	}else if(cmd.equals("write_process")) {
    		String id = request.getParameter("userid");
    		String title = request.getParameter("title");
    		String content = request.getParameter("content");
    		System.out.println(id);
    		System.out.println(title);
    		System.out.println(content);
    		dao = new BoardDAO3();
    		int result = dao.insertBoard(title, content, id);
			
			if(result==1) {
				 request.getRequestDispatcher("/board?cmd=list")
			 .forward(request, response); 
		      //response.sendRedirect("/GreenJsp2/board?cmd=list")
			}else { JSFunction.alertLocation("글쓰기 실패",
			  "/GreenJsp2/board?cmd=write", response); 
			
			}
			//게시글 삭제요청	 
    	}else if(cmd.equals("delete")) {
    		String num = request.getParameter("num");
    		dao = new BoardDAO3();
    		int result = dao.deleteBoard(Integer.parseInt(num));

    		if(result==1) {
    			JSFunction.alertLocation("게시글 삭제", "/GreenJsp2/board?cmd=list", response);
    		}else {
    			JSFunction.alertLocation("게시글 삭제실패", "/GreenJsp2/board?cmd=view&num="+num, response);
    		}
    	//게시글 수정요청
    	}else if(cmd.equals("edit")) {
    		String num = request.getParameter("num");
    		//dao 객체 생성해서 할당 
    		dao = new BoardDAO3();
    		BoardDTO dto = dao.getBoard(Integer.parseInt(num));
    		//request속성 추가 dto속성에 dto객체를 저장 
    		request.setAttribute("dto", dto);
    		//페이지 이동 
    		request.getRequestDispatcher("/06bootstrap/board/edit.jsp")
    		.forward(request, response);
    	//게시글 수정요청 처리
    	}else if(cmd.equals("update_process")) {
    		String num = request.getParameter("num");
    		String content = request.getParameter("content");
    		String title = request.getParameter("title");
    		dao = new BoardDAO3();
    		int result = dao.updateBoard(Integer.parseInt(num), title, content);
    		if(result==1) {
    			request.getRequestDispatcher("/board?cmd=list").forward(request, response);
    		}else {
    			JSFunction.alertLocation("수정실패", "/GreenJsp2/board?cmd=edit&num="+num, response);
    		}
    	}
    	
    	
    }

	//get요청이 왔을때 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	//post요청이 왔을때 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

}

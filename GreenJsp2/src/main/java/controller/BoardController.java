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
    		List<BoardDTO> list = dao.selectList();
    		System.out.println("dddd");
    		System.out.println(list.get(0).getVisitcount());
    		System.out.println(list.get(1).getVisitcount());
    		System.out.println(list.get(2).getVisitcount());
    		request.setAttribute("list", list);
    		request.getRequestDispatcher("/06bootstrap/board/list.jsp")
    		.forward(request, response);
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

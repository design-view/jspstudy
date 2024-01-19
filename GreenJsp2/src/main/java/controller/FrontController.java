package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/front")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FrontController() {
        super();
    }

	void route(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청주소를 uri 변수에 저장
		//uri: 식별자 
		//url: 식별자+위치 
		//요청 주소 반환 getRequestURI()
		String uri = request.getRequestURI();
		System.out.println(uri);
		//요청 파라미터 반환해서 cmd에 할당
		String cmd = request.getParameter("cmd");
		//응답 타입 텍스트로 지정하기 
		response.setContentType("text/plain; charset=utf-8");
		//out변수에 response.getWriter()메소드로 반환받은 객체 할당
		PrintWriter out= response.getWriter();
		//cmd값이 list이면 실행
		if(cmd.equals("list")) {
			out.print("리스트페이지");
		//cmd값이 view면 실행
		}else if(cmd.equals("view")) {
			out.print("뷰페이지");
		//cmd값이 write면 실행
		}else if(cmd.equals("write")) {
			out.print("쓰기페이지");
		}
		out.flush();
		out.close();
	}
	//get요청 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		route(request,response);
	}

	//post요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		route(request,response);
	}

}

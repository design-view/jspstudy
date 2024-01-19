package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8090/GreenJsp/AjaxTest
//위처럼 요청이 오면 AjaxController가 처리
//@WebServlet 브라우져의 요청과 서블릿을 매핑 
@WebServlet("/AjaxTest")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }
    //요청타입이 get일때 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("요청이옴");
		PrintWriter out = response.getWriter();
		out.print("ok");
		out.flush();
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	//요청타입이 post일때 실행 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

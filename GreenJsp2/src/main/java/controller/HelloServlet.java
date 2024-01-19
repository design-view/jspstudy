package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.coyote.BadRequestException;


@WebServlet("/abc")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloServlet() {
        super();  
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("abc요청이옴");
		
		//속성추가 setAttribute(속성명,속성값)
		//req.setAttribute("message", "안녕하세요");
		//서버에서의 페이지이동(재요청아님, 클라이언트 모름)
		/*
		 * req.getRequestDispatcher("/07servlet/hello.jsp") .forward(req, res);
		 */
		System.out.println(res.getContentType());
		//응답결과타입을 지정 
		//ContentType : 응답할 파일 지정 
		//text/html  : html페이지  text/plain : 문자
		//application/json
		res.setContentType("application/json;charset=utf-8");
		//출력스트림 생성
		PrintWriter out = res.getWriter();
		out.print("{\"제품\":\"노트북\"}");
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//요청 contentType을 contentType변수에 할당 
		String contentType = request.getContentType();
		//출력스트림 생성 out변수에 할당 
		PrintWriter out = response.getWriter();
		//요청 contentType이 application/json일때
		if(contentType.equals("application/json")) {
			//입력스트림 생성 
			BufferedReader br =  request.getReader();
			//한줄씩 읽어서 리턴 
			String input;
			while((input=br.readLine())!=null) {
				System.out.println(input);
			}
			out.print("ok");
			out.flush();
			out.close();
		}else {
			String title = request.getParameter("title");
			String price = request.getParameter("price");
			out.print("{\"title\": "+title+",\"price\":"+price+"}");
			out.flush();
			out.close();
		}
		
		System.out.println(contentType);
		
	}

}

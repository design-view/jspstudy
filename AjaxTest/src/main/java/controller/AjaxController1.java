package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.User;
import model.UserDTO;

//요청이 http://localhost:8090/AjaxTest/ajax1로 왔을때 처리해줌 
@WebServlet("/ajax1")
public class AjaxController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AjaxController1() {
        super();
    }

	//get요청일때 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답타입 지정
		response.setContentType("application/json; charset=utf-8");
		//응답해주려면 출력스트림
		PrintWriter out = response.getWriter();
		String name = request.getParameter("username");
		String age =request.getParameter("userage");
		out.print("{\"name\":\""+ name+"\", \"age\":"+age+"}");
	}
	//post요청일때 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json; charset=utf-8");
		//username=greegreen&userage=30
		//getParameter()메소드로 요청데이터를 받으려면 x-www-form-urlencoede타입이어야한다
		//String name = request.getParameter("username");  
		//String age =request.getParameter("userage");
		//body순수 데이터 읽기
		//입력스트림 생성
		BufferedReader br = request.getReader(); 
		//readLine() 데이터를 한줄단위로 읽음 
		String str = br.readLine();
		System.out.println(str);
		//컨버터 객체 생성
		Gson gson = new Gson();
		//fromJson() json을 ---> 자바객체로 리턴 
		UserDTO dto = gson.fromJson(str, UserDTO.class);
		System.out.println("dto는 : "+dto);
		//user객체 생성 
		User user = new User();
		//객체 필드 값지정 
		user.setId(1);
		user.setPassword("1234");
		user.setUserage(32);
		user.setUsername("green");
		//user를 json으로 변경 toJson()
		String userJson = gson.toJson(user);
		PrintWriter out = response.getWriter();
		//출력스트림으로 응답
		out.print(userJson);
	}

}

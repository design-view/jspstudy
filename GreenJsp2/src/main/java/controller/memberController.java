package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;


@WebServlet("/member")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public memberController() {
        super(); 
    }
	//get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	//post요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("통신요청옴");
		//입력스트립 생성 
		//그냥 text라서 리더로 읽는다.
		BufferedReader br = request.getReader();
		//한줄씩읽음 
		String userid = br.readLine();
		//MemberDAO생성
		MemberDAO dao = new MemberDAO(getServletContext());
		int result = dao.findByid(userid);
		//출력스트입
		PrintWriter out = response.getWriter();
		if(result==1) {
			out.print("ok");
		}else {
			out.print("fail");
		}
		out.flush();
		System.out.println(userid);
		
	}

}












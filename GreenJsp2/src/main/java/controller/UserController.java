package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JSFunction;
import member.MemberDAO;
import member.MemberDTO;


@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserController() {
        super();
    }
    
    void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		/* 요청올것 /http://localhost/GreenJsp2/user?cmd=join */
    	String cmd =  req.getParameter("cmd");
    	//session받기 req.getSeesion()
    	HttpSession session = req.getSession();
    	//*****응답 컨텐츠타입 지정 html형태로 응답해!!!!
		res.setContentType("text/html; charset=utf-8");
		//출력스트립 생성 
		PrintWriter out =  res.getWriter();
    	//회원가입요청
    	if(cmd.equals("join")) {
    		System.out.println("join요청");
    		//페이지 포워딩하기(서버에서 페이지 이동)
    		req.getRequestDispatcher("/06bootstrap/user/join.jsp")
    		.forward(req, res);
    	//로그인요청
    	}else if(cmd.equals("login")) {
    		System.out.println("login요청");
    		//페이지 포워딩하기(서버에서 페이지 이동)
    		req.getRequestDispatcher("/06bootstrap/user/login.jsp")
    		.forward(req, res);
    	//로그아웃 요청
    	}else if(cmd.equals("logout")) {
    		System.out.println("logout요청");
    		//session속성제거하기 removeAttribute("속성명")
    		session.removeAttribute("userId");
    		session.removeAttribute("userName");
    		//JSFunction클래스의 정적메소드 alertLocation()호출
    		JSFunction.alertLocation("로그아웃되셨습니다.", "/GreenJsp2/user?cmd=login", out);
    	//회원정보수정 요청
    	}else if(cmd.equals("edit")) {
    		System.out.println("edit요청");
    		//페이지 포워딩하기(서버에서 페이지 이동)
    		req.getRequestDispatcher("/06bootstrap/user/edit.jsp")
    		.forward(req, res);
    	//로그인 post요청
    	}else if(cmd.equals("login_process")) {
    		System.out.println("login_process");
    		//form태그에 담긴값 조회 userId:input의 name속성명
    		String userid = req.getParameter("userId");
    		//form태그에 담긴값 조회 userPw:input의 name속성명
    		String userpw = req.getParameter("userPw");
    		//DAO객체 생성
    		MemberDAO dao = new MemberDAO(getServletContext());
    		//DTO객체 생성  logincheck()메소드 호출해서 리턴되는 값으로 할당
    		MemberDTO dto = dao.logincheck(userid, userpw);
    		//dto객체의 id값이 null이 아니면 session속성추가하기
    		if(dto.getId()!=null) {
    			session.setAttribute("userId", dto.getId());
    			session.setAttribute("userName", dto.getName());
    		}
    		//JSFunction클래스의 정적메소드 alertLocation()호출
    		JSFunction.alertLocation("로그인되었습니다.", "/GreenJsp2/user?cmd=login", out);
    	}
    }
	//get요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메소드 호출
		process(request, response);
	}
	//post요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		//메소드 호출
		process(request, response);
	}

}

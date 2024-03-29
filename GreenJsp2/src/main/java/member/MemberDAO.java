package member;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspWriter;

import common.DBConnection;
import common.JDBCConnect;
import common.JSFunction;

public class MemberDAO {
	Connection con = DBConnection.getConnection();
	Statement stmt;
	ResultSet rs;
	PreparedStatement psmt;
	//게시글 목록 가져오기
	public List<MemberDTO> selectList(){
		//쿼리작성
		String sql = "select * from member";
		//리턴타입 변수생성 
		List<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		try {
			//정적쿼리객체 생성 Statement타입 생성해서 stmt필드에 할당 
			//stmt필드는 JDBCConnect에서 선언됨 
			stmt = con.createStatement();
			//쿼리실행 executeQuery()메소드가 실행되면 ResultSet타입 리턴 
			rs = stmt.executeQuery(sql);
			//rs.next() 커서를 아래행으로 이동 boolean타입(true,false) 리턴 
			while(rs.next()){
				//DTO타입 객체 생성 
				MemberDTO member = new MemberDTO();
				//객체의 필드 업데이트 --> 현재 행의 있는 열데이터
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setRegidate(rs.getDate("regidate"));
				//리스트에 객체 추가 
				memberlist.add(member);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//con이 null이아니고 stmt가 null이 아니고 rs가 null이 아닐때
			if(con!=null && stmt !=null && rs != null ) {
				DBConnection.close(con, stmt, rs);
			}
		}
		return memberlist;						
	}
	//게시글 상세 조회하기
	public MemberDTO detailView(String id) {
		//? 인파라미터 
		//동적 쿼리
		String query = "select * from member where id=?";
		MemberDTO member = new MemberDTO();
		try {
			//동적객체생성 PreparedStatement
			psmt = con.prepareStatement(query);
			//인파라미터에 값을 지정 setString() setInt() setDate()
			psmt.setString(1, id);
			//slect문 쿼리실행 executeQuery() ---> ResultSet
			rs = psmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setRegidate(rs.getDate("regidate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//con이 null이아니고 stmt가 null이 아니고 rs가 null이 아닐때
			if(con!=null && psmt !=null && rs != null ) {
				DBConnection.close(con, psmt, rs);
			}
		}
		return member;
	}
	
	//게시글 삭제하기 
	public int deleteMember(String id) {
		//쿼리작성
		String query = "delete from member where id='"+id+"'";
		//리턴할 변수생성
		int result = 0;
		try {
			//정적쿼리객체생성 con.careateStatement()
			stmt=con.createStatement();
			//executeUpdate() 쿼리가적용된 행갯수(int)를 리턴해줌
			result = stmt.executeUpdate(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//con이 null이아니고 stmt가 null이 아닐때
			if(con!=null && stmt !=null) {
				DBConnection.close(con, stmt);
			}
		}
		return result;
		
	}
	//게시글 수정하기
	public int updateMember(String id, String pw, String name, String oldid) {
		int result = 0;
		String query = "update member set id=?, pass=?, name=? where id=?";
		try {
			//동적쿼리객체 생성
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, oldid);
			result = psmt.executeUpdate();  //수정된 행의 갯수 리턴 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//con이 null이아니고 stmt가 null이 아닐때
			if(con!=null && psmt !=null) {
				DBConnection.close(con, psmt);
			}
		}
		return result;
	}
	//게시글 추가하기(회원가입 )
	public int insertMember(String id, String pass, String name) {
		//쿼리문 작성
		String sql = "insert into member(id,pass,name) values(?,?,?)";
		int result = 0;
		//쿼리수행
		try{
			//connection객체를 통해서 preparedStatement객체를 생성 
			psmt = con.prepareStatement(sql);
			//인파라미터에 실제값을 대입
			psmt.setString(1,id);
			psmt.setString(2,pass);
			psmt.setString(3,name);
			result = psmt.executeUpdate();   //변경된행의 갯수를 리턴
		}
		catch(Exception e){

		}finally {
			//con이 null이아니고 stmt가 null이 아닐때
			if(con!=null && psmt !=null) {
				DBConnection.close(con, psmt);
			}
		}
		return result;
	}
	//로그인 체크하기 
	public MemberDTO logincheck(String id, String pw) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id=? and pass=?";
		System.out.println("아이디" + id);
		System.out.println("패스워드" +pw);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(dto.getId());
		return dto;
	}
	//아이디 체크하기
	//아이디가 있으면 1을리턴 없으면 0을리턴 
	public int findByid(String userid) {
		int result = 0;
		String sql = "select * from member where id=?";
		try {
			psmt =con.prepareStatement(sql);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//con이 null이아니고 stmt가 null이 아니고 rs가 null이 아닐때
			if(con!=null && psmt !=null && rs != null ) {
				DBConnection.close(con, psmt, rs);
			}
		}
		
		return result;
	}
	
}

package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.DBConnection;
import common.JDBCConnect;

public class BoardDAO3  {
	Connection con=DBConnection.getConnection();
	Statement stmt;
	PreparedStatement psmt;
	ResultSet rs;
	//게시물의 개수반환하기
	public int selectCount(String search) {
		con=DBConnection.getConnection();
		int totalCount = 0;
		//게시물 수를 구하는 쿼리작성
		String query = "select count(*) from board";
		//매개변수의 값을 받지 못하면 null
		if(search!=null) {
			query += " where title like '%"+search+"%'";
		}
		//쿼리작성 쿼리객체생성
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnection.close(con, stmt, rs);
		}
		return totalCount;
	}
	//검색한 게시글 가져오기
	public List<BoardDTO> searchList(String search){
		con=DBConnection.getConnection();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String query = "select * from board where title like '%"+search+"%'";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				boardlist.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(con!=null && stmt!=null && rs !=null) {
				DBConnection.close(con,stmt,rs);
			}
		}
		return boardlist;
	}
	//게시글 목록 가져오기
	public List<BoardDTO> selectList(){
		con=DBConnection.getConnection();
		List<BoardDTO> boardlist = new ArrayList<BoardDTO>();
		String query = "select * from board";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				boardlist.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(con!=null && stmt!=null && rs !=null) {
				DBConnection.close(con,stmt,rs);
			}
		}
		return boardlist;
	}
	//게시글 하나 가져오기
	public BoardDTO getBoard(int num) {
		con=DBConnection.getConnection();
		BoardDTO dto = new BoardDTO();
		try {
			String query = "select * from board where num=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(con!=null && psmt!=null && rs !=null) {
				DBConnection.close(con,psmt,rs);
			}
		}
		return dto;
	}
	//게시글 추가하기 
	public int insertBoard(String title, String content, String id ) {
		System.out.println("하하하하하여기여기");
		int result = 0;
		//쿼리문 작성
		String sql = "insert into board(num, title, content, id, visitcount) values(seq_board_num.nextval,?,?,?,0)";
				
		//쿼리수행
		try{
			//connection객체를 통해서 preparedStatement객체를 생성 
			psmt = con.prepareStatement(sql);
			//인파라미터에 실제값을 대입
			psmt.setString(1,title);
			psmt.setString(2,content);
			psmt.setString(3,id);
			System.out.println("하하하하하");
			result = psmt.executeUpdate();   //변경된행의 갯수를 리턴
		}
		catch(Exception e){
			
		}finally {
			if(con!=null && psmt!=null) {
				DBConnection.close(con,psmt);
			}
		}
		return result;
	}
	//게시글 삭제하기 
	public int deleteBoard(int num) {
		//쿼리작성
		String query = "delete from board where num=?";
		//리턴할 변수생성
		int result = 0;
		try {
			//정적쿼리객체생성 con.careateStatement()
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			//executeUpdate() 쿼리가적용된 행갯수(int)를 리턴해줌
			result = psmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(con!=null && psmt!=null) {
				DBConnection.close(con,psmt);
			}
		}
		return result;
			
	}
	//게시글 수정하기
	public int updateBoard(int num, String title, String content ) {
		int result = 0;
		String query = "update board set title=?, content=? where num=?";
		try {
			//동적쿼리객체 생성
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, num);
			result = psmt.executeUpdate();  //수정된 행의 갯수 리턴 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(con!=null && psmt!=null) {
				DBConnection.close(con,psmt);
			}
		}
		return result;
	}
	//조회수 업데이트하기
	public int visitcountUpdate(int num) {
		con=DBConnection.getConnection();
		//변수선언
		int result=0;
		//board테이블의 num컬럼값이 num인 행을 수정
		//visitcount를1증가 
		//int타입 변수리턴
		//1.오라클접속 con생성
		//2.쿼리작성, 쿼리객체
		String query = "update board set visitcount=visitcount+1 where num=?";
		
		try {
			//동적쿼리객체 생성
			psmt = con.prepareStatement(query);
			//첫번째 인파라미터(?)에 num할당 
			psmt.setInt(1, num);
			//3.쿼리실행 executeUpdate(): int타입 리턴 (변경된 행의 갯수) 
			//executeQuery() : ResultSet타입 리턴(조회된 행)
			//실행후 변경된 행의 갯수를 리턴 
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(con!=null && psmt!=null) {
				DBConnection.close(con,psmt);
			}
		}
		
		return result;
	}
	
}

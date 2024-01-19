package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBCConnect {
	//데이터베이스연결
	public Connection con;
	//정적 쿼리문을 실행할때 사용
	public Statement stmt;
	//동적 쿼리문을 실행할때 사용
	public PreparedStatement psmt;
	//select 쿼리문의 결과를 저장
	public ResultSet rs;
	
	//기본생성자
	public JDBCConnect() {
		try {
			//JDBC드라이버 로드 
			Class.forName("oracle.jdbc.OracleDriver");
			//오라클 경로  jdbc:oracle:thin ---> 오라클 프로토콜
			//http://naver.com   jdbc:oracle:thin:@localhost:1521:xe
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "greenjsp";
			String pw = "green1234";
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("JDBC 컨넥션 생성");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//생성자 오버로딩
	public JDBCConnect(String driver, String url, String id, String pw) {
		
			try {
				//JDBC 드라이버 로드
				Class.forName(driver);
				//DB연결
				con = DriverManager.getConnection(url,id,pw);
				System.out.println("2번째 생성자로 생성");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	}
	
	
	//생성자3
	public JDBCConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePwd");
			//JDBC 드라이버 로드
			Class.forName(driver);
			//DB연결
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("2번째 생성자로 생성");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//연결해지
	public void close() {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(psmt != null) psmt.close();
				if(con != null) con.close();
				System.out.println("자원해지");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}

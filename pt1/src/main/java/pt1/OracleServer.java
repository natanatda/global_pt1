package pt1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleServer {	//protected : 같은 패키지 이거나 자손클래스에서 호출가능
	protected Connection conn = null;			//DB연결
	protected PreparedStatement pstmt = null;	//쿼리문 작성및 실행
	protected ResultSet rs = null;			//실행결과 추출
	protected String sql = null;				//sql 작성
	//2. DB드라이버 
	//3. DB로그인 (연결)
	protected Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String user ="team03" , pass="team";
			String dburl="jdbc:oracle:thin:@192.168.219.123:1521:orcl";
			conn = DriverManager.getConnection(dburl,user,pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	protected void oracleClose() {
		if(rs != null) {
			try {rs.close();} catch (Exception se) {}
		}
		if(pstmt != null) {
			try {pstmt.close();} catch (Exception se) {}
		}
		if(conn != null) {
			try {conn.close();} catch (Exception se) {}
		}
	}
}

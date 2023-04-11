package pt1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List; 

public class BoardDAO extends OracleServer{
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO() {}
	
	public void insertNotice(BoardDTO notice) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num=notice.getNum();
		int number=0;
		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from notice");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			if (num!=0) 
			{ 
				sql = "insert into notice(num,writer,subject,category,content,reg values(notice_seq.NEXTVAL,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, notice.getWriter());
				pstmt.setString(2, notice.getSubject());
				pstmt.setString(3, notice.getCategory());
				pstmt.setString(4, notice.getContent());
				pstmt.setTimestamp(5, notice.getReg());
				
				pstmt.executeUpdate();
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
	}

	public int getNoticeCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
		return x; 
	}
	
	public List getNotices(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List noticeList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select num,writer,subject,category,content,reg"+
					"from (select num,writer,subject,category,content,reg "+
					"from (select * from notice order by reg) order by reg ) where num >= ? and num <= ? ");
					pstmt.setInt(1, start); 
					pstmt.setInt(2, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						noticeList = new ArrayList(end); 
						do{ 
							BoardDTO notice= new BoardDTO();
							notice.setNum(rs.getInt("num"));
							notice.setWriter(rs.getString("writer"));
							notice.setSubject(rs.getString("subject"));
							notice.setCategory(rs.getString("category"));
							notice.setContent(rs.getString("content"));
							noticeList.add(notice); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
		return noticeList;
	}
	
	public BoardDTO getNotice(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO notice=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from notice where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new BoardDTO();
				notice.setNum(rs.getInt("num"));
				notice.setWriter(rs.getString("writer"));
				notice.setSubject(rs.getString("subject"));
				notice.setCategory(rs.getString("category"));
				notice.setContent(rs.getString("content"));
				notice.setReg(rs.getTimestamp("reg"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
		
		return notice;
	}
	public BoardDTO updateGetNotice(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO notice=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select * from notice where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new BoardDTO();
				notice.setNum(rs.getInt("num"));
				notice.setWriter(rs.getString("writer"));
				notice.setSubject(rs.getString("subject"));
				notice.setCategory(rs.getString("category"));
				notice.setContent(rs.getString("content"));
				notice.setReg(rs.getTimestamp("reg"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}

		return notice;
	}
	public int updateNotice(BoardDTO notice) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String dbwriter="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select writer from notice where num = ?");
			pstmt.setInt(1, notice.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbwriter= rs.getString("writer"); 
				if(dbwriter.equals(notice.getWriter())){
					pstmt = conn.prepareStatement("update notice set writer=?,subject=?,category=?,content=? where num=?");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, notice.getWriter());
					pstmt.setString(2, notice.getSubject());
					pstmt.setString(3, notice.getCategory());
					pstmt.setString(4, notice.getContent());
					pstmt.setInt(5, notice.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
		return x;
	}
	public int deleteNotice(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String dbwriter="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select writer from notice where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbwriter= rs.getString("writer");
				if(dbwriter.equals("admin1") || dbwriter.equals("admin2") ||dbwriter.equals("admin3")){
					pstmt = conn.prepareStatement("delete from notice where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			oracleClose();
		}
		return x;
	}

}

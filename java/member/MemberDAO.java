package member;

import java.sql.*;
import javax.sql.*;

import member.MemberDTO;

import javax.naming.*;


public class MemberDAO {
	    
	 	private static MemberDAO instance = new MemberDAO();
	    
	    public static MemberDAO getInstance() {return instance; }  //자기자신을 리턴값으로 가지고있는 메서드 ...객체를 리턴하고있음 
	    
	    private MemberDAO() {}  // 생성자 
	    

		public Connection getConnection() { 
			Connection conn = null;
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");  
				String user = "team03" , pass = "team" ;
				String dburl = "jdbc:oracle:thin:@192.168.219.123:1521:orcl";
				conn = DriverManager.getConnection(dburl,user,pass);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		
	 
	    public void insertMember (MemberDTO member) 
	    throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"insert into MEMBER values (?,?,?,?,?,?,?,?)");
	            pstmt.setString(1, member.getId());
	            pstmt.setString(2, member.getPw());
	            pstmt.setString(3, member.getName());
	            pstmt.setString(4, member.getBirth());
	            pstmt.setString(5, member.getPhonenumber());
	            pstmt.setString(6, member.getEmail());
	            pstmt.setString(7, member.getDelivery_address());

	            pstmt.executeUpdate();  //1행이 추가~ 막 이런 리턴 안받았음
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }
	 
		public int userCheck(String id, String passwd)   //리턴타입 int임 
		throws Exception {
			Connection conn = null;   //지역변수라서 일일이 다 선언해줌
	        PreparedStatement pstmt = null;
			ResultSet rs= null;
	        String dbpasswd="";
			int x=-1;
	        
			try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"select passwd from MEMBER where id = ?");   //쿼리문작성중. 멤버 태그에 있는 비밀번호만 검색하겠다는거임. 매개변수로 입력받은 id대입해서 해당 아이디에 맞는 비밀번호,,,
	            pstmt.setString(1, id); 
	            rs= pstmt.executeQuery();

				if(rs.next()){   //얘가 트루일때..
					dbpasswd= rs.getString("passwd");    //받은 비밀번호랑 원래 그 아이디에 맞는 비밀번호를 비교
					if(dbpasswd.equals(passwd))
						x= 1; //아이디 비번 모두 맞음
					else
						x= 0; //비번 틀림
				}else  //펄스면 이거 실행. (아이디 잘못 입력했을때-아이디 틀림) 
					x= -1;
				
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
		}

		public int confirmId(String id) 
		throws Exception {
			Connection conn = null;
	        PreparedStatement pstmt = null;
			ResultSet rs= null;
	        String dbpasswd="";
			int x=-1;
	        
			try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"select id from MEMBER where id = ?");
	            pstmt.setString(1, id);
	            rs= pstmt.executeQuery();

				if(rs.next())
					x= 1; 
				else
					x= -1;	
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
		}


	    public MemberDAO getMember(String id)
	    throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        MemberDAO member=null;
	        try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	            	"select * from MEMBER where id = ?");
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                MemberDTO member1 = new MemberDTO();          //DTO에 다 보냄.
	                member1.setId(rs.getString("id"));
	                member1.setPw(rs.getString("pw"));
					member1.setName(rs.getString("name"));
					member1.setBirth(rs.getString("birth")); 
	                member1.setPhonenumber(rs.getString("phonenumber"));
					member1.setEmail(rs.getString("email"));  
					member1.setDelivery_address(rs.getString("delivery_address")); 
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return member;  //DTO 리턴받음
	    }
	    
	    public void updateMember(MemberDTO member)
	    throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            conn = getConnection();
	            
	            pstmt = conn.prepareStatement(
	              "update MEMBER set pw=?,name=?,email=?"+
	              "where id=?");
	            pstmt.setString(1, member.getPw());
	            pstmt.setString(2, member.getName());
	            pstmt.setString(3, member.getEmail());
	            pstmt.setString(4, member.getId());
	            
	            pstmt.executeUpdate();
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
	    }
	    
	    public int deleteMember(String id, String passwd)
	    throws Exception {
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs= null;
	        String dbpasswd="";
	        int x=-1;
	        try {
				conn = getConnection();

	            pstmt = conn.prepareStatement(
	            	"select pw from MEMBER where id = ?");
	            pstmt.setString(1, id);
	            rs = pstmt.executeQuery();
	            
				if(rs.next()){
					dbpasswd= rs.getString("pw");                //비밀번호 같아야 탈퇴진행해줌 
					if(dbpasswd.equals(passwd)){
						pstmt = conn.prepareStatement(
	            	      "delete from MEMBER where id=?");
	                    pstmt.setString(1, id);
	                    pstmt.executeUpdate();
						x= 1; 
					}else
						x= 0;
				}
	        } catch(Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	        }
			return x;
	    }
	    
	    public String idFind(MemberDTO dto)
	    	    throws Exception {
	    	        Connection conn = null;
	    	        PreparedStatement pstmt = null;
	    	        ResultSet rs = null;
	    	        String result =null;
	    	        try {
	    	        	conn = getConnection();
	    	        	String sql = "select id from member where name=? and email=? and phonenumber=?";
	    	        	pstmt = conn.prepareStatement(sql);
	    	        	pstmt.setString(1, dto.getName());
	    	        	pstmt.setString(2, dto.getEmail());
	    	        	pstmt.setString(3, dto.getPhonenumber());
	    	        	rs=pstmt.executeQuery();
	    	        	if(rs.next()) {
	    	        		result=rs.getString("id"); 
	    	        	}
	    	        }catch(Exception e) {
	    	        	e.printStackTrace();
	    	        }finally {
	    	        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    	        }
	    	        
	    	        return result;
	    	}
	    
	    public boolean loginCheck(MemberDTO dto) {
			boolean result = false;
			 Connection conn = null;
		       PreparedStatement pstmt = null;
		       ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement("select * from test2 where id=? and pw=?");  //쿼리문 실행
				pstmt.setString(1, dto.getId()); //물음표 채우기
				pstmt.setString(2, dto.getPw());
				
				rs = pstmt.executeQuery(); //쿼리문 실행결과는 resultset에 넣음
				if(rs.next()) {
					result=true;
				}
						
			
			}catch(Exception e) {
				e.printStackTrace();  //예외내용이 콘솔창에 들여쓰기돼서 나오게 함
				
			}finally {
				if(pstmt != null) {
					try {pstmt.close();}
					catch(Exception e) {}
					}    //close()가 예외가 있음
				if(conn != null) {
					try {conn.close();}
					catch(Exception se) {}
				}
				if(rs != null) {
					try {rs.close();}
					catch(Exception e) {}
			    }
			}
			return result;
		
	}
	 }
	    
	    



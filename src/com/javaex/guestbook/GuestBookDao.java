package com.javaex.guestbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestBookDao {
	
	//<필드>
	
	// --연결관련 필드--
	// 0. import java.sql.*;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		private String id = "webdb"; 
		private String pw = "webdb";
		
	// --리스트 필드--	
		List<GuestBookVo> gList;
	
	// --각 메소드 결과처리 위한 필드--
		int count=0;
		
		
	//<생성자>
	
	
	//<g/s>
	
	
	//<메서드>
	
	//--DB와 연결관련 메서드--
	
	public void getConnection() {
		
		try {
		    // 1. JDBC 드라이버 (Oracle) 로딩
			Class.forName(driver);

		    // 2. Connection 얻어오기
			
			conn = DriverManager.getConnection(url, id , pw);

		} catch (ClassNotFoundException e) {
		    System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
		    System.out.println("error:" + e);
		}

	}
	
	//자원정리 메서드
	public void close() {
	    try {
	        if (rs != null) {
	            rs.close();
	        }                
	        if (pstmt != null) {
	            pstmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    } catch (SQLException e) {
	        System.out.println("error:" + e);
	    }
	}
	
	
	////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////
	
	
	// DB에서 리스트 가져오기
	
	public List<GuestBookVo> getList(){
		
		getConnection();
		gList = new ArrayList<>();
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		    String query = "select   no, ";
		    	   query += "        name, ";
		    	   query += "        password, ";
		    	   query += "        content, ";
		    	   query += "        reg_date ";
		    	   query += "from    guestbook ";
		    
		    pstmt = conn.prepareStatement(query);	   
		    rs = pstmt.executeQuery();
		    
		    while(rs.next()) {
		    	
		    	int no = rs.getInt(1);
		    	String name = rs.getString(2);
		    	String pw = rs.getString(3);
		    	String content = rs.getString(4);
		    	String date = rs.getString(5);
		    	
		    	gList.add(new GuestBookVo(no, name, pw, content, date));
		    }
		   
		    
		    
		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return gList;
	}
	
	//DB에서 데이터 하나 가져오기
	public GuestBookVo getGuest(int no){
		
		getConnection();
		
		GuestBookVo gv=null;
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		    String query = "select   no, ";
				   query += "        name, ";
				   query += "        password, ";
				   query += "        content, ";
				   query += "        reg_date ";
				   query += " from    guestbook ";
				   query += " where no = ? ";
				
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int number = rs.getInt(1);
				String name = rs.getString(2);
				String password = rs.getString(3);
				String content = rs.getString(4);
				String reg_date = rs.getString(5);
				
				gv = new GuestBookVo(number,name,password,content,reg_date);
				
			}
			
		    
		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return gv;
		
	}
	
	//비밀번호 아이디 맞는지 체크만 하는 기능
	
	public int check(int no, String name, String password){
		
		getConnection();
		
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		
				String query = "delete from guestbook ";
		    	   	   query += "where no = ? and name = ? and password = ? ";
		    	   	   
		    	   	   pstmt = conn.prepareStatement(query);	   
		    	   	   pstmt.setInt(1, no);
		    	   	   pstmt.setString(2, name);
		    	   	   pstmt.setString(3, password);
		    	   	
		    	   	   count = pstmt.executeUpdate();
	
		   conn.commit(); 
		    
		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return count;
	}
	
	
	
	
	
	
	//DB에서 삭제
	public int delete(int no, String name, String password){
		
		getConnection();
		
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		
				String query = "delete from guestbook ";
		    	   	   query += "where no = ? and name = ? and password = ? ";
		    	   	   
		    	   	   pstmt = conn.prepareStatement(query);	   
		    	   	   pstmt.setInt(1, no);
		    	   	   pstmt.setString(2, name);
		    	   	   pstmt.setString(3, password);
		    	   	
		    	   	   count = pstmt.executeUpdate();
	
		   conn.commit(); 
		    
		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return count;
	}
	
	
	//DB 수정
	public int update(GuestBookVo gv){
		
		getConnection();
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		    String query = "update guestbook ";
		    	   query += "set   name = ? ";
				   query += "      password = ? ";	   
				   query += "      content = ? ";
				   query += "      reg_date = sysdate ";
				   query += "where no = ? ";

		    pstmt = conn.prepareStatement(query);	   
		    pstmt.setString(1, gv.name);
		    pstmt.setString(2, gv.pw);
		    pstmt.setString(3, gv.content);
		    pstmt.setString(4, gv.date);
		    
		    // 4. 결과처리
		   count = pstmt.executeUpdate();

		   conn.commit();
		   
		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return count;
	}
	
	

	
	
	//DB 등록
	public int insert(GuestBookVo gv){
		
		getConnection();
		
		try {
		    // 3. SQL문 준비 / 바인딩 / 실행
		    String query = "insert into guestbook ";
		    	   query += "values(seq_no.nextval, ? , ? , ? , sysdate ) ";
				 

		    pstmt = conn.prepareStatement(query);	   
		    pstmt.setString(1, gv.name);
		    pstmt.setString(2, gv.pw);
		    pstmt.setString(3, gv.content);
		   
		    
		    // 4. 결과처리
		   count = pstmt.executeUpdate();
		   
		   conn.commit();

		}  catch (SQLException e) {
		    System.out.println("error:" + e);
		} 
		
		close();
		
		return count;
	}
	
	
	
	

	
}

package net.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO {
	private DBOpen dbopen=null;
	private DBClose dbclose=null;
	
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private StringBuilder sql=null;
	
	public MemberDAO() {
		dbopen=new DBOpen();
		dbclose=new DBClose();
	}//
	
	
	public int duplecateID(String uid) {
		ResultSet rs=null;
		int cnt=0;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT COUNT(id) AS cnt");
			sql.append(" FROM MEMBER"); 
			sql.append(" WHERE id=?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복조회 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return cnt;
		
	}//duplecateID() end
	
	
	public String memRank(String id, String password) {
		ResultSet rs=null;
		String mlevel=null;
		
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			
			sql.append(" SELECT mlevel");
			sql.append(" FROM member");
			sql.append(" WHERE id=? AND passwd=?"); 
			//sql.append(" AND mlevel in('A1', 'B1', 'C1', 'D1')");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mlevel=rs.getString("mlevel");
			}
		}catch(Exception e) {
			System.out.println("로그인 실패 : "+e);
		}finally {
			dbclose.close(con, pstmt, rs);
		}//try end
		
		return mlevel;
	}
	
}//class end

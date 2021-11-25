package Model_User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void getconn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "nextlevel2";
			String dbpw = "nextlevel123";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {// try에서 psmt, conn 객체 생성되지 않았다면 close()불가능
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
			psmt.close();
			}
			if(conn !=null) {
				conn.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int reviewWt (int cnum,String id, int rate, String opinion) {
		int cnt =0;
		try {
		getconn();

		String sql = "insert into T_rating values(T_RATING_SEQ.nextval,?,?,?,?,sysdate)"; // 테이블 내용 오면 수정 할 것!!

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, cnum);
		psmt.setString(2, id);
		psmt.setInt(3, rate);
		psmt.setString(4, opinion);

		cnt = psmt.executeUpdate();

		
	} catch (Exception e) {
		e.printStackTrace(); 
	

	} finally {
		close();
	}
	return cnt;
}
	
	public ArrayList<ratingVO> showreview(int cnum) {
		ArrayList<ratingVO> al = new ArrayList<ratingVO>();
		try {
			getconn();

			String sql = "select u_id, r_rating, r_opinion, reg_date from T_Rating where c_seq= ?"; // 테이블 내용 오면 수정 할 것!!

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cnum);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String u_id = rs.getString(1);
				int  r_rating = rs.getInt(2);
				String r_opinion = rs.getString(3);
				Date reg_date = rs.getDate(4);
				
				ratingVO vo = new ratingVO(u_id,r_rating,r_opinion,reg_date);
				al.add(vo);
				
			}

		} catch (Exception e) {
			e.printStackTrace(); 
		

		} finally {
			close();
		}
		return al;
	}
	
}

package Model_Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class BoardDAO {
	
	Connection conn =null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	public void get_conn() {
		try {		
			
			// 1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 연결
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "nextlevel2";
			String dbpw = "nextlevel123";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pst!=null) {
				pst.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	//2. 수정 기능
	public int updateArticle(String article_subject, String article_content, String file1, int article_seq) {
		
		int cnt = 0;
		
		try {
			get_conn();
			
			//3. 실행한 sql 정의
			String sql = "update T_community set ARTICLE_SUBJECT = ?, ARTICLE_CONTENT = ?, file1 = ? where ARTICLE_SEQ = ?";
			
			//4. 실행 객체 생성(PreparedStatement)
			pst = conn.prepareStatement(sql);
			//-> SQLException -> sql 정의가 제대로 되어있지 않을 때
			
			//5. 바인드 변수(?) 채우기
			pst.setString(1, article_subject);
			pst.setString(2, article_content);
			pst.setString(3, file1);
			pst.setInt(4, article_seq);


			
			//6. sql 실행
			//executeUpdate(): update, insert, delete(테이블 상에 변화 o) -> int
			//executeQuery(): select(테이블 상에 변화x) -> ResultSet(데이터)
			cnt = pst.executeUpdate();
			

			
		}catch(Exception e) { //try 에서 예외 상황이 발생한 경우
			System.out.println("게시판글 업데이트 실패!");
			e.printStackTrace(); //예외상황이 발생순서대로 출력
		}finally { //try에서 예외상황이 발생하던지/하지않던지 간에 무조건 마지막에 실행
			close();
		}
		
		return cnt;
		
	}
		
	public int HitCountBoard(int article_seq, int hitCnt) {
		
		int cnt = 0;
		
		try {
			get_conn();
			
			//3. 실행한 sql 정의
			String sql = "update T_community set cnt= ? where ARTICLE_SEQ = ?";
			
			//4. 실행 객체 생성(PreparedStatement)
			pst = conn.prepareStatement(sql);
			//-> SQLException -> sql 정의가 제대로 되어있지 않을 때
			
			//5. 바인드 변수(?) 채우기
			pst.setInt(1, hitCnt);
			pst.setInt(2, article_seq);


			
			//6. sql 실행
			//executeUpdate(): update, insert, delete(테이블 상에 변화 o) -> int
			//executeQuery(): select(테이블 상에 변화x) -> ResultSet(데이터)
			cnt = pst.executeUpdate();
			

			
		}catch(Exception e) { //try 에서 예외 상황이 발생한 경우
			System.out.println("게시판글 업데이트 실패!");
			e.printStackTrace(); //예외상황이 발생순서대로 출력
		}finally { //try에서 예외상황이 발생하던지/하지않던지 간에 무조건 마지막에 실행
			close();
		}
		
		return cnt;
		
	}
	

	public int writeArticle(String article_subject, String article_content, String file1, String u_id) {
		
		int cnt = 0;
		
		try {
			get_conn();
			
			//3. 실행한 sql 정의
			String sql = "insert into T_community values(article_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
			
			//4. 실행 객체 생성(PreparedStatement)
			pst = conn.prepareStatement(sql);
			//-> SQLException -> sql 정의가 제대로 되어있지 않을 때
			
			//5. 바인드 변수(?) 채우기
			pst.setString(1, article_subject);
			pst.setString(2, article_content);
			pst.setString(3, file1);
			pst.setInt(4, 0);
			pst.setString(5, u_id);

			
			//6. sql 실행
			//executeUpdate(): update, insert, delete(테이블 상에 변화 o) -> int
			//executeQuery(): select(테이블 상에 변화x) -> ResultSet(데이터)
			cnt = pst.executeUpdate();
			

			
		}catch(Exception e) { //try 에서 예외 상황이 발생한 경우
			System.out.println("게시판글 작성 실패!");
			e.printStackTrace(); //예외상황이 발생순서대로 출력
		}finally { //try에서 예외상황이 발생하던지/하지않던지 간에 무조건 마지막에 실행
			close();
		}
		
		return cnt;
		
	}
	
	//4. 전체 회원 정보
	
	public ArrayList<BoardVO> showArticle() {
		ArrayList<BoardVO> al = new ArrayList<BoardVO>();
		
		try {
			get_conn();
			// 3. 실행할 sql 정의
			String sql = "select C.ARTICLE_SEQ, C.ARTICLE_SUBJECT, C.ARTICLE_CONTENT, C.REG_DATE, C.file1, C.CNT, C.U_ID, U.U_nickname from T_community C, T_user U where C.u_id = U.u_id order by reg_date desc";

			// 4. PreparedStatement 객체 생성
			pst = conn.prepareStatement(sql);

			// 6. sql 실행 결과처리
			rs = pst.executeQuery();
			
			
			
			while (rs.next()) {
				int num = rs.getInt("ARTICLE_SEQ");
				String title = rs.getString("ARTICLE_SUBJECT");
				String CONTENT = rs.getString("ARTICLE_CONTENT");
				String REG_DATE = rs.getString("REG_DATE");
				String file1 = rs.getString("file1");
				int cnt = rs.getInt("CNT");
				String id = rs.getString("U_ID");
				String nick = rs.getString("u_nickname");

				
				BoardVO vo = new BoardVO(num, title, CONTENT, REG_DATE, file1, cnt, id, nick);
				
				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("불러오기 실패!");
			e.printStackTrace();

		} finally {
			close();
			

		}
		
		return al;
		
		
	}
	
	public BoardVO showOneArticle(int seq_num) {
		BoardVO vo = null;
		
		try {
			get_conn();
			// 3. 실행할 sql 정의
			String sql = "select C.ARTICLE_SEQ, C.ARTICLE_SUBJECT, C.ARTICLE_CONTENT, C.REG_DATE, C.file1, C.CNT, C.U_ID, U.U_nickname from T_community C, T_user U where C.u_id = U.u_id and c.article_seq=?";

			// 4. PreparedStatement 객체 생성
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, seq_num);

			// 6. sql 실행 결과처리
			rs = pst.executeQuery();
			
			
			
			while (rs.next()) {
				int num = rs.getInt("ARTICLE_SEQ");
				String title = rs.getString("ARTICLE_SUBJECT");
				String CONTENT = rs.getString("ARTICLE_CONTENT");
				String REG_DATE = rs.getString("REG_DATE");
				String file1 = rs.getString("file1");
				int cnt = rs.getInt("CNT");
				String id = rs.getString("U_ID");
				String nick = rs.getString("u_nickname");
				
				
				
				vo = new BoardVO(num, title, CONTENT, REG_DATE, file1, cnt, id, nick);
				


			}

		} catch (Exception e) {
			System.out.println("불러오기 실패!");
			e.printStackTrace();

		} finally {
			close();
			

		}
		
		return vo;
		
		
	}
	
	
	public BoardVO selectOne(String id) {
		BoardVO vo = null;
		
		try {
			get_conn();
			// 3. 실행할 sql 정의
			String sql = "select * from T_user where u_id = ?";

			// 4. PreparedStatement 객체 생성
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			// 6. sql 실행 결과처리
			rs = pst.executeQuery();
			
			
			
			while (rs.next()) {
				String get_id = rs.getString("U_ID");
				String name = rs.getString("U_NAME");
				String nick = rs.getString("U_NICKNAME");
				String phone = rs.getString("U_PHONE");
				String email = rs.getString("U_EMAIL");
				int postcd = rs.getInt("U_POSTCD");
				String addr = rs.getString("U_ADDR");
				String addrdtl1 = rs.getString("U_ADDRDTL1");
				String addrdtl2 = rs.getString("U_ADDRDTL2");
				String joinDt = rs.getString("U_JOINDATE");
				int point = rs.getInt("U_point");
				String status = rs.getString("U_status");

				


			}

		} catch (Exception e) {
			System.out.println("로그인실패!");
			e.printStackTrace();

		} finally {
			close();
			

		}
		
		return vo;
		
		
	}
	
	

	
	public int deleteArticle(int num) {
		
		int cnt = 0;
		
		try {
			get_conn();
			
			//3. 실행한 sql 정의
			String sql = "delete from t_community where article_seq = ?";
			
			//4. 실행 객체 생성(PreparedStatement)
			pst = conn.prepareStatement(sql);
			//-> SQLException -> sql 정의가 제대로 되어있지 않을 때
			
			//5. 바인드 변수(?) 채우기
			pst.setInt(1, num);
			
			//6. sql 실행
			//executeUpdate(): update, insert, delete(테이블 상에 변화 o) -> int
			//executeQuery(): select(테이블 상에 변화x) -> ResultSet(데이터)
			cnt = pst.executeUpdate();
			

			
		}catch(Exception e) { //try 에서 예외 상황이 발생한 경우
			e.printStackTrace(); //예외상황이 발생순서대로 출력
		}finally { //try에서 예외상황이 발생하던지/하지않던지 간에 무조건 마지막에 실행
			close();
		}
		
		return cnt;
		
		
		
		
	}
		
	
	
}
	
	



package ClassModel;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ClassModel.ClassVO;

public class ClassDAO {
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
	
	//cateSearch함수에서 리스트 값을 String 값으로 바꿔주는 method
	public String input(String[] array) {
		String a="";
		
		for(int i = 0; i<array.length;i++) {
			a += array[i];
			if(i != array.length-1){
			    a+= "|";
			  }
			}
		
		return a;
	}
	
	//카테고리에서 선택한 강의 정보 검색
	// 리스트 정보 = listInfo
	public ArrayList<ClassVO> Search(String cate) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		try {
			getconn();

			String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where C_CATEGORY1 = ?"; // 테이블 내용 오면 수정 할 것!!

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cate);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String c_name = rs.getString(1);
				Date c_start_dt = rs.getDate(2);
				Date c_end_dt = rs.getDate(3);
				int c_seq = rs.getInt(4);
				
				ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
				al.add(vo);
				
			}

		} catch (Exception e) {
			e.printStackTrace(); 
		

		} finally {
			close();
		}
		return al;
	}
	
	
	// 상세 카테고리에서 선택한 강의 정보 검색
	public ArrayList<ClassVO> cateSearch(String[] location, String[] time, String[] type, String cate) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		String a="";
		String b="";
		String c="";
		String d ="'";
		
		if(location==null) {
			a="'구'";
		}else {
		a=input(location);
		a=d+a+d;
		}
		
		if(time == null) {
			b="'타임'";
		}else{
		b=input(time);
		b=d+b+d;
		}
		
		if(type==null) {
			c="'형'";
		}else {
		c=input(type);
		c=d+c+d;
		}
		
		
		
		try {
			getconn();

			String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_category1= ? and regexp_like (c_location ,"+a+") and regexp_like (c_category3 ,"+b+") and regexp_like(c_category2 ,"+c+")";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();

			while (rs.next()) {
				
				String c_name = rs.getString(1);
				Date c_start_dt = rs.getDate(2);
				Date c_end_dt = rs.getDate(3);
				int c_seq = rs.getInt(4);
				
				ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
				al.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace(); 

		} finally {
			close();
		}
		return al;
	}
	
	// 모든 검색 카테고리 정보 
	public ArrayList<ClassVO> cateAllSearch(String[] location, String[] time, String[] type ,String Searchs) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		String a="";
		String b="";
		String c="";
		String d ="'";
		String sql ;
		
		if(location==null) {
			a="'구'";
		}else {
		a=input(location);
		a=d+a+d;
		}
		
		if(time == null) {
			b="'타임'";
		}else{
		b=input(time);
		b=d+b+d;
		}
		
		if(type==null) {
			c="'형'";
		}else {
		c=input(type);
		c=d+c+d;
		}
	
		
		try {
			getconn();
			if (Searchs==null) {
				sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where regexp_like (c_location ,"+a+") and regexp_like (c_category3 ,"+b+") and regexp_like(c_category2 ,"+c+")";
				psmt = conn.prepareStatement(sql);
			}else {
				sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_name like ? and regexp_like (c_location ,"+a+") and regexp_like (c_category3,"+b+") and regexp_like(c_category2 ,"+c+")";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+Searchs+"%");
				
			}
			
			
			rs = psmt.executeQuery();
			while (rs.next()) {
				
				String c_name = rs.getString(1);
				Date c_start_dt = rs.getDate(2);
				Date c_end_dt = rs.getDate(3);
				int c_seq = rs.getInt(4);
				
				ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
				al.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace(); 

		} finally {
			close();
		}
		return al;
	}
	
	
	//상세 페이지정보 검색 
	public ClassVO show(int cnum) {
		ClassVO vo =null;
		try {
			getconn();

			String sql = "select * from T_Class where c_seq= ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cnum);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int c_seq = rs.getInt(1);
				int edu_seq = rs.getInt(2);
				String c_name = rs.getString(3);
				String c_category1 = rs.getString(4);
				String c_category2 = rs.getString(5);
				String c_category3= rs.getString(6);
				String c_location = rs.getString(7);
				String c_time = rs.getString(8);
				Date c_start_dt = rs.getDate(9);
				Date c_end_dt = rs.getDate(10);
				int c_count = rs.getInt(11);
				String c_pay = rs.getString(12);
				String c_content = rs.getString(13);
				String c_tchnm = rs.getString(14);
				String c_tchsp = rs.getString(15);
				
				vo = new ClassVO(c_seq, edu_seq, c_name, c_category1, c_category2, c_category3,
						 c_location, c_time, c_start_dt,c_end_dt, c_count, c_pay,
						c_content, c_tchnm, c_tchsp) ;
				
			}

		} catch (Exception e) {
			e.printStackTrace(); 

		} finally {
			close();
		}
		return vo;
	}

	
	//수강 신청한 클래스 삽입 하기
	public int ApplyClass(int C_seq, String id ) {
		int cnt=0;
		try {
			getconn();

			String sql = "insert into T_TIMETABLE values(T_TIMETABLE_SEQ.nextval,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);

			// 5. 바인드 변수(?) 채우기
			psmt.setString(1, id);
			psmt.setInt(2, C_seq);


			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace(); 

		} finally {
			close();
			}
			return cnt;
		}


	//수강 신청강의 중복 확인
	public int DistinctClass (int cnum) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		int result = 0;
	try {
		getconn();

		String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_seq = ?"; // 테이블 내용 오면 수정 할 것!!

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, cnum);

		rs = psmt.executeQuery();

		while (rs.next()) {
			
			String c_name = rs.getString(1);
			Date c_start_dt = rs.getDate(2);
			Date c_end_dt = rs.getDate(3);
			int c_seq = rs.getInt(4);
			
			ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
			al.add(vo);
		}
			for(int i=0;i<al.size();i++){
				int [] ary = {al.get(i).getC_seq()};
					for(int j=0;j<i;j++) {
						if(al.get(i).getC_seq() == al.get(j).getC_seq()) {
							result = 1;
						} else {
							result = 2;
						}
					}
			}
		
	} catch (Exception e) {
		e.printStackTrace(); 
	

	} finally {
		close();
	}
	return result;
}

	//메인 페이지 검색 
	public ArrayList<ClassVO> MainSearch(String Searchs) {
	ArrayList<ClassVO> al = new ArrayList<ClassVO>();
	try {
		getconn();

		String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_name like ?"; // 테이블 내용 오면 수정 할 것!!

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, "%"+Searchs+"%");

		rs = psmt.executeQuery();

		while (rs.next()) {
			
			String c_name = rs.getString(1);
			Date c_start_dt = rs.getDate(2);
			Date c_end_dt = rs.getDate(3);
			int c_seq = rs.getInt(4);
			
			ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
			al.add(vo);
			
		}

	} catch (Exception e) {
		e.printStackTrace(); 
	

	} finally {
		close();
	}
	return al;
}
	
	//테스트 결과 검색 
		public ArrayList<ClassVO> TestSearch(String type) {
			ArrayList<ClassVO> al = new ArrayList<ClassVO>();
			try {
				getconn();

				String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_category2 like ?"; // 테이블 내용 오면 수정 할 것!!

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+type+"%");

				rs = psmt.executeQuery();

				while (rs.next()) {
					
					String c_name = rs.getString(1);
					Date c_start_dt = rs.getDate(2);
					Date c_end_dt = rs.getDate(3);
					int c_seq = rs.getInt(4);
					
					ClassVO vo = new ClassVO(c_name,c_start_dt,c_end_dt,c_seq);
					al.add(vo);
					
				}

			} catch (Exception e) {
				e.printStackTrace(); 
			

			} finally {
				close();
			}
			return al;
		}

		
		public ArrayList<ClassVO> nearClassSearch() {
			      ArrayList<ClassVO> al = new ArrayList<ClassVO>();
			         
			      try {
			         getconn();

			         String sql = "select * from T_CLASS";

			         psmt = conn.prepareStatement(sql);
			         rs = psmt.executeQuery();

			         while (rs.next()) {
			            
			            int c_seq = rs.getInt("c_seq");
			            String c_name = rs.getString("c_name");
			            String c_location = rs.getString("c_location");
			            String c_pay = rs.getString("c_pay");
			            
			            ClassVO vo = new ClassVO(c_seq, c_name, c_location, c_pay);
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




	
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
		try {// try���� psmt, conn ��ü �������� �ʾҴٸ� close()�Ұ���
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
	
	//cateSearch�Լ����� ����Ʈ ���� String ������ �ٲ��ִ� method
	
	public String input(String[] array) {
		String cateList="";
		
		for(int i = 0; i<array.length;i++) {
			cateList += array[i];
			if(i != array.length-1){
				cateList+= "|";
			  }
			}
		
		return cateList;
	}
	
	//ī�װ����� ������ ���� ���� �˻�
	// ����Ʈ ���� = listInfo
	public ArrayList<ClassVO> Search(String cate) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		try {
			getconn();

			String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where C_CATEGORY1 = ?"; // ���̺� ���� ���� ���� �� ��!!

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
	
	
	// �� ī�װ����� ������ ���� ���� �˻�
	public ArrayList<ClassVO> cateSearch(String[] location, String[] time, String[] type, String cate) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		String cateLoca="";
		String cateTime="";
		String cateType="";
		String apo ="'";
		
		if(location==null) {
			cateLoca="'��'";
		}else {
			cateLoca=apo+input(location)+apo;
		}
		
		if(time == null) {
			cateTime="'Ÿ��'";
		}else{
			cateTime=apo+input(time)+apo;
		}
		
		if(type==null) {
			cateType="'��'";
		}else {
			cateType=apo+input(type)+apo;
		}
		
		
		
		try {
			getconn();

			String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_category1= ? and regexp_like (c_location ,"+cateLoca+") "
					+ " and regexp_like(c_category2 ,"+cateType+") and regexp_like (c_category3 ,"+cateTime+")";
			
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
	
	// ��� �˻� ī�װ� ���� 
	public ArrayList<ClassVO> cateAllSearch(String[] location, String[] time, String[] type ,String Searchs) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		String a="";
		String b="";
		String c="";
		String d ="'";
		String sql ;
		
		if(location==null) {
			a="'��'";
		}else {
		a=input(location);
		a=d+a+d;
		}
		
		if(time == null) {
			b="'Ÿ��'";
		}else{
		b=input(time);
		b=d+b+d;
		}
		
		if(type==null) {
			c="'��'";
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
	
	
	//�� ���������� �˻� 
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

	
	//���� ��û�� Ŭ���� ���� �ϱ�
	public int ApplyClass(int C_seq, String id ) {
		int cnt=0;
		try {
			getconn();

			String sql = "insert into T_TIMETABLE values(T_TIMETABLE_SEQ.nextval,?,?,sysdate)";

			psmt = conn.prepareStatement(sql);

			// 5. ���ε� ����(?) ä���
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


	//���� ��û���� �ߺ� Ȯ��
	public int DistinctClass (int cnum) {
		ArrayList<ClassVO> al = new ArrayList<ClassVO>();
		int result = 0;
	try {
		getconn();

		String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_seq = ?"; // ���̺� ���� ���� ���� �� ��!!

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

	//���� ������ �˻� 
	public ArrayList<ClassVO> MainSearch(String Searchs) {
	ArrayList<ClassVO> al = new ArrayList<ClassVO>();
	try {
		getconn();

		String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_name like ?"; // ���̺� ���� ���� ���� �� ��!!

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
	
	//�׽�Ʈ ��� �˻� 
		public ArrayList<ClassVO> TestSearch(String type) {
			ArrayList<ClassVO> al = new ArrayList<ClassVO>();
			try {
				getconn();

				String sql = "select c_name, c_start_dt, c_end_dt, c_seq from T_Class where c_category2 like ?"; // ���̺� ���� ���� ���� �� ��!!

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

			         String sql = "select * from T_CLASS order by c_seq desc";

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




	
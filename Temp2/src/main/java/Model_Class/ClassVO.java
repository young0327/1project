package Model_Class;

public class ClassVO {

	private int c_seq;
	private int edu_seq;
	private String c_name;
	private String c_category1;
	private String c_category2;
	private String c_category3;
	private String c_location;
	private String c_time;
	private String c_start_dt;
	private String c_end_dt;
	private int c_count;
	private int c_pay;
	
	
	public ClassVO(int c_seq, int edu_seq, String c_name, String c_category1, String c_category2, String c_category3,
			String c_location, String c_time, String c_start_dt, String c_end_dt, int c_count, int c_pay) {
		super();
		this.c_seq = c_seq;
		this.edu_seq = edu_seq;
		this.c_name = c_name;
		this.c_category1 = c_category1;
		this.c_category2 = c_category2;
		this.c_category3 = c_category3;
		this.c_location = c_location;
		this.c_time = c_time;
		this.c_start_dt = c_start_dt;
		this.c_end_dt = c_end_dt;
		this.c_count = c_count;
		this.c_pay = c_pay;
	}


	public int getC_seq() {
		return c_seq;
	}


	public int getEdu_seq() {
		return edu_seq;
	}


	public String getC_name() {
		return c_name;
	}


	public String getC_category1() {
		return c_category1;
	}


	public String getC_category2() {
		return c_category2;
	}


	public String getC_category3() {
		return c_category3;
	}


	public String getC_location() {
		return c_location;
	}


	public String getC_time() {
		return c_time;
	}


	public String getC_start_dt() {
		return c_start_dt;
	}


	public String getC_end_dt() {
		return c_end_dt;
	}


	public int getC_count() {
		return c_count;
	}


	public int getC_pay() {
		return c_pay;
	}
	
	
}

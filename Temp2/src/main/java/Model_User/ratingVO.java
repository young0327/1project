package Model_User;

import java.sql.Date;

public class ratingVO {
	private int r_seq;
	private int c_seq;
	private String u_id;
	private int r_rating;
	private String r_opinion;
	private Date reg_date;
	public ratingVO(int r_seq, int c_seq, String u_id, int r_rating, String r_opinion, Date reg_date) {
		super();
		this.r_seq = r_seq;
		this.c_seq = c_seq;
		this.u_id = u_id;
		this.r_rating = r_rating;
		this.r_opinion = r_opinion;
		this.reg_date = reg_date;
	}
	public ratingVO(String u_id, int r_rating, String r_opinion, Date reg_date) {
		this.u_id = u_id;
		this.r_rating = r_rating;
		this.r_opinion = r_opinion;
		this.reg_date = reg_date;
	}
	public int getR_seq() {
		return r_seq;
	}
	public int getC_seq() {
		return c_seq;
	}
	public String getU_id() {
		return u_id;
	}
	public int getR_rating() {
		return r_rating;
	}
	public String getR_opinion() {
		return r_opinion;
	}
	public Date getReg_date() {
		return reg_date;
	}
	
	
	
}

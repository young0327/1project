package Model_Board;

public class BoardVO {
	
	private int article_seq;
	private String article_subject;
	private String article_content;
	private String reg_date;
	private String file1;
	private int cnt;
	private String u_id;
	private String nick;
	
	
	public BoardVO(int article_seq, String article_subject, String article_content, String reg_date, String file1,
			int cnt, String u_id, String nick) {
		super();
		this.article_seq = article_seq;
		this.article_subject = article_subject;
		this.article_content = article_content;
		this.reg_date = reg_date;
		this.file1 = file1;
		this.cnt = cnt;
		this.u_id = u_id;
		this.nick = nick;
	}


	public int getArticle_seq() {
		return article_seq;
	}


	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}


	public String getArticle_subject() {
		return article_subject;
	}


	public void setArticle_subject(String article_subject) {
		this.article_subject = article_subject;
	}


	public String getArticle_content() {
		return article_content;
	}


	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}


	public String getReg_date() {
		return reg_date;
	}


	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}


	public String getFile1() {
		return file1;
	}


	public void setFile1(String file1) {
		this.file1 = file1;
	}


	public int getCnt() {
		return cnt;
	}


	public void setCnt(int cnt) {
		this.cnt = cnt;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getNick() {
		return nick;
	}


	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
	
	
	

	
	

	
	

}

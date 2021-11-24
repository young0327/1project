package Model_Board;

public class BoardVO {
	
	private int article_seq;
	private String article_subject;
	private String article_content;
	private String reg_date;
	private String file1;
	private String file2;
	private int cnt;
	private String u_id;
	private String nick;
	
	
	public BoardVO(int article_seq, String article_subject, String article_content, String reg_date, String file1,
			String file2, int cnt, String u_id, String nick) {
		super();
		this.article_seq = article_seq;
		this.article_subject = article_subject;
		this.article_content = article_content;
		this.reg_date = reg_date;
		this.file1 = file1;
		this.file2 = file2;
		this.cnt = cnt;
		this.u_id = u_id;
		this.nick = nick;
	}


	public int getArticle_seq() {
		return article_seq;
	}


	public String getArticle_subject() {
		return article_subject;
	}


	public String getArticle_content() {
		return article_content;
	}


	public String getReg_date() {
		return reg_date;
	}


	public String getFile1() {
		return file1;
	}


	public String getFile2() {
		return file2;
	}


	public int getCnt() {
		return cnt;
	}


	public String getU_id() {
		return u_id;
	}


	public String getNick() {
		return nick;
	}
	
	

	
	

}

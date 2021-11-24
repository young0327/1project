package Model_Comment;

public class CommentVO {
	private int comm_seq;
	private int article_seq;
	private String comm_content;
	private String reg_date;
	private String u_id;
	
	
	public CommentVO(int comm_seq, int article_seq, String comm_content, String reg_date, String u_id) {
		super();
		this.comm_seq = comm_seq;
		this.article_seq = article_seq;
		this.comm_content = comm_content;
		this.reg_date = reg_date;
		this.u_id = u_id;
	}


	public int getComm_seq() {
		return comm_seq;
	}


	public int getArticle_seq() {
		return article_seq;
	}


	public String getComm_content() {
		return comm_content;
	}


	public String getReg_date() {
		return reg_date;
	}


	public String getU_id() {
		return u_id;
	}
	
	
	
	

}

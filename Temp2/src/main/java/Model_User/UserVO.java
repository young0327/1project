package Model_User;

public class UserVO {
	
	private String id;
	private String name;
	private String nick;
	private String phone;
	private String email;
	private int postcd;
	private String addr;
	private String addrdtl1;
	private String addrdtl2;
	private String joinDt;
	private int point;
	private String status;
	
	
	public UserVO(String id, String name, String nick, String phone, String email, int postcd, String addr,
			String addrdtl1, String addrdtl2, String joinDt, int point, String status) {
		super();
		this.id = id;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.email = email;
		this.postcd = postcd;
		this.addr = addr;
		this.addrdtl1 = addrdtl1;
		this.addrdtl2 = addrdtl2;
		this.joinDt = joinDt;
		this.point = point;
		this.status = status;
	}


	public String getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public String getNick() {
		return nick;
	}


	public String getPhone() {
		return phone;
	}


	public String getEmail() {
		return email;
	}


	public int getPostcd() {
		return postcd;
	}


	public String getAddr() {
		return addr;
	}


	public String getAddrdtl1() {
		return addrdtl1;
	}


	public String getAddrdtl2() {
		return addrdtl2;
	}


	public String getJoinDt() {
		return joinDt;
	}


	public int getPoint() {
		return point;
	}


	public String getStatus() {
		return status;
	}
	
	
	
	
	
	
	
	

	
	
	
}

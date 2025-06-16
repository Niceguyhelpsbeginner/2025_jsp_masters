package users;

public class UsersDTO {
    private String usernum;
	private String username;
	private String address;
	private String password;
	private String nickname;
	
	
	// 모든 필드를 매개변수로 받는 생성자
	public UsersDTO(String usernum, String username, String address, String password, String nickname) {
		this.usernum = usernum;
		this.username = username;
		this.address = address;
		this.password = password;
		this.nickname = nickname;
	}
	public UsersDTO(String username, String password) {
		this.username = username;
		this.password = password;
	}
	// 기본 생성자
	public UsersDTO() {
	}
		
	public String getUsernum() {
		return this.usernum;
	}
	
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getpassword() {
		return this.password;
	}
	
	public void setpassword(String password) {
		this.password = password;
	}
	
	public String getNickname() {
		return this.nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}

package users;

public class UsersDTO {
    private String usernum;
	private String username;
	private String address;
	private String pwd;
	private String nickname;
	
	// 기본 생성자
	public UsersDTO() {
	}
	
	// 모든 필드를 매개변수로 받는 생성자
	public UsersDTO(String usernum, String username, String address, String pwd, String nickname) {
		this.usernum = usernum;
		this.username = username;
		this.address = address;
		this.pwd = pwd;
		this.nickname = nickname;
	}
	
	public String getUsernum() {
		return usernum;
	}
	
	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}

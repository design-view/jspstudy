package model;

public class UserDTO {
	private String username;
	private int userage;
	
	@Override
	public String toString() {
		return "UserDTO [username=" + username + ", userage=" + userage + "]";
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUserage() {
		return userage;
	}
	public void setUserage(int userage) {
		this.userage = userage;
	}
	
	
	
}

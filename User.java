public class User {
	private String username;
	private String password;

	//constructor to create user with this information
	public User(String un, String pw) {
		username = un;
		password = pw;
	}

	//sets username
	public void setUsername(String un) {
		username = un;
	}

	//sets password
	public void setPassword(String pw) {
		password = pw;
	}

	//returns username
	public String getUsername() {
		return username;
	}

	//returns password
	public String getPassword() {
		return password;
	}
}
//import DatabaseInteract
//import User
//import Login

public class SignUp {
	private String username;
	private String password;
	//if we need a timestamp for login, why don't we have one for signup?

	//deault constructor sets current user to null
	public SignUp() {
		username = null;
		password = null;
	}

	//constructor sets current user to these inputs
	public SignUp(String un, String pw) {
		username = un;
		password = pw;
	}

	//returns true if the user is successfully logged in, false if not
	public Boolean validateUser(String username, String password) {
		DatabaseInteract dataInteract = new DataBaseInteract();
		User curUser = dataInteract.queryUser(username);
		Boolean success = (curUser == null);
		if(success) {
			User addThisUser = new User(username, password);
			dataInteract.addUser(addThisUser);

			Login login = new Login();
			login.userValidated(username, password);
			return true;
		}

		return success;
	}

	public void setUsername(String un) {
		username = un;
	}

	public void setPassword(String pw) {
		password = pw;
	}
}
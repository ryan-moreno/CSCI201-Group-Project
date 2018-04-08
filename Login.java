//import DatabaseInteract
//import User

public class Login {
	String username;
	String password;

	//deault constructor sets current user to null
	public Login() {
		username = null;
		password = null;
	}

	//constructor sets current user to these inputs
	public Login(String un, String pw, String ts) {
		username = un;
		password = pw;
	}

	//returns true if the user is successfully logged in, false if not
	public Boolean userValidated(String username, String password) {
		DatabaseInteract dataInteract = new DataBaseInteract();
		User[] userArr = dataInteract.getUsers();

		Boolean found = false;
		int i = 0;
		while(userArr[i] != null) {
			if(userArr[i].getUsername().equals(username) && userArr[i].equals(password)) {
				found = true;
				//tell swift code:
				//LoginSession.shareInstance.isLogin = true
				//LoginSession.shareInstance.username = //(java's username)
				break;
			}
		}

		return found;
	}

	//sets username
	public void setUsername(String un) {
		username = un;
	}

	//sets password
	public void setPassword(String pw) {
		password = pw;
	}

}

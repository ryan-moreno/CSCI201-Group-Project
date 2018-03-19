//import DatabaseInteract
//import User
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Login {
	String username;
	String password;
	String timestamp;

	//deault constructor sets current user to null
	public Login() {
		username = null;
		password = null;
		timestamp = null;
	}

	//constructor sets current user to these inputs
	public Login(String un, String pw, String ts) {
		username = un;
		password = pw;
		//unclear what the timestamp is for
		timestamp = ts;
	}

	//returns true if the user is successfully logged in, false if not
	public Boolean userValidated(String username, String password) {
		String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
		DatabaseInteract dataInteract = new DataBaseInteract();
		User[] userArr = dataInteract.getUsers();

		Boolean found = false;
		int i = 0;
		while(userArr[i] != null) {
			if(userArr[i].getUsername().equals(username) && userArr[i].equals(password)) {
				found = true;
				//set the user logged in for the current opened application to this user
				//unsure how we are implementing this
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

	//sets timestamp

	public void setTimestamp(String ts) {
		timestamp = ts;
	}
}

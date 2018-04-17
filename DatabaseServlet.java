package servlets;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import classes.User;
import classes.DatabaseInteract;

/**
 * Servlet implementation class DatabaseServlet
 */
@WebServlet("/DatabaseServlet")
public class DatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    JSONObject jsonObject = new JSONObject();
	    String responseString = "";
	    
	    //get json data from call from swift code
	    String jsonData = request.getParameter("jsondata");
	
	    try {
	    		jsonObject = new JSONObject(jsonData);
	    } catch (JSONException je) {
			System.out.println("je" + je.getMessage());
		}
		
	    //check if successful login or signup
	    if(jsonObject != null) {
	    		String username = "";
	    		String password = "";
	    		Boolean login = true;
	    		Boolean jsonFail = false;
	    		try {
			    //get username from json data
			    username = (String) jsonObject.get("username");
			    //get password from json data
			    password = (String) jsonObject.get("password");
			    //get whether user is signing in or logging up
			    login = (Boolean) jsonObject.get("login");
	    		} catch (JSONException je) {
	    			jsonFail = true;
	    		}
			
		    if(!jsonFail && username != null && username.length() != 0 && password != null && password.length() != 0) {
		    		DatabaseInteract db = new DatabaseInteract();
		    		if(login) {
		    			responseString = db.attemptLogin(username, password);
		    		} else {
		    			responseString = db.attemptSignup(username, password);
		    		}
		    } else {
		    		responseString = "Please provide both a username and password";
		    }
	    }
	    
	    //if successful, set response to true, if not, to false
//	    String json1 = gson.toJson(success);
//	    String json2 = gson.toJson(usernameExists);
//	    String bothJson = "["+json1+","+json2+"]";
//	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(responseString);
	}
	
}

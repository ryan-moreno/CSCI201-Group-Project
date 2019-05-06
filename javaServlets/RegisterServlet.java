package pkg;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    JSONObject jsonObject = new JSONObject();
	    String responseString = "";
	    
	    String jsonData = request.getParameter("jsondata");
	
	    try {
	    	JSONParser parser = new JSONParser();	
            Object obj = parser.parse(jsonData);
            jsonObject = (JSONObject) obj;
	    } catch (ParseException je) {
			System.out.println("je" + je.getMessage());
		}
		
	    if(jsonObject != null) {
			    String username = (String) jsonObject.get("username");
			    String password = (String) jsonObject.get("password");
		    	System.out.println(username);
		    	System.out.println(password);    		
	    }
	    
	    responseString = "success";

	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(responseString);
	}
	
}

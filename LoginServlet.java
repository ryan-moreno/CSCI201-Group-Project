package servlets;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.DatabaseInteract;

/**
 * Servlet implementation class ViewMessageServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in LoginServlet");
		if ("POST".equalsIgnoreCase(request.getMethod())) 
		{
			String httpBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			System.out.println(httpBody);
			
			String username = httpBody.split(",")[0];
			String password = httpBody.split(",")[1];
			
			DatabaseInteract db = new DatabaseInteract();
			String error = db.attemptLogin(username, password);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(error);
		}
	}
}
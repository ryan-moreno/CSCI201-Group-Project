package pkg;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewMessageServlet
 */
@WebServlet("/ViewMessageServlet")
public class ViewMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in CreateMessageServlet");
		if ("POST".equalsIgnoreCase(request.getMethod())) 
		{
			String httpBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
			System.out.println(httpBody);
			
			//katies code
			//will receive a string in json format, convert, then place in the database
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("testing");
		}
	}
}

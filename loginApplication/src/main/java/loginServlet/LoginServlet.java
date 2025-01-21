package loginServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
     // Check if credentials are valid
        if ("admin".equals(username) && "password123".equals(password)) {
            response.sendRedirect("welcome.jsp");  // Redirect to welcome page after successful login
        } else if((!username.isEmpty() || !password.isEmpty()) || (!"admin".equals(username) || !"password123".equals(password))) {
        	 request.setAttribute("errorMessage", "Invalid credentials. Try again.");
            request.getRequestDispatcher("/login.jsp").forward(request, response); // Forward back to login.jsp with error message
          
        }
    }


 
}

package signUpServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Database connection
	private static final String DB_URL = "jdbc:mysql://localhost:3306/signupData";
	private static final String DB_username = "root";
	private static final String DB_password = "root";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String Name = request.getParameter("full_name");
		String mailId = request.getParameter("mailId");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String empRole = request.getParameter("Employee_Role");
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//load mysql JDBC driver
			
			Connection connection = DriverManager.getConnection(DB_URL, DB_username, DB_password);
			if (connection != null) {
			    out.println("<h2>Connection successful!</h2>");
			} else {
			    out.println("<h2>Connection failed!</h2>");
			}
			String query = "INSERT INTO userDetails(full_name, mailId, username, password, Employee_Role) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
				
			 	preparedStatement.setString(1, Name);
	            preparedStatement.setString(2, mailId);
	            preparedStatement.setString(3, username);
	            preparedStatement.setString(4, password);  // Consider hashing passwords in real applications
	            preparedStatement.setString(5, empRole); 
	            

	            int result = preparedStatement.executeUpdate();
	            if (result > 0) {
	                out.println("<h2>Signup successful!</h2>");
	            } else {
	                out.println("<h2>Error: Unable to sign up. Please try again.</h2>");
	            }

	            preparedStatement.close();
	            connection.close();
	            
		}catch(Exception e){
			e.printStackTrace(out);
		}
		
		
	}

}

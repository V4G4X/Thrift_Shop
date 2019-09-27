

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password1= request.getParameter("password");
		String password2="";
		PrintWriter out = response.getWriter();
		if (username.isEmpty())
			out.println("Empty Username Field");
		System.out.println("Empty Username Field");
		if (password1.isEmpty())
			out.println("Empty Password Field");
			System.out.println("Empty Password Field");
		if(!username.isEmpty() && !password1.isEmpty()) {
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement st = con.prepareStatement("Select * from Login where username= ?");
				st.setString(1, username);
				ResultSet rs=st.executeQuery();
				if(rs.next())
				{
					
					password2=rs.getString("password");
					out.println(password2);
					if(password1.compareTo(password2)!=0)
					{
						out.println("Passwords did not match");
					}
					else
					{
						out.println("Logged in successfully!!");
						System.out.println("Logged in successfully!!");
					}
				}
				else
				{
					out.println("Username does not exist!!");
				}
				st.close();
				con.close();
			} catch (Exception e) {
				System.out.print("errors yaha par kidhar");
				e.printStackTrace(); 
			}
		}
		doGet(request, response);
	}

}

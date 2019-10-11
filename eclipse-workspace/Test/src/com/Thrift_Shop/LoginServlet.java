package com.Thrift_Shop;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TestServlet
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("userError", "");
		request.setAttribute("passError", "");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password");
		String password2 = "";
		int u_id = 0;
		if (!username.isEmpty() && !password1.isEmpty()) {
			try {
				// to establish connection with database
				Connection con = DatabaseConnection.initializeDatabase();
				// PreparedStatement is used to run dynamic query
				PreparedStatement st = con.prepareStatement("Select password from Login where username =?");
				// ? value in above string will be replaced by Username
				st.setString(1, username);
				// rs will point to the result of above query
				ResultSet rs = st.executeQuery();
				HttpSession session = request.getSession();
				session.setAttribute("flagLogin", 0);
				if (!rs.next()) {

					// Set userError key-value pair
					request.setAttribute("userError", "Username not found");

					session.setAttribute("flagLogin", 1);
					request.getRequestDispatcher("Login.jsp").forward(request, response);
					System.out.println("Username not found");
					return;
				} else {
					password2 = rs.getString("password");
					if (password1.compareTo(password2) != 0) {
						// Set passError key-value pair
						request.setAttribute("passError", "Password did not match");
						session.setAttribute("flagLogin", 1);
						request.getRequestDispatcher("Login.jsp").forward(request, response);
						System.out.println("Password did not match");
						return;
					} else {
						// session is used to transfer data from one jsp to other

						session.setAttribute("username", username);
						session.setAttribute("password", password1);
						PreparedStatement pst = con.prepareStatement("Select uid from Login where username = ? ");
						pst.setString(1, username);
						ResultSet rs2 = pst.executeQuery();
						rs2.next();
						u_id = rs2.getInt("uid");
						System.out.println("hello");
						System.out.println(u_id);
						session.setAttribute("uid", u_id);
						// to redirect to profile page

						pst = con.prepareStatement("Select * from User where uid = ? ");
						System.out.println(u_id);
						pst.setInt(1, u_id);
						System.out.println(u_id);
						ResultSet rs3 = null;
						try {
							rs3 = pst.executeQuery();
						} catch (Exception e) {
							System.out.println("exception");
							e.printStackTrace();
						}
						rs3.next();

						String fname = rs3.getString("fname");

						String lname = rs3.getString("lname");
						String fullname = fname + " " + lname;
						request.setAttribute("fullname", fullname);
						request.setAttribute("email_id", rs3.getString("email_id"));

						request.setAttribute("bldg", rs3.getString("building"));

						request.setAttribute("city", rs3.getString("city"));
						request.setAttribute("neigh", rs3.getString("neighbourhood"));
						request.setAttribute("bldg", rs3.getString("building"));
						int pincode = rs3.getInt("pincode");
						request.setAttribute("pincode", pincode);

						request.setAttribute("wallet", rs3.getFloat("wallet"));

						pst = con.prepareStatement("Select * from Phone where uid = ? ");
						pst.setInt(1, u_id);

						ResultSet rs4 = pst.executeQuery();

						String phoneno = "";
						rs4.next();

						phoneno = rs4.getString("phone");

						if (rs4.next()) {
							phoneno = phoneno + "," + rs4.getString("phone");

						}

						request.setAttribute("phoneno", phoneno);

						System.out.println("Logged in successfully!!");

					}
				}
				st.close();
				con.close();
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				
				return;	
			} catch (Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		} else {
			request.setAttribute("userError", "Enter Username and Password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
			System.out.println("UEnter Username and Password");
			return;
		}
		doGet(request, response);
	}

}

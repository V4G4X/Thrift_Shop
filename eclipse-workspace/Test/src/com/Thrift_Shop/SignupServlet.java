package com.Thrift_Shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignupServer
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
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

	protected void clearAttributes(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("fNameError", "");
		request.setAttribute("lNameError", "");
		request.setAttribute("phoneError", "");
		request.setAttribute("emailError", "");
		request.setAttribute("userNameError", "");
		request.setAttribute("passwordError2", "");
		request.setAttribute("passwordError1", "");
		request.setAttribute("addressError", "");
		request.setAttribute("emailDup", "");
	}
	protected void clearParameters(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("fName", "");
		request.setAttribute("lName", "");
		request.setAttribute("phone1", "");
		request.setAttribute("phone2", "");
		request.setAttribute("email", "");
		request.setAttribute("username", "");
		request.setAttribute("building", "");
		request.setAttribute("city", "");
		request.setAttribute("neighborhood", "");
		request.setAttribute("pincode", "");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		clearAttributes(request, response);
		if(request.getParameter("reset")!=null && (request.getParameter("reset").compareTo("Reset"))==0) {
			clearParameters(request, response);
			request.getRequestDispatcher("SignUp.jsp").forward(request, response);
			return;
		}
		String fname = request.getParameter("fname");
		request.setAttribute("fName", fname);
		String lname = request.getParameter("lname");
		request.setAttribute("lName", lname);
		String phno1 = request.getParameter("phno1");
		request.setAttribute("phone1", phno1);
		String phno2 = request.getParameter("phno2");
		request.setAttribute("phone2", phno2);
		String emailid = request.getParameter("emailid");
		request.setAttribute("email", emailid);
		String username = request.getParameter("uname");
		request.setAttribute("username", username);
		String password1 = request.getParameter("pwd1");
		String password2 = request.getParameter("pwd2");
		String building = request.getParameter("bldg");
		request.setAttribute("building", building);
		String city = request.getParameter("city");
		request.setAttribute("city", city);
		String neighbourhood = request.getParameter("neighbour");
		request.setAttribute("neighborhood", neighbourhood);
		String pincode = request.getParameter("pincode");
		request.setAttribute("pincode", pincode);
		int uid = 0;

		if (password1.compareTo(password2) != 0) {
			request.setAttribute("passwordError2", "Passwords did not match.");
			request.getRequestDispatcher("SignUp.jsp").forward(request, response);
			System.out.println("Passwords did not match");
		}
		if (!fname.isEmpty() && !lname.isEmpty() && !phno1.isEmpty() && !emailid.isEmpty() && !username.isEmpty()
				&& !password1.isEmpty() && !building.isEmpty() && !city.isEmpty() && !neighbourhood.isEmpty()
				&& !pincode.isEmpty()) {
			try {
				Connection con = DatabaseConnection.initializeDatabase();

				PreparedStatement pst = con.prepareStatement("insert into User(fname,lname,email_id,building,city,neighbourhood,pincode)values(?,?,?,?,?,?,?)");
				pst.setString(1, fname);
				pst.setString(2, lname);
				pst.setString(3, emailid);
				pst.setString(4, building);
				pst.setString(5, city);
				pst.setString(6, neighbourhood);
				pst.setString(7, pincode);
				try {
					pst.executeUpdate();
				} catch (SQLIntegrityConstraintViolationException e) {
					System.out.println("Duplicate Entry: "+emailid);
					request.setAttribute("emailDup", "This Email has already been used before.");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}

				pst = con.prepareStatement("Select uid from User where email_id =?");
				pst.setString(1, emailid);
				ResultSet rs = pst.executeQuery();
				rs.next();
				uid = rs.getInt("uid");

				pst = con.prepareStatement("insert into Phone(uid,phone)values(?,?)");
				pst.setInt(1, uid);
				pst.setString(2, phno1);
				pst.executeUpdate();

				if (!phno2.isEmpty()) {
					pst = con.prepareStatement("insert into Phone(uid,phone)values(?,?)");
					pst.setInt(1, uid);
					pst.setString(2, phno2);
					pst.executeUpdate();
				}

				pst = con.prepareStatement("insert into Login(uid,username,password)values(?,?,?)");
				pst.setInt(1, uid);
				pst.setString(2, username);
				pst.setString(3, password1);
				try {
					pst.executeUpdate();
				} catch (SQLIntegrityConstraintViolationException e) {
					System.out.println("Duplicate Entry: "+username);
					request.setAttribute("usernameError", "This Username has already been used before.");
					pst = con.prepareStatement("DELETE FROM User where email_id like ?");
					pst.setString(1, emailid);
					pst.executeUpdate();
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				response.sendRedirect("Login.jsp");
			} catch (Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		}
		else {
			try {

				if (fname.isEmpty()) {
					request.setAttribute("fNameError", "First Name Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (lname.isEmpty()) {
					request.setAttribute("lNameError", "Last Name Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (phno1.isEmpty()) {
					request.setAttribute("phoneError", "Primary Phone no. Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (emailid.isEmpty()) {
					request.setAttribute("emailError", "Email Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (username.isEmpty()) {
					request.setAttribute("usernameError", "Username Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (password1.isEmpty()) {
					request.setAttribute("passwordError1", "Password Cannot be Empty");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}
				if (building.isEmpty() || city.isEmpty() || neighbourhood.isEmpty() || pincode.isEmpty()) {
					request.setAttribute("addressError", "Please Fill all Address  fields");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);
					return;
				}

			} catch (Exception e) {
				System.out.println("Some Exception Happened");
				e.printStackTrace();
			}
		}
		doGet(request, response);
	}

}

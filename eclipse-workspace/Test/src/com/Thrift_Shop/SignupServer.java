package com.Thrift_Shop;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignupServer
 */
@WebServlet("/SignupServer")
public class SignupServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServer() {
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
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String phno1=request.getParameter("phno1");
		String phno2=request.getParameter("phno2");
		String emailid=request.getParameter("emailid");
		String username=request.getParameter("uname");
		String password1=request.getParameter("pwd1");
		String password2=request.getParameter("pwd2");
		String building=request.getParameter("bldg");
		String city=request.getParameter("city");
		String neighbourhood=request.getParameter("neighbour");
		String pincode=request.getParameter("pincode");
		int uid = 0;
		
		if(password1.compareTo(password2)!=0){
			response.sendRedirect("errorSignup.jsp");
			System.out.println("Passwords did not match");
		}
		if(!fname.isEmpty() && !lname.isEmpty() && !phno1.isEmpty() && !emailid.isBlank() && !username.isEmpty() && !password1.isEmpty() && !building.isEmpty() && !city.isEmpty() && !neighbourhood.isEmpty() && !pincode.isEmpty()) {
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				
				PreparedStatement pst = con.prepareStatement("insert into User(fname,lname,email_id,building,city,neighbourhood,pincode)values(?,?,?,?,?,?,?)");
				pst.setString(1,fname);
				pst.setString(2,lname);
				pst.setString(3,emailid);
				pst.setString(4,building);
				pst.setString(5,city);
				pst.setString(6,neighbourhood);
				pst.setString(7,pincode);
				pst.executeUpdate();
				
				pst = con.prepareStatement("Select uid from User where email_id =?");
				pst.setString(1,emailid);
				ResultSet rs=pst.executeQuery();
				rs.next();
				uid=rs.getInt("uid");
				
				pst =con.prepareStatement("insert into Phone(uid,phone)values(?,?)");
				pst.setInt(1,uid);
				pst.setString(2,phno1);
				pst.executeUpdate();
				
				if(!phno2.isEmpty()) {
					pst =con.prepareStatement("insert into Phone(uid,phone)values(?,?)");
					pst.setInt(1,uid);
					pst.setString(2,phno2);
					pst.executeUpdate();
				}
				
				pst =con.prepareStatement("insert into Login(uid,username,password)values(?,?,?)");
				pst.setInt(1,uid);
				pst.setString(2,username);
				pst.setString(3,password1);
				pst.executeUpdate();
				
				response.sendRedirect("Login.jsp");
				
				
			}catch (Exception e) {
				System.out.print(e);
				e.printStackTrace(); 
			}
		}
		
		
		
		
		doGet(request, response);
	}

}

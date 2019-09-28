package com.Thrift_Shop;


import java.io.IOException;
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
		
		
		
		
		doGet(request, response);
	}

}

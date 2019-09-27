package com.Thrift_Shop;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestServlet() {
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
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		if (username.isEmpty())
			out.println("Empty Username Field");
		if (password.isEmpty())
			out.println("Empty Password Field");
		if(!username.isEmpty() && !password.isEmpty()) {
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement st = con.prepareStatement("INSERT INTO User(name) VALUES(?)");
				st.setString(1, username);
				st.execute();
				st.close();
				con.close();
				out.println("Wrote into DB(FUCK YEAHHH!!!)");
				request.setAttribute("name", username);
				request.setAttribute("pass", password);
				request.getRequestDispatcher("TheOther.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace(); 
			}
		}
		doGet(request, response);
	}

}

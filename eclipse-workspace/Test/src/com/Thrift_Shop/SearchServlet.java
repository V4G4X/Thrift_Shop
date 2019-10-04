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
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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
		String search=request.getParameter("search");
		if(search.isEmpty())
		{
			System.out.println("Empty search");
		}
		search="%"+search+"%";
		try
		{
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st1 = con.prepareStatement("select i_id,price,title from Item inner join Item_Detail using(i_id) where title LIKE ? OR author LIKE ? AND stock != 0");
			st1.setString(1,search);
			st1.setString(2,search);
			ResultSet rs=st1.executeQuery();
			while(rs.next())
			{
				String title=rs.getString("title");
				float price=rs.getFloat("price");
				System.out.println("Title:" + title);
				System.out.println("Price:" + price);
				System.out.println();
			}

		}
		catch (Exception e) {
			System.out.print("Some Exception Caught Here!");
			e.printStackTrace();
		}
		doGet(request, response);
	}

}

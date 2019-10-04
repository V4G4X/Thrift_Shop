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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		search = search.trim();

		if (search.isEmpty()) {
			System.out.println("Empty search");
			request.setAttribute("searchError", "Empty search");
			request.getRequestDispatcher("Buy.jsp").forward(request, response);
			return;
		}

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//Writing Independent Code for Splice Search
		String keyword[] = search.split(" ");																//Generate Keywords
		System.out.println("No. of KeyWords are : "+keyword.length);
		for (int i = 0; i < keyword.length; i++)															//Add WildCards to each keyword 
			keyword[i] = "%" + keyword[i] +"%";
		String query = "SELECT i_id,price,title,author FROM Item INNER JOIN Item_Detail USING(i_id) WHERE";	//Generate Query head(or the starting static part)
		for (int i = 0; i < keyword.length; i++) {
			query = query + " title LIKE ? OR ";															//append to the Query, the search from Title for each keyword
		}
		for (int i = 0; i < keyword.length; i++) {
			if(i!=keyword.length-1)																			//append to the Query, the search from author for each keyword
				query = query + " author LIKE ? OR ";
			else
				query = query + " author LIKE ? AND stock !=0 ";											//slightly modify last append to accommodate stock
		}
		try {
			Connection con2 = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con2.prepareStatement(query);
			int i=1;
			for ( i=1 ; i <= keyword.length; i++) {															
				st.setString(i, keyword[i-1]);																//The first 'keywork.length' sets will belong to title
			}
			for (i=keyword.length+1  ; i  <= 2*keyword.length; i++) {
				st.setString(i, keyword[i-keyword.length-1]);												//The second 'keywork.length' sets will belong to title
			}
			System.out.println(st.toString().substring(42) + "\n");											//Prints Prepared String for Developers Verification
			ResultSet rs = st.executeQuery();
			if(!rs.isBeforeFirst())																			//Checks if cursor is before HEAD
				System.out.println("Search Came  up Empty");												//Search will be empty only if there IS no HEAD
			else while (rs.next()) {
				String title = rs.getString("title");
				float price = rs.getFloat("price");
				System.out.println("Title: " + title);
				System.out.println("Price: " + price);
				System.out.println("Author: " + rs.getString("author") + "\n");
			}
		} catch (Exception e) {
			System.out.println("Look for Exceptions in Search Block");
			e.printStackTrace();
		}
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//		search = "%" + search + "%";
		//		try {
		//			Connection con = DatabaseConnection.initializeDatabase();
		//			PreparedStatement st1 = con.prepareStatement("select i_id,price,title,author from Item inner join Item_Detail using(i_id) where title LIKE ? OR author LIKE ? AND stock != 0");
		//			st1.setString(1, search);
		//			st1.setString(2, search);
		//			ResultSet rs = st1.executeQuery();
		//			while (rs.next()) {
		//				String title = rs.getString("title");
		//				float price = rs.getFloat("price");
		//				System.out.println("Title:" + title);
		//				System.out.println("Price:" + price);
		//				System.out.println("Author" + rs.getShort("author"));
		//				System.out.println();
		//			}
		//		} catch (Exception e) {
		//			System.out.print("Some Exception Caught Here!");
		//			e.printStackTrace();
		// }
		doGet(request, response);
	}

}

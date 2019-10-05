package com.Thrift_Shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		String required[] = request.getParameterValues("searchby");
		if(request.getParameterValues("searchby")==null) {
			//in case none have been chosen
			System.out.println("Empty search");
			request.setAttribute("searchError", "Please choose a search filter ;)");
			request.getRequestDispatcher("Buy.jsp").forward(request, response);
			return;
		}
		int searchbyval = 0;
		for(String value :required) // traverses array to determine which filters have been chosen and sets searchbyval accordingly.
		{							//Refer below for an index
			if(required.length == 3)	//in case all filters have been chosen
			{
				searchbyval = 7;
				break;
			}
			else if(required.length == 2)	//in case only two have
			{
				if(value.compareTo("auth") == 0)
				{
					if(searchbyval == 0)
					{
						searchbyval = 2;
					}
					else if(searchbyval == 1){
						searchbyval = 4;
						break;
					}
					else if(searchbyval == 3){
						searchbyval = 5;
						break;
					}											
				}
				else if( value.compareTo("tit") == 0)
				{
					if(searchbyval == 0)
					{
						searchbyval = 1;
					}
					else if(searchbyval == 2){
						searchbyval = 4;
						break;
					}
					else if(searchbyval == 3){
						searchbyval = 6;
						break;
					}											
				}
				else if(value.compareTo("desc") == 0)
				{
					if(searchbyval == 0)
					{
						searchbyval = 3;
					}
					else if(searchbyval == 1){
						searchbyval = 6;
						break;
					} else if (searchbyval == 2) {
						searchbyval = 5;
						break;
					}
				}
			} else if (required.length == 1) // in case only one filter has been chosen
			{
				if (value.compareTo("auth") == 0) {
					searchbyval = 2;
				} else if (value.compareTo("tit") == 0) {
					searchbyval = 1;
				}
				if (value.compareTo("desc") == 0) {
					searchbyval = 3;
				}
			}
		}
		/*
		 * index for search by val value of searchbyval = 1 ::implies to be searched
		 * only by title value of searchbyval = 2 ::implies to be searched only by
		 * author value of searchbyval = 3 ::implies to be searched only by description
		 * value of searchbyval = 4 ::implies to be searched by title and author value
		 * of searchbyval = 5 ::implies to be searched by author and description value
		 * of searchbyval = 6 ::implies to be searched only by title and description
		 * value of searchbyval = 7 ::implies to be searched by title,author and
		 * description
		 */

		if (search.isEmpty()) { // in case search bar is empty
			System.out.println("Empty search");
			request.setAttribute("searchError", "Empty search");
			request.getRequestDispatcher("Buy.jsp").forward(request, response);
			return;
		}

		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Writing Independent Code for Splice Search
		String keyword[] = search.split(" "); // Generate Keywords
		System.out.println("No. of KeyWords are : " + keyword.length);
		for (int i = 0; i < keyword.length; i++) // Add WildCards to each keyword
			keyword[i] = "%" + keyword[i] + "%";

		String query = "SELECT i_id,price,title,author FROM Item INNER JOIN Item_Detail USING(i_id) WHERE"; // Generate
		// Query
		// head(or
		// the
		// starting
		// static
		// part)

		if (searchbyval == 1 || searchbyval == 4 || searchbyval == 6 || searchbyval == 7) // adding title where
			// searchbyval requires it
		{
			for (int i = 0; i < keyword.length; i++) {
				if ((searchbyval == 1) && (i == (keyword.length - 1))) {
					query = query + " title LIKE ? AND stock != 0";
				} else {
					query = query + " title LIKE ? OR ";
				}
			}
		}
		if (searchbyval == 2 || searchbyval == 4 || searchbyval == 5 || searchbyval == 7) // adding author when and
			// where required by
			// searchbyval
		{
			for (int i = 0; i < keyword.length; i++) {
				if ((i == (keyword.length - 1)) && ((searchbyval == 2) || (searchbyval == 4))) // append to the Query,
					// the search from
					// author for each
					// keyword
					query = query + " author LIKE ? AND stock !=0 ";
				else

					query = query + " author LIKE ? OR "; // slightly modify last append to accommodate stock
			}
		}
		if (searchbyval == 3 || searchbyval == 6 || searchbyval == 5 || searchbyval == 7) // adding description when and
			// where required
		{
			for (int i = 0; i < keyword.length; i++) {
				if (i == (keyword.length - 1)) // append to the Query, the search from author for each keyword
					query = query + " description LIKE ? AND stock !=0 ";
				else

					query = query + " description LIKE ? OR "; // slightly modify last append to accommodate stock
			}
		}
		query = query + "ORDER BY Item.price ASC";
		try {
			Connection con2 = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con2.prepareStatement(query);
			int i = 1;
			if (searchbyval == 1 || searchbyval == 4 || searchbyval == 6 || searchbyval == 7) // sets title to keywords
			{
				for (int j = 0; j < keyword.length; j++) {
					st.setString(i, keyword[j]);
					i++; // The first 'keywork.length' sets will belong to title
				}
			}
			if (searchbyval == 2 || searchbyval == 4 || searchbyval == 5 || searchbyval == 7) // sets author to keyword
			{
				for (int j = 0; j < keyword.length; j++) {
					st.setString(i, keyword[j]);
					i++;// The second 'keywork.length' sets will belong to title
				}
			}
			if (searchbyval == 3 || searchbyval == 5 || searchbyval == 6 || searchbyval == 7) // sets description to
				// keywords
			{
				for (int j = 0; j < keyword.length; j++) {
					st.setString(i, keyword[j]);
					i++;
				}
			}
			System.out.println(st.toString().substring(42) + "\n"); // Prints Prepared String for Developers
			// Verification
			ResultSet rs = st.executeQuery();
			QueryResult result = new QueryResult(getRowCount(rs));
			System.out.println("Row Count: " + getRowCount(rs));
			if (!rs.isBeforeFirst()) // Checks if cursor is before HEAD
				System.out.println("Search Came  up Empty"); // Search will be empty only if there IS no HEAD
			else
				while (rs.next()) {
					String title = rs.getString("title");
					float price = rs.getFloat("price");
					System.out.println("Title: " + title);
					System.out.println("Price: " + price);
					System.out.println("Author: " + rs.getString("author") + "\n");
					result.appendRow(rs.getInt("i_id"), rs.getString("title"), rs.getString("author"),rs.getFloat("price"));
				}
			request.setAttribute("result", result);
			request.getRequestDispatcher("Buy.jsp").forward(request, response);
			return;
		} catch (Exception e) {
			System.out.println("Look for Exceptions in Search Block");
			e.printStackTrace();
		}
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// search = "%" + search + "%";
		// try {
		// Connection con = DatabaseConnection.initializeDatabase();
		// PreparedStatement st1 = con.prepareStatement("select i_id,price,title,author
		// from Item inner join Item_Detail using(i_id) where title LIKE ? OR author LIKE ? AND stock != 0");
		// st1.setString(1, search);
		// st1.setString(2, search);
		// ResultSet rs = st1.executeQuery();
		// while (rs.next()) {
		// String title = rs.getString("title");
		// float price = rs.getFloat("price");
		// System.out.println("Title:" + title);
		// System.out.println("Price:" + price);
		// System.out.println("Author" + rs.getShort("author"));
		// System.out.println();
		// }
		// } catch (Exception e) {
		// System.out.print("Some Exception Caught Here!");
		// e.printStackTrace();
		// }
		doGet(request, response);
	}

	private int getRowCount(ResultSet rs) throws SQLException {
		rs.last();
		int n = rs.getRow();
		rs.beforeFirst();
		return n;
	}

}

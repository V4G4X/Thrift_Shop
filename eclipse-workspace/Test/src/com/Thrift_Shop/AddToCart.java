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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
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
		request.setAttribute("QuantityError", "");
		int qty=0;
		try{
			qty = Integer.parseInt(request.getParameter("qty"));
		}catch(NumberFormatException e) {
			request.setAttribute("QuantityError", "Quantity cannot be zero");
			request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
			return;
		}
		if(qty<=0)
		{
			request.setAttribute("QuantityError", "Quantity cannot be zero");
			request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
			return;
		}
		
		System.out.println("User Entered quantity: "+qty+" for buying.");
		
		HttpSession session = request.getSession();
		int b_id=(int)session.getAttribute("uid");
		int i_id=(int)session.getAttribute("viewable_iid");
		System.out.println("Now adding to cart" + i_id);
		try
		{
			Connection con=DatabaseConnection.initializeDatabase();
			PreparedStatement st=con.prepareStatement("SELECT @result1");
			try {
				st.executeQuery();
			} catch (Exception e) {
				System.out.println("Exception Caught at Line 69 of AddToCart.java");
			}

			st=con.prepareStatement("call addtocart(?,?,?,@result1)");
			st.setInt(1,i_id);
			st.setInt(2,qty);
			st.setInt(3,b_id);
			try {
				st.executeQuery();
			} catch (Exception e) {
				System.out.println("Exception Caught at Line 79 of AddToCart.java");
				System.out.println(st);
				System.out.println();
				e.printStackTrace();
			}
			st=con.prepareStatement("Select @result1 as Result");
			ResultSet rs =null;
			try {
				rs=st.executeQuery();				
			} catch (Exception e) {
				System.out.println("Exception Caught at Line 77 of AddToCart.java ");
				e.printStackTrace();
				return;
			}
			try {
				rs.next();				
			} catch (Exception e) {
				System.out.println("Exception Caught at Line 85 of AddToCart.java ");
				e.printStackTrace();
				return;
			}

			int flag1=rs.getInt("Result");
			if(flag1==10)
			{
				request.setAttribute("QuantityError", "Stock insufficient!!!");
				request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
				return;
				
			}
			else
			{
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		doGet(request, response);
	}

}

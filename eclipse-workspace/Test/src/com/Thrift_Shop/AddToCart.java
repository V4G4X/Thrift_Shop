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
		int qty=Integer.parseInt(request.getParameter("qty"));
		if(qty<=0)
		{
			request.setAttribute("QuantityError", "Quantity cannot be zero");
			request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
		}
		HttpSession session = request.getSession();
		int b_id=(int)session.getAttribute("uid");
		int i_id=(int)session.getAttribute("viewable_iid");
		try
		{
			Connection con=DatabaseConnection.initializeDatabase();
			PreparedStatement st=con.prepareStatement("SELECT @result");
			st.executeQuery();
			st=con.prepareStatement("call addtocart(?,?,?,@result)");
			st.setInt(1,i_id);
			st.setInt(2,qty);
			st.setInt(3,b_id);
			st.executeQuery();
			st=con.prepareStatement("Select @result as Result");
			ResultSet rs=st.executeQuery();
			rs.next();
			int flag=rs.getInt("Result");
			if(flag==0)
			{
				request.setAttribute("QuantityError", "Stock insufficient!!!");
				request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
				
			}
			else
			{
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		doGet(request, response);
	}

}

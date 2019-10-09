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
 * Servlet implementation class BuyNow
 */
@WebServlet("/BuyNow")
public class BuyNow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyNow() {
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
		
		System.out.println("inbuynow");
		
		HttpSession session = request.getSession();
		int b_id=(int)session.getAttribute("uid");
		System.out.println(b_id);
		String build = "",neighb = "",city = "";
		float wallet;
		String temp_title = "";
		float temp_price = 0;
		float temp_partialAmt = 0;
		int temp_iid = 0;
		float total_amount = 0;
		int flag = (int)session.getAttribute("flag");
		System.out.println("flag:"+flag);
		String queryUserDetails="SELECT building,neighbourhood,city,wallet from User where uid = ?";
		try
		{
			Connection con=DatabaseConnection.initializeDatabase();
			PreparedStatement st=con.prepareStatement(queryUserDetails);
			st.setInt(1,b_id);
			ResultSet rs = st.executeQuery();
			rs.next();
			build = rs.getString("building");
			neighb = rs.getString("neighbourhood");
			city = rs.getString("city");
			wallet = rs.getFloat("wallet");
			request.setAttribute("building", build);
			request.setAttribute("neighbourhood", neighb);
			request.setAttribute("city", city);
			request.setAttribute("wallet", wallet);
			System.out.println("inbuynow");
			if(flag==1) {
				Query_ViewCart result = (Query_ViewCart) (session.getAttribute("rs"));
				session.setAttribute("result", result);
				st = con.prepareStatement("select total_amount from Orders where b_id = ? AND status = ?;");
				st.setInt(1, b_id);
				st.setString(2, "cart");
				rs = st.executeQuery();
				rs.next();
				total_amount = rs.getFloat("total_amount");
				request.setAttribute("total_amount", total_amount);
			}
			else if(flag==2) {
				int qty=0;
				System.out.println(qty);
				try{
					qty = Integer.parseInt(request.getParameter("qty"));
				}catch(NumberFormatException e) {
					request.setAttribute("QuantityError", "Quantity cannot be zero");
					request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
					return;
				}
				System.out.println(qty);
				if(qty<=0)
				{
					request.setAttribute("QuantityError", "Quantity cannot be zero");
					request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
				}		
				System.out.println(qty);
				temp_title = (String)session.getAttribute("viewable_title");
				temp_price = (int)session.getAttribute("viewable_price");
				total_amount = qty*temp_price;
				System.out.println("inbuynow");
				Query_ViewCart result = new Query_ViewCart(1);

				result.appendRow(temp_title, temp_price, qty, total_amount,temp_iid);
				session.setAttribute("result", result);
				request.setAttribute("total_amount", total_amount);
			}
			
			request.getRequestDispatcher("BuyNow.jsp").forward(request, response);
			return;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}

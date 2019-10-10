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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewCart
 */
@WebServlet("/ViewCart")
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCart() {
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
		HttpSession session = request.getSession();
		System.out.println("Reached Here Successfully");
		int b_id=(int)session.getAttribute("uid");
		System.out.println("The b_id/uid received from Session is: "+b_id);
		int order_id;
		String query_order = "Select o_id from Orders where b_id = ? and status = 'Cart'";
		String query_cart = "Select Item.i_id,Item_Detail.title,Item.price,Contains.quantity,Contains.partial_amount from Item INNER JOIN (Item_Detail INNER JOIN Contains ON Contains.i_id = Item_Detail.i_id) ON Item.i_id = Item_Detail.i_id where o_id = ?";
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement pst = con.prepareStatement(query_order);
			pst.setInt(1, b_id);
			ResultSet rs1 = pst.executeQuery();
			if(!rs1.isBeforeFirst())
			{
				System.out.println("In here");
				Query_ViewCart qvc = new Query_ViewCart(0);
				session.setAttribute("rs", qvc);
				request.setAttribute("CartError", "Empty Cart ;)");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			System.out.println("Idhar");
			rs1.next();
			order_id = rs1.getInt("o_id");
			pst = con.prepareStatement(query_cart);
			pst.setInt(1, order_id);
			ResultSet rs2 = pst.executeQuery();
			String temp_title = "";
			float temp_price = 0;
			float temp_partialAmt = 0;
			int temp_qty = 0;
			int temp_iid = 0;
			int n = this.getRowCount(rs2);
				Query_ViewCart rs = new Query_ViewCart(n);
				rs2.next();
			for(int i = 0;i<n;i++)
			{
				temp_title = rs2.getString("title");
				temp_price = rs2.getFloat("price");
				temp_qty = rs2.getInt("quantity");
				temp_partialAmt = rs2.getFloat("partial_amount");
				temp_iid = rs2.getInt("i_id");
				System.out.println("Title: " + temp_title);
				rs.appendRow(temp_title, temp_price, temp_qty, temp_partialAmt,temp_iid);
				rs2.next();
			}
			
				session.setAttribute("rs", rs);
				request.getRequestDispatcher("Cart.jsp").forward(request, response);
				
			
			return;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		doGet(request, response);
	}
	private int getRowCount(ResultSet rs) throws SQLException {
		rs.last();
		int n = rs.getRow();
		rs.beforeFirst();
		return n;
	}


}

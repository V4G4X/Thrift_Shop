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
 * Servlet implementation class transaction
 */
@WebServlet("/transaction")
public class transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public transaction() {
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
		int b_id = (int)session.getAttribute("uid");
		System.out.println("userid found"+b_id);
		String viewName="itemlist"+b_id;
		String getOrderDetails="Select total_amount from Orders where o_id =?";
		String getOrderIDQuery = "Select o_id from Orders where b_id = ? AND status = 'Cart'";
		String createView="CREATE VIEW `"+viewName+"` AS select Item.i_id,Item.s_id,Item.stock,Contains.quantity,Contains.partial_amount,Item_Detail.title from Item INNER JOIN (Contains INNER JOIN Item_Detail using(i_id))using(i_id) where o_id=? ";
		String getWallet="Select wallet from User where uid = ?";
		String getView="Select * from `"+viewName+"`";
		
		System.out.println(viewName);
		String userwall="Update User SET wallet=wallet-? where uid=?";
		String qtyUpdate="Update `"+viewName+"` SET stock=stock-? where i_id=?";
		String walletUpdate="Update User SET wallet=wallet+? where uid=?";
		String dropView="Drop view `"+viewName+"`";
		String statusConfirm="Update Orders SET status='Confirmed' where o_id=?";
		try
		{
			Connection con=DatabaseConnection.initializeDatabase();
			PreparedStatement st=con.prepareStatement(getOrderIDQuery);
			st.setInt(1,b_id);
			ResultSet rs1=null;
			try {
				rs1=st.executeQuery();
			} catch (Exception e) {
				System.out.println("Couldn't get OrderId");
				e.printStackTrace();
				return;
			}
			rs1.next();
			int oid=rs1.getInt("o_id");
			
			st=con.prepareStatement(getOrderDetails);
			st.setInt(1,oid);
			ResultSet rs2=null;
			try {
				rs2=st.executeQuery();
			} catch (Exception e) {
				System.out.println("Couldn't get Order Details");
				e.printStackTrace();
				return;
			}
			rs2.next();
			float amount=rs2.getFloat("total_amount");
			
			st=con.prepareStatement(getWallet);
			st.setInt(1,b_id);
			ResultSet rs3=null;
			try {
					rs3=st.executeQuery();
			} catch (Exception e) {
				System.out.println("Could'nt get wallet");
				e.printStackTrace();
				return;
			}
			rs3.next();
			float wall=rs3.getFloat("wallet");
			
			if(wall<amount)
			{
				request.setAttribute("wallinsufficient", "Wallet balance is insufficient");
				request.getRequestDispatcher("Cart.jsp").forward(request, response);
			}
			else
			{
				st=con.prepareStatement(createView);
				st.setInt(1,oid);
				try
				{
				System.out.println(st);	
					st.executeUpdate();
				}
				catch(Exception e)
				{
					System.out.println("Exception in view creation");
					e.printStackTrace();
					return;
				}
				
				st=con.prepareStatement(getView);
				ResultSet rs4=null;
				try
				{
					rs4=st.executeQuery();
				}
				catch(Exception e)
				{
					System.out.println("View not fetched");
					e.printStackTrace();
					return;
				}
				while(rs4.next())
				{
					int stck=rs4.getInt("stock");
					int qty=rs4.getInt("quantity");
					String ititle=rs4.getString("title");
					if(stck<qty)
					{
						request.setAttribute("itemqtyError", "Stock for "+ititle+"is Unavailable!!");						
						request.getRequestDispatcher("BuyNow.jsp").forward(request, response);
					}
				}
				st=con.prepareStatement(userwall);
				st.setFloat(1, amount);
				st.setInt(2, b_id);
				try
				{
					st.executeUpdate();
				}catch (Exception e) {
					System.out.println("User ka wallet kam karti hai");
					e.printStackTrace();
					return;
				}
				rs4.beforeFirst();
				while(rs4.next())
				{
					int s_id=rs4.getInt("s_id");
					float partial_amount=rs4.getInt("partial_amount");
					int qty=rs4.getInt("quantity");
					int iid=rs4.getInt("i_id");
					st=con.prepareStatement(qtyUpdate);
					st.setInt(1,qty);
					st.setInt(2, iid);
					try {
						st.executeUpdate();
					} catch (Exception e) {
						System.out.println("Quantity updates after selling");
						e.printStackTrace();
						return;
					}
					st=con.prepareStatement(walletUpdate);
					st.setFloat(1, partial_amount);
					st.setInt(2,s_id);
					try {
						st.executeUpdate();
					} catch (Exception e) {
						System.out.println("Wallet wasn't updated");
						e.printStackTrace();
						return;
					}
				}
				st=con.prepareStatement(dropView);
				try {
					st.executeUpdate();
				} catch (Exception e) {
					System.out.println("View wasn't dropped");
					e.printStackTrace();
					return;
				}
				st=con.prepareStatement(statusConfirm);
				st.setInt(1,oid);
				try
				{
					st.executeUpdate();
				}
				catch(Exception e)
				{
					System.out.println("Could update status");
					e.printStackTrace();
					return;
				}
				response.sendRedirect("Success.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		doGet(request, response);
	}
}
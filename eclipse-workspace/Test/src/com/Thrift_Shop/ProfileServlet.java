package com.Thrift_Shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Entered Profile Servlet");
		try {
			HttpSession session = request.getSession();
			int u_id = (int)session.getAttribute("uid");

			try{
				Connection con = DatabaseConnection.initializeDatabase();

				String sale_details = "Select title,quantity,partial_amount,timestmp,i_id,b_id from transaction_details where s_id = ?";
				PreparedStatement pst = con.prepareStatement(sale_details);
				pst.setInt(1, u_id);

				ResultSet rs3 = pst.executeQuery();

				int n = getRowCount(rs3);
				if(n ==0)
				{
					Query_Item q1=new Query_Item(0);
					session.setAttribute("sales_details", q1);
					request.setAttribute("sellError", "No Items Sold yet!");
					System.out.println("No Items Sold yet!");
				}
				else {
					Query_Item q = new Query_Item(n);
					String temp_title = "";
					int temp_qty = 0;
					float temp_partial_amount = 0;
					Timestamp temp_time;
					int temp_iid = 0;
					int temp_bid = 0;

					while(rs3.next())
					{
						temp_title = rs3.getString("title");
						temp_qty = rs3.getInt("quantity");
						temp_iid = rs3.getInt("i_id");
						temp_bid = rs3.getInt("b_id");
						temp_partial_amount = rs3.getFloat("partial_amount");
						temp_time = rs3.getTimestamp("timestmp");
						q.appendRow(temp_iid, temp_title, temp_partial_amount, temp_qty, temp_time, temp_bid);
					}

					session.setAttribute("sales_details",q);
				}
				//orders
				String temp_title = "";
				int temp_qty = 0;
				float temp_partial_amount = 0;
				Timestamp temp_time;
				int temp_iid = 0;
				int temp_bid = 0;
				System.out.println("IDhar0");
				String orders_query = "Select distinct o_id,timestmp from transaction_details where b_id = ?";
				String item_query = "Select title,i_id,quantity,partial_amount,b_id from transaction_details where o_id = ?";
				String total_query = "Select total_amount from Orders where o_id = ?";
				System.out.println("IDhar");
				pst = con.prepareStatement(orders_query);
				System.out.println("IDhar1");
				pst.setInt(1, u_id);
				int temp_oid;							
				ResultSet rs4 = pst.executeQuery();
				System.out.println("IDhar2");
				n = getRowCount(rs4);
				System.out.println("rows:"+n);
				int temp_n=0;
				float temp_tot=0;
				if(n == 0)
				{
					Query_OrderDetails q4=new Query_OrderDetails(0);
					session.setAttribute("order_details", q4);
					request.setAttribute("orderError", "No Items Sold yet!");
					System.out.println("No Orders made yet!");
				}
				else {
					Query_OrderDetails q2 = new Query_OrderDetails(n);
					System.out.println("Order count :"+n);
					while(rs4.next())
					{

						temp_oid = rs4.getInt("o_id");
						temp_time= rs4.getTimestamp("timestmp");
						pst = con.prepareStatement(item_query);
						pst.setInt(1, temp_oid);
						ResultSet rs5=pst.executeQuery();
						temp_n= getRowCount(rs5);

						Query_Item temp_item=new Query_Item(temp_n);
						while(rs5.next())
						{	
							temp_title = rs5.getString("title");
							temp_qty = rs5.getInt("quantity");
							temp_iid = rs5.getInt("i_id");
							temp_bid = rs5.getInt("b_id");
							temp_partial_amount = rs5.getFloat("partial_amount");
							temp_item.appendRow(temp_iid, temp_title, temp_partial_amount, temp_qty, temp_time, temp_bid);
						}
						pst = con.prepareStatement(total_query);
						pst.setInt(1,temp_oid);
						ResultSet rs6=null;
						try {
							rs6=pst.executeQuery();
							rs6.next();
						} catch (Exception e) {
							System.out.println("Exception Caught near Line 145");
							e.printStackTrace();
							return;
						}
						temp_tot =rs6.getFloat("total_amount");
						q2.appendRow(temp_oid, temp_time, temp_item,temp_tot,temp_n);

////<<<<<<< HEAD
////				request.setAttribute("phoneno", phoneno);
//				System.out.println("Logged in successfully!!");
//				request.getRequestDispatcher("Profile.jsp").forward(request, response);
//				return
////=======
					}
					session.setAttribute("order_details", q2);
				}		
			}catch(Exception e)
			{
				System.out.println("Exception Caught near Line 162");
				e.printStackTrace();
//>>>>>>> b556ce69926594890b80ee5f0a7593afd89f10be
				return;
			}
			try {
				//Starting Code to Fetch Profile Details
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement pst = con.prepareStatement("Select * from User where uid = ? ");
				System.out.println(u_id);
				pst.setInt(1, u_id);
				System.out.println(u_id);
				ResultSet rs3 = null;
				try {
					rs3 = pst.executeQuery();
				} catch (Exception e) {
					System.out.println("exception");
					e.printStackTrace();
				}
				rs3.next();

				String fname = rs3.getString("fname");

				String lname = rs3.getString("lname");
				String fullname = fname + " " + lname;
				request.setAttribute("fullname", fullname);
				request.setAttribute("email_id", rs3.getString("email_id"));

				request.setAttribute("bldg", rs3.getString("building"));

				request.setAttribute("city", rs3.getString("city"));
				request.setAttribute("neigh", rs3.getString("neighbourhood"));
				request.setAttribute("bldg", rs3.getString("building"));
				int pincode = rs3.getInt("pincode");
				request.setAttribute("pincode", pincode);

				request.setAttribute("wallet", rs3.getFloat("wallet"));

				pst = con.prepareStatement("Select * from Phone where uid = ? ");
				pst.setInt(1, u_id);

				ResultSet rs4 = pst.executeQuery();

				String phoneno = "";
				rs4.next();

				phoneno = rs4.getString("phone");

				if (rs4.next()) {
					phoneno = phoneno + "," + rs4.getString("phone");

				}

				request.setAttribute("phoneno", phoneno);

//				System.out.println("Logged in successfully!!");
				//
				
				
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				System.out.println("Logged in successfully!!!");
			} catch (Exception e) {
				System.out.println("Redirect has exception");
			}
		} catch (Exception e) {
			System.out.println("Outer Scope has exception");
		}
		return;
		//		doGet(request, response);

	}

	private int getRowCount(ResultSet rs) throws SQLException {
		rs.last();
		int n = rs.getRow();
		rs.beforeFirst();
		return n;
	}

}

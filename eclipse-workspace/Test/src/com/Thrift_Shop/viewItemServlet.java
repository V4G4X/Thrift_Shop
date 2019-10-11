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
 * Servlet implementation class viewItemServlet
 */
@WebServlet("/viewItemServlet")
public class viewItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewItemServlet() {
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
		int sid=(int)session.getAttribute("uid");
		String getItems="Select title,price,Item.i_id,stock from Item INNER JOIN Item_Detail using(i_id) where s_id=? AND stock!=0";
		try
		{
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement pst = con.prepareStatement(getItems);
			pst.setInt(1, sid);
			ResultSet rs1 = pst.executeQuery();
			if(!rs1.isBeforeFirst())
			{
				System.out.println("In here");
				Query_ViewCart qvc = new Query_ViewCart(0);
				session.setAttribute("rs", qvc);
				request.setAttribute("SaleError", "No Sales Yet ;)");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				return;
			}
			String temp_title = "";
			float temp_price = 0;
			float temp_partialAmt = 0;
			int temp_qty = 0;
			int temp_iid = 0;
			int n = this.getRowCount(rs1);
			Query_ViewCart q=new Query_ViewCart(n);
			while(rs1.next())
			{
				temp_title = rs1.getString("title");
				temp_price = rs1.getFloat("price");
				temp_qty = rs1.getInt("stock");
				temp_iid=rs1.getInt("i_id");
				temp_partialAmt = temp_qty*temp_price;
				q.appendRow(temp_title, temp_price, temp_qty, temp_partialAmt,temp_iid);
				
			}
			session.setAttribute("saleitem", q);
			request.getRequestDispatcher("SaleItemView.jsp").forward(request, response);
		}
		catch(Exception e)
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

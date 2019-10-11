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
 * Servlet implementation class RemoveItem
 */
@WebServlet("/RemoveItem")
public class RemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveItem() {
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
		int iid = Integer.parseInt(request.getParameter("remove"));
		String query_order = "Select o_id from Orders where b_id = ? and status = 'Cart'";
		int o_id;
		HttpSession session = request.getSession();
		Query_ViewCart qvc = (Query_ViewCart)session.getAttribute("rs");
		int u_id = (int)session.getAttribute("uid");
		int result;
		String query1 = "SELECT @result";
		String query2 = "call removeFromCart(?,?,@result)";
		String query3 = "Select @result as RESULT";
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement pst = con.prepareStatement(query_order);
			pst.setInt(1,u_id);
			ResultSet rs1 = pst.executeQuery();
			rs1.next();
			o_id = rs1.getInt("o_id");
			pst = con.prepareStatement(query1);
			pst.executeQuery();
			pst = con.prepareStatement(query2);
			pst.setInt(1,o_id);
			pst.setInt(2, iid);
			pst.executeQuery();
			pst = con.prepareStatement(query3);
			ResultSet rs2 = pst.executeQuery();
			rs2.next();
			result = rs2.getInt("RESULT");
			if(result == 1)
			{
				request.getRequestDispatcher("ViewCart").forward(request, response);
				return;
			}
			else if(result == 2)
			{
				request.getRequestDispatcher("ProfileServlet").forward(request, response);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}

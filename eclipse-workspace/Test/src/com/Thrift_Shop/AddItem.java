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
 * Servlet implementation class AddItem
 */
@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItem() {
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

	
	protected void clearAttributes(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("titleError", "");
		request.setAttribute("conditionError", "");
		request.setAttribute("priceError", "");
		request.setAttribute("stockError", "");
	}
	protected void clearParameters(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("title", "");
		request.setAttribute("condition", "");
		request.setAttribute("price", "");
		request.setAttribute("quantity", "");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		clearAttributes(request, response);

		String tit = request.getParameter("title");
		if (tit.isEmpty()) {
			request.setAttribute("titleError", "Title Cannot be Empty");
			request.getRequestDispatcher("Sell.jsp").forward(request, response);
			return;
		}
		request.setAttribute("title", tit);

		String auth = request.getParameter("author");
		request.setAttribute("author", auth);

		String desc = request.getParameter("description");
		request.setAttribute("description", desc);

		
		int cond = 0;
		try{
			cond = Integer.parseInt(request.getParameter("condition"));
		}catch(NumberFormatException e) {
			request.setAttribute("conditionError", "Condition Cannot be Zero");
			request.getRequestDispatcher("Sell.jsp").forward(request, response);
			return;
		}
		request.setAttribute("condition", cond);

		
		int pri = 0;
		try{
			pri = Integer.parseInt(request.getParameter("price"));
		}catch(NumberFormatException e) {
			request.setAttribute("priceError", "Price Cannot be Zero");
			request.getRequestDispatcher("Sell.jsp").forward(request, response);
			return;
		}
		request.setAttribute("price", pri);

		
		int  qty = 0;
		try{
			qty = Integer.parseInt(request.getParameter("quantity"));
		}
		catch(NumberFormatException e) {
			request.setAttribute("stockError", "Stock Cannot be Zero");
			request.getRequestDispatcher("Sell.jsp").forward(request, response);
			return;
		}
		request.setAttribute("quantity", qty);


		
		if((!tit.isEmpty()) && (pri != 0) && (qty != 0) && (cond != 0))
		{
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				HttpSession session = request.getSession();
				int u_id = (int) session.getAttribute("uid");
				System.out.print(u_id);
				PreparedStatement pst = con.prepareStatement("Insert into Item(s_id,stock,price) values (?,?,?)"); 
				pst.setInt(1, u_id);
				pst.setInt(2, qty);
				pst.setInt(3,pri);
				pst.executeUpdate();
				
				PreparedStatement pst2 = con.prepareStatement("Select max(i_id) as i_id from Item");
				ResultSet rs1 = pst2.executeQuery();
				rs1.next();
				int iid = rs1.getInt("i_id");
				System.out.println(iid);
				
				PreparedStatement pst3 = con.prepareStatement("Insert into Item_Detail values (?,?,?,?,?)");
				pst3.setInt(1, iid);
				pst3.setString(2,tit);
				pst3.setString(5,auth);
				pst3.setString(3,desc);
				pst3.setInt(4,cond);
				
				pst3.executeUpdate();
				
			}catch(Exception exception)
			{
				System.out.println("Some Exception Happened");
				exception.printStackTrace();
			}
			
		}	
	doGet(request, response);
	}

}

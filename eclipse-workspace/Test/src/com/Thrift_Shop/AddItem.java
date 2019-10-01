package com.Thrift_Shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tit = request.getParameter("title");
		String auth = request.getParameter("author");
		String desc = request.getParameter("description");
		int pri = Integer.parseInt(request.getParameter("price"));
		int  qty = Integer.parseInt(request.getParameter("quantity"));
		
		if((!tit.isEmpty()) && (!auth.isEmpty()) && (!desc.isEmpty()) && (pri != 0) && (qty != 0))
		{
			try {
				Connection con = DatabaseConnection.initializeDatabase();
				int u_id = session.getAttribute("uid");
				PreparedStatement pst = con.prepareStatement("Insert into Item(s_id,stock,price) values (?,?,?)"); 
				pst.setString(1, u_id);
			}catch(Exception exception)
			{
				exception.printStackTrace();
			}
			
		}
		
		
		doGet(request, response);
	}

}

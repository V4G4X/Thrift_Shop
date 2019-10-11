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
 * Servlet implementation class RemoveSaleItemServlet
 */
@WebServlet("/RemoveSaleItemServlet")
public class RemoveSaleItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveSaleItemServlet() {
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
		doGet(request, response);
		int iid =Integer.parseInt(request.getParameter("removeItem"));
		System.out.println("Item ID : " + iid);
		String RemoveItemQuery = "Update Item set stock = 0 where i_id = ?";
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement pst = con.prepareStatement(RemoveItemQuery);
			pst.setInt(1, iid);
			try {
			pst.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			request.getRequestDispatcher("viewItemServlet").forward(request, response);
			}catch(Exception e)
		{
				e.printStackTrace();
		}
	}

}

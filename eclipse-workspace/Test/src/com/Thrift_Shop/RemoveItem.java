package com.Thrift_Shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int row_number = Integer.parseInt(request.getParameter("remove"));
		String query_order = "Select o_id from Orders where b_id = ? and status = 'Cart'";
		String query_cart = "Select Item_Detail.title,Item.price,Contains.quantity,Contains.partial_amount from Item INNER JOIN (Item_Detail INNER JOIN Contains ON Contains.i_id = Item_Detail.i_id) ON Item.i_id = Item_Detail.i_id where o_id = ?";
		
		doGet(request, response);
	}

}

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
 * Servlet implementation class ItemDetail
 */
@WebServlet("/ItemDetail")
public class ItemDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDetail() {
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
		int i_id = Integer.parseInt(request.getParameter("i_id"));
		String item_query = "Select i_id,s_id,price,stock,title,author,description,Item_Detail.condition from Item INNER JOIN Item_Detail using(i_id) where i_id = ?";
		int viewable_iid=0,viewable_sid =0,viewable_price = 0 ,viewable_stock = 0 ,viewable_condition = 0;
		String viewable_title = "",viewable_author = "",viewable_description = "",viewable_fname = "",viewable_lname = "",viewable_email = "",viewable_phone = "";
		System.out.println(i_id);
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement pst = con.prepareStatement(item_query);
			pst.setInt(1,i_id);
			
			ResultSet rs1 = pst.executeQuery();
			
			rs1.next();
			
			viewable_sid = rs1.getInt("s_id");
			viewable_price = rs1.getInt("price");
			viewable_condition = rs1.getInt("condition");
			viewable_stock = rs1.getInt("stock");
			viewable_title = rs1.getString("title");
			viewable_author = rs1.getString("author");
			viewable_description = rs1.getString("description");
			viewable_iid = i_id;
			
			
			String seller_query = "Select fname,lname,email_id from User where uid = ?";
			String seller_phone_query = "Select phone from Phone where uid = ?";
			
			PreparedStatement pst2 = con.prepareStatement(seller_query);
			pst2.setInt(1, viewable_sid);
			ResultSet rs2 = pst2.executeQuery();
			
			rs2.next();
			
			viewable_fname = rs2.getString("fname");
			viewable_lname = rs2.getString("lname");
			viewable_email = rs2.getString("email_id");
			
			
			
			PreparedStatement pst3 = con.prepareStatement(seller_phone_query);
			pst3.setInt(1, viewable_sid);
			ResultSet rs3 = pst3.executeQuery();
			int i =0;
			while(rs3.next())
			{
				if(i==0)
				{
					viewable_phone = rs3.getString("phone");
				}
				else {
					viewable_phone = viewable_phone + "," + rs3.getString("phone");
				}
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("viewable_sid", viewable_sid);
			session.setAttribute("viewable_iid", viewable_iid);
			session.setAttribute("viewable_price", viewable_price);
			session.setAttribute("viewable_stock", viewable_stock);
			session.setAttribute("viewable_condition", viewable_condition);
			session.setAttribute("viewable_title", viewable_title);
			session.setAttribute("viewable_author", viewable_author);
			session.setAttribute("viewable_description", viewable_description);
			session.setAttribute("viewable_fname", viewable_fname);
			session.setAttribute("viewable_lname", viewable_lname);
			session.setAttribute("viewable_email", viewable_email);
			session.setAttribute("viewable_phone", viewable_phone);
			
			request.getRequestDispatcher("itemDetail.jsp").forward(request, response);
			return;
		}catch(Exception e){
			System.out.println("An error just occured");
			e.printStackTrace();
		}
		doGet(request, response);
	}

}

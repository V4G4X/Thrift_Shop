<%@page import="com.Thrift_Shop.Query_Item"%>
<%@page import="com.Thrift_Shop.Query_OrderDetails"%>

<%@page import = "java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<h3>welcome <%=session.getAttribute("username")%></h3>
		<form method = "post" action = "LogoutServlet">
		<input type = "submit" value = "Logout" class = "button">
		</form>
	<form action="Sell.jsp">
			<input type="submit" value="Sell" class="button">
	</form>
	<form action="Buy.jsp">
		<input type="submit" value="Buy" class="button">
	</form>
	<form method = "post" action="ViewCart">
		<input type="submit" value="View Cart" class="button">
		${CartError}
	</form>
	<form action="viewItemServlet" method="post">
			<input type="submit" value="View Your Items" class="button">
		${SaleError}
	</form>
	<fieldset>
	<legend>Order History</legend>
	<%
	Query_OrderDetails q1=(Query_OrderDetails)session.getAttribute("order_details");
	if(q1.getN() == 0)
	{
	%>
	<h4>No Order Yet!!</h4>
	<%
	}
	else
	{
		int temp_oid;
		Timestamp temp_time;
		float temp_total;
		int temp_n=0;
		int i=0;
		
		for(i=0;i<q1.getN();i++)
		{
			temp_oid=q1.getOid(i);
			temp_time=q1.gettime(i);
			temp_total=q1.getTotal(i);
			temp_n=q1.getItem_count(i);
			
			Query_Item temp_i = new Query_Item(temp_n);
			temp_i=q1.getItems(i);
			
			
	%>
	<fieldset>
	
	<legend>Ordered on :<%=temp_time%> for <%=temp_total%></legend>
	
	
	
	
	<%
			String temp_title = "";
			int temp_qty = 0;
			float temp_partial_amount = 0;
			int temp_iid = 0;
			int temp_bid = 0;
			int item_n=0;
	%>
	<table>
	<tr>
		<td>SR.No</td>
		<td>Title</td>
		<td>Quantity</td>
		<td>Partial Amount</td>
	</tr>
	
	<%
		item_n=temp_i.getN();
			
			for(int j=0;j<item_n;j++)
			{
				temp_title = temp_i.getTitle(j);
				temp_qty = temp_i.getQty(j);
				temp_iid = temp_i.getiid(j);
				temp_partial_amount = temp_i.getPartial_amount(j);
				%>
				<tr>
					<td><%=j+1%></td>
					<td><%=temp_title%></td>
					<td><%=temp_qty%></td>
					<td><%=temp_partial_amount%></td>
				</tr>
				<%
			}
			
	%>
	</table>
	</fieldset>
	<%
			
		}
	%>
	
	<%
	
	
	}%>
	</fieldset>
	<br><br>
	<fieldset>
	<legend>Sales History</legend>
	<%
		
	Query_Item q = (Query_Item)session.getAttribute("sales_details");
	if(q.getN()==0)
	{	
	%>
	<h4>No item sold yet!!</h4>
	<%
	}
	else
	{
		
	%>
	
	<table>
	<tr>
		<td>SR.No</td>
		<td>TimeStamp</td>
		<td>Title</td>
		<td>Quantity</td>
		<td>Partial Amount</td>
	</tr>
		<%

			
		String temp_title = "";
		int temp_qty = 0;
		float temp_partial_amount = 0;
		Timestamp temp_time;
		int temp_iid = 0;
		int temp_bid = 0;
		int i=0;
		int n = q.getN();
		for(i = 0;i<n;i++)
		{
			temp_title = q.getTitle(i);
			temp_qty = q.getQty(i);
			temp_iid = q.getiid(i);
			temp_partial_amount = q.getPartial_amount(i);
			temp_time = q.getTime(i);
			
		%>
			<tr>
				<td><%=i+1%></td>
				<td><%=temp_time%></td>
				<td><%=temp_title%></td>
				<td><%=temp_qty%></td>
				<td><%=temp_partial_amount%></td>
			</tr>
		
	<%} %>
	</table>
	<%}
	%>
	</fieldset>
	
			
</body>
</html>
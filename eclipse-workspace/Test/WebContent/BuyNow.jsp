<%@page import="com.Thrift_Shop.Query_ViewCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<script type="text/javascript" src="assets/JS/jquery-3.4.1.js"></script>
<title>BuyNow</title>
</head>
<body>
	<fieldset class="fieldset">
		<legend><b>Shipping to this Address</b>
		</legend>
		<table class="table-content">
			<tr>
				<td><b>Building :</b></td>
				<td>${building }</td>
			</tr>
			<tr>
				<td><b>Neighbourhood :</b></td>
				<td>${neighbourhood }</td>
			</tr>
			<tr>
				<td><b>City :</b></td>
				<td>${city}</td>
			</tr>
		</table>
	</fieldset>
	
	<b>Wallet :</b><div>${wallet }</div>
	<form action="transaction" method="post">
		<table>
		<tr>
		<td> <input type="submit" value="Confirm" name="confirm"></td>
		</tr>
		<tr>
		<td>${wallinsufficient}${itemqtyError}</td>
		</tr>
		
		</table>
	
	</form>
	<input type="submit" value="Confirm" name="confirm">
	
	
	
		<fieldset class="fieldset">
		<legend><b>Bill</b>
		</legend>
		<table>
		<tr>
			<td>SR.NO</td>
			<td>Title</td>
			<td>Price</td>
			<td>Quantity</td>
			<td>Partial Amount</td>
		</tr>
		
		<% 
			Query_ViewCart result = (Query_ViewCart) (session.getAttribute("result"));

			int n = result.getN();
			String temp_title = "";
			float temp_price = 0;
			float temp_pamount = 0;
			int temp_qty = 0;
			int temp_iid = 0;
			int i = 0;
			for (i = 0; i < n; i++) {
					temp_title = result.getTitle(i);
					temp_price = result.getPrice(i);
					temp_pamount = result.getPartial_amount(i);
					temp_qty = result.getQuantity(i);
					temp_iid = result.getiid(i);
		%>
		<tr style="border-bottom:1px solid black">
			
			<td width="10%"><%=i + 1%></td>
			<td width="50%"><%=temp_title%></td>
			<td width="10%"><%=temp_price%></td>
			<td width="10%"><%=temp_qty%></td>
			<td width="10%"><%=temp_pamount%></td>			
		</tr>
		<%
			}
		%>
		
		<%-- <% 
			Query_ViewCart result1 = (Query_ViewCart) (session.getAttribute("rs"));

			int m = result1.getN();
			for (i = 0; i < m; i++) {
					temp_title = result1.getTitle(i);
					temp_price = result1.getPrice(i);
					temp_pamount = result1.getPartial_amount(i);
					temp_qty = result1.getQuantity(i);
					temp_iid = result1.getiid(i);
		%>
		<tr>
			
			<td width="10%"><%=i + 1%></td>
			<td width="50%"><%=temp_title%></td>
			<td width="10%"><%=temp_price%></td>
			<td width="10%"><%=temp_qty%></td>
			<td width="10%"><%=temp_pamount%></td>			
		</tr>
		<%
			}
		%>
 --%>
 		<tr>
			<td><b>Total::</</b></td>
			<td></td>
			<td></td>
			<td></td>
			<td><%=temp_pamount%></td>
		</tr>



	</table>


	</fieldset>
	
</body>
</html>
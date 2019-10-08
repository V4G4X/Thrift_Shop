<%@page import="com.Thrift_Shop.Query_ViewCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<script type="text/javascript" src="assets/JS/jquery-3.4.1.js"></script>
</head>
<body>

	<%
		Query_ViewCart result = (Query_ViewCart) (session.getAttribute("rs"));
		if (result == null) {
	%>
	${CartError}
	<%
		} else {
			int n = result.getN();
			String temp_title = "";
			float temp_price = 0;
			float temp_pamount = 0;
			int temp_qty = 0;
			int i = 0;
	%>

	<table>
		<tr>
			<td>SR.NO</td>
			<td>Title</td>
			<td>Price</td>
			<td>Quantity</td>
			<td>Partial Amount</td>
		</tr>
		<%
			for (i = 0; i < n; i++) {
					temp_title = result.getTitle(i);
					temp_price = result.getPrice(i);
					temp_pamount = result.getPartial_amount(i);
					temp_qty = result.getQuantity(i);
		%>

		<tr>
			
			<td width="10%"><%=i + 1%></td>
			<td width="50%"><%=temp_title%></td>
			<td width="10%"><%=temp_price%></td>
			<td width="10%"><%=temp_qty%></td>
			<td width="10%"><%=temp_pamount%></td>
			<td width = "10%"><form action="RemoveItem" method="post"><input type="submit" value="REMOVE" name="button"><input type="hidden" value="<%=i%>" name="remove"></form></td>
			
		</tr>
		<%
			}
			}
		%>




	</table>

</body>
</html>
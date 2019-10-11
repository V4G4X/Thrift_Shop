<%@page import="com.Thrift_Shop.Query_ViewCart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="assets/CSS/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-inverse bg-dark">
		<div class="container">
			<a href="#" class="navbar-brand title">Thrift Shop</a>
			<ul class="navbar-nav pull-right">
				<li class="navbar-item ">
					<form action="Profile.jsp">
						<button class="nav-link btn primary" style="margin-top: 10%;">Profile <i class="fa fa-user-circle" aria-hidden="true"></i></button>
					</form>
				</li>
			</ul>
		</div>
	</nav>

	<%
		Query_ViewCart result = (Query_ViewCart) (session.getAttribute("rs"));
		if (result == null) {
		} else {
			int n = result.getN();
			String temp_title = "";
			float temp_price = 0;
			float temp_pamount = 0;
			int temp_qty = 0;
			int temp_iid = 0;
			int i = 0;
			session.setAttribute("flag", 1);
	%>
	<div class="container">
		<table class="table table-striped table-bordered table-hover">
			<caption><h3> Cart:</h3></caption>
			<tr class="info ">
				<th>SR.NO</th>
				<th>Title</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Partial Amount</th>
				<th>Remove</th>
			</tr>
			<%
				for (i = 0; i < n; i++) {
						temp_title = result.getTitle(i);
						temp_price = result.getPrice(i);
						temp_pamount = result.getPartial_amount(i);
						temp_qty = result.getQuantity(i);
						temp_iid = result.getiid(i);
			%>

			<tr class="text-center">

				<td><%=i + 1%></td>
				<td><%=temp_title%></td>
				<td><%=temp_price%></td>
				<td><%=temp_qty%></td>
				<td><%=temp_pamount%></td>
				<td><form class="" action="RemoveItem" method="post">
						<input type="submit" value="REMOVE" name="button"
							class="btn btn-warning"> <input type="hidden"
							value="<%=temp_iid%>" name="remove">
					</form></td>

			</tr>
			<%
				}
				}
			%>
		</table>
		<form method="post" action="BuyNow">
			<input type="submit" value="Buy Now"
				class="button btn btn-success pull-right px-5" name="buyNow">
		</form>
	</div>

</body>
</html>
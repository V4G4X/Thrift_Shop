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
<style type="text/css">
.col-sm-6 {
 padding-left: 44%;
}

.btn-lg {
	margin-right: 100% !important;
	margin-left: -300% !important;
	margin-top: 5% !important;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse bg-dark">
		<div class="container">
			<a href="#" class="navbar-brand title">Thrift Shop</a>
			<ul class="navbar-nav pull-right">
				<li class="navbar-item ">
					<form action="ProfileServlet" method="POST">
						<div class="btn-group">
							<button class="nav-link btn btn-secondary" id="gotoProfile"
								formaction="ProfileServlet">
								Profile <i class="fa fa-user-circle" aria-hidden="true"></i>
							</button>
							<button class="nav-link btn primary" formaction="Cart.jsp">
								Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i>
							</button>

						</div>
					</form>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container jumbrotron">
		<div class="">
			<fieldset class="fieldset">
				<legend>
					<b>Shipping to this Address</b>
				</legend>
				<table class="table">
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
		</div>
		<div class="text-center">
			<div class="col-sm-6 justify-content-center">
				<div class="justify-content-center text-center"><b>Wallet:</b>${wallet }</div>
			</div>
		</div>
		<br>
		<br>
		<fieldset class="fieldset">
			<legend>
				<b>Bill</b>
			</legend>
			<table class="table table-bordered table-striped">
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
				<tr style="border-bottom: 1px solid black">

					<td width="10%"><%=i + 1%></td>
					<td width="50%"><%=temp_title%></td>
					<td width="10%"><%=temp_price%></td>
					<td width="10%"><%=temp_qty%></td>
					<td width="10%"><%=temp_pamount%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td><b>Total::</b></td>
					<td></td>
					<td></td>
					<td></td>
					<td>${total_amount}</td>
				</tr>
			</table>


		</fieldset>

		<div class="text-center pull-right">
			<form class="text-center " action="transaction" method="post">
				<table>
					<tr>
						<td><button type="submit" class="btn btn-lg primary"
								value="Confirm" name="confirm">Confirm</button></td>
					</tr>
					<tr>
						<td>${wallinsufficient}${itemqtyError}</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>
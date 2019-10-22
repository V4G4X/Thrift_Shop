<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell the Item</title>
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

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(1)>td:nth-child(2)>input:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(3)>td:nth-child(2)>input:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(4)>td:nth-child(2)>textarea:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(5)>td:nth-child(2)>input:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(7)>td:nth-child(2)>input:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

/* Element | http://localhost:8080/Test/Sell.jsp */
.table-content>tbody:nth-child(1)>tr:nth-child(9)>td:nth-child(2)>input:nth-child(1)
	{
	width: 100%;
	margin-bottom: 10px;
}

button.primary:nth-child(1) {
 padding: 1% 4%;
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
	<div class="container">

		<form class="jumbotron" method="POST" action="AddItem" name="sell">
			<fieldset class="fieldset">
				<legend>
					<b>Sell Item</b>
				</legend>
				<table class="table-content">
					<tr>
						<td><b>Title <span class="com">*</span>:
						</b></td>
						<td><input type="text" name="title" value="${title}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${titleError}</td>
					</tr>
					<tr>
						<td><b>Author:</b></td>
						<td><input type="text" name="author" value="${author}"></td>
					</tr>

					<tr>
						<td><b>Describe the Book:</b></td>
						<td><textarea rows="5" cols="50" name="description">${description}</textarea></td>
					</tr>
					<tr>
						<td><b>Condition <span class="com">*</span>:
						</b></td>
						<td><input type="number" name="condition"
							value="${condition}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${conditionError}</td>
					</tr>
					<tr>
						<td><b>Selling price(for each) <span class="com">*</span>:
						</b></td>
						<td><input type="number" name="price" value="${price}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${priceError}</td>
					</tr>
					<tr>
						<td><b>Quantity <span class="com">*</span>:
						</b></td>
						<td><input type="number" name="quantity" value="${quantity}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${stockError}</td>
					</tr>
				</table>
				<br> <br>
				<div class="text-center">
						<button type="submit" class="btn primary btn-outline-dark">Sell</button>
				</div>

			</fieldset>
		</form>
	</div>
</body>
</html>
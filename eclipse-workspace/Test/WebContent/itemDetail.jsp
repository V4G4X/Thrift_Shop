<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<title>Item - <%=session.getAttribute("viewable_title")%></title>
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
					<form>
						<div class="btn-group">
							<button class="nav-link btn btn-secondary" id="gotoProfile"
								formaction="Profile.jsp">
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

	<div class="container-fluid">
		<div class="row">
			<a href="Buy.jsp">
				<div class="col-12" formaction="Buy.jsp" style="font-size: x-large;">
					<i class="fa fa-arrow-left" aria-hidden="true">Back to Search</i>
				</div>
			</a>
		</div>
	</div>

	<%
		session.setAttribute("flag", 2);
	%>
	<fieldset class="fieldset">
		<legend><b>Item Details</b></legend>
		<table class="table-content">
			<tr><td><b>Title:</b></td> <td><%=session.getAttribute("viewable_title")%></td></tr>
			<tr><td><b>Author:</b></td><td><%=session.getAttribute("viewable_author")%></td></tr>
			<tr><td><b>Description:</b></td><td><%=session.getAttribute("viewable_description")%></td></tr>
			<tr><td><b>Condition:</b></td><td><%=session.getAttribute("viewable_condition")%></td></tr>
			<tr><td><b>Price:</b></td><td><%=session.getAttribute("viewable_price")%></td></tr>
			<tr><td><b>Stock:</b></td><td><%=session.getAttribute("viewable_stock")%></td></tr>
		</table>
	</fieldset>

	<fieldset class="fieldset">
		<legend><b>Seller Details</b></legend>
		<table class="table-content">
			<tr><td><b>Seller ID:</b></td><td><%=session.getAttribute("viewable_sid")%></td></tr>
			<tr><td><b>Seller Name:</b></td><td><%=session.getAttribute("viewable_fname")%></td></tr>
			<tr><td><b>Seller Last Name:</b></td><td><%=session.getAttribute("viewable_lname")%></td></tr>
			<tr><td><b>Seller Email-ID:</b></td><td><%=session.getAttribute("viewable_email")%></td></tr>
			<tr><td><b>Seller Phone:</b></td><td><%=session.getAttribute("viewable_phone")%></td></tr>
		</table>
	</fieldset>
		<br>
		<br>
	<div class="container" id="errorCatcher"></div>
	<script type="text/javascript">
		let str = "${QuantityError}";
		if(str!==""){
			console.log("Entered Here");
			let tag = '<div class="alert alert-danger alert-dismissible fade in">  <strong>Error!</strong> ${QuantityError}</div>';
			$("#errorCatcher").append(tag);
		}
	</script>
	
	<div class="container">
		<form name="addtocart" method="post" action="AddToCart" >
			<div class="form-group text-center justify-content-center">
				Quantity:<input type="number" class="form-control" name="qty" class="" autofocus>
				<div class="btn-group btn-group-justified  text-center justify-content-center" >
					<button type="submit" value="Add to Cart" class=" btn primary btn-lg butpad" name="addToCart">Add to Cart</button>
					<button type="submit" value="Buy Now" class=" btn btn-info btn-lg butpad" name="buyNow" formaction="BuyNow">Buy Now</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
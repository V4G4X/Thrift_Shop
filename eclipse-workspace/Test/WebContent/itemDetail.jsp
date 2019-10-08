<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<title>Item - <%=session.getAttribute("viewable_title")%></title>
</head>
<body>
	<fieldset class="fieldset">
		<table class="table-content">
			<tr>
				<td><b>Title:</b></td>
				<td><%=session.getAttribute("viewable_title")%></td>
			</tr>
			<tr>
				<td><b>Author:</b></td>
				<td><%=session.getAttribute("viewable_author")%></td>
			</tr>
			<tr>
				<td><b>Description:</b></td>
				<td><%=session.getAttribute("viewable_description")%></td>
			</tr>
			<tr>
				<td><b>Condition:</b></td>
				<td><%=session.getAttribute("viewable_condition")%></td>
			</tr>
			<tr>
				<td><b>Price:</b></td>
				<td><%=session.getAttribute("viewable_price")%></td>
			</tr>
			<tr>
				<td><b>Stock:</b></td>
				<td><%=session.getAttribute("viewable_stock")%></td>
			</tr>
		</table>
	</fieldset>
	
	<fieldset class="fieldset">
		<legend>
			<b>Seller Details</b>
		</legend>
		<table class="table-content">
			<tr>
				<td><b>Seller ID:</b></td>
				<td><%=session.getAttribute("viewable_sid")%></td>
			</tr>
			<tr>
				<td><b>Seller Name:</b></td>
				<td><%=session.getAttribute("viewable_fname")%></td>
			</tr>
			<tr>
				<td><b>Seller Last Name:</b></td>
				<td><%=session.getAttribute("viewable_lname")%></td>
			</tr>
			<tr>
				<td><b>Seller Email-ID:</b></td>
				<td><%=session.getAttribute("viewable_email")%></td>
			</tr>
			<tr>
				<td><b>Seller Phone:</b></td>
				<td><%=session.getAttribute("viewable_phone")%></td>
			</tr>
		</table>
	</fieldset>
	<form name="addtocart" method="post" action="AddToCart">
		<section class="center">
			<table class="table-content">
			<tr>
			<td>Quantity:</td>
			<td><input type="number" name="qty" autofocus></td>
			<td></td>
			</tr>
			<tr>
			<td><div class="center error">${QuantityError}</div></td>
			</tr>
			<tr>
			<td><input type="submit" value="Add to Cart" class="button" name="addToCart"></td>
			<td><input type="submit" value="Buy Now" class="button" name="buyNow" formaction="BuyNow"></td>
			</tr>
			</table>			
		</section>
	</form>
</body>
</html>
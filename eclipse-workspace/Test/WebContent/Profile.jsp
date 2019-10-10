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
	<form>
	<fieldset>
	<legend>Order History</legend>
	
	</fieldset>
	<br><br>
	<fieldset>
	<legend>Sales History</legend>
	
	</fieldset>
	</form>
	
			
</body>
</html>
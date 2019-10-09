<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<h3>My User name is <%=session.getAttribute("username")%></h3>
	<h3>My password is <%=session.getAttribute("password")%> </h3>
	
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
	
			
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<title>Item-<%=session.getAttribute("Title")%></title>
</head>
<body>
	<fieldset class="fieldset">
	<table class="table-content">
		<tr>
			<td><b>Title:</b></td>
			<td><%=session.getAttribute("Title")%></td>
		</tr>
		<tr>
			<td><b>Author:</b></td>
			<td><%=session.getAttribute("Author")%></td>
		</tr>
		<tr>
			<td><b>Description:</b></td>
			<td><%=session.getAttribute("Description")%></td>
		</tr>
		<tr>
			<td><b>Condition:</b></td>
			<td><%=session.getAttribute("Condition")%></td>
		</tr>
		<tr>
			<td><b>Price:</b></td>
			<td><%=session.getAttribute("Price")%></td>
		</tr>
		
	</table>
	</fieldset>
	<section class="center">
		<input type="submit" value="Add to cart" class="button">
	</section>
</body>
</html>
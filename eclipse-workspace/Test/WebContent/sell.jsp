<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell the Item</title>
</head>
<body>
	<form method = "POST" action = "AddItem" name  = "sell">
		<fieldset>
			<legend>Sell Item</legend>
					<table align="center">
					<tr>
						<td>Title:</td>
						<td><input type="text" name="title" ></td>
					</tr>
					<tr>
						<td>Author:</td>
						<td><input type="text" name="author" ></td>
					</tr>
					<tr>
						<td>Describe the Book:</td>
						<td><input type="text" name="description" ></td>
					</tr>
					<tr>
						<td>Condition:</td>
						<td><input type="num" name="condition"></td>
					</tr>
					<tr>
						<td>Selling price(for each):</td>
						<td><input type="number" name="price"></td>
					</tr>
					<tr>
						<td>Quantity:</td>
						<td><input type="number" name="quantity"></td>
					</tr>
				</table>
				</fieldset>
	</form>
</body>
</html>
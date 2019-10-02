<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<title>Sell the Item</title>
</head>
<body>
	<form method = "POST" action = "AddItem" name  = "sell">
		<fieldset class="fieldset">
			<legend><b>Sell Item</b></legend>
				<table class="table-content">
					<tr>
						<td><b>Title <span class="com">*</span>:</b></td>
						<td><input type="text" name="title" ></td>
					</tr>
					<tr>
						<td><b>Author:</b></td>
						<td><input type="text" name="author" ></td>
					</tr>
					<tr>
						<td><b>Describe the Book:</b></td>
						<td><textarea rows="5" cols="50" name="description" ></textarea></td>
					</tr>
					<tr>
						<td><b>Condition <span class="com">*</span>:</b></td>
						<td><input type="number" name="condition"></td>
					</tr>
					<tr>
						<td><b>Selling price(for each) <span class="com">*</span>:</b></td>
						<td><input type="number" name="price"></td>
					</tr>
					<tr>
						<td><b>Quantity <span class="com">*</span>:</b></td>
						<td><input type="number" name="quantity"></td>
					</tr>
				</table>
				<br>
				<br>
				<section class="center">
					<input type = "submit" value ="Sell" class="button">
				</section>
				</fieldset>
	</form>
</body>
</html>
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
						<td><b>Condition <span class="com">*</span>:</b></td>
						<td><input type="number" name="condition" value="${condition}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${conditionError}</td>
					</tr>
					<tr>
						<td><b>Selling price(for each) <span class="com">*</span>:</b></td>
						<td><input type="number" name="price" value="${price}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${priceError}</td>
					</tr>
					<tr>
						<td><b>Quantity <span class="com">*</span>:</b></td>
						<td><input type="number" name="quantity" value="${quantity}"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${stockError}</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<title>BuyNow</title>
</head>
<body>
	<fieldset class="fieldset">
		<legend><b>Shipping to this Address</b>
		</legend>
		<table class="table-content">
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
	
	<b>Wallet :</b><div>${wallet }</div>
	<form action="transaction" method="post">
		<table>
		<tr>
		<td> <input type="submit" value="Confirm" name="confirm"></td>
		</tr>
		<tr>
		<td>${wallinsufficient}${itemqtyError}</td>
		</tr>
		
		</table>
	
	</form>
	<input type="submit" value="Confirm" name="confirm">
	
	
	
</body>
</html>
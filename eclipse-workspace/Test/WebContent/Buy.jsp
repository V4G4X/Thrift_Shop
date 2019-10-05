<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy the Item</title>
<script type="text/javascript" src="assets/JS/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
						let element = '<script type="text/javascript" src="assets/JS/itemList.jsp">'
								+ '</scrip'+'t>';
						$("head").append(element);
					});
</script>

<link href="assets/CSS/style.css" rel="stylesheet">
</head>
<body>
	<form action="SearchServlet" method="POST">
		<table>
			<tr>
				<td><input type="text" name="search"></td>
				<td><input type="submit" value="Search"></td>
			</tr>
			<tr>
				<td>Search By:</td>
				<td>Author :<input type="checkbox" name="searchby" value="auth"
					checked> Title : <input type="checkbox" name="searchby"
					value="tit" checked> Description :<input type="checkbox"
					name="searchby" value="desc" checked>
				</td>
			</tr>
		</table>
		<h2 class="error">${searchError}</h2>
	</form>
	<div id="dynaTable"></div>
</body>
</html>
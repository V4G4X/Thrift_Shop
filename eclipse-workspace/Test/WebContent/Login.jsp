<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="assets/CSS/style.css" rel="stylesheet">
</head>
<body>
	<form name="login" method="POST" action="LoginServlet" onSubmit="return validate(event);">
		<fieldset class="login">
			<legend>Enter Details</legend>
			<table class="login">
				<tr class="login">
					<td><b>User-name :</b></td>
					<td><input type="text" name="username"></td>					
				</tr>
				<tr class="login">
					<td></td>
					<td><div name="username_error"></div></td>
				</tr>
				<tr class="login">
					<td><b>Password :</b></td>
					<td><input type="password" name="password"></td>					
				</tr>					
				<tr class="login">
					<td></td>
					<td><div id="password_error"></div></td>
				</tr>
			</table>
			<section class="center">
				<input type="submit" value="Submit" class="button">
				<input type="reset" value="Reset" class="button">
			</section>
		</fieldset>
	</form>
	<br>
	<br>
	<form action="SignUp.jsp" class="login">
	<button type="submit">Sign Up</button>
	</form>
</body>
<script type="text/javascript" src="assets/JS/loginValidation.js"></script>
</html>



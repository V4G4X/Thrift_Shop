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
	<form name="login" method="POST" action="LoginServlet">
		<!-- onSubmit="return validate(event);"> -->
		<fieldset class="fieldset">
			<legend>Enter Details</legend>
			<table class="table-content">
				<tr>
					<td><b>Username :</b></td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td></td>
					<td><div id="username_error" class="error"></div></td>
				</tr>
				<tr>
					<td><b>Password :</b></td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr class="login">
					<td></td>
					<td><div id="password_error" class="error"></div></td>
				</tr>
			</table>
			<section class="center">
				<input type="submit" value="Submit" class="button" id="btn">
				<input type="reset" value="Reset" class="button">
			</section>
			<div class="center error">${userError}${passError}</div>
		</fieldset>
	</form>
	<br>
	<br>
	<form action="SignUp.jsp" class="login">
		<section class="center">
			<input type="submit" value="Sign Up" class="button">
		</section>
	</form>
</body>
<script type="text/javascript" src="assets/JS/loginValidation.js"></script>
</html>



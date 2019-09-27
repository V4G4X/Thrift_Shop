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
	<form name="login" method="POST" action="TestServlet">
		<fieldset class="login">
			<legend>Enter Details</legend>
			<table class="login">
				<tr class="login">
					<td>Username</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr class="login">
					<td>Password</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
			<section class="center">
				<button type="submit">Submit</button>
				<button type="reset">Reset</button>
			</section>
		</fieldset>
	</form>
	<br>
	<br>
	<form action="SignUp.jsp" class="login">
	<button type="submit">Sign Up</button>
	</form>
</body>
</html>
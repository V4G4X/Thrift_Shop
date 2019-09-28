<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-up</title>
</head>
<body>
	<form method="POST" name="signup" action="SignupServer" align="center">
		<fieldset>
			<legend>Sign-up</legend>
			
				<fieldset width=200>
					<legend> Personal Details</legend>
					<table align="center">
					<tr>
						<td>Firstname:</td>
						<td><input type="text" name="fname"></td>
					</tr>
					<tr>
						<td>Lastname:</td>
						<td><input type="text" name="lname"></td>
					</tr>
					<tr>
						<td>Phone no1*:</td>
						<td><input type="tel" name="phno1"></td>
					</tr>
					<tr>
						<td>Phone no2*:</td>
						<td><input type="tel" name="phno2"></td>
					</tr>
					<tr>
						<td>Email id:</td>
						<td><input type="email" name="emailid"></td>
					</tr>

				</table>
				</fieldset>
				<fieldset width=200>
					<legend>Login Details</legend>
				<table align="center">
					<tr>
						<td>Username:</td>
						<td><input type="text" name="uname"></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="pwd1"></td>
					</tr>
					<tr>
						<td>Confirm Password:</td>
						<td><input type="password" name="pwd2"></td>
					</tr>
				</table>
				</fieldset>
				<fieldset width="200">
					<legend>Address</legend>
				<table align="center" width="200" heigth="500">
					<tr>
						<td>Building:</td>
						<td><input type="text" name="bldg"></td>
					</tr>
					<tr>
						<td>City:</td>
						<td><input type="text" name="city"></td>
					</tr>
					<tr>
						<td>Neighbourhood:</td>
						<td><input type="text" name="neighbour"></td>
					</tr>
					<tr>
						<td>Pincode:</td>
						<td><input type="text" name="pincode"></td>
					</tr>

			</table>
				</fieldset>

		</fieldset>
	</form>
</body>
</html>
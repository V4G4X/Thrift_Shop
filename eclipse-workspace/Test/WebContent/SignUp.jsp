<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="assets/CSS/style.css" rel="stylesheet">
<script src="assets/JS/signupValidation.js"></script>
<title>Sign-up</title>
</head>
<body>
	<form method="POST" name="signup" action="SignupServlet" align="center">
		<fieldset>
			<legend>Sign-up</legend>
			<fieldset width=200>
				<legend> Personal Details</legend>
				<table align="center">
					<tr>
						<td>First Name:*</td>
						<td><input type="text" name="fname" value="${fName}"></td>
						<td class="error">${fNameError}</td>
					</tr>
					<tr>
						<td>Last Name:*</td>
						<td><input type="text" name="lname" value="${lName}"></td>
						<td class="error">${lNameError}</td>
					</tr>
					<tr>
						<td>Phone No. 1*:</td>
						<td><input type="tel" name="phno1" maxlength="10"
							minlength="10" value="${phone1}"></td>
						<td class="error">${phoneError}</td>
					</tr>
					<tr>
						<td>Phone No. 2:</td>
						<td><input type="tel" name="phno2" maxlength="10"
							minlength="10" value="${phone2}"></td>
					</tr>
					<tr>
						<td>Email:*</td>
						<td><input type="email" name="emailid" value="${email}"></td>
						<td class="error">${emailError}${emailDup}</td>
					</tr>

				</table>
			</fieldset>

			<fieldset width=200>
				<legend>Login Details</legend>
				<table align="center">
					<tr>
						<td>Username:*</td>
						<td><input type="text" name="uname" value="${username}"></td>
						<td class="error">${usernameError}</td>
					</tr>
					<tr>
						<td>Password:*</td>
						<td><input type="password" name="pwd1"></td>
						<td class="error">${passwordError1}</td>
					</tr>
					<tr>
						<td>Confirm Password:*</td>
						<td><input type="password" name="pwd2"></td>
						<td class="error">${passwordError2}</td>
					</tr>
				</table>
			</fieldset>
			<fieldset width="200">
				<legend>Address</legend>
				<table align="center" width="200" heigth="500">
					<tr>
						<td>Building:*</td>
						<td><input type="text" name="bldg" value="${building }"></td>
					</tr>
					<tr>
						<td>City:*</td>
						<td><input type="text" name="city" value="${city }"></td>
					</tr>
					<tr>
						<td>Neighborhood:*</td>
						<td><input type="text" name="neighbour"
							value="${neighborhood }"></td>
					</tr>
					<tr>
						<td>Pincode:*</td>
						<td><input type="tel" name="pincode" minlength="6"
							maxlength="6" value="${pincode }"></td>
					</tr>
					<tr>
						<td><div class="error">
								<br>${addressError }
							</div></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<section class="center">
				<button type="submit">Submit</button>
				<input type="submit" name="reset" value="Reset" placeholder="Reset" onclick="SignupServlet"> 
			</section>
		</fieldset>
	</form>
</body>
</html>
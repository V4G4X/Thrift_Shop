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
	<form method="POST" name="signup" action="SignupServlet">
		<fieldset class="main-fieldset">
			<legend><b>Sign-up</b></legend>
			<fieldset class="fieldset">
				<legend><b>Personal Details</b></legend>
				<table class="table-content">
					<tr>
						<td><b>First Name:</b></td>
						<td><input type="text" name="fname" value="${fName}"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${fNameError}</td>
					</tr>
					<tr>
						<td><b>Last Name:</b></td>
						<td><input type="text" name="lname" value="${lName}"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${lNameError}</td>
					</tr>
					<tr>
						<td><b>Phone No. 1:</b></td>
						<td><input type="tel" name="phno1" maxlength="10" minlength="10" value="${phone1}"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${phoneError}</td>
					</tr>
					<tr>
						<td><b>Phone No. 2:</b></td>
						<td><input type="tel" name="phno2" maxlength="10" minlength="10" value="${phone2}"></td>
					</tr>
					<tr>
						<td><b>Email:</b></td>
						<td><input type="email" name="emailid" value="${email}"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${emailError}${emailDup}</td>
					</tr>

				</table>
			</fieldset>

			<fieldset class="fieldset">
				<legend><b>Login Details</b></legend>
				<table class="table-content">
					<tr>
						<td><b>User-name:</b></td>
						<td><input type="text" name="uname" value="${username}"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${usernameError}</td>
					</tr>
					<tr>
						<td><b>Password:</b></td>
						<td><input type="password" name="pwd1"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${passwordError1}</td>
					</tr>
					<tr>
						<td><b>Confirm Password:</b></td>
						<td><input type="password" name="pwd2"></td>
					</tr>	
					<tr>
						<td></td>
						<td class="error">${passwordError2}</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset">
				<legend>Address</legend>
				<table class="table-content">
					<tr>
						<td><b>Building:</b></td>
						<td><input type="text" name="bldg" value="${building }"></td>
					</tr>
					<tr>
						<td><b>City:</b></td>
						<td><input type="text" name="city" value="${city }"></td>
					</tr>
					<tr>
						<td><b>Neighborhood:</b></td>
						<td><input type="text" name="neighbour" value="${neighborhood }"></td>
					</tr>
					<tr>
						<td><b>Pin-code:</b></td>
						<td><input type="tel" name="pincode" minlength="6" maxlength="6" value="${pincode }"></td>
					</tr>
					<tr>
						<td></td>
						<td class="error">${addressError}</td>
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
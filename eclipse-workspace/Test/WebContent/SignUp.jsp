<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign-up</title>
<link href="assets/CSS/signUp.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid bg">
	<div class="row">
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	<div class="col-md-4 col-sm-4 col-xs-12">
	<div class="signup-form">
	<form method="POST" name="signup" action="SignupServlet" onSubmit="return validate(event);">
		<h2>Sign Up</h2>
		<p>Please fill in this form to create an account!</p>
		<hr>
		<label><b>Personal Details</b></label>
		<div class="form-group">
			<div class="row">
				<div class="col"><input type="text" name="fname" value="${fName}" placeholder="First Name"></div>
				<div class="col"><input type="text" name="lname" value="${lName}" placeholder="Last Name"></div>
			</div>
			<div class="row">
				<div class="col" class="error"><small>${fNameError}</small></div>
				<div class="col" class="error"><small>${lNameError}</small></div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="row">
				<div class="col"><input type="tel" name="phno1" maxlength="10" minlength="10" value="${phone1}" placeholder="Mobile Number"></div>
				<div class="col"><input type="tel" name="phno2" maxlength="10" minlength="10" value="${phone2}" placeholder="Alternate Number"></div>
			</div>
			<div class="error"><small>${phoneError}</small></div>
		</div>
		
		<div class="form-group">
			
		</div>
		
		<div class="form-group">
			<input type="email" name="emailid" value="${email}" placeholder="Email-Id">
			<div class="error"><small>${emailError}${emailDup}</small></div>
		</div>
					
		<hr>
		<label><b>Login Detail</b></label>
		<div class="form-group">
			<input type="text" name="uname" value="${username}" placeholder="User Name">
			<div class="error"><small>${usernameError}</small></div>
		</div>
						
		<div class="form-group">
			<input type="password" name="pwd1" placeholder="Password">
			<div class="error"><small>${passwordError1}</small></div>
		</div>	
		
		<div class="form-group">
			<input type="password" name="pwd2" placeholder="Confirm-Password">
			<div class="error"><small>${passwordError2}</small></div>
		</div>			
		
		<hr>				
		
		<label><b>Address</b></label>
		<div class="form-group">
			<input type="text" name="bldg" value="${building }" placeholder="Building Name">
		</div>
		
		<div class="form-group">
			<input type="text" name="city" value="${city }" placeholder="City Name">
		</div>
					
		<div class="form-group">
			<input type="text" name="neighbour" value="${neighborhood }" placeholder="Neighbourhood Name">
		</div>
			
		<div class="form-group">
			<input type="tel" name="pincode" minlength="6" maxlength="6" value="${pincode }" placeholder="Pin-Code">
		</div>
		
		<div class="error"><small>${addressError}</small></div>
		
		<div class="form-group">
			<label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col"><input type="submit" value="Sign Up" class="btn btn-primary btn-block"></div>
				<div class="col"><input type="submit" name="reset" value="Reset" placeholder="Reset" onclick="SignupServlet" class="btn btn-primary btn-block"></div>
			</div>
		</div>
	</form>
	<div class="hint-text">Already have an account? <a href="Login.jsp">Login here</a></div>
	</div>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	</div>
</div>
</body>
</html>
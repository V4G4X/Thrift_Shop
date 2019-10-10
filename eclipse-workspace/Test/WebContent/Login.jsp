<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href="assets/CSS/login.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid bg">
		<div class="row justify-content-center">
			<div class=" col-xs-9 col-md-4 col-lg-4 ">
				<div class="form-container">
					<h1>Login Form</h1>
					<form name="login" method="POST" action="LoginServlet" onSubmit="return validate(event);">
						<div class="form-group">
							<label>User Name</label> <input type="text" class="form-control" name="username" placeholder="Enter User Name">
							<div id="username_error" class="error"></div>
						</div>

						<div class="form-group">
							<label>Password</label> <input type="password" class="form-control" name="password" placeholder="Enter Password">
							<div id="password_error" class="error"></div>
						</div>
						<input type="submit" value="Log In" class="btn btn-success btn-block" id="btn">
						<div class="center error">${userError}${passError}</div>
					</form>
					<br> <br> <small id="emailHelp" class="form-text text-muted"><span>New to Thrift_Shop?</span></small>
					<form action="SignUp.jsp" class="login">
						<input type="submit" value="Sign Up"
							class="btn btn-primary btn-block">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="assets/JS/loginValidation.js"></script>
</html>




function validate(event){

	event.preventDefault();
	console.log(event);
	if(document.login.username.value == ""){
		document.login.username.style.border = "1px solid red";
		document.getElementById('username_error').innerHTML="Username is required"
			console.log(document.getElementById('username_error'));
		document.login.username.focus();
		return false;
	}
	else if(document.login.password.value == ""){
		document.login.password.style.border = "1px solid red";
		document.getElementById('password_error').innerHTML="Password is required"
			console.log(document.getElementById('password_error'));
		document.login.password.focus();
		return false;
	}
	else{
		document.login.submit();
	}
}






function validate(event){
	
	event.preventDefault();
	
	if(document.login.username.value == ""){
		document.login.username.style.border = "1px solid red";
		document.getElementId('username_error').innerHTML="Username is required"
		document.login.username.focus();
		return false;
	}
	else if(document.login.password.value == ""){
		document.login.password.style.border = "1px solid red";
		document.getElementId('password_error').innerHTML="Password is required"
		document.login.password.focus();
		return false;
	}
	else{
		document.login.submit();
	}
}





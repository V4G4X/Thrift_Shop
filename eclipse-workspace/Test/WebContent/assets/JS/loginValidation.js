
document.getElementById('btn').addEventListener('blur', usernameVerify, true);
document.getElementById('btn').addEventListener('blur', passwordVerify, true);

function validate(event){

	event.preventDefault();
	if(document.login.username.value == ""){
//		document.login.username.style.border = "1px solid red";
		document.getElementById('username_error').innerHTML="Username is required"
		document.login.username.focus();
		return false;
	}
	else if(document.login.password.value == ""){
//		document.login.password.style.border = "1px solid red";
		document.getElementById('password_error').innerHTML="Password is required"
		document.login.password.focus();
		return false;
	}
	else{
		document.login.submit();
	}
}


function usernameVerify(){
	if(document.login.username.value != ""){
		document.login.username.style.border = "";
		document.getElementById('username_error').innerHTML=""
		return true;
	}
	
}

function passwordVerify(){
	if(document.login.password.value != ""){
		document.login.password.style.border = "";
		document.getElementById('password_error').innerHTML=""
		return true;
	}
}


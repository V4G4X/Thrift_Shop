
document.getElementById('btn1').addEventListener('blur', firstnameVerify, true);
document.getElementById('btn1').addEventListener('blur', lastnameVerify, true);
document.getElementById('btn1').addEventListener('blur', phno1Verify, true);
document.getElementById('btn1').addEventListener('blur', phno2Verify, true);
document.getElementById('btn1').addEventListener('blur', passVerify, true);
document.getElementById('btn1').addEventListener('blur', conpassVerify, true);


function validateSignup(event){
	event.preventDefault();
	
		if(!/^[a-zA-Z]*$/g.test(document.signup.fname.value))
		{
			document.getElementById('fNameError').innerHTML="Letters Only in First Name";
			document.signup.fname.focus();
			return false;

		}
		else if(!/^[a-zA-Z]*$/g.test(document.signup.lname.value))
		{
			document.getElementById('lNameError').innerHTML="Letters Only in Last Name";
			document.signup.lname.focus();
			return false;
		}
		else if(!/^[0-9]*$/g.test(document.signup.phno1.value))
		{
			document.getElementById('phoneError1').innerHTML="Numbers Only in Mobile Number";
			document.signup.phno1.focus();
			return false;

		}
		else if(!/^[0-9]*$/g.test(document.signup.phno2.value))
		{
			document.getElementById('phoneError2').innerHTML="Numbers Only in Mobile Name";
			document.signup.phno2.focus();
			return false;
		}
		else if(!/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/g.test(document.signup.pwd1.value))
		{
			document.getElementById('passwordError1').innerHTML="Password should contain atleast one number, one capital letter,one small letter and one special character";
			document.signup.pwd1.focus();
			return false;	
		}
		else if(!/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/g.test(document.signup.pwd2.value))
		{
			document.getElementById('passwordError2').innerHTML="Numbers Only in Mobile Name";
			document.signup.pwd2.focus();
			return false;	
		}
		else
		{
			document.signup.submit();
		}	
}

function firstnameVerify(){
	if(/^[a-zA-Z]*$/g.test(document.signup.fname.value)){
		document.getElementById('fNameError').innerHTML="";
		return true;
	}
	
}
function lastnameVerify(){
	if(/^[a-zA-Z]*$/g.test(document.signup.lname.value)){
		document.getElementById('lNameError').innerHTML="";
		return true;
	}
	
}

function phno1Verify(){
	if(/^[0-9]*$/g.test(document.signup.phno1.value)){
		document.getElementById('phoneError1').innerHTML="";
		return true;
	}
	
}
function phno2Verify(){
	if(/^[0-9]*$/g.test(document.signup.phno2.value)){
		document.getElementById('phoneError2').innerHTML="";
		return true;
	}
	
}
function passVerify(){
	if(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/g.test(document.signup.pwd1.value)){
		document.getElementById('passwordError1').innerHTML="";
		return true;
	}
	
}
function conpassVerify(){
	if(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/g.test(document.signup.pwd2.value)){
		document.getElementById('passwordError2').innerHTML="";
		return true;
	}
	
}

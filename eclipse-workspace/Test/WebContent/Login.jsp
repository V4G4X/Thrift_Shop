<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Home Page
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="assets/CSS/material-kit.css" rel="stylesheet" />
  <link href="assets/CSS/login.css" rel="stylesheet">
  <script async defer src="https://buttons.github.io/buttons.js"></script>	
    <script src="assets/JS/core/jquery.min.js" type="text/javascript"></script>
</head>
<body class="landing-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand">
          Thrift Shop </a>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <button class="btn btn-primary btn-round" data-toggle="modal" data-target="#loginModal">
              Login<i class="material-icons">account_circle</i>       
            </button>       
          </li>
          <li class="nav-item">
            <button class="btn btn-primary btn-round" data-toggle="modal" data-target="#signUpModal">
              Sign Up<i class="material-icons">double_arrow</i>
          
            </button>
          </li>
        </ul>
      </div>
    </div>
  </nav>
	         <div class="modal fade" id="loginModal" tabindex="-1" role="">
              <div class="modal-dialog modal-login">
                  <div class="modal-content">
                      <div class="card card-signup card-plain">
                          <div class="modal-header">
                            <div class="card-header card-header-primary text-center">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                <i class="material-icons">clear</i>
                              </button>
          
                              <h4 class="card-title">Log in</h4>
                              <div class="social-line">
                                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                  <i class="fa fa-facebook-square"></i>
                                </a>
                                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                  <i class="fa fa-twitter"></i>
                                </a>
                                <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                  <i class="fa fa-google-plus"></i>
                                </a>
                              </div>
                            </div>
                          </div>
                          <div class="modal-body">
                              <form class="form" name="login" method="post" action="LoginServlet" onSubmit="return validate(event);">
                                  <p class="description text-center"></p>
                                  <div class="card-body">
          
                                      <div class="form-group bmd-form-group">
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                              <div class="input-group-text"><i class="material-icons">face</i></div>
                                            </div>
                                            <input type="text" class="form-control" name="username" placeholder="User Name...">
                                            <small id="username_error" class="error"></small>
                                          </div>
                                      </div>
          
                                      <div class="form-group bmd-form-group">
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                              <div class="input-group-text"><i class="material-icons">lock_outline</i></div>
                                            </div>
                                            <input type="password" name="password" placeholder="Password..." class="form-control">
                                            <small id="password_error" class="error"></small>
                                          </div>
                                      </div>
                                      <div class="form-group bmd-form-group">
                                          <div class="input-group">  
                                            <input type="submit" value="Log In" class="btn btn-primary btn-link" id="btn">
                                            <small class="center error">${userError}${passError}</small>	
                                          </div>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          
          
          <div class="modal fade" id="signUpModal" tabindex="-1" role="">
        <div class="modal-dialog modal-login" role="document">
            <div class="modal-content">
                <div class="card card-signup card-plain">
                    <div class="modal-header">
                        <div class="card-header card-header-primary text-center">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                <!-- <i class="material-icons">clear</i> -->
                            </button>

                            <h4 class="card-title">Sign Up</h4>
                            <div class="social-line">
                              <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                <i class="fa fa-facebook-square"></i>
                              </a>
                              <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                <i class="fa fa-twitter"></i></a>
                              <a href="#pablo" class="btn btn-just-icon btn-link btn-white">
                                <i class="fa fa-google-plus"></i>
                              </a>
                            </div> 
                        </div>
                    </div>
                    <div class="modal-body">
                        <form class="form" method="POST" name="signup" action="SignupServlet" onSubmit="return validateSignup(event);">
                            <p class="description font-weight-bold text-center"> Sign in to create an Account!</p>
                            <div class="card-body">

                                <div class="container">
                                    <div class="row ">
                                        <div class="col-6 form-group">
                                            <div class="input-group ">
                                                <div>
                                                    <div class="input-group-text"><i class="material-icons">face</i>
                                                    </div>
                                                </div>
                                                <input type="text" name="fname" value="${fName}" class="form-control" placeholder="First Name..." required>
                                                <small class="error" id="fNameError">${fNameError}</small>
                                            </div>
                                        </div>
                                        <div class="col-6 form-group">
                                            <div class="input-group ">
                                                <input type="text" name="lname" value="${lName}" class="form-control" placeholder="Last Name..." required>
                                                <small class="error" id="lNameError">${lNameError}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="container">
                                    <div class="row ">
                                        <div class="col-6 form-group">
                                            <div class="input-group ">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                                <input type="text" name="phno1" maxlength="10" minlength="10" value="${phone1}" class="form-control" placeholder="Mobile Number..." required>
                                                <small class="error" id="phoneError1">${phoneError}</small>
                                            </div>
                                        </div>
                                        <div class="col-6 form-group">
                                            <div class="input-group">
                                                <input type="text" name="phno2" maxlength="10" minlength="10" value="${phone2}" class="form-control" placeholder="Alternative Number...">
                                            	<small class="error" id="phoneError2">${phoneError}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="container">
                                    <div class="form-group bmd-form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="material-icons">email</i></div>
                                            </div>
                                            <input type="email" class="form-control" name="emailid" value="${email}" placeholder="Email..." required>
                                            <small class="error">${emailError}${emailDup}</small>
                                        </div>
                                    </div>
                                </div>

                                <p class="description font-weight-bold text-center" style="padding-top: 10%;">Login
                                    Details
                                </p>

                                <div class="container">
                                    <div class="form-group bmd-form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-user-circle" aria-hidden="true"></i></div>
                                            </div>
                                            <input type="text" class="form-control" value="${username}" name="uname" placeholder="Username..." required>
                                            <small class="error">${usernameError}</small>
                                        </div>
                                    </div>
                                </div>

                                <div class="container">
                                    <div class="row ">
                                        <div class="col-6 form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="material-icons">lock_outline</i>
                                                    </div>
                                                </div>
                                                <input type="password" name="pwd1" placeholder="Password..." class="form-control" required>
                                                <small class="error" id="passwordError1">${passwordError1}</small>
                                            </div>
                                        </div>
                                        <div class="col-6 form-group">
                                            <div class="input-group">
                                                <input type="password" name="pwd2" placeholder="Confirm Password..." class="form-control" required>
                                                <small class="error" id="passwordError2">${passwordError2}</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <p class="description font-weight-bold text-center" style="padding-top: 10%;">
                                    Address
                                </p>

                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group bmd-form-group">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text"><i class="fa fa-building" aria-hidden="true"></i>
                                                        </div>
                                                    </div>
                                                    <input type="text" name="bldg" class="form-control" value="${building }" placeholder="Building..." required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row ">
                                        <div class="col-6 form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="fa fa-address-book" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                                <input type="text" name="city" class="form-control" value="${city }" placeholder="City..." required>
                                            </div>
                                        </div>
                                        <div class="col-6 form-group">
                                            <div class="input-group">
                                                <input type="text" name="neighbour" class="form-control"  value="${neighborhood }" placeholder="Neighborhood..." required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col form-group bmd-form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text"><i class="fa fa-building" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                                <input type="tel" name="pincode" minlength="6" maxlength="6" value="${pincode }" class="form-control" placeholder="Pincode..." required>
                                                <small class="error">${addressError}</small>
                                            </div>
                                        </div>
                                    </div>

                                </div>
	                            <div class="form-group bmd-form-group">
                                     <div class="input-group">  
                                           <input type="submit" value="Sign In" class="btn btn-primary btn-link" id="btn1">	
                                     </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
 
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/wp2036897.jpg')">
    <div class="container">
    <div class="container-fluid" id="alertCatcher">
</div>

      <div class="row">
        <div class="col-md-6">
          <h1 class="title">Thrift Shop.</h1>
          <h4>The Online Marketplace for Used Books (from here on referred as 'Thrift Shop') is a Web Application named Thrift Shop which aims to connect buyers and sellers of old/used books.</h4>
          <br>
          <!-- <a href="" target="_blank" class="btn btn-danger btn-raised btn-lg">
            <i class="fa fa-play"></i> Watch video
          </a> -->
        </div>
      </div>
    </div>
  </div>
  <div class="main main-raised">
    <div class="container">
      <div class="section text-center">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="title">Let&apos;s talk product</h2>
            <h5 class="description">Thrift Shop aims to aid students procure these expensive resources from their seniors at a significant discount. These seniors too gain an extra source of funding to buy books for their own use on the web application hence creating a network of inter dependent users which fully utilize the knowledge the books have to offer.</h5>
          </div>
        </div>
        <div class="features">
          <div class="row">
            <div class="col-md-4">
              <div class="info">
                <div class="icon icon-info">
                  <i class="material-icons">chat</i>
                </div>
                <h4 class="info-title">Free Platform</h4>
                <p>To provide a single , reliable and affordable platform for potential buyers of Used books.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="info">
                <div class="icon icon-success">
                  <i class="material-icons">verified_user</i>
                </div>
                <h4 class="info-title">Verified Users</h4>
                <p>To provide a hassle free and carefree environment for sellers of the Used Books.</p>
              </div>
            </div>
            <div class="col-md-4">
              <div class="info">
                <div class="icon icon-danger">
                  <i class="material-icons">lock_outline</i>
                </div>
                <h4 class="info-title">Security</h4>
                <p>To create a repository of data available only to the Administrators for boosting business intelligence.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="section text-center">
        <h2 class="title">Here is our team</h2>
        <div class="team">
          <div class="row">
            <div class="col">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="assets/img/faces/avatar.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Ayushi Patani
                    <br>
                    <small class="card-description text-muted">33107</small>
                  </h4>
                  <div class="card-body">
                    <p class="card-description"></p>
                  </div>
                  <div class="card-footer justify-content-center">
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Linked In"><i class="fa fa-linkedin"></i></a>

                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="assets/img/faces/christian.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Varun Gawande
                    <br>
                    <small class="card-description text-muted">33117</small>
                  </h4>
                  <div class="card-body">
                    <p class="card-description"></p>
                  </div>
                  <div class="card-footer justify-content-center">
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Linked In"><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="assets/img/faces/christian.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Jash Gujarathi
                    <br>
                    <small class="card-description text-muted">33118</small>
                  </h4>
                  <div class="card-body">
                    <p class="card-description"></p>
                  </div>
                  <div class="card-footer justify-content-center">
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Linked In"><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="team-player">
                <div class="card card-plain">
                  <div class="col-md-6 ml-auto mr-auto">
                    <img src="assets/img/faces/christian.jpg" alt="Thumbnail Image" class="img-raised rounded-circle img-fluid">
                  </div>
                  <h4 class="card-title">Yash Gupta
                    <br>
                    <small class="card-description text-muted">33119</small>
                  </h4>
                  <div class="card-body">
                    <p class="card-description"></p>
                  </div>
                  <div class="card-footer justify-content-center">
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Instagram"><i class="fa fa-instagram"></i></a>
                    <a href="#pablo" rel="tooltip"class="btn btn-link btn-just-icon" data-original-title="Follow us on Linked In"><i class="fa fa-linkedin"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="section section-contacts">
        <div class="row">
          <div class="col-md-8 ml-auto mr-auto">
            <h2 class="text-center title">Work with us</h2>
            <h4 class="text-center description"></h4>
            <form class="contact-form">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Your Name</label>
                    <input type="email" class="form-control">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label class="bmd-label-floating">Your Email</label>
                    <input type="email" class="form-control">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleMessage" class="bmd-label-floating">Your Message</label>
                <textarea type="email" class="form-control" rows="4" id="exampleMessage"></textarea>
              </div>
              <div class="row">
                <div class="col-md-4 ml-auto mr-auto text-center">
                  <button class="btn btn-primary btn-raised">
                    Send Message
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <footer class="footer footer-default">
    <div class="container">
      <nav class="float-left">
        <ul>
          <li>
            <a href="">
              About Us
            </a>
          </li>
          <li>
            <a href="">
              Licenses
            </a>
          </li>
        </ul>
      </nav>
      <div class="copyright float-right">
        &copy;
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="material-icons">favorite</i>by PICT IT Students.
      </div>
    </div>
  </footer>
</body>
<!--   Core JS Files   -->
<script type="text/javascript" src="assets/JS/loginValidation.js"></script>
<script type="text/javascript" src="assets/JS/signupValidation.js"></script>
  <script src="assets/JS/core/popper.min.js" type="text/javascript"></script>
  <script src="assets/JS/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="assets/JS/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="assets/JS/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="assets/JS/plugins/nouislider.min.js" type="text/javascript"></script>
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="assets/JS/material-kit.js?v=2.0.6" type="text/javascript"></script>
  
    <script>
  	let flag= "<%= session.getAttribute("flagLogin") %>";
  	if(flag==="3"){

  		$("#alertCatcher").append('<div class="alert alert-success"><div class="container-fluid"><div class="alert-icon"><i class="material-icons">check</i></div><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button><b>Success Alert:</b> Successfull SignUp</div></div>');
  		<% session.setAttribute("flagLogin",0); %>
  	}
  	else if(flag==="2"){
  		$("#alertCatcher").append('<div class="alert alert-danger"><div class="container"><div class="alert-icon"><i class="material-icons">error_outline</i></div><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button><b>Error Alert:</b> Error in Sign Up...</div></div>');
  		<% session.setAttribute("flagLogin",0); %>
  	}
  	else if(flag==="1"){
  		$("#alertCatcher").append('<div class="alert alert-danger"><div class="container"><div class="alert-icon"><i class="material-icons">error_outline</i></div><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button><b>Error Alert:</b> Error in Login...</div></div>');
  		<% session.setAttribute("flagLogin",0); %>
  	}
  	
  	
  	
  </script>
  
</html>

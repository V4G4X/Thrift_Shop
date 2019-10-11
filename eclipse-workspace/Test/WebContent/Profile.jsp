<%@page import="com.Thrift_Shop.Query_Item"%>
<%@page import="com.Thrift_Shop.Query_OrderDetails"%>
<%@page import = "java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Profile
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="assets/CSS/material-kit.css" rel="stylesheet" />
   <script async defer src="https://buttons.github.io/buttons.js"></script>	
   
    <script src="assets/JS/core/jquery.min.js" type="text/javascript"></script>
</head>
<body class="profile-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand">
          Thrift Shop </a>
      </div>

      <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
    	  <li class="dropdown nav-item">
    	  	<form method = "post" action="ViewCart">
            <button class="btn btn-primary btn-round">
              Cart<i class="material-icons">shopping_cart</i>       
            </button>       
            </form>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="" target="_blank" data-original-title="Follow us on Twitter">
              <i class="fa fa-twitter"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="" target="_blank" data-original-title="Like us on Facebook">
              <i class="fa fa-facebook-square"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" rel="tooltip" title="" data-placement="bottom" href="" target="_blank" data-original-title="Follow us on Instagram">
              <i class="fa fa-instagram"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('assets/img/city-profile.jpg');">
        <div class="container-fluid" id="alertCatcher">
</div>
  </div>
  
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
                <img src="assets/img/faces/christian.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title"><%=session.getAttribute("username")%></h3>
                <h6>User</h6>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i class="fa fa-dribbble"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>

        </div>
        <div class="description text-center">
        </div>
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile-tabs">
              <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                <li class="nav-item">
                  <button class="nav-link active" data-toggle="modal" data-target="#profileModal">
                    <i class="material-icons">account_circle</i> Profile Details
                  </button>
                </li>
                <li class="nav-item">
                  <form method = "post" id="buyForm" action="Buy.jsp">
            		<button onclick="buy_submit()" type="submit" class="nav-link" role="tab" data-toggle="tab">
              		<i class="material-icons">shopping_basket</i>Buy       
           			 </button>
           		  </form> 
                </li>
                <li class="nav-item">
					<form method = "post" id="sellForm" action="Sell.jsp">
            		<button onclick="sell_submit()" type="submit" class="nav-link" role="tab" data-toggle="tab">
              		<i class="material-icons">monetization_on</i>Sell      
           			 </button>
           		  </form> 
                </li>
                <li class="nav-item">
					<form method = "post" id="saleItemForm" action="SaleItemView.jsp">
            		<button onclick="saleItem_submit()" type="submit" class="nav-link" role="tab" data-toggle="tab">
              		<i class="material-icons">work</i>View Your Item      
           			 </button>
           		  </form> 
                </li>
              </ul>
            </div>
          </div>
        </div>
          <div class="text-centre justify-content-center"><h2><b>Past Transaction</b></h2></div>
        <fieldset>
	<legend>Order History</legend>
	<%
	Query_OrderDetails q1=(Query_OrderDetails)session.getAttribute("order_details");
	if(q1.getN() == 0)
	{
	%>
	<h4>No Order Yet!!</h4>
	<%
	}
	else
	{
		int temp_oid;
		Timestamp temp_time;
		float temp_total;
		int temp_n=0;
		int i=0;
		
		for(i=0;i<q1.getN();i++)
		{
			temp_oid=q1.getOid(i);
			temp_time=q1.gettime(i);
			temp_total=q1.getTotal(i);
			temp_n=q1.getItem_count(i);
			
			Query_Item temp_i = new Query_Item(temp_n);
			temp_i=q1.getItems(i);
			
			
	%>
	<fieldset>
	
	<legend>Ordered on :<%=temp_time%> for <%=temp_total%></legend>
	
	
	
	
	<%
			String temp_title = "";
			int temp_qty = 0;
			float temp_partial_amount = 0;
			int temp_iid = 0;
			int temp_bid = 0;
			int item_n=0;
	%>
	<table>
	<tr>
		<td>SR.No</td>
		<td>Title</td>
		<td>Quantity</td>
		<td>Partial Amount</td>
	</tr>
	
	<%
		item_n=temp_i.getN();
			
			for(int j=0;j<item_n;j++)
			{
				temp_title = temp_i.getTitle(j);
				temp_qty = temp_i.getQty(j);
				temp_iid = temp_i.getiid(j);
				temp_partial_amount = temp_i.getPartial_amount(j);
				%>
				<tr>
					<td><%=j+1%></td>
					<td><%=temp_title%></td>
					<td><%=temp_qty%></td>
					<td><%=temp_partial_amount%></td>
				</tr>
				<%
			}
			
	%>
	</table>
	</fieldset>
	<%
			
		}
	%>
	
	<%
	
	
	}%>
	</fieldset>
	<br><br>
	<fieldset>
	<legend>Sales History</legend>
	<%
		
	Query_Item q = (Query_Item)session.getAttribute("sales_details");
	if(q.getN()==0)
	{	
	%>
	<h4>No item sold yet!!</h4>
	<%
	}
	else
	{
		
	%>
	
	<table>
	<tr>
		<td>SR.No</td>
		<td>TimeStamp</td>
		<td>Title</td>
		<td>Quantity</td>
		<td>Partial Amount</td>
	</tr>
		<%

			
		String temp_title = "";
		int temp_qty = 0;
		float temp_partial_amount = 0;
		Timestamp temp_time;
		int temp_iid = 0;
		int temp_bid = 0;
		int i=0;
		int n = q.getN();
		for(i = 0;i<n;i++)
		{
			temp_title = q.getTitle(i);
			temp_qty = q.getQty(i);
			temp_iid = q.getiid(i);
			temp_partial_amount = q.getPartial_amount(i);
			temp_time = q.getTime(i);
			
		%>
			<tr>
				<td><%=i+1%></td>
				<td><%=temp_time%></td>
				<td><%=temp_title%></td>
				<td><%=temp_qty%></td>
				<td><%=temp_partial_amount%></td>
			</tr>
		
	<%} %>
	</table>
	<%}
	%>
	</fieldset>
      </div>
    </div>
  </div>
  <div class="modal fade" id="profileModal" tabindex="-1" role="">
    <div class="modal-dialog modal-login" role="document">
        <div class="modal-content">
            <div class="card card-signup card-plain">
                <div class="modal-header">
                  <div class="card-header card-header-primary text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                      <i class="material-icons">clear</i>
                    </button>

                    <h4 class="card-title">Profile Details</h4>
                    </div>
                  </div>
                </div>
                <div class="modal-body">
                	<div class="card-body">
						<table>
							<tr></tr>
							<tr>
								<td></td>
								<td><b>Personal Details</b></td>
							</tr>
							<tr></tr>
						
							<tr>
								<td><b>User Name : </b></td>
								<td><%= session.getAttribute("username") %></td>
							</tr>
							<tr>
								<td><b>Full Name : </b></td>
								<td>${fullname}</td>
							</tr>
							
							<tr>
								<td><b>Email-Id : </b></td>
								<td>${email_id }</td>
								
							</tr>
							
							<tr></tr>
							<tr>
								<td></td>
								<td><b>Address</b></td>
							</tr>
							<tr></tr>
							<tr>
								<td><b>Building : </b></td>
								<td>${bldg}</td>
							</tr>
							
							<tr>
								<td><b>Neighbourhood : </b></td>
								<td>${neigh}</td>
								
							</tr>
							
							<tr>
								<td><b>City : </b></td>
								<td>${city}</td>
							</tr>
							
							<tr>
								<td><b>Mobile Number : </b></td>
								<td>${phoneno}</td>
							</tr>
							
							<tr>
								<td><b>Pincode : </b></td>
								<td>${pincode}</td>
							</tr>
							
							<tr>
								<td><b>Wallet</b></td>
								<td>${wallet}</td>						
							</tr>
						
						</table>

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
        </script>, made with <i class="material-icons">favorite</i> by PICT IT Students.
      </div>
    </div>
  </footer>
<!--   Core JS Files   -->

  <script src="assets/JS/core/popper.min.js" type="text/javascript"></script>
<script src="assets/JS/core/bootstrap-material-design.min.js" type="text/javascript"></script>
   <script src="assets/JS/plugins/moment.min.js"></script>
<!--   	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="assets/JS/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
 <!--   Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="assets/JS/plugins/nouislider.min.js" type="text/javascript"></script>
<!--   Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="assets/JS/material-kit.js" type="text/javascript"></script> 
    <script>
  	let flag= "<%= session.getAttribute("flagCart") %>";
  	
  	if(flag==="1"){
  		$("#alertCatcher").append('<div class="alert alert-danger"><div class="container"><div class="alert-icon"><i class="material-icons">error_outline</i></div><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true"><i class="material-icons">clear</i></span></button><b>Error Alert:</b> Cart Empty</div></div>');
  		<% session.setAttribute("flagCart",0); %>
  	}
  	function sell_submit() {
  	    document.getElementById("sellForm").submit();
  	   }
  	function buy_submit() {
  	    document.getElementById("buyForm").submit();
  	   }
  	function saleItem_submit() {
  	    document.getElementById("saleItemForm").submit();
  	   }
	</script>
</body>
</html>

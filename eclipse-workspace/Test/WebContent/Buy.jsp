<%@page import="com.Thrift_Shop.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy the Item</title>
<link rel="stylesheet" href="assets/CSS/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-inverse bg-dark">
		<div class="container">
			<a href="#" class="navbar-brand title">Thrift Shop</a>
			<ul class="navbar-nav pull-right">
				<li class="navbar-item ">
					<form action="ProfileServlet" method="POST">
						<div class="btn-group">
							<button class="nav-link btn btn-secondary" id="gotoProfile"
								formaction="ProfileServlet">
								Profile <i class="fa fa-user-circle" aria-hidden="true"></i>
							</button>
							<button class="nav-link btn primary" formaction="Cart.jsp">
								Cart <i class="fa fa-shopping-cart" aria-hidden="true"></i>
							</button>

						</div>
					</form>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="jumbotron img-rounded">
			<form action="SearchServlet" method="POST">
				<div class="input-group">
					<input type="text" class="form-control input-lg" name="search"
						placeholder="Search...">
					<div class="input-group-btn btn-lg">
						<button type="submit" class="btn primary btn-lg">Search</button>
					</div>
				</div>
				<div class=" text-center">
					<h3>Search By</h3>
				</div>
				<div class="form-group text-center">
					<div class="checkbox checkbox-inline">
						<label><input type="checkbox" name="searchby" value="auth"
							checked> Author:</label>
					</div>
					<div class="checkbox checkbox-inline">
						<label><input type="checkbox" name="searchby" value="tit"
							checked> Title:</label>
					</div>
					<div class="checkbox checkbox-inline">
						<label><input type="checkbox" name="searchby" value="desc"
							checked> Description:</label>
					</div>
					<div id="alertCatcher"></div>
					<script type="text/javascript">
						let str = "${searchError}";
						console.log("str is:" + str);
						if (str !== "") {
							console.log("Entered Here");
							$("#alertCatcher")
									.append(
											'<h2 class="alert alert-danger">${searchError}</h2>');
						}
					</script>
				</div>
			</form>

			<div class="container ">
				<form id="form-id" method="POST" action="ItemDetail">

					<table class="table table-striped table-hover">
						<%
							QueryResult result = (QueryResult) (request.getAttribute("result"));
							if (result == null) {
								return;
							} else {
								int len = result.getN();
								int i_id[] = result.getI_id();
								String title[] = result.getTitle();
								String author[] = result.getAuthor();
								String desc[] = result.getDescription();
								int cond[] = result.getCondition();
								float price[] = result.getPrice();
								for (int i = 0; i < len; i++) {
									int x = i_id[i];
						%>

						<%
							if (i == 0) {
						%>
						<tr >
							<td class="primary"></td>
							<td class="primary">Title</td>
							<td class="primary">Author</td>
							<td class="primary">Price</td>
						</tr>
						<%
							}
						%>
						<tr id="<%out.print(x);%>" onclick='$("#<%out.print(x);%>").parent().parent().parent().submit();'>
							<td><input type="text" name="i_id" style="visibility:hidden;display:none;" value="<%out.print(x);%>"><img src="assets/img/item.png"></td>
							<td><%=title[i]%></td>
							<td><%=author[i]%></td>
							<td><%=price[i]%></td>
						</tr>

						<%
							}
							}
						%>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
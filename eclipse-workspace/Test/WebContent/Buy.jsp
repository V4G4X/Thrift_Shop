<%@page import="com.Thrift_Shop.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy the Item</title>
<link href="assets/CSS/style.css" rel="stylesheet">
</head>
<body>
	<form action="SearchServlet" method="POST">
		<table>
			<tr>
				<td><input type="text" name="search"></td>
				<td><input type="submit" value="Search"></td>
			</tr>
			<tr>
				<td>Search By:</td>
				<td>Author :<input type="checkbox" name="searchby" value="auth"
					checked> Title : <input type="checkbox" name="searchby"
					value="tit" checked> Description :<input type="checkbox"
					name="searchby" value="desc" checked>
				</td>
			</tr>
		</table>
		<h2 class="error">${searchError}</h2>
	</form>
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

		<form id="form-id" method="POST" action="ItemDetail">
			<input type="hidden" name="i_id" value="<%out.print(x);%>">
			<div role="row" id="<%out.print(x);%>" class="row" onclick='$("#<%out.print(x);%>").parent().submit();'>
				<div class="cell"><img src="assets/item.png"></div>
				<div class="cell">
					<div><b>Title :</b> <%=title[i]%></div>
					<div><b>Author :</b> <%=author[i]%></div>
					<div><b>Price :</b> <%=price[i]%></div>
				</div>
				<br>
				<br>
			</div>
		</form>
		<%
				}
				}
			%>
</body>
</html>
<%@page import="com.Thrift_Shop.QueryResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy the Item</title>
<link href="assets/CSS/style.css" rel="stylesheet">
<!-- <script type="text/javascript" src="assets/JS/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						let element = '<script type="text/javascript" src="assets/JS/itemList.jsp">'
								+ '</scrip'+'t>';
						//	$("head").append(element);
					});
</script> -->
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
		<div role="grid" class="headingtable">
			<div role="row" class="headingrow">
				<div role="gridcell" class="headingcell">Title</div>
				<div role="gridcell" class="headingcell">Author</div>
				<div role="gridcell" class="headingcell">Price</div>
			</div>
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
						session.setAttribute("itemid", i_id[i]);
						session.setAttribute("Title", title[i]);
						session.setAttribute("Author", author[i]);
						session.setAttribute("Description", desc[i]);
						session.setAttribute("Condition", cond[i]);
						session.setAttribute("Price", price[i]);
			%>
			
  			<div role="row" class="row" onClick="window.location='itemDetail.jsp';">
    			<div role="gridcell" class="cell"><%=title[i]%></div>
    			<div role="gridcell" class="cell"><%=author[i]%></div>
    			<div role="gridcell" class="cell"><%=price[i]%></div>
 			</div>
			<%
				}
				}
			%>
		</div>
</body>
</html>
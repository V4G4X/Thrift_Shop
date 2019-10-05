<%@page import="com.Thrift_Shop.QueryResult"%>
<%
	QueryResult result = (QueryResult) (request.getAttribute("result"));
	if (result != null) {
		int len = result.getN();
		int i_id[] = result.getI_id();
		String title[] = result.getTitle();
		String author[] = result.getAuthor();
		float price[] = result.getPrice();
	}
%>
alert("Script Loaded");

let length = <%= len %> ;
alert(length);

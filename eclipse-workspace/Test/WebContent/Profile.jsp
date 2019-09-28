<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>My password is <%=session.getAttribute("password")%> </h3>
	<h3>My User name is <%=session.getAttribute("username")%></h3>
</body>
</html>
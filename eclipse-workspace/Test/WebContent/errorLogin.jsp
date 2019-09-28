<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<center><p style="color:red">User name or Password is Wrong.</p></center>
<%
getServletContext().getRequestDispatcher("/Login.jsp").include(request, response);
%>
</body>
</html>
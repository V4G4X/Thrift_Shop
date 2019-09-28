<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup Page</title>
</head>
<body>
<center><p style="color:red">Password and Confirm password is not matched!!</p></center>
<%
getServletContext().getRequestDispatcher("/SignUp.jsp").include(request, response);
%>
</body>
</html>
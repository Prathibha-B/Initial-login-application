<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<h2>Login Form</h2>
 	<div style="color: red; font-weight: bold;">
        <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
    </div>
	<form action="LoginServlet" method="POST">
		<label for="username">Username:	</label>
		<Input type="text" name="username" required><br><br>
		<label for="password">Password:</label>
		<input type="text" name="password" required><br><br>
		<button type="submit" value="login" onClick="errorMessage">Login</button>
	</form>
</body>
</html> 
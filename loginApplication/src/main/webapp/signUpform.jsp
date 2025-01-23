<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background: #ffffff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Signup Form</h2>
    <form action="SignUpServlet" method="post">
        
        <label for="full_name">Name:</label>
        <input type="text" id="name" name="full_name" required> 

        <label for="mailId">Email:</label>
        <input type="email" id="mailId" name="mailId" required>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" maxlength="10" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" maxlength="20" required>
        
        <label for="role">Employee Role:</label>
        <select for="Employee_Role" name="Employee_Role" id="Employee_Roles" required> 
            <option value="">--Select role--</option>
            <option value="Admin">Admin</option>
            <option value="Associate">Associate</option>
            <option value="Assistant">Assistant</option>
        </select><br><br>

        <input type="submit" value="Sign Up">
    </form>
</body>
</html>

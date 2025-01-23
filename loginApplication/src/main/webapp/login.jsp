<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
    .hidden {
        display: none;
    }
   
</style>
<script>
    function showForm() {
        const selectedType = document.getElementById("loginType").value;
        const userForm = document.getElementById("userForm");
        const errorDiv = document.getElementById("errorDiv");
        const loginHeading = document.getElementById("LoginHeading");
        console.log("Selected Type: ", selectedType);
        console.log("User Form: ", userForm);

        if (selectedType === "Admin" || selectedType === "Associate" || selectedType === "Assistant") {
            userForm.classList.remove("hidden");
            userForm.classList.add("visible");
            errorDiv.classList.add("hidden");
            loginHeading.innerHTML = selectedType + ` Login`;
        } else {
            userForm.classList.add("hidden");
            userForm.classList.remove("visible");
            errorDiv.classList.remove("hidden");
            errorDiv.innerHTML = "Please select a valid Login Type.";
            loginHeading.innerHTML = "Sign In"; // Reset heading to default
        }
    }
</script>
</head>
<body>
    <h2 id="LoginHeading">Sign In</h2>

    <!-- Error Message -->
    <div id="errorDiv" class="hidden" style="color: red; font-weight: bold;">
        <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
    </div>

    <!-- First Form -->
    <form id="loginTypeForm">
        <label for="loginType">Select Login Type:</label>
        <select name="LoginType" id="loginType" onchange="showForm()">
            <option value="">--Select--</option>
            <option value="Admin">Admin</option>
            <option value="Associate">Associate</option>
            <option value="Assistant">Assistant</option>
        </select>
    </form>
<br><br>
    <!-- Second Form (Initially Hidden) -->
    <form id="userForm" class="hidden" action="LoginServlet" method="POST">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>
        <button type="submit" value="login">Login</button><br><br>
        <a>Haven't signed up already? <a href="signUpform.jsp">SignUp</a></a>
    </form>
</body>
</html>

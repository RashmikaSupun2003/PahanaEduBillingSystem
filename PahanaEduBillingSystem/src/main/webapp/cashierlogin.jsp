<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cashier Login - Pahana Edu</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #a1c4fd, #c2e9fb);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
        }

        .login-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #1a237e;
            font-size: 28px;
        }

        .login-container label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        .login-container input[type="submit"] {
            background-color: #1a237e;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .login-container input[type="submit"]:hover {
            background-color: #303f9f;
        }

        .error-message {
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Cashier Login</h2>
    <form action="CashierLoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="Login">
        
        
    </form>
    
    <a class="back-button" href="loginnav.jsp">← Back</a>

    <% 
        String error = request.getParameter("error");
        if (error != null) { 
    %>
        <div class="error-message"><%= error %></div>
    <% 
        } 
    %>
</div>

</body>
</html>


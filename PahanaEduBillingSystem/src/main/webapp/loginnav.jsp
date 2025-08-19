<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Navigation - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
        }

        .container {
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 300px;
        }

        h2 {
            margin-bottom: 25px;
            color: #00796b;
        }

        .login-btn {
            display: block;
            width: 200px;
            margin: 10px auto;
            padding: 12px;
            font-size: 16px;
            background-color: #00897b;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
            text-decoration: none;
        }

        .login-btn:hover {
            background-color: #004d40;
        }

        /* ✅ Back button style */
        .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            font-size: 14px;
            background-color: #ff7043;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #bf360c;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Login As</h2>
    <a href="adminLogin.jsp" class="login-btn">Admin</a>
    <a href="cashierlogin.jsp" class="login-btn">Cashier</a>
    <a href="customerLogin.jsp" class="login-btn">Customer</a>

    <!-- ✅ Back button linking to home.jsp -->
    <a href="index.jsp" class="back-btn">⬅ Back to Home</a>
</div>

</body>
</html>

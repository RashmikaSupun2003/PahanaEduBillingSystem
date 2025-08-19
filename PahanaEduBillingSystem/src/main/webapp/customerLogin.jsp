<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Login - Pahana Edu</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c2e9fb, #a1c4fd);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
        }
        .container {
            background: white;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #003366;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 500;
            color: #444;
        }
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #002244;
        }
        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #003366;
            text-decoration: none;
            font-size: 14px;
        }
        .back-button:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>👤 Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <label for="account_number">Account Number:</label>
            <input type="text" name="account_number" id="account_number" placeholder="Enter Account Number" required>

            <label for="name">Name:</label>
            <input type="text" name="name" id="name" placeholder="Enter Your Name" required>

            <button type="submit">Login</button>
        </form>
        <a class="back-button" href="loginnav.jsp">← Back</a>
    </div>
</body>
</html>

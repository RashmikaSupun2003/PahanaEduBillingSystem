<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cashier Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.95);
            max-width: 600px;
            margin: 60px auto;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        h1 {
            font-size: 26px;
            color: #2e7d32;
            text-align: center;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 22px;
            color: #333;
            text-align: center;
            margin-top: 30px;
        }

        p {
            font-size: 16px;
            text-align: center;
            color: green;
            margin-bottom: 30px;
        }

        ol {
            padding-left: 0;
            list-style: none;
            margin-top: 20px;
        }

        li {
            margin: 20px 0;
            text-align: center;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome Cashier: <%= session.getAttribute("cashierUsername") %></h1>
        <p>Login successful.</p>

        <h2>🏠 CASHIER DASHBOARD</h2>
        <ol>
            <li><a href="Cashier_displayCustomers.jsp">📋 Display Customers</a></li>
            <li><a href="Cashier_displayItems.jsp">📦 Display Items</a></li>
            <li><a href="Billing.jsp">🧾 Calculate & Print Bill</a></li>
            <li><a href="index.jsp">🚪 Exit</a></li>
        </ol>
    </div>
</body>
</html>

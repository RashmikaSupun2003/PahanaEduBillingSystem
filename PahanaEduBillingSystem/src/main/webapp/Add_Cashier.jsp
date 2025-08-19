<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Cashier - Pahana Edu</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c2e9fb, #a1c4fd);
            padding: 40px;
            margin: 0;
            background: url('assets/image/image2.jpg') 
        }
        .container {
            background: white;
            max-width: 450px;
            margin: auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
        }
        input[type=text], input[type=password] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type=submit] {
            background-color: #003366;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type=submit]:hover {
            background-color: #002244;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add Cashier</h2>
    <form action="AddCashierServlet" method="post">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" placeholder="Full Name" required />

        <label for="nic">NIC</label>
        <input type="text" id="nic" name="nic" placeholder="National ID Card Number" required />

        <label for="phone">Phone Number</label>
        <input type="text" id="phone" name="phone" placeholder="Phone Number" required />

        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Username" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Password" required />

        <input type="submit" value="Add Cashier" />
    </form>
    
    <div class="back">
        <a href="adminDashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html>

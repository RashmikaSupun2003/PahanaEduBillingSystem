<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #c2e9fb, #a1c4fd);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: url('assets/image/image2.jpg') 
        }
        .container {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #003366;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        button {
            width: 100%;
            background: #003366;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background: #0055aa;
        }
        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #003366;
            text-decoration: none;
            font-weight: bold;
        }
        .back:hover {
            color: #ff4500;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add Customer</h2>
    <form action="addCustomerServlet" method="post">
        <label>Account Number</label>
        <input type="text" name="accountNumber" required>

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Address</label>
        <textarea name="address" rows="3" required></textarea>

        <label>Telephone Number</label>
        <input type="text" name="telephone" required>

        <label>Units Consumed</label>
        <input type="number" name="units" required>

        <button type="submit">Add Customer</button>
    </form>

    <a class="back" href="adminDashboard.jsp">← Back to Dashboard</a>
</div>

</body>
</html>

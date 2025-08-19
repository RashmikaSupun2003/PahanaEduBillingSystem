<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Pahana Edu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c2e9fb, #a1c4fd);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('assets/image/image2.jpg') no-repeat center center fixed;
        }

        .navbar {
            background-color: #003366;
            padding: 20px;
            color: white;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.25);
            letter-spacing: 1px;
        }

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 50px 20px;
            gap: 30px;
            flex: 1;
        }

        .card {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: white;
            border-radius: 16px;
            width: 220px;
            height: 220px;
            text-decoration: none;
            color: #003366;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            background: #f5faff;
        }

        .card i {
            font-size: 50px;
            margin-bottom: 20px;
            color: #1a237e;
        }

        .card span {
            font-size: 18px;
            font-weight: 600;
        }

        .footer {
            background: #003366;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .card {
                width: 100%;
                max-width: 300px;
            }
        }
    </style>
</head>
<body>

<div class="navbar">Admin Dashboard - Pahana Edu 📚</div>

<div class="dashboard">
    <a href="AddCustomer.jsp" class="card">
        <i class="fas fa-user-plus"></i>
        <span>Add Customer</span>
    </a>

    <a href="displayCustomers.jsp" class="card">
        <i class="fas fa-users"></i>
        <span>Display Customers</span>
    </a>

    <a href="add_book.jsp" class="card">
        <i class="fas fa-plus-circle"></i>
        <span>Add Item</span>
    </a>

    <a href="DisplayItems.jsp" class="card">
        <i class="fas fa-list-ul"></i>
        <span>Display Items</span>
    </a>

    <a href="View_Print_Bill.jsp" class="card">
        <i class="fas fa-file-invoice-dollar"></i>
        <span>View & Print Bill</span>
    </a>

    <a href="Add_Cashier.jsp" class="card">
        <i class="fas fa-user-cog"></i>
        <span>Add Cashier</span>
    </a>

    <a href="index.jsp" class="card">
        <i class="fas fa-sign-out-alt"></i>
        <span>Exit</span>
    </a>
</div>

<div class="footer">&copy; 2025 Pahana Edu. All rights reserved.</div>

</body>
</html>

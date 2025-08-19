<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard - Pahana Edu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #1a237e;
            padding: 20px;
            color: white;
            text-align: center;
            font-size: 26px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
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
            width: 220px;
            height: 220px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
            text-decoration: none;
            color: #1a237e;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            background: #f1fff2;
        }

        .card i {
            font-size: 50px;
            margin-bottom: 20px;
            color: #388e3c;
        }

        .card h3 {
            font-size: 20px;
            font-weight: 600;
            margin: 0;
        }

        .footer {
            background-color: #1a237e;
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

<div class="navbar">
    Welcome 👤 | Customer Dashboard - Pahana Edu
</div>

<div class="dashboard">
    <a class="card" href="ViewCustomerProfile.jsp">
        <i class="fas fa-user-circle"></i>
        <h3>View Profile</h3>
    </a>

    <a class="card" href="ViewMyBills.jsp">
        <i class="fas fa-receipt"></i>
        <h3>View My Bills</h3>
    </a>

    <a class="card" href="logout.jsp">
        <i class="fas fa-sign-out-alt"></i>
        <h3>Logout</h3>
    </a>
</div>

<div class="footer">
    &copy; 2025 Pahana Edu. All rights reserved.
</div>

</body>
</html>

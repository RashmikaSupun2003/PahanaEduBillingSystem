<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pahana Bookshop</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/home.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .navbar {
            background-color: rgba(51, 51, 51, 0.9);
            padding: 15px 30px;
        }

        .navbar h1 {
            color: #fff;
            margin: 0;
            font-size: 28px;
        }

        .container {
            text-align: center;
            margin: 80px auto 30px;
            background: rgba(255, 255, 255, 0.92);
            padding: 40px 30px;
            width: 65%;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .container h2 {
            font-size: 36px;
            color: #222;
            margin-bottom: 10px;
        }

        .container p {
            font-size: 18px;
            color: #555;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .button-group a {
            padding: 12px 24px;
            background-color: #008CBA;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s;
        }

        .button-group a:hover {
            background-color: #005f73;
        }

        .about {
            width: 65%;
            margin: 10px auto 90px;
            background: #fdfdfd;
            padding: 25px;
            border-radius: 10px;
            line-height: 1.6;
            font-size: 16px;
            color: #333;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }

        .about h3 {
            color: #008CBA;
            margin-bottom: 10px;
        }

        .about h4 {
            color: #444;
            margin-top: 15px;
        }

        .about ul {
            margin: 10px 0;
            padding-left: 20px;
        }

        .about ul li {
            margin-bottom: 5px;
        }

        .about p.help-link {
            margin-top: 20px;
            font-size: 16px;
        }

        .about p.help-link a {
            color: #008CBA;
            text-decoration: underline;
        }

        .footer {
            background: linear-gradient(90deg, #333, #444);
            color: #f1f1f1;
            padding: 15px 0;
            text-align: center;
            font-size: 14px;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -3px 6px rgba(0, 0, 0, 0.3);
        }

        .footer p {
            margin: 4px 0;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h1>Pahana Bookshop</h1>
    </div>

    <!-- Welcome Section -->
    <div class="container">
        <h2>Welcome to Pahana Bookshop</h2>
        <p>Manage customers, items, and billing operations with ease using our web-based management system.</p>

        <!-- Buttons -->
        <div class="button-group">
            <a href="loginnav.jsp">Login</a>
            <a href="help.jsp">Help</a> <!-- Help button added -->
        </div>
    </div>

    <!-- About Section -->
    <div class="about">
        <h3>About This Web System</h3>
        <p>
            The <b>Pahana Bookshop Management System</b> is an all-in-one digital solution designed to 
            replace manual record-keeping and billing. It ensures data accuracy, fast transactions, 
            and better customer service.
        </p>

        <h4>🔹 Key Features:</h4>
        <ul>
            <li>✔ Secure login with role-based access (Admin, Cashier, Customer)</li>
            <li>✔ Manage customer and item information effortlessly</li>
            <li>✔ Generate accurate bills with automatic calculations</li>
            <li>✔ Easy-to-use interface with smooth navigation</li>
            <li>✔ Provides usage guidelines via the Help Section</li>
        </ul>

        <h4>🔹 User Roles:</h4>
        <ul>
            <li><b>Admin:</b> Full control over customers, items, and billing settings.</li>
            <li><b>Cashier:</b> Can manage billing and process transactions quickly.</li>
            <li><b>Customer:</b> Can log in to view their account details and billing history.</li>
        </ul>

        <p class="help-link">Need assistance? Visit our <a href="help.jsp">Help Section</a> anytime for usage guidelines.</p>

        <p>✅ This system is built to make Pahana Bookshop operations smarter, faster, and more reliable.</p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Pahana Bookshop | All Rights Reserved.</p>
        <p>📌 Developed by Pahana Edu IT Team | 📧 support@pahanaedu.lk | ☎ +94 77 123 4567</p>
    </div>
</body>
</html>

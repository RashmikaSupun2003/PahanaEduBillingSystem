<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Pahana Bookshop - Help</title>
    <style>
        body {
            margin: 0; padding: 40px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #0a2540;
            color: #e0e0e0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            margin-bottom: 20px;
            color: #ffa500;
            text-shadow: 0 0 8px #ffa500aa;
        }
        .help-container {
            max-width: 720px;
            background: #112d57;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px #ffa500aa;
            line-height: 1.6;
        }
        h2 {
            color: #ffb84d;
            border-bottom: 2px solid #ffb84d;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
        h3 {
            color: #ffd27f;
            margin-top: 30px;
            margin-bottom: 12px;
        }
        ul {
            margin-left: 20px;
        }
        ul li {
            margin-bottom: 10px;
            font-weight: 500;
        }
        a.back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 28px;
            background: #ff8c00;
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 6px 18px #ff8c00aa;
            font-weight: 600;
            transition: background 0.3s ease;
        }
        a.back-link:hover {
            background: #ffa500;
            box-shadow: 0 8px 25px #ffa500cc;
        }
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }
            .help-container {
                padding: 20px 25px;
            }
        }
    </style>
</head>
<body>
    <h1>Pahana Bookshop - Help Section</h1>

    <div class="help-container">
        <h2>User Role Guidelines</h2>

        <h3>Admin</h3>
        <ul>
            <li>Add, edit, and delete customer accounts.</li>
            <li>Manage inventory items (add/update/delete).</li>
            <li>Control billing settings and generate reports.</li>
            <li>Assign roles and manage system-wide configurations.</li>
        </ul>

        <h3>Cashier</h3>
        <ul>
            <li>Process customer billing and payments.</li>
            <li>Calculate bills based on consumption units.</li>
            <li>Print bills and receipts for customers.</li>
            <li>Update usage data after transactions.</li>
        </ul>

        <h3>Customer</h3>
        <ul>
            <li>View your account details and billing history online.</li>
            <li>Review payment status and previous transactions.</li>
            <li>Contact support for account-related help.</li>
        </ul>

        <a href="index.jsp" class="back-link">← Back to Login</a>
    </div>
</body>
</html>

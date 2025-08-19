<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Pahana Edu</title>
    <style>
        /* (Same styling as your shared template) */
        * { box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #c2e9fb, #a1c4fd);
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: url('assets/image/image3.jpg') no-repeat center center fixed;
        }

        .container {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .container h2 {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
            font-size: 22px;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: 600;
            color: #333;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input:focus {
            border: 1px solid #007bff;
            outline: none;
        }

        button {
            background: #007bff;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }

        .back-button {
            margin-top: 15px;
            display: block;
            background: #6c757d;
            color: white;
            text-align: center;
            padding: 10px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 15px;
        }

        .back-button:hover {
            background: #495057;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>👑 Admin Login</h2>
        <form action="loginServlet" method="post">
            <input type="hidden" name="role" value="admin">

            <label for="username">Username:</label>
            <input type="text" name="username" id="username" placeholder="Enter Admin Username" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>
        </form>

        <a class="back-button" href="loginnav.jsp">← Back</a>
    </div>
</body>
</html>
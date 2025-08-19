<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            padding: 40px;
            background: url('assets/image/image2.jpg') 
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 30px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }
        button:hover {
            background-color: #0055aa;
        }
        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            background: #888;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }
        .message {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">

    <!-- Back to Admin Dashboard Button -->
    <a href="adminDashboard.jsp" class="back-button">&larr; Back</a>

    <h2>Add New Book</h2>

    <!-- Success or Error Message -->
    <%
        String msg = request.getParameter("msg");
        if ("success".equals(msg)) {
    %>
        <p class="message" style="color: green;">Book added successfully!</p>
    <%
        } else if ("error".equals(msg)) {
    %>
        <p class="message" style="color: red;">Failed to add book. Try again.</p>
    <%
        }
    %>

    <!-- Add Book Form -->
    <form action="AddBookServlet" method="post">
        <label>Book Name:</label>
        <input type="text" name="book_name" required>

        <label>Author:</label>
        <input type="text" name="author" required>

        <label>Price:</label>
        <input type="number" step="0.01" name="price" required>

        <label>Quantity:</label>
        <input type="number" name="quantity" required>

        <button type="submit">Add Book</button>
    </form>
</div>
</body>
</html>
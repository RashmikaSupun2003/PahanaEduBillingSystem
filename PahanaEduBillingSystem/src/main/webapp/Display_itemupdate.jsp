<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    int bookId = 0;
    String bookName = "";
    String author = "";
    String price = "";
    String quantity = "";

    try {
        bookId = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM books WHERE book_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, bookId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        bookName = rs.getString("book_name");
                        author = rs.getString("author");
                        price = rs.getBigDecimal("price").toString();
                        quantity = Integer.toString(rs.getInt("quantity"));
                    } else {
                        out.println("<p class='error'>Book not found!</p>");
                    }
                }
            }
        }
    } catch (Exception e) {
        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #f0f4f8, #d9e2ec);
            padding: 50px;
             background: url('assets/image/image5.jpg') 
        }

        .container {
            background: #fff;
            max-width: 500px;
            margin: auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            padding: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Book</h2>

    <form action="Display_itemupdateProcess.jsp" method="post">
        <input type="hidden" name="book_id" value="<%= bookId %>" />

        <label for="book_name">Book Name:</label>
        <input type="text" name="book_name" value="<%= bookName %>" required />

        <label for="author">Author:</label>
        <input type="text" name="author" value="<%= author %>" required />

        <label for="price">Price:</label>
        <input type="text" name="price" value="<%= price %>" required />

        <label for="quantity">Quantity:</label>
        <input type="number" name="quantity" value="<%= quantity %>" required min="0" />

        <button type="submit">Update Book</button>
    </form>
</div>

</body>
</html>

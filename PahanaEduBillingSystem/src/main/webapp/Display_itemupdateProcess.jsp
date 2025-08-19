<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    request.setCharacterEncoding("UTF-8");

    String message = "";

    try {
        int bookId = Integer.parseInt(request.getParameter("book_id"));
        String bookName = request.getParameter("book_name");
        String author = request.getParameter("author");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        // Basic validation
        if (bookName == null || bookName.trim().isEmpty() ||
            author == null || author.trim().isEmpty() ||
            priceStr == null || priceStr.trim().isEmpty() ||
            quantityStr == null || quantityStr.trim().isEmpty()) {

            message = "All fields are required!";
        } else {
            // Parse numeric values
            java.math.BigDecimal price = new java.math.BigDecimal(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            try (Connection conn = DBUtil.getConnection()) {
                String sql = "UPDATE books SET book_name = ?, author = ?, price = ?, quantity = ? WHERE book_id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, bookName);
                    stmt.setString(2, author);
                    stmt.setBigDecimal(3, price);
                    stmt.setInt(4, quantity);
                    stmt.setInt(5, bookId);

                    int rowsUpdated = stmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        message = "Book updated successfully.";
                    } else {
                        message = "Book not found or update failed.";
                    }
                }
            }
        }
    } catch (Exception e) {
        message = "Error updating book: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .message {
            font-size: 18px;
            color: <%= message.startsWith("Error") || message.contains("failed") ? "red" : "green" %>;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<p class="message"><%= message %></p>

<a href="DisplayItems.jsp">Back to Book List</a>

</body>
</html>

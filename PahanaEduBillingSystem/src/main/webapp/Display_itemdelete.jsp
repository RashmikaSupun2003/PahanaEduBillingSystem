<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    String message = "";

    try {
        int bookId = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "DELETE FROM books WHERE book_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, bookId);
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    message = "Book deleted successfully.";
                } else {
                    message = "Book not found or could not be deleted.";
                }
            }
        }
    } catch (Exception e) {
        message = "Error deleting book: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .message {
            font-size: 18px;
            color: <%= message.startsWith("Error") || message.contains("not") ? "red" : "green" %>;
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

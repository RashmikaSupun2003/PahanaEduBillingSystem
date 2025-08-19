<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image2.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .back-button {
            display: inline-block;
            background: #555;
            color: #fff;
            padding: 10px 18px;
            border-radius: 6px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background: #333;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px 16px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #673ab7;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button {
            padding: 8px 14px;
            background-color: #03a9f4;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease;
            margin: 0 4px;
        }

        .button:hover {
            background-color: #0288d1;
        }

        .error {
            color: red;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Back to Admin Dashboard Button -->
    <a href="adminDashboard.jsp" class="back-button">&larr; Back</a>

    <h2>📚 Book List</h2>

    <table>
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Added Date</th>
            <th>Actions</th>
        </tr>

        <%
            try (Connection conn = DBUtil.getConnection()) {
                String sql = "SELECT * FROM books ORDER BY added_date DESC";
                try (PreparedStatement stmt = conn.prepareStatement(sql);
                     ResultSet rs = stmt.executeQuery()) {

                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("book_id") %></td>
            <td><%= rs.getString("book_name") %></td>
            <td><%= rs.getString("author") %></td>
            <td><%= rs.getBigDecimal("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getTimestamp("added_date") %></td>
            <td>
                <!-- Update Button -->
                <a href="Display_itemupdate.jsp?id=<%= rs.getInt("book_id") %>" class="button">Update</a>
                <!-- Delete Button -->
                <a href="Display_itemdelete.jsp?id=<%= rs.getInt("book_id") %>" class="button" onclick="return confirm('Are you sure you want to delete this book?');">Delete</a>
            </td>
        </tr>
        <%
                    }
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="7" class="error">Error loading books: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>

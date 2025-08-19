<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book List</title>
    <style>
        /* Background and body */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image1.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }

        /* Container for content */
        .container {
            max-width: 1100px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        /* Back button */
        .back-button {
            display: inline-block;
            margin-bottom: 25px;
            background: #00796b;
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 4px 8px rgba(0,121,107,0.3);
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background: #004d40;
        }

        /* Heading */
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            color: #00796b;
            letter-spacing: 1px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
        }

        th {
            background-color: #00796b;
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
            user-select: none;
        }

        tbody tr:nth-child(even) {
            background-color: #e0f2f1;
        }

        tbody tr:hover {
            background-color: #b2dfdb;
            cursor: pointer;
        }

        td {
            border-bottom: 1px solid #ccc;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Back to Admin Dashboard Button -->
    <a href="cashierDashboard.jsp" class="back-button">&larr; Back</a>

    <h2>Book List</h2>

    <table>
        <thead>
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Added Date</th>
        </tr>
        </thead>
        <tbody>
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
            <td>$<%= rs.getBigDecimal("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td><%= rs.getTimestamp("added_date") %></td>
        </tr>
        <%
                    }
                }
            } catch (Exception e) {
        %>
        <tr>
            <td colspan="6" style="color:red; text-align:center;">Error loading books: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

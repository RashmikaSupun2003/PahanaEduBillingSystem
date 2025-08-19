<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.system.util.DBUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #e0f2f1);
            margin: 0;
            padding: 40px;
             background: url('assets/image/image1.jpg') 
        }

        .customer-management-container {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            max-width: 1000px;
            margin: auto;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #00796b;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #004d40;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .button {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            color: white;
            background-color: #0288d1;
            text-decoration: none;
            transition: background-color 0.3s ease;
            font-size: 14px;
            margin: 2px;
            display: inline-block;
        }

        .button:hover {
            background-color: #0277bd;
        }

        .action-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #388e3c;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .action-btn:hover {
            background-color: #2e7d32;
        }

        .add-btn {
            background-color: #00796b;
        }

        .add-btn:hover {
            background-color: #004d40;
        }
    </style>
</head>
<body>
<div class="customer-management-container">
    <h2>Customer Management</h2>

    <table>
        <tr>
            <th>Account Number</th>
            <th>Name</th>
            <th>Address</th>
            <th>Telephone</th>
            <th>Units Consumed</th>
            <th>Actions</th>
        </tr>

        <%
            try (Connection conn = DBUtil.getConnection()) {
                String sql = "SELECT * FROM customers";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("account_number") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("address") %></td>
            <td><%= rs.getString("telephone") %></td>
            <td><%= rs.getInt("units_consumed") %></td>
            <td>
                <a href="customersupdateUser.jsp?id=<%= rs.getInt("account_number") %>" class="button">Update</a>
                <a href="customersdeleteUser.jsp?id=<%= rs.getInt("account_number") %>" class="button" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
            </td>
        </tr>
        <%
                    }
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error loading customers: " + e.getMessage() + "</p>");
            }
        %>
    </table>

    <div style="text-align: center;">
        <a href="cashierDashboard.jsp" class="action-btn add-btn">← Back to Dashboard</a>
    </div>
</div>
</body>
</html>

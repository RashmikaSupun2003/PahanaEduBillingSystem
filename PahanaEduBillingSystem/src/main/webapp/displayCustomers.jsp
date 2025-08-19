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
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #d3cce3, #e9e4f0);
            background: url('assets/image/image2.jpg') 
        }

        .customer-management-container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: white;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #6200ea;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .button {
            display: inline-block;
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 5px;
            color: white;
            background-color: #03a9f4;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin: 2px;
        }

        .button:hover {
            background-color: #0288d1;
        }

        .action-btn {
            display: inline-block;
            padding: 12px 20px;
            font-size: 16px;
            font-weight: bold;
            background-color: #43a047;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .action-btn:hover {
            background-color: #2e7d32;
        }

        .error {
            color: red;
            text-align: center;
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
                out.println("<p class='error'>Error loading customers: " + e.getMessage() + "</p>");
            }
        %>
    </table>

    <div style="text-align: center;">
        <a href="AddCustomer.jsp" class="action-btn">➕ Add New Customer</a>
    </div>
    
    <a class="back-button" href="adminDashboard.jsp">← Back</a>
</div>
</body>
</html>

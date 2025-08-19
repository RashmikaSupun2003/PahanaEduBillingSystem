<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.system.util.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Bills</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('assets/image/image2.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 15px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .back-button {
            display: inline-block;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 10px 25px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>All Printed Bills</h2>

        <!-- Back button -->
        <a class="back-button" href="adminDashboard.jsp">← Back to Admin Dashboard</a>

        <table>
            <tr>
                <th>Bill ID</th>
                <th>Account Number</th>
                <th>Customer Name</th>
                <th>Units</th>
                <th>Price per Unit</th>
                <th>Total Amount</th>
                <th>Date</th>
            </tr>

            <%
                try (Connection conn = DBUtil.getConnection()) {
                    String sql = "SELECT * FROM bills ORDER BY bill_date DESC";
                    try (PreparedStatement stmt = conn.prepareStatement(sql);
                         ResultSet rs = stmt.executeQuery()) {

                        while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("bill_id") %></td>
                <td><%= rs.getString("account_number") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getInt("units") %></td>
                <td>Rs. <%= rs.getDouble("price_per_unit") %></td>
                <td><strong>Rs. <%= rs.getDouble("total_amount") %></strong></td>
                <td><%= rs.getTimestamp("bill_date") %></td>
            </tr>
            <%
                        }
                    }
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="7" style="color:red; text-align: center;">Error: <%= e.getMessage() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>

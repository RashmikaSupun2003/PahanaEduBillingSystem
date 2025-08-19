<%@ page import="java.sql.*, com.system.util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accountNumber = (String) session.getAttribute("accountNumber");
    if (accountNumber == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Bills - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f8f8;
            margin: 0;
            padding: 30px;
             background: url('assets/image/image5.jpg') 
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }

        th {
            background-color: #1a237e;
            color: white;
        }

        .back {
            text-align: center;
            margin-top: 25px;
        }

        .back a {
            text-decoration: none;
            background: #1a237e;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .back a:hover {
            background: #3949ab;
        }

        .no-bills {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>My Bills</h2>

    <%
        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM bills WHERE account_number = ? ORDER BY bill_date DESC";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNumber);
            rs = stmt.executeQuery();

            boolean hasBills = false;

            if (rs.isBeforeFirst()) {
                hasBills = true;
    %>
    <table>
        <tr>
            <th>Bill ID</th>
            <th>Customer Name</th>
            <th>Units</th>
            <th>Price/Unit (Rs)</th>
            <th>Total Amount (Rs)</th>
            <th>Bill Date</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("bill_id") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getInt("units") %></td>
            <td><%= rs.getDouble("price_per_unit") %></td>
            <td><%= rs.getDouble("total_amount") %></td>
            <td><%= rs.getTimestamp("bill_date") %></td>
        </tr>
        <% } %>
    </table>
    <%
            }

            if (!hasBills) {
    %>
        <div class="no-bills">
            <p>No bills found for your account.</p>
        </div>
    <%
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    %>

    <div class="back">
        <a href="CustomerDashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>

<%@ page import="java.sql.*, com.system.util.DBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accountNumber = (String) session.getAttribute("accountNumber");
    if (accountNumber == null) {
        response.sendRedirect("CustomerLogin.jsp");
        return;
    }

    String name = "";
    String address = "";
    String telephone = "";
    int units = 0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBUtil.getConnection();
        String sql = "SELECT name, address, telephone, units_consumed FROM customers WHERE account_number = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNumber);
        rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            address = rs.getString("address");
            telephone = rs.getString("telephone");
            units = rs.getInt("units_consumed");
        } else {
            out.println("<p style='color:red;'>Customer not found.</p>");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile - Pahana Edu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f9f9;
            margin: 0;
            padding: 30px;
             background: url('assets/image/image5.jpg') 
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
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

        td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        td.label {
            font-weight: bold;
            width: 40%;
            background: #f0f0f0;
        }

        .back {
            display: block;
            margin-top: 25px;
            text-align: center;
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
    </style>
</head>
<body>
<div class="container">
    <h2>My Profile</h2>
    <table>
        <tr>
            <td class="label">Account Number</td>
            <td><%= accountNumber %></td>
        </tr>
        <tr>
            <td class="label">Name</td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td class="label">Address</td>
            <td><%= address %></td>
        </tr>
        <tr>
            <td class="label">Telephone</td>
            <td><%= telephone %></td>
        </tr>
        <tr>
            <td class="label">Units Consumed</td>
            <td><%= units %></td>
        </tr>
    </table>

    <div class="back">
        <a href="CustomerDashboard.jsp">Back to Dashboard</a>
    </div>
</div>
</body>
</html>

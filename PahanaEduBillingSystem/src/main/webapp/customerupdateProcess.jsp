<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    request.setCharacterEncoding("UTF-8");

    int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String telephone = request.getParameter("telephone");
    int unitsConsumed = Integer.parseInt(request.getParameter("unitsConsumed"));

    String message = "";

    try (Connection conn = DBUtil.getConnection()) {
        String sql = "UPDATE customers SET name = ?, address = ?, telephone = ?, units_consumed = ? WHERE account_number = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, address);
            stmt.setString(3, telephone);
            stmt.setInt(4, unitsConsumed);
            stmt.setInt(5, accountNumber);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                message = "Customer updated successfully.";
            } else {
                message = "Customer not found or update failed.";
            }
        }
    } catch (Exception e) {
        message = "Error updating customer: " + e.getMessage();
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
            color: green;
        }
        .error {
            color: red;
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

<p class="<%= message.startsWith("Error") || message.contains("failed") ? "error" : "message" %>">
    <%= message %>
</p>

<a href="displayCustomers.jsp">Back to Customer List</a>

</body>
</html>

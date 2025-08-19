<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    String message = "";

    try {
        int accountNumber = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "DELETE FROM customers WHERE account_number = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, accountNumber);
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    message = "Customer deleted successfully.";
                } else {
                    message = "Customer not found or could not be deleted.";
                }
            }
        }
    } catch (Exception e) {
        message = "Error deleting customer: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Customer</title>
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

<p class="<%= message.startsWith("Error") || message.contains("not") ? "error" : "message" %>">
    <%= message %>
</p>

<a href="displayCustomers.jsp">Back to Customer List</a>

</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.system.util.DBUtil" %>

<%
    int accountNumber = Integer.parseInt(request.getParameter("id"));
    String name = "";
    String address = "";
    String telephone = "";
    int unitsConsumed = 0;

    try (Connection conn = DBUtil.getConnection()) {
        String sql = "SELECT * FROM customers WHERE account_number = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, accountNumber);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    name = rs.getString("name");
                    address = rs.getString("address");
                    telephone = rs.getString("telephone");
                    unitsConsumed = rs.getInt("units_consumed");
                } else {
                    out.println("<p style='color:red; text-align:center;'>Customer not found!</p>");
                }
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Update Customer</title>
    <style>
        /* General body & font */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
             background: url('assets/image/image5.jpg') 
        }

        /* Form container */
        form {
            background: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
            width: 400px;
            box-sizing: border-box;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        /* Labels styling */
        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            color: #555;
            user-select: none;
        }

        /* Input styling */
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            margin-top: 8px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #3f72af;
            box-shadow: 0 0 8px rgba(63, 114, 175, 0.5);
            outline: none;
        }

        /* Submit button */
        .btn {
            margin-top: 30px;
            width: 100%;
            padding: 15px 0;
            font-size: 18px;
            font-weight: 700;
            color: white;
            background-color: #3f72af;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(63, 114, 175, 0.6);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            user-select: none;
        }

        .btn:hover {
            background-color: #2c4a79;
            box-shadow: 0 8px 18px rgba(44, 74, 121, 0.8);
        }

        /* Responsive */
        @media (max-width: 450px) {
            form {
                width: 100%;
                padding: 25px 20px;
                border-radius: 12px;
            }
        }
    </style>
</head>
<body>

    <form action="customerupdateProcess.jsp" method="post" autocomplete="off">
        <h2>Update Customer</h2>

        <input type="hidden" name="accountNumber" value="<%= accountNumber %>" />

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= name %>" required />

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= address %>" required />

        <label for="telephone">Telephone:</label>
        <input type="text" id="telephone" name="telephone" value="<%= telephone %>" required />

        <label for="unitsConsumed">Units Consumed:</label>
        <input type="number" id="unitsConsumed" name="unitsConsumed" value="<%= unitsConsumed %>" min="0" required />

        <button type="submit" class="btn">Update</button>
    </form>

</body>
</html>

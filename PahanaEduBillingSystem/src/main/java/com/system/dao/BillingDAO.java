package com.system.dao;

import com.system.util.DBUtil;
import java.sql.*;

public class BillingDAO {

    public String generateAndSaveBill(String accountNumber, int[] unitsArr, double[] pricesArr) {
        String query = "SELECT name FROM customers WHERE account_number = ?";
        String insertBill = "INSERT INTO bills (account_number, customer_name, units, price_per_unit, total_amount) VALUES (?, ?, ?, ?, ?)";
        StringBuilder bill = new StringBuilder();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, accountNumber);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                return "notfound";
            }

            String name = rs.getString("name");
            double total = 0;
            StringBuilder itemDetails = new StringBuilder();

            for (int i = 0; i < unitsArr.length; i++) {
                double itemTotal = unitsArr[i] * pricesArr[i];
                total += itemTotal;

                // Optional: insert each item separately
                try (PreparedStatement insertStmt = conn.prepareStatement(insertBill)) {
                    insertStmt.setString(1, accountNumber);
                    insertStmt.setString(2, name);
                    insertStmt.setInt(3, unitsArr[i]);
                    insertStmt.setDouble(4, pricesArr[i]);
                    insertStmt.setDouble(5, itemTotal);
                    insertStmt.executeUpdate();
                }

                itemDetails.append("Item ").append(i + 1).append(": ")
                        .append(unitsArr[i]).append(" units x Rs. ")
                        .append(pricesArr[i]).append(" = Rs. ")
                        .append(itemTotal).append("\n");
            }

            // Build bill output
            bill.append("Customer Account Number: ").append(accountNumber).append("\n")
                .append("Customer Name: ").append(name).append("\n")
                .append("----------------------------------\n")
                .append(itemDetails)
                .append("----------------------------------\n")
                .append("Total Amount Due: Rs. ").append(total).append("\n")
                .append("Generated on: ").append(new java.util.Date()).append("\n")
                .append("Thank you!");

        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        return bill.toString();
    }
}

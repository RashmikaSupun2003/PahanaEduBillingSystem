package com.system.dao;

import com.system.model.CustomerModel;
import com.system.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    // ✅ Existing method to add a customer
    public boolean addCustomer(CustomerModel customer) {
        boolean rowInserted = false;
        String sql = "INSERT INTO customers (account_number, name, address, telephone, units_consumed) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, customer.getAccountNumber());
            stmt.setString(2, customer.getName());
            stmt.setString(3, customer.getAddress());
            stmt.setString(4, customer.getTelephone());
            stmt.setInt(5, customer.getUnitsConsumed());

            rowInserted = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    // ✅ New method to get all customers for display
    public List<CustomerModel> getAllCustomers() {
        List<CustomerModel> customers = new ArrayList<>();
        String sql = "SELECT * FROM customers";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                CustomerModel customer = new CustomerModel(
                        rs.getString("account_number"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("telephone"),
                        rs.getInt("units_consumed")
                );
                customers.add(customer);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return customers;
    }
}

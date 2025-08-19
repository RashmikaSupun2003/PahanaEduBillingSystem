package com.system.dao;

import com.system.model.CustomerLoginModel;
import com.system.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginDAO {

    public boolean validate(CustomerLoginModel customer) {
        boolean isValid = false;

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM customers WHERE account_number = ? AND name = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, customer.getAccountNumber());
            stmt.setString(2, customer.getName());

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isValid = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isValid;
    }
}

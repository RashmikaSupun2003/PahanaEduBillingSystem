package com.system.dao;

import com.system.model.AddCashierModel;
import com.system.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddCashierDAO {

    public boolean addCashier(AddCashierModel cashier) {
        String sql = "INSERT INTO cashier (name, nic, phone, username, password) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, cashier.getName());
            pst.setString(2, cashier.getNic());
            pst.setString(3, cashier.getPhone());
            pst.setString(4, cashier.getUsername());
            pst.setString(5, cashier.getPassword());  // For security, consider hashing passwords
            
            int affectedRows = pst.executeUpdate();
            return affectedRows > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}


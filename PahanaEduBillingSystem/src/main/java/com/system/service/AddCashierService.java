package com.system.service;

import com.system.dao.AddCashierDAO;
import com.system.model.AddCashierModel;

public class AddCashierService {
    private AddCashierDAO dao = new AddCashierDAO();

    public boolean addCashier(AddCashierModel cashier) {
        // You can add business validations here if needed before saving
        return dao.addCashier(cashier);
    }
}

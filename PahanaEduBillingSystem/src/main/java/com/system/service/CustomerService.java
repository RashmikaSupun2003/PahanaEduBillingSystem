package com.system.service;

import com.system.model.CustomerModel;
import com.system.dao.CustomerDAO;

import java.util.List;

public class CustomerService {
    private CustomerDAO dao = new CustomerDAO();

    // ✅ For adding customer (already exists)
    public boolean registerCustomer(CustomerModel customer) {
        return dao.addCustomer(customer);
    }

    // ✅ NEW: For displaying all customers
    public List<CustomerModel> getAllCustomers() {
        return dao.getAllCustomers();
    }
}

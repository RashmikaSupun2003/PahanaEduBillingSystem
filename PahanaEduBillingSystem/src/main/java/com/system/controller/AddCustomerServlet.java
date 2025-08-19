package com.system.controller;

import com.system.model.CustomerModel;
import com.system.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService = new CustomerService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Get form data
        String accNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        int units = Integer.parseInt(request.getParameter("units"));

        // ✅ Create model object
        CustomerModel customer = new CustomerModel(accNumber, name, address, telephone, units);

        // ✅ Call service to insert data
        boolean success = customerService.registerCustomer(customer);

        if (success) {
            // ✅ Forward to success.jsp
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            // ✅ Forward to error.jsp
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

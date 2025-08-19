package com.system.controller;

import com.system.model.AddCashierModel;
import com.system.service.AddCashierService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddCashierServlet")
public class AddCashierServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AddCashierService service = new AddCashierService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AddCashierModel cashier = new AddCashierModel(name, nic, phone, username, password);

        boolean success = service.addCashier(cashier);

        if(success) {
            // Redirect or forward to success page or back to admin dashboard
            response.sendRedirect("adminDashboard.jsp?msg=Cashier+Added+Successfully");
        } else {
            // On failure, redirect or show error
            response.sendRedirect("Add_Cashier.jsp?error=Failed+to+add+cashier");
        }
    }
}

package com.system.controller;

import com.system.dao.BillingDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String[] unitsArr = request.getParameterValues("units");
        String[] priceArr = request.getParameterValues("price");

        int[] units = new int[unitsArr.length];
        double[] prices = new double[priceArr.length];

        for (int i = 0; i < unitsArr.length; i++) {
            units[i] = Integer.parseInt(unitsArr[i]);
            prices[i] = Double.parseDouble(priceArr[i]);
        }

        BillingDAO dao = new BillingDAO();
        String bill = dao.generateAndSaveBill(accountNumber, units, prices);

        if ("notfound".equals(bill)) {
            response.sendRedirect("Billing.jsp?msg=notfound");
        } else if ("error".equals(bill)) {
            response.sendRedirect("Billing.jsp?msg=error");
        } else {
            request.setAttribute("bill", bill);
            request.getRequestDispatcher("Billing.jsp").forward(request, response);
        }
    }
}

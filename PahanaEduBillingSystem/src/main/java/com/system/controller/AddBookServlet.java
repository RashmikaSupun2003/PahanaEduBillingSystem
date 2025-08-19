package com.system.controller;

import com.system.model.AddBookModel;
import com.system.service.AddBookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookName = request.getParameter("book_name");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        AddBookModel book = new AddBookModel();
        book.setBookName(bookName);
        book.setAuthor(author);
        book.setPrice(price);
        book.setQuantity(quantity);

        AddBookService service = new AddBookService();
        boolean isAdded = service.saveBook(book);

        if (isAdded) {
            response.sendRedirect("add_book.jsp?msg=success");
        } else {
            response.sendRedirect("add_book.jsp?msg=error");
        }
    }
}

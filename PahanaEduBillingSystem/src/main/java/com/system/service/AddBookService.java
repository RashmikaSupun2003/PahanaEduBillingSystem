package com.system.service;

import com.system.dao.AddBookDAO;
import com.system.model.AddBookModel;

public class AddBookService {
    private AddBookDAO dao = new AddBookDAO();

    public boolean saveBook(AddBookModel book) {
        return dao.addBook(book);
    }
}

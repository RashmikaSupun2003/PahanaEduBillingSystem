package com.system.dao;

import com.system.model.AddBookModel;
import com.system.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddBookDAO {
    public boolean addBook(AddBookModel book) {
        boolean result = false;

        String sql = "INSERT INTO books (book_name, author, price, quantity) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, book.getBookName());
            stmt.setString(2, book.getAuthor());
            stmt.setDouble(3, book.getPrice());
            stmt.setInt(4, book.getQuantity());

            int rows = stmt.executeUpdate();
            result = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.User;

public class BookDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/librarydb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    public void addBook(Book book) throws ClassNotFoundException, SQLException{
        String insertBook = "INSERT INTO books (title, author, status) VALUES (?, ?, ?)";
        Class.forName("com.mysql.cj.jdbc.Driver");
            
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(insertBook);

        stmt.setString(1, book.getTitle());
        stmt.setString(2, book.getAuthor());
        stmt.setString(3, book.getStatus());

        stmt.executeUpdate();
    }
    
    public List<Book> getAllBooks() throws ClassNotFoundException, SQLException {
        List<Book> bookList = new ArrayList<>();
        String getBooks = "SELECT * FROM books";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(getBooks);
        
        ResultSet rs = stmt.executeQuery(); 

        while (rs.next()) {
            Book book = new Book();
            book.setId(rs.getInt("id"));
            book.setAuthor(rs.getString("author"));
            book.setStatus(rs.getString("status"));
            book.setTitle(rs.getString("title"));
            bookList.add(book);
        }
        
        return bookList;
    }
    
    public List<Book> searchBooks(String title) throws ClassNotFoundException, SQLException {
        List<Book> bookList = new ArrayList<>();
        String getBookByTitle = "SELECT * FROM books WHERE title LIKE ?";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        PreparedStatement stmt = conn.prepareStatement(getBookByTitle);
        stmt.setString(1, "%" + title + "%");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Book book = new Book();
            book.setId(rs.getInt("id"));
            book.setAuthor(rs.getString("author"));
            book.setStatus(rs.getString("status"));
            book.setTitle(rs.getString("title"));
            bookList.add(book);
        }

        return bookList;
    }
    
    public Book getBookById(int id) throws ClassNotFoundException, SQLException{
        Book book = new Book();
        String getBookById = "SELECT * FROM books WHERE id = ?";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        PreparedStatement stmt = conn.prepareStatement(getBookById);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            book.setId(rs.getInt("id"));
            book.setAuthor(rs.getString("author"));
            book.setStatus(rs.getString("status"));
            book.setTitle(rs.getString("title"));
        }
        return book;
    }
}
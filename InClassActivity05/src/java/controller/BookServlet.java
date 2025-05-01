package controller;

import dao.BookDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;

@WebServlet("/addBook")
public class BookServlet extends HttpServlet {

    BookDAO bookDAO = new BookDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            
            if (title == null || title.trim().isEmpty() || author == null || author.trim().isEmpty()) {
                request.setAttribute("error", "Invalid input!");
                request.getRequestDispatcher("addBook.jsp").forward(request, response);
                return;
            }
            
            Book book = new Book();
            book.setTitle(title);
            book.setAuthor(author);
            book.setStatus("Available");
            bookDAO.addBook(book);
            response.sendRedirect("dashboard.jsp");
        }
        catch (Exception ex){
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

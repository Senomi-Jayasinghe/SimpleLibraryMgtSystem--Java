package controller;

import dao.BookDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO dao = new BookDAO();
        try{
            List<Book> bookList = dao.getAllBooks();
            request.setAttribute("bookList", bookList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchBook.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception ex){
            request.setAttribute("errorMessage", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            BookDAO dao = new BookDAO();
            List<Book> bookList = dao.searchBooks(title);
            request.setAttribute("bookList", bookList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("searchBook.jsp");
            dispatcher.forward(request, response);
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

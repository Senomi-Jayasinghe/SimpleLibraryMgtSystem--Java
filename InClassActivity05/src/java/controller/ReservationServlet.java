package controller;

import dao.BookDAO;
import dao.ReservationDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import model.Book;
import model.Reservation;

@WebServlet("/reserveBook")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            BookDAO dao = new BookDAO();
            Book book = new Book();
            book = dao.getBookById(bookId);
            
            request.setAttribute("book", book);
            RequestDispatcher dispatcher = request.getRequestDispatcher("reserveForm.jsp");
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
        try{
            String studentName = request.getParameter("studentName");
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            LocalDateTime reservationDate = LocalDateTime.now();
            
            Reservation reservation = new Reservation();
            reservation.setStudentName(studentName);
            reservation.setStudentId(studentId);
            reservation.setBookId(bookId);
            
            ReservationDAO dao = new ReservationDAO();
            dao.addReservation(reservation);
            dao.updateBookStatus(bookId);
            response.sendRedirect("searchBook");
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

package controller;

import dao.ReservationDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Reservation;

@WebServlet("/viewReservation")
public class ViewReservationServlet extends HttpServlet {

    ReservationDAO reservationDAO = new ReservationDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            List<Reservation> reservationList = reservationDAO.getReservations();          
            request.setAttribute("reservationList", reservationList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewReservations.jsp");
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
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

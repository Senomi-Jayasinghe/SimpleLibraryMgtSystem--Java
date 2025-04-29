package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import model.Reservation;

public class ReservationDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/librarydb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
   
    public void addReservation(Reservation reservation) throws ClassNotFoundException, SQLException{
        String insertReservation = "INSERT INTO reservations (student_name, student_id, book_id)"
                + " VALUES (?, ?, ?)";
        Class.forName("com.mysql.cj.jdbc.Driver");
            
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(insertReservation);

        stmt.setString(1, reservation.getStudentName());
        stmt.setInt(2, reservation.getStudentId());
        stmt.setInt(3, reservation.getBookId());
        stmt.executeUpdate();
    }
    
    public void updateBookStatus(int bookId) throws ClassNotFoundException, SQLException{
        String updateBook = "UPDATE books SET status = 'Reserved' WHERE id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        PreparedStatement stmt = conn.prepareStatement(updateBook);
        stmt.setInt(1, bookId);
        stmt.executeUpdate();
    }
}

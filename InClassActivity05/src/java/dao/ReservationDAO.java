package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
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
    
    public List<Reservation> getReservations() throws ClassNotFoundException, SQLException {
        List<Reservation> reservationList = new ArrayList<>();
        String getReservations = "SELECT * FROM reservations";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(getReservations);
        
        ResultSet rs = stmt.executeQuery(); 

        while (rs.next()) {
            Reservation reservation = new Reservation();
            reservation.setId(rs.getInt("id"));
            reservation.setStudentName(rs.getString("student_name"));
            reservation.setStudentId(rs.getInt("student_id"));
            reservation.setBookId(rs.getInt("book_id"));
            reservation.setReservationDate(rs.getTimestamp("reservation_date").toLocalDateTime());
            reservationList.add(reservation);
        }
        
        return reservationList;
    }
}

package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO {
    
    private final String jdbcURL = "jdbc:mysql://localhost:3306/librarydb";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    
    public User validateUser(String username, String password) throws ClassNotFoundException, SQLException{
        String selectUser = "SELECT * FROM users WHERE username=? AND password=?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement stmt = conn.prepareStatement(selectUser);
        stmt.setString(1, username);
        stmt.setString(2, password);
        
        ResultSet rs = stmt.executeQuery();
        
	if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setUsername(rs.getString("username"));
            user.setPassword(rs.getString("password"));
            user.setRole(rs.getString("role"));
            
            return user;
        }
	else{
            return null;
	}
    }
}

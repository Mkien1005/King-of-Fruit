package db;
import java.sql.*;
public class dbConnection {
	public static Connection createConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
			if (connection != null) {
                System.out.println("Connected to the database successfully");
            } else {
                System.out.println("Failed to connect to the database");
            }
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
}

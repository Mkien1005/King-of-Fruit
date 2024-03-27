package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class adminQuery {
	public static int getProductNum() {
		int num=0;
		Connection con = db.dbConnection.createConnection();
		try {
			PreparedStatement ptm = con.prepareStatement("Select * from productions");
			ResultSet rs = ptm.executeQuery();
			while (rs.next()) {
				num++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public static int getUserNum() {
		int num=0;
		Connection con = db.dbConnection.createConnection();
		try {
			PreparedStatement ptm = con.prepareStatement("Select * from users");
			ResultSet rs = ptm.executeQuery();
			while (rs.next()) {
				num++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return num;
	}
	public static boolean updateProduct(int id, String name, String cost, String desc, String type, String species, String stock) {
		Connection con = db.dbConnection.createConnection();
		String sql = "UPDATE `productions` SET `name_prod`=?,`cost`=?,`description`=?,`type`=?,`species`=?,`quantity_stock`=? WHERE `id`=?";
		
		try {
			PreparedStatement ptm = con.prepareStatement(sql);
			ptm.setString(1, name);
			ptm.setString(2, cost);
			ptm.setString(3, desc);
			ptm.setString(4, type);
			ptm.setString(5, species);
			ptm.setString(6, stock);
			ptm.setInt(7, id);
			int effect = ptm.executeUpdate();
			if(effect>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean updateUser(int id, String fullname, String username, String address, String email, int phone) {
		Connection con = db.dbConnection.createConnection();
		String sql = "UPDATE `users` SET `username`=?,`fullName`=?,`email`=?,`phone`=?,`address`=? WHERE `id`=?";
		
		try {
			PreparedStatement ptm = con.prepareStatement(sql);
			ptm.setString(1, username);
			ptm.setString(2, fullname);
			ptm.setString(3, email);
			ptm.setInt(4, phone);
			ptm.setString(5, address);
			ptm.setInt(6, id);
			int effect = ptm.executeUpdate();
			if(effect>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean addProduct(String name, String desc, String price,String type,String spieces,String stock, String fileName) {
		Connection con = db.dbConnection.createConnection();
		String sql = "INSERT INTO `productions` (`name_prod`, `img_prod`, `cost`, `description`, `type`, `species`, `quantity_bought`, `quantity_stock`) VALUES (?, ?, ?, ?, ?, ?, 0, ?)";
		try {
			PreparedStatement ptm = con.prepareStatement(sql);
			ptm.setString(1, name);
			ptm.setString(2, fileName);
			ptm.setString(3, price);
			ptm.setString(4, desc);
			ptm.setString(5, type);
			ptm.setString(6, spieces);
			ptm.setString(7, stock);
			int effect = ptm.executeUpdate();
			if(effect>0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	public static boolean removeProduct(int productID) {
		Connection con = db.dbConnection.createConnection();
		String sql = "DELETE FROM productions WHERE id = ?";
		PreparedStatement statement;
		try {
			statement = con.prepareStatement(sql);
			statement.setInt(1, productID);
			// Thực thi truy vấn
			int rowsDeleted = statement.executeUpdate();
			if (rowsDeleted > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static boolean removeUser(int userID) {
		Connection con = db.dbConnection.createConnection();
		String sql = "DELETE FROM users WHERE id = ?";
		PreparedStatement statement;
		try {
			statement = con.prepareStatement(sql);
			statement.setInt(1, userID);
			// Thực thi truy vấn
			int rowsDeleted = statement.executeUpdate();
			if (rowsDeleted > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}

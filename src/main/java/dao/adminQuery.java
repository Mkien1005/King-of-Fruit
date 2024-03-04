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
	public static boolean updateProduct(int id, String name, String cost, String desc, String type, String species, int bought, String stock) {
		Connection con = db.dbConnection.createConnection();
		String sql = "UPDATE `productions` SET `name_prod`=?,`cost`=?,`description`=?,`type`=?,`species`=?,`quantity_bought`=?,`quantity_stock`=? WHERE `id`=?";
		
		try {
			PreparedStatement ptm = con.prepareStatement(sql);
			ptm.setString(1, name);
			ptm.setString(2, cost);
			ptm.setString(3, desc);
			ptm.setString(4, type);
			ptm.setString(5, species);
			ptm.setInt(6, bought);
			ptm.setString(7, stock);
			ptm.setInt(8, id);
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
}

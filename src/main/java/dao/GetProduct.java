package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Products;
import db.dbConnection;

public class GetProduct {
	static Connection connection = null;
	static PreparedStatement preparedStatement = null;
	static ResultSet rs = null;
	public static List<Products> getAllProducts(){
		List<Products> productList = new ArrayList<>();
		connection = db.dbConnection.createConnection();
		String sql = "SELECT * FROM productions";
        try {
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery(sql);

            // Lặp qua kết quả và tạo các đối tượng sản phẩm từ dữ liệu
            while (rs.next()) {
                int productId = rs.getInt("id");
                String productName = rs.getString("name_prod");
                String productImage = rs.getString("img_prod");
                String cost = rs.getString("cost");
                String description = rs.getString("description");
                String type = rs.getString("type");
                String species = rs.getString("species");
                Products product = new Products(productId, productName, productImage, description, cost, type, species);
                productList.add(product);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	public static List<Products> getProductsQuantityBought1(){
		List<Products> productList = new ArrayList<>();
		connection = db.dbConnection.createConnection();
		String sql = "SELECT * FROM productions ORDER BY quantity_bought DESC LIMIT 6";
        try {
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery(sql);

            // Lặp qua kết quả và tạo các đối tượng sản phẩm từ dữ liệu
            while (rs.next()) {
                int productId = rs.getInt("id");
                String productName = rs.getString("name_prod");
                String productImage = rs.getString("img_prod");
                String cost = rs.getString("cost");
                String description = rs.getString("description");
                String type = rs.getString("type");
                String species = rs.getString("species");
                Products product = new Products(productId, productName, productImage, description, cost, type, species);
                productList.add(product);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	public static List<Products> getProductsQuantityBought2(){
		List<Products> productList = new ArrayList<>();
		connection = db.dbConnection.createConnection();
		String sql = "SELECT * FROM productions ORDER BY quantity_bought DESC LIMIT 4 OFFSET 6";

        try {
			preparedStatement = connection.prepareStatement(sql);
			rs = preparedStatement.executeQuery(sql);

            // Lặp qua kết quả và tạo các đối tượng sản phẩm từ dữ liệu
            while (rs.next()) {
                int productId = rs.getInt("id");
                String productName = rs.getString("name_prod");
                String productImage = rs.getString("img_prod");
                String cost = rs.getString("cost");
                String description = rs.getString("description");
                String type = rs.getString("type");
                String species = rs.getString("species");
                Products product = new Products(productId, productName, productImage, description, cost, type, species);
                productList.add(product);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return productList;
	}
	public static List<Products> getFruit() {
		List<Products> List = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit", "root", "");
			dbConnection.createConnection();
			pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Fruits' LIMIT 8");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int productId = rs.getInt("id");
				String productName = rs.getString("name_prod");
				String productImage = rs.getString("img_prod");
				String cost = rs.getString("cost");
				String description = rs.getString("description");
				String type = rs.getString("type");
				String species = rs.getString("species");
				Products product = new Products(productId, productName, productImage, description, cost, type, species);
				List.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}
	public static List<Products> getVegetable() {
		List<Products> List = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit", "root", "");
			dbConnection.createConnection();
			pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Vegetables' LIMIT 8");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int productId = rs.getInt("id");
				String productName = rs.getString("name_prod");
				String productImage = rs.getString("img_prod");
				String cost = rs.getString("cost");
				String description = rs.getString("description");
				String type = rs.getString("type");
				String species = rs.getString("species");
				Products product = new Products(productId, productName, productImage, description, cost, type, species);
				List.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}
	public static List<Products> getBread() {
		List<Products> List = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit", "root", "");
			dbConnection.createConnection();
			pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Bread' LIMIT 8");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int productId = rs.getInt("id");
				String productName = rs.getString("name_prod");
				String productImage = rs.getString("img_prod");
				String cost = rs.getString("cost");
				String description = rs.getString("description");
				String type = rs.getString("type");
				String species = rs.getString("species");
				Products product = new Products(productId, productName, productImage, description, cost, type, species);
				List.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

	public static List<Products> getMeat() {
		List<Products> List = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit", "root", "");
			dbConnection.createConnection();
			pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Meat' LIMIT 8");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int productId = rs.getInt("id");
				String productName = rs.getString("name_prod");
				String productImage = rs.getString("img_prod");
				String cost = rs.getString("cost");
				String description = rs.getString("description");
				String type = rs.getString("type");
				String species = rs.getString("species");
				Products product = new Products(productId, productName, productImage, description, cost, type, species);
				List.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}

	public static void updateQuantity(int id, int newQuantity, int username) {
		connection = db.dbConnection.createConnection();
        try {
			preparedStatement = connection.prepareStatement("UPDATE cart SET quantity = ? WHERE id_product = ? AND id_user = ?");
			preparedStatement.setInt(1, newQuantity);
			preparedStatement.setInt(2, id);
			preparedStatement.setInt(3, username);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

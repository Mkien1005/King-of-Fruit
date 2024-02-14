package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Products;
public class GetProduct {
	public static List<Products> getAllProducts(){
		List<Products> productList = new ArrayList<>();
		Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
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
}

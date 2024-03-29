package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ProductWithQuantity;
import bean.Products;

public class CartQuery {
	public static List<ProductWithQuantity> updateCart(int id_user, int id_product, int quantity, String username) throws SQLException {
        List<Products> productList = new ArrayList<>();
        List<ProductWithQuantity> productWithQuantityList = new ArrayList<>();
        Connection cn = db.dbConnection.createConnection();
		PreparedStatement check = cn.prepareStatement("SELECT quantity from cart where id_user=? and id_product=?");
        check.setInt(1, id_user);
        check.setInt(2, id_product);
        ResultSet data = check.executeQuery();
        if (data.next()) {
            // Lấy giá trị số lượng
            int quantityInDB = data.getInt("quantity");
            quantityInDB = quantityInDB + quantity;
            PreparedStatement update = cn
                    .prepareStatement("UPDATE cart SET quantity=? where id_user=? and id_product=?");
            update.setInt(1, quantityInDB);
            update.setInt(2, id_user);
            update.setInt(3, id_product);
            update.executeUpdate();
        } else {
            try {
                PreparedStatement ps = cn
                        .prepareStatement("INSERT INTO cart (id_user, id_product, quantity) VALUES (?, ?, ?)");
                ps.setInt(1, id_user);
                ps.setInt(2, id_product);
                ps.setInt(3, quantity);

                int affectedRows = ps.executeUpdate();
                if (affectedRows > 0) {
                    System.out.println("Item added to cart successfully");
                } else {
                    return null;
                }
            } catch (SQLException e) {
                // Xử lý lỗi SQL
                e.printStackTrace();

                return null;
            }
        }
        
        PreparedStatement pstmt = cn.prepareStatement("SELECT p.*, c.quantity " +
                "FROM productions p " +
                "INNER JOIN cart c ON p.id = c.id_product " +
                "INNER JOIN users u ON c.id_user = u.id " +
                "WHERE u.username = ?");
        pstmt.setString(1, username);
        ResultSet rs = pstmt.executeQuery();

        // Lặp qua kết quả truy vấn và tạo các đối tượng Product
        while (rs.next()) {
            int productId = rs.getInt("id");
            String productName = rs.getString("name_prod");
            String productImage = rs.getString("img_prod");
            String cost = rs.getString("cost");
            String description = rs.getString("description");
            String type = rs.getString("type");
            String species = rs.getString("species");
            int quan = rs.getInt("quantity");
            Products product = new Products(productId, productName, productImage, description, cost, type, species);
            productList.add(product);
            ProductWithQuantity productWithQuantity = new ProductWithQuantity(product, quan);
            productWithQuantityList.add(productWithQuantity);
        }
        return productWithQuantityList;
	}
}

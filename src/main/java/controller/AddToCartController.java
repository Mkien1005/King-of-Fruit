package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ProductWithQuantity;
import bean.Products;
import db.dbConnection;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	int id_user = (int) session.getAttribute("id_user");
//    	System.out.println(getServletContext().getAttribute("id_user"));
    	int id_product = (int) Integer.parseInt(request.getParameter("idproduct"));

        Connection cn = db.dbConnection.createConnection();
        try {
            PreparedStatement ps = cn.prepareStatement("INSERT INTO cart (id_user, id_product, quantity) VALUES (?, ?, ?)");
            ps.setInt(1, id_user);
            ps.setInt(2, id_product);
            ps.setInt(3, 1);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
            	
            	System.out.println("Item added to cart successfully");
        	    String username = (String) session.getAttribute("username");
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                List<Products> productList = new ArrayList<>();
                List<ProductWithQuantity> productWithQuantityList = new ArrayList<>();
                try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
                dbConnection.createConnection();
                // Thực hiện truy vấn
                pstmt =  conn.prepareStatement("SELECT p.*, c.quantity " +
                        "FROM productions p " +
                        "INNER JOIN cart c ON p.id = c.id_product " +
                        "INNER JOIN users u ON c.id_user = u.id " +
                        "WHERE u.username = ?");
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                // Lặp qua kết quả truy vấn và tạo các đối tượng Product
                while (rs.next()) {
                    int productId = rs.getInt("id");
                    String productName = rs.getString("name_prod");
                    String productImage = rs.getString("img_prod");
                    String cost = rs.getString("cost");
                    String description = rs.getString("description");
                    String type = rs.getString("type");
                    String species = rs.getString("species");
                    int quantity = rs.getInt("quantity");
                    Products product = new Products(productId, productName, productImage, description, cost, type, species);
                    productList.add(product);
                    ProductWithQuantity productWithQuantity = new ProductWithQuantity(product, quantity);
                    productWithQuantityList.add(productWithQuantity);
                }
                request.setAttribute("productWithQuantityList", productWithQuantityList);
                response.sendRedirect("/re-java-web/CartDirector");
            } else {
                System.out.println("Error adding item to cart");
                RequestDispatcher rd = request.getRequestDispatcher("/View/404.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL
            e.printStackTrace();
            
            RequestDispatcher rd = request.getRequestDispatcher("/View/404.jsp");
            rd.forward(request, response);
        }


    }
}

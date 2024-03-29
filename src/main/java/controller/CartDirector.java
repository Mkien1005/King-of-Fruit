package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet("/CartDirector")
public class CartDirector extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartDirector() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
	    Integer id = (Integer) session.getAttribute("id_user");
	    if(id != null) {
	    	Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Products> productList = new ArrayList<>();
	        List<ProductWithQuantity> productWithQuantityList = new ArrayList<>();
		    try {
	            // Kết nối tới cơ sở dữ liệu MySQL
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
	            dbConnection.createConnection();
	            // Thực hiện truy vấn
	            pstmt =  conn.prepareStatement("SELECT p.*, c.quantity " +
	                    "FROM productions p " +
	                    "INNER JOIN cart c ON p.id = c.id_product " +
	                    "INNER JOIN users u ON c.id_user = u.id " +
	                    "WHERE u.id = ? ORDER BY c.id DESC");
	            pstmt.setInt(1, id);
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
	            List<String> name_product_List = dao.GetProduct.getAllNameProduct();
                request.setAttribute("name_product_List", name_product_List);
	            request.setAttribute("productWithQuantityList", productWithQuantityList);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/View/cart.jsp");
	            dispatcher.forward(request, response);
		    } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }else {
	    	
	    	response.sendRedirect("loginPage");
	    }
	    
	}

}

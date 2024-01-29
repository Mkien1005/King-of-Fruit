package controller;

import java.io.IOException;
import java.net.URLEncoder;
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

import bean.Products;
import db.dbConnection;

@WebServlet("/indexForward")
public class indexForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public indexForward() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		 Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Products> productList = new ArrayList<>();
	        
	        try {
	            // Kết nối tới cơ sở dữ liệu MySQL
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
	            dbConnection.createConnection();
	            // Thực hiện truy vấn
	            pstmt = conn.prepareStatement("SELECT * FROM productions limit 8");
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
	                Products product = new Products(productId, productName, productImage, description, cost, type, species);
	                productList.add(product);
	            }
	            List<Products> VegetablesList = getVegetable();
	            List<Products> FruitList = getFruit();
	            List<Products> BreadList = getBread();
	            List<Products> MeatList = getMeat();
	            // Đặt productList vào thuộc tính của request để chuyển tiếp sang trang JSP
	            request.setAttribute("productList", productList);
	            request.setAttribute("VegetablesList", VegetablesList);
	            request.setAttribute("FruitList", FruitList);
	            request.setAttribute("BreadList", BreadList);
	            request.setAttribute("MeatList", MeatList);
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/View/index.jsp");
	            dispatcher.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
//	        } finally {
//	            // Đóng các tài nguyên
//	            try {
//	                if (rs != null) rs.close();
//	                if (pstmt != null) pstmt.close();
//	                if (conn != null) conn.close();
//	            } catch (SQLException e) {
//	                e.printStackTrace();
//	            }
//	        }
	}
	public static List<Products> getVegetable() {
		List<Products> List = new ArrayList<>();
		 Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            // Kết nối tới cơ sở dữ liệu MySQL
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
	            dbConnection.createConnection();
	            // Thực hiện truy vấn
	            pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Vegetables' LIMIT 8");
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
	                Products product = new Products(productId, productName, productImage, description, cost, type, species);
	                List.add(product);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		return List;
	}
	public static List<Products> getFruit() {
		List<Products> List = new ArrayList<>();
		 Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {
	            // Kết nối tới cơ sở dữ liệu MySQL
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
	            dbConnection.createConnection();
	            // Thực hiện truy vấn
	            pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Fruits' LIMIT 8");
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
	            // Kết nối tới cơ sở dữ liệu MySQL
	        	Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
	            dbConnection.createConnection();
	            // Thực hiện truy vấn
	            pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Bread' LIMIT 8");
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
            // Kết nối tới cơ sở dữ liệu MySQL
        	Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit","root","");
            dbConnection.createConnection();
            // Thực hiện truy vấn
            pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `type`='Meat' LIMIT 8");
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
                Products product = new Products(productId, productName, productImage, description, cost, type, species);
                List.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	return List;
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

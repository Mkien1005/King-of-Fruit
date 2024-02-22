package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Products;
import db.dbConnection;

@WebServlet("/Detail_Product")
public class Detail_Product extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Detail_Product() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String data = request.getParameter("id");
        int id = Integer.parseInt(data);
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Kết nối tới cơ sở dữ liệu MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kingoffruit", "root", "");
            dbConnection.createConnection();
            // Thực hiện truy vấn
            pstmt = conn.prepareStatement("SELECT * FROM `productions` WHERE `id`=?");
            pstmt.setInt(1, id); // Chỉ số bắt đầu từ 1
            rs = pstmt.executeQuery();
            if (rs.next()) { // Kiểm tra xem ResultSet có dữ liệu không
                int productId = rs.getInt("id");
                String productName = rs.getString("name_prod");
                String productImage = rs.getString("img_prod");
                String cost = rs.getString("cost");
                String description = rs.getString("description");
                String type = rs.getString("type");
                String species = rs.getString("species");
                Products product = new Products(productId, productName, productImage, description, cost, type,
                        species);

                request.setAttribute("product", (Object) product);
                RequestDispatcher rd = request.getRequestDispatcher("View/shop-detail.jsp");
                rd.forward(request, response);
            } else {
                // Không tìm thấy sản phẩm
                response.sendRedirect("View/404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

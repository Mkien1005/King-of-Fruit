package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveProductCart")
public class RemoveProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoveProductCart() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		int productId = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession(false);
		int id_user = (int) session.getAttribute("id_user");
		Connection con = null;
        con = db.dbConnection.createConnection();
        try {
        	String sql = "DELETE FROM cart WHERE id_user = ? AND id_product = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, id_user);
            statement.setInt(2, productId);

			// Thực thi truy vấn
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                // Xóa thành công dữ liệu từ bảng cart
            	response.setContentType("text/plain");
            	response.getWriter().write("Product with ID " + productId + " removed successfully.");
            } else {
                // Không có dữ liệu nào được xóa
                response.getWriter().write("No data found for deletion.");
            }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

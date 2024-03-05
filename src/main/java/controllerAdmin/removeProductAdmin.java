package controllerAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class removeProductAdmin
 */
@WebServlet("/removeProductAdmin")
public class removeProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public removeProductAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		Connection con = null;
		con = db.dbConnection.createConnection();
		try {
			String sql = "DELETE FROM productions WHERE id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, productId);

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

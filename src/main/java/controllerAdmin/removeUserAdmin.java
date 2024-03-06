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

@WebServlet("/removeUserAdmin")
public class removeUserAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		Connection con = null;
		con = db.dbConnection.createConnection();
		try {
			String sql = "DELETE FROM users WHERE id = ?";
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, idUser);

			// Thực thi truy vấn
			int rowsDeleted = statement.executeUpdate();
			if (rowsDeleted > 0) {
				// Xóa thành công dữ liệu từ bảng cart
				response.setContentType("text/plain");
				response.getWriter().write("User with ID " + idUser + " removed successfully.");
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

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		boolean check = dao.adminQuery.removeUser(idUser);
		if (check) {
			// Xóa thành công dữ liệu từ bảng cart
			response.setContentType("text/plain");
			response.getWriter().write("User with ID " + idUser + " removed successfully.");
		} else {
			// Không có dữ liệu nào được xóa
			response.getWriter().write("No data found for deletion.");
		}
	}

}

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbConnection;

@WebServlet("/controller/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra thông tin đăng nhập ở đây
        boolean dangNhapThanhCong = kiemTraDangNhap(username, password);
        String variableValue;
        if (dangNhapThanhCong) {
        	variableValue = "success";
        } else {
        	variableValue = "failure";
        }	
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(variableValue);
	}
	private boolean kiemTraDangNhap(String username, String password) {
        // Kiểm tra thông tin đăng nhập ở đây, trả về true nếu hợp lệ, ngược lại trả về false
		Connection connection = dbConnection.createConnection();
		String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) {
                if(resultSet!=null) {
                	return true;
                }else {
                	return false;
                }
            }
        } catch (SQLException e) {
        e.printStackTrace();
    }
        return false;
    }

}

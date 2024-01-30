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
import javax.servlet.http.HttpSession;

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
        	HttpSession session = request.getSession();
            session.setAttribute("username", username); // Lưu tên đăng nhập vào phiên
        	variableValue = "success";
        } else {
        	variableValue = "failure";
        }	
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(variableValue);
	}
	private boolean kiemTraDangNhap(String username, String password) {
	    try (Connection connection = dbConnection.createConnection();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?")) {

	        statement.setString(1, username);
	        statement.setString(2, password);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            return resultSet.next(); // Trả về true nếu có ít nhất một bản ghi khớp
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}


}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.users;
import dao.UserQuery;
import db.dbConnection;

import java.sql.*;
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		Connection conn = dbConnection.createConnection();
		String username = request.getParameter("username");
		String password =request.getParameter("password");
		String fullName=request.getParameter("fullname");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		users user = new users();
		user.setUsername(username);
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		boolean check1 = UserQuery.InsertUser(conn, user);
		if(check1) {
			request.setAttribute("msg", "Register Success!");
			String newPath = "/re-java-web/View/index.jsp";
	        response.sendRedirect(newPath);
	        try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			request.setAttribute("msg", "Register Failed!");
			request.setAttribute("user", username);
			String newPath = "/re-java-web/View/index.jsp";
	        response.sendRedirect(newPath);
	        try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}

package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullname");
        String email =  request.getParameter("email");
        String phone = request.getParameter("phone");
		Connection conn = dbConnection.createConnection();
		users user = new users();
		user.setUsername(username);
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPassword(password);
		user.setAddress("");
		String check1 = UserQuery.InsertUser(conn, user);
		if(check1 == "true") {
			int id_user = dao.UserQuery.getUserIdByUsername(username);
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("id_user", id_user);
			/* response.sendRedirect("indexForward"); */
	        request.setAttribute("success", "Register Success!");
		}else if(check1 =="Email" || check1 == "Username"){
			response.getWriter().write(check1);
		}
	}

}

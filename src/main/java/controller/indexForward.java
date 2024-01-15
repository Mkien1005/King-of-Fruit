package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/indexForward")
public class indexForward extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public indexForward() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher rDispatcher = request.getRequestDispatcher("/View/test.html");
//		rDispatcher.forward(request, response);
		String newPath = "/re-java-web/View/index.jsp";
        response.sendRedirect(newPath);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

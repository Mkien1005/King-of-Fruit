package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class updateProduct
 */
@WebServlet("/updateProduct")
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public updateProduct() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int productId = Integer.parseInt(request.getParameter("productId"));
		 int quantity = Integer.parseInt(request.getParameter("quantity"));
         HttpSession session = request.getSession();
         int username = (int) session.getAttribute("id_user");
         dao.GetProduct.updateQuantity(productId, quantity, username);
         response.setStatus(HttpServletResponse.SC_OK);
         response.getWriter().println("Success");
	}

}

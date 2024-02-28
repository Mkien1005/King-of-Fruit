package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ProductWithQuantity;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("id_user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }
        int id_user = (int) session.getAttribute("id_user");
        int id_product = (int) Integer.parseInt(request.getParameter("idproduct"));
        int quantity = (int) Integer.parseInt(request.getParameter("quantity"));
        try {
            String username = (String) session.getAttribute("username");
            List<ProductWithQuantity> productWithQuantityList = dao.CartQuery.updateCart(id_user, id_product, quantity, username);
            if( productWithQuantityList != null) {
            	request.setAttribute("productWithQuantityList", productWithQuantityList);
            	response.sendRedirect("/re-java-web/CartDirector");
            }
            else {
                RequestDispatcher rd = request.getRequestDispatcher("/View/404.jsp");
                rd.forward(request, response);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}

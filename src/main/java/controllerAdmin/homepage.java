package controllerAdmin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Products;

@WebServlet("/homepage")
public class homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public homepage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int numProduct = dao.adminQuery.getProductNum();
		int numUser = dao.adminQuery.getUserNum();
		List<Products> products = dao.GetProduct.getProductsQuantityBought1();
		request.setAttribute("numProduct", numProduct);
		request.setAttribute("numUser", numUser);
		request.setAttribute("productList", products);
		request.setAttribute("info", "Dashboard");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

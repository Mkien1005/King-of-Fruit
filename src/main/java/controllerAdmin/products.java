package controllerAdmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Products;


@WebServlet("/products")
public class products extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public products() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Products> products = dao.GetProduct.getAllProducts();
		request.setAttribute("products", products);
		request.setAttribute("info", "Products");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/product.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Products;

@WebServlet("/shopDirector")
public class shopDirector extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public shopDirector() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		String keyword = (String) request.getParameter("keyword");
		if(keyword==null) {
			String check = request.getParameter("page");
			int page = 1;
			if(check != null) {
				page = Integer.parseInt(check);
			}
			int itemsPerPage = 9;
			List<Products> dataList = dao.GetProduct.getAllProducts(); 
			int totalPages = (int) Math.ceil((double) dataList.size() / itemsPerPage);
			int startIndex = (page - 1) * itemsPerPage;
			int endIndex = Math.min(startIndex + itemsPerPage, dataList.size());
			// Dữ liệu của trang được yêu cầu
			List<Products> pageData = dataList.subList(startIndex, endIndex);
			// Set dữ liệu và thuộc tính vào request
			request.setAttribute("pageData", pageData);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", page);
			List<String> name_product_List = dao.GetProduct.getAllNameProduct();
            request.setAttribute("name_product_List", name_product_List);
			RequestDispatcher dp = request.getRequestDispatcher("/View/shop.jsp");
			dp.forward(request, response);
		}else {
			String like_keyword = "%"+keyword+"%";
			String check = request.getParameter("page");
			int page = 1;
			if(check != null) {
				page = Integer.parseInt(check);
			}
			int itemsPerPage = 9;
			List<Products> dataList = dao.GetProduct.getProductsByKeyword(like_keyword);
			if(dataList.isEmpty()) {
				request.setAttribute("msg", "No product has key word: "+ keyword);
			}
			int totalPages = (int) Math.ceil((double) dataList.size() / itemsPerPage);
			int startIndex = (page - 1) * itemsPerPage;
			int endIndex = Math.min(startIndex + itemsPerPage, dataList.size());
			// Dữ liệu của trang được yêu cầu
			List<Products> pageData = dataList.subList(startIndex, endIndex);
			// Set dữ liệu và thuộc tính vào request
			request.setAttribute("pageData", pageData);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("currentPage", page);
			
			RequestDispatcher dp = request.getRequestDispatcher("/View/shop.jsp");
			dp.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		doGet(request, response);
	}

}

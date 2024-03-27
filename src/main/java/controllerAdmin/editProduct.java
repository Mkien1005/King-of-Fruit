package controllerAdmin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * Servlet implementation class editProduct
 */
@WebServlet("/editProduct")
public class editProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public editProduct() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }

        String jsonData = stringBuilder.toString();

        // Chuyển đổi JSON thành đối tượng JSONObject
        JSONObject jsonObject = new JSONObject(jsonData);

        // Lấy từng giá trị từ JSONObject
        String productName = jsonObject.getString("productName");
        String productCost = jsonObject.getString("productCost");
        String desc = jsonObject.getString("productDescription");
        String type = jsonObject.getString("productType");
        String species = jsonObject.getString("productSpecies");
        String stock = jsonObject.getString("quantityStock");
        int id = jsonObject.getInt("id");
        // Xử lý dữ liệu, thường là lưu vào cơ sở dữ liệu hoặc thực hiện các thao tác khác
        // Ví dụ: Lưu vào cơ sở dữ liệu
        boolean success = dao.adminQuery.updateProduct(id, productName, productCost, desc, type, species, stock);

        // Chuẩn bị phản hồi cho máy khách
        if (success) {
            response.setContentType("application/text");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("success");
        } else {
            response.setContentType("application/text");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("error"); 
        }

		
	}

}

package controllerAdmin;

import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addProduct")
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Đường dẫn tới thư mục lưu trữ ảnh trong source code
        String uploadPath = getServletContext().getRealPath("") + File.separator + "public/img" + File.separator;
        String productName = request.getParameter("name");
        if(productName==null) {
        	response.getWriter().println("fail");
        	return;
        }
        String productDescription = request.getParameter("desc");
        String productPrice = request.getParameter("price");
        String productType = request.getParameter("type");
        String productSpecies = request.getParameter("species");
        String productStock = request.getParameter("stock");
        String img = request.getParameter("imgName");
        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // Lấy dữ liệu từ form
            Part filePart = request.getPart("proImg");
            String fileName = getFileName(filePart);
            
            // Ghi file vào thư mục image
            OutputStream out = new FileOutputStream(new File(uploadPath + File.separator + fileName));
            InputStream fileContent = filePart.getInputStream();
            int read;
            final byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.close();
            boolean check = dao.adminQuery.addProduct(productName, productDescription, productPrice, productType, productSpecies, productStock, fileName);
            if(check) {
            	response.setContentType("application/text");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("success");
            }else {
            	response.setContentType("application/text");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("failure");
            }
            // Gửi phản hồi về client
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Không thể tải lên file: " + e.getMessage());
        }
	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		for (String content : partHeader.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}

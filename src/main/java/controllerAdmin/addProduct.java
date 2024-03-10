package controllerAdmin;

import java.io.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addProduct")
@MultipartConfig
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
		String UPLOAD_DIRECTORY = "/public/img";

	        // Đường dẫn tuyệt đối của thư mục lưu trữ file trên máy chủ
	    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        String productName = request.getParameter("name");
        String productDescription = request.getParameter("desc");
        String productPrice = request.getParameter("productPrice");
        String productType = request.getParameter("proType");
        String productSpecies = request.getParameter("proSpecies");
        String productStock = request.getParameter("proStock");
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
            int read = 0;
            byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.close();
            fileContent.close();
            boolean check = dao.adminQuery.addProduct(productName, productDescription, productPrice, productType, productSpecies, productStock, fileName);
            if(check) {
            	response.setContentType("text/plain");
            	response.setCharacterEncoding("UTF-8");
            	response.setHeader("Content-Disposition", "inline"); // Hoặc "attachment; filename=result.txt" nếu bạn muốn tải file xuống
            	response.getWriter().write("success");

            }else {
            	response.setContentType("text/plain");
            	response.setCharacterEncoding("UTF-8");
            	response.setHeader("Content-Disposition", "inline"); // Hoặc "attachment; filename=result.txt" nếu bạn muốn tải file xuống
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

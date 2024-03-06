package controllerAdmin;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/editUser")
public class editUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public editUser() {
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
        String fullname = jsonObject.getString("fullname");
        String username = jsonObject.getString("username");
        String address = jsonObject.getString("address");
        String email = jsonObject.getString("email");
        int phone = jsonObject.getInt("phone");
        int id = jsonObject.getInt("id");    
        // Xử lý dữ liệu, thường là lưu vào cơ sở dữ liệu hoặc thực hiện các thao tác khác
        // Ví dụ: Lưu vào cơ sở dữ liệu
        boolean success = dao.adminQuery.updateUser(id, fullname, username, address, email, phone);

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

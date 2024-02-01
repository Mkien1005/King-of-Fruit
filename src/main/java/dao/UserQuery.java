package dao;
import java.sql.*;

import bean.users;
public class UserQuery {
	public static boolean InsertUser(Connection con, users user) {
		PreparedStatement pstm = null;
		String sql = "insert into users (`username`, `password`, `fullName`, `email`, `phone`, `address`) values(?,?,?,?,?,?)";
		try {
			pstm = con.prepareStatement(sql);
			String username = user.getUsername();
			String password = user.getPassword();
			String fullName = user.getFullName();
			String email = user.getEmail();
			String phone = user.getPhone();
			pstm.setString(1, username);
			pstm.setString(2, password);
			pstm.setString(3, fullName);
			pstm.setString(4, email);
			pstm.setString(5, phone);
			pstm.setString(6,"");
			int check = pstm.executeUpdate();
			if(check!=0) {
				return true;
			}
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	    // Hàm để lấy giá trị id từ username
	    public static int getUserIdByUsername(String username) {
	        int userId = -1; // Giá trị mặc định nếu không tìm thấy

	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;

	        try {
	            // Tạo kết nối đến cơ sở dữ liệu
	            connection = db.dbConnection.createConnection();

	            // Chuẩn bị câu truy vấn SQL
	            String sql = "SELECT id FROM users WHERE username = ?";
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, username);

	            // Thực hiện truy vấn
	            resultSet = preparedStatement.executeQuery();

	            // Xử lý kết quả truy vấn
	            if (resultSet.next()) {
	                // Nếu có kết quả, lấy giá trị id từ cột "id"
	                userId = resultSet.getInt("id");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            // Đóng tất cả các tài nguyên
	            try {
	                if (resultSet != null) {
	                    resultSet.close();
	                }
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        return userId;
	    }
}

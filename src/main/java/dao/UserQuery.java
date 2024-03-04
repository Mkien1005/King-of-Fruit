package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.Products;
import bean.users;

public class UserQuery {
	public static String InsertUser(Connection con, users user) {
		PreparedStatement pstm, pstm1, pstm2 = null;
		ResultSet rs1, rs2 = null;
		String checkUsername = "Select * From users where username = ? ";
		try {
			pstm1 = con.prepareStatement(checkUsername);
			pstm1.setString(1, user.getUsername());
			rs1 = pstm1.executeQuery();
			if(!rs1.next()) {
				String checkEmail = "Select * From users where email = ? ";
				pstm2 = con.prepareStatement(checkEmail);
				pstm2.setString(1, user.getEmail());
				rs2 = pstm2.executeQuery();
				if(!rs2.next()) {
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
						pstm.setString(6, "");
						int check = pstm.executeUpdate();
						if (check != 0) {
							pstm.close();
							return "true";
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}		
				}else {
					return "Email";
				}
			}else {
				return "Username";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "false";
	}

	public static int getUserIdByUsername(String username) {
		int userId = -1;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = db.dbConnection.createConnection();

			String sql = "SELECT id FROM users WHERE username = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);

			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				userId = resultSet.getInt("id");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	public static List<users> getAllProducts(){
		List<users> userList = new ArrayList<>();
		Connection connection = db.dbConnection.createConnection();
		String sql = "SELECT * FROM users";
        try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery(sql);

            // Lặp qua kết quả và tạo các đối tượng sản phẩm từ dữ liệu
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String fullName = rs.getString("fullName");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                users user = new users();
                user.setId(id);
        		user.setUsername(username);
        		user.setFullName(fullName);
        		user.setEmail(email);
        		user.setPhone(phone);
        		user.setAddress(address);
        		user.setPassword("");
        		user.setAddress("");
                userList.add(user);
                
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
}

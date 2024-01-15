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
}

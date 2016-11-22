package ets.secure_webapp.dao.impl;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ets.secure_webapp.dao.UserDao;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.utils.PasswordEncryption;

public class UserDaoImpl implements UserDao {
	
	private Connection getConnection() throws SQLException {
		return DataSourceProvider.getInstance().getDataSource().getConnection();
	}
	
	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"),
						rs.getString("surname"), rs.getString("name"), rs.getString("avatar"), rs.getString("country"),
						rs.getDate("date"));
				users.add(user);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	@Override
	public User getUserByUsername(String username) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user WHERE username=?");
			stmt.setString(1, username);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"),
						rs.getString("surname"), rs.getString("name"), rs.getString("avatar"), rs.getString("country"),
						rs.getDate("date"));
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User setUserPassword(Integer id_user, String newPassword) {
		try {
			Connection connection = getConnection();

			PreparedStatement stmt = connection.prepareStatement("UPDATE user SET password=? WHERE id_user=?");

			try {
				stmt.setString(1, PasswordEncryption.generatePassword(newPassword));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
			stmt.setInt(2, id_user);
			stmt.executeUpdate();

			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

}

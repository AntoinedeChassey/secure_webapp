package ets.secure_webapp.dao.impl;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import com.mysql.jdbc.Statement;

import ets.secure_webapp.dao.UserDao;
import ets.secure_webapp.entities.LogPassword;
import ets.secure_webapp.entities.Role;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;
import ets.secure_webapp.utils.PasswordEncryption;

public class UserDaoImpl implements UserDao {

	private MyLogger myLogger = new MyLogger(UserDaoImpl.class.getName());

	private Connection getConnection() throws SQLException {
		return DataSourceProvider.getInstance().getDataSource().getConnection();
	}

	@Override
	public List<User> getUsers() {
		List<User> users = new ArrayList<User>();
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user ORDER BY id_user DESC");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				User user = new User(rs.getInt("id_user"), null, rs.getString("username"), rs.getString("password"),
						rs.getString("surname"), rs.getString("name"), rs.getString("avatar"), rs.getString("country"),
						rs.getTimestamp("date"));
				Integer id_role = rs.getInt("id_role");
				Role role = AppManager.getInstance().getRoleById(id_role);
				user.setRole(role);
				users.add(user);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Log
		myLogger.log(Level.INFO, "getUsers");
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
				User user = new User(rs.getInt("id_user"), null, rs.getString("username"), rs.getString("password"),
						rs.getString("surname"), rs.getString("name"), rs.getString("avatar"), rs.getString("country"),
						rs.getTimestamp("date"));
				Integer id_role = rs.getInt("id_role");
//				try {
//					PreparedStatement stmtRole = connection.prepareStatement("SELECT * FROM role WHERE id_role=?");
//					stmtRole.setInt(1, id_role);
//					ResultSet rsRole = stmtRole.executeQuery();
//					if (rsRole.next()) {
//						Role role = new Role(rsRole.getInt("id_role"), rsRole.getString("name"),
//								rsRole.getInt("maxInactiveInterval"));
//						user.setRole(role);
//						connection.close();
//						// Log
//						myLogger.log(Level.INFO, "getUserByUsername - " + user.getUsername());
//						return user;
//					}
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
				Role role = AppManager.getInstance().getRoleById(id_role);
				user.setRole(role);
				connection.close();
				// Log
				myLogger.log(Level.INFO, "getUserByUsername - " + user.getUsername());
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean setUserPassword(Integer id_user, String newPassword) {
		List<LogPassword> logs = new ArrayList<>();
		try {
			Connection connection = getConnection();
			// LIMIT 3 -> Checks if user input a different password within the 3 last ones
			PreparedStatement stmt = connection
					.prepareStatement("SELECT * FROM log_password WHERE id_user=? ORDER BY date DESC LIMIT 3");
			stmt.setInt(1, id_user);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				LogPassword log = new LogPassword(rs.getInt("id_log_password"), rs.getInt("id_user"),
						rs.getString("password"), rs.getTimestamp("date"));
				logs.add(log);
			}

			try {
				if (userCanChangePassword(logs, newPassword)) {
					try {
						PreparedStatement stmt2 = connection
								.prepareStatement("UPDATE user SET password=? WHERE id_user=?");
						String encryptedPassword = null;
						try {
							encryptedPassword = PasswordEncryption.generatePassword(newPassword);
							stmt2.setString(1, encryptedPassword);
						} catch (NoSuchAlgorithmException e) {
							e.printStackTrace();
						} catch (InvalidKeySpecException e) {
							e.printStackTrace();
						}
						stmt2.setInt(2, id_user);
						stmt2.executeUpdate();
						if (encryptedPassword != null)
							if (addLogPassword(id_user, encryptedPassword)) {
								connection.close();
								// Log
								myLogger.log(Level.INFO, "setUserPassword - id_user: " + id_user);
								return true;
							}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return false;
				}
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.err.println("User has to set a different password!");
		return false;
	}

	@Override
	public boolean addUser(User newUser, Integer id_role) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user WHERE username=?");
			stmt.setString(1, newUser.getUsername());

			ResultSet rs = stmt.executeQuery();
			if (!rs.next()) {
				try {
					PreparedStatement stmt2 = connection.prepareStatement(
							"INSERT INTO user(id_role, username, password, surname, name, avatar, country) VALUES(?,?,?,?,?,?,?)",
							Statement.RETURN_GENERATED_KEYS);
					// Setting id_role to 2
					stmt2.setInt(1, id_role);
					stmt2.setString(2, newUser.getUsername());
					String encryptedPassword = null;
					try {
						encryptedPassword = PasswordEncryption.generatePassword(newUser.getPassword());
						stmt2.setString(3, encryptedPassword);
					} catch (NoSuchAlgorithmException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (InvalidKeySpecException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

					stmt2.setString(4, newUser.getSurname());
					stmt2.setString(5, newUser.getName());
					stmt2.setString(6, newUser.getAvatar());
					stmt2.setString(7, newUser.getCountry());
					stmt2.executeUpdate();
					connection.close();
					User createdUser = getUserByUsername(newUser.getUsername());

					if (encryptedPassword != null)
						if (addLogPassword(createdUser.getId_user(), encryptedPassword)) {
							if (initLogConnection(createdUser.getId_user())) {
								myLogger.log(Level.INFO, "addUser :" + createdUser.getUsername());
								return true;
							}
						}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				System.err.println("User already exists !");
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		myLogger.log(Level.SEVERE, "addUser : could not create new user");
		return false;
	}

	// Private methods

	private boolean addLogPassword(Integer id_user, String encryptedPassword) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement(
					"INSERT INTO log_password(id_user, password) VALUES(?,?)", Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, id_user);
			stmt.setString(2, encryptedPassword);
			stmt.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean initLogConnection(Integer id_user) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO log_connection(id_user) VALUES(?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, id_user);
			stmt.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean userCanChangePassword(List<LogPassword> logs, String newPassword)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		for (LogPassword log : logs) {
			if (PasswordEncryption.validatePassword(newPassword, log.getPassword()))
				return false;
		}
		return true;
	}

	@Override
	public User getUserById(Integer id_user) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM user WHERE id_user=?");
			stmt.setInt(1, id_user);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				User user = new User(rs.getInt("id_user"), null, rs.getString("username"), rs.getString("password"),
						rs.getString("surname"), rs.getString("name"), rs.getString("avatar"), rs.getString("country"),
						rs.getTimestamp("date"));
				Integer id_role = rs.getInt("id_role");
				
				Role role = AppManager.getInstance().getRoleById(id_role);
				user.setRole(role);
				connection.close();
				// Log
				myLogger.log(Level.INFO, "getUserById - " + user.getUsername());
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}

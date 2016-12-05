package ets.secure_webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import com.mysql.jdbc.Statement;

import ets.secure_webapp.dao.SecurityDao;
import ets.secure_webapp.entities.Ban;
import ets.secure_webapp.entities.LogConnection;
import ets.secure_webapp.entities.LogPassword;
import ets.secure_webapp.utils.MyLogger;

public class SecurityDaoImpl implements SecurityDao {

	private MyLogger myLogger = new MyLogger(SecurityDaoImpl.class.getName());

	private Connection getConnection() throws SQLException {
		return DataSourceProvider.getInstance().getDataSource().getConnection();
	}

	@Override
	public LogConnection getConnectionLogByUserId(Integer id_user) {
		LogConnection log = null;
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM log_connection WHERE id_user=?");
			stmt.setInt(1, id_user);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				log = new LogConnection(rs.getInt("id_log_connection"), rs.getInt("id_user"), rs.getInt("phase"),
						rs.getInt("attempts"), rs.getTimestamp("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log;
	}

	@Override
	public boolean incrementLogConnection(Integer id_user) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection
					.prepareStatement("UPDATE log_connection SET attempts=attempts+1, date=? WHERE id_user=?");
			stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			stmt.setInt(2, id_user);
			stmt.executeUpdate();
			connection.close();
			myLogger.log(Level.WARNING,
					"User: id_user - " + id_user + " bad authentification, incrementing connection logs!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean resetLogConnectionAttempts(Integer id_user) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection
					.prepareStatement("UPDATE log_connection SET attempts=0 WHERE id_user=?");
			stmt.setInt(1, id_user);
			stmt.executeUpdate();
			connection.close();
			myLogger.log(Level.INFO, "Admin for id_user - " + id_user + " reset connection attempts!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean setLogConnectionPhase(Integer id_user, Integer phase) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("UPDATE log_connection SET phase=? WHERE id_user=?");
			stmt.setInt(1, phase);
			stmt.setInt(2, id_user);
			stmt.executeUpdate();
			connection.close();
			myLogger.log(Level.INFO, "Admin for id_user - " + id_user + " set connection phase to " + phase + "!");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<LogConnection> getLogConnections() {
		List<LogConnection> logConnections = new ArrayList<LogConnection>();
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM log_connection ORDER BY id_user DESC");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				LogConnection logConnection = new LogConnection(rs.getInt("id_log_connection"), rs.getInt("id_user"),
						rs.getInt("phase"), rs.getInt("attempts"), rs.getTimestamp("date"));
				logConnections.add(logConnection);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Log
		myLogger.log(Level.INFO, "getLogConnections");
		return logConnections;
	}

	@Override
	public boolean addBan(Ban newBan) {
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ban WHERE ip=?");
			stmt.setString(1, newBan.getIp());

			ResultSet rs = stmt.executeQuery();
			if (!rs.next()) {
				try {
					PreparedStatement stmt2 = connection.prepareStatement("INSERT INTO ban(ip, date) VALUES(?,?)",
							Statement.RETURN_GENERATED_KEYS);
					stmt2.setString(1, newBan.getIp());
					stmt2.setTimestamp(2, newBan.getDate());
					stmt2.executeUpdate();
					connection.close();
					return true;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				System.err.println("Ban already exists for this IP: " + newBan.getIp());
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		myLogger.log(Level.SEVERE, "addBan : could not create new ban");
		return false;
	}

	@Override
	public List<Ban> getBans() {
		List<Ban> bans = new ArrayList<>();
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ban ORDER BY date DESC");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Ban ban = new Ban(rs.getInt("id_ban"), rs.getString("ip"), rs.getTimestamp("date"));
				bans.add(ban);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// Log
		myLogger.log(Level.INFO, "getBans");
		return bans;
	}

	@Override
	public LogPassword getPasswordLogByUserId(Integer id_user) {
		LogPassword log = null;
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM log_password WHERE id_user=? ORDER BY date DESC LIMIT 1");
			stmt.setInt(1, id_user);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				log = new LogPassword(rs.getInt("id_log_password"), rs.getInt("id_user"), rs.getString("password"),
						rs.getTimestamp("date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return log;
	}
}

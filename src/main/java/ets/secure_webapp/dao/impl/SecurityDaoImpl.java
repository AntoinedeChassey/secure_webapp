package ets.secure_webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import ets.secure_webapp.dao.SecurityDao;
import ets.secure_webapp.entities.LogConnection;
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
		myLogger.log(Level.INFO, "getConnectionLogs");
		return logConnections;
	}
}

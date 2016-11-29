package ets.secure_webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ets.secure_webapp.dao.RoleDao;
import ets.secure_webapp.entities.Role;

public class RoleDaoImpl implements RoleDao {

	private Connection getConnection() throws SQLException {
		return DataSourceProvider.getInstance().getDataSource().getConnection();
	}

	@Override
	public List<Role> getRoles() {
		List<Role> roles = new ArrayList<Role>();
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM role");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Role role = new Role(rs.getInt("id_role"), rs.getString("name"), rs.getInt("maxInactiveInterval"),
						rs.getInt("maxAttempts"), rs.getLong("maxTimeForPhase1"));
				roles.add(role);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return roles;
	}

	@Override
	public Role getRoleById(Integer id_role) {
		Role role = null;
		try {
			Connection connection = getConnection();
			PreparedStatement stmt = connection.prepareStatement("SELECT * FROM role WHERE id_role = ?");
			stmt.setInt(1, id_role);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				role = new Role(rs.getInt("id_role"), rs.getString("name"), rs.getInt("maxInactiveInterval"),
						rs.getInt("maxAttempts"), rs.getLong("maxTimeForPhase1"));
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return role;
	}
}

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
				Role role = new Role(rs.getInt("id_role"), rs.getString("name"), rs.getInt("maxInactiveInterval"));
				roles.add(role);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return roles;
	}
}

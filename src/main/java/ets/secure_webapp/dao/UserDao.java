package ets.secure_webapp.dao;

import java.util.List;

import ets.secure_webapp.entities.User;

public interface UserDao {

	public List<User> getUsers();

	public User getUserByUsername(String username);
	
	public User setUserPassword(Integer id_user, String newPassword);
}

package ets.secure_webapp.dao;

import java.util.List;

import ets.secure_webapp.entities.User;

public interface UserDao {

	public List<User> getUsers();

	public User getUserByUsername(String username);

	public boolean setUserPassword(Integer id_user, String newPassword);

	public boolean addUser(User newUser, Integer id_role);

	public User getUserById(Integer id_user);
}

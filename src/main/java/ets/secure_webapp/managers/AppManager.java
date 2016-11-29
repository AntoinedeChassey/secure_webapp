package ets.secure_webapp.managers;

import java.util.List;

import ets.secure_webapp.dao.RoleDao;
import ets.secure_webapp.dao.UserDao;
import ets.secure_webapp.dao.impl.RoleDaoImpl;
import ets.secure_webapp.dao.impl.UserDaoImpl;
import ets.secure_webapp.entities.Role;
import ets.secure_webapp.entities.User;

public class AppManager {

	private static AppManager instance;

	public static AppManager getInstance() {
		if (instance == null) {
			instance = new AppManager();
		}
		return instance;
	}

	private UserDao userDao = new UserDaoImpl();
	private RoleDao roleDao = new RoleDaoImpl();

	private AppManager() {
	}

	// User methods

	public List<User> getUsers() {
		return userDao.getUsers();
	}

	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	public boolean setUserPassword(Integer id_user, String newPassword) {
		return userDao.setUserPassword(id_user, newPassword);
	}

	public boolean addUser(User newUser) {
		return userDao.addUser(newUser);
	}

	// Role methods

	public List<Role> getRoles() {
		return roleDao.getRoles();
	}
}

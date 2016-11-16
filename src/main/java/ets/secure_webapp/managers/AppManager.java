package ets.secure_webapp.managers;

import java.util.List;

import ets.secure_webapp.dao.UserDao;
import ets.secure_webapp.dao.impl.UserDaoImpl;
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

	private AppManager() {
	}

	// User methods

	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	public User setUserPassword(Integer id_user, String newPassword) {
		return userDao.setUserPassword(id_user, newPassword);
	}
}

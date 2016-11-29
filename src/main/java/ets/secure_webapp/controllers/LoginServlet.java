package ets.secure_webapp.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.LogConnection;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;
import ets.secure_webapp.utils.PasswordEncryption;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -8480593309360208929L;

	private MyLogger myLogger = new MyLogger(LoginServlet.class.getName());

	private Map<String, String> authorizedUsers;

	@Override
	public void init() throws ServletException {

		authorizedUsers = new HashMap<>();

		List<User> users = AppManager.getInstance().getUsers();
		for (int i = 0; i < users.size(); i++) {
			authorizedUsers.put(users.get(i).getUsername(), users.get(i).getPassword());
		}
		System.out.println(authorizedUsers);

		// Database init
//		User admin = new User(null, null, "admin@test.com", "admin", "Best", "Admin", "./img/users/test.png", "Canada",
//				null);
//		User userCarre = new User(null, null, "usercarre@test.com", "user", "Carre", "User", "./img/users/profile.png",
//				"Canada", null);
//		User userCercle = new User(null, null, "usercercle@test.com", "user", "Cercle", "Cercle",
//				"./img/users/profile.png", "France", null);
//
//		AppManager.getInstance().addUser(admin);
//		AppManager.getInstance().addUser(userCarre);
//		AppManager.getInstance().addUser(userCercle);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		init();

		User user = (User) request.getSession().getAttribute("connectedUser");
		if (user == null || "".equals(user)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/login.jsp");
			view.forward(request, response);
		} else {
			try {

				System.out.println(
						"[INFO] - Default maxInactiveInterval: " + request.getSession().getMaxInactiveInterval());
				System.out.println("[INFO] - Setting maxInactiveInterval: " + user.getRole().getMaxInactiveInterval());
				request.getSession().setMaxInactiveInterval(user.getRole().getMaxInactiveInterval());
				response.sendRedirect("home");
			} catch (Exception e) {
				// e.printStackTrace();
				System.err.println("[ERROR] - No users in session !");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String usernameInput = request.getParameter("username");
		String passwordInput = request.getParameter("password");

		User user = AppManager.getInstance().getUserByUsername(usernameInput);

		if (user != null) {
			try {
				// If the user entered the correct login association and if he
				// has
				// attempted less than 5 times
				if (authorizedUsers.containsKey(usernameInput)
						&& PasswordEncryption.validatePassword(passwordInput, authorizedUsers.get(usernameInput))
						&& userIsAllowedToConnect(user)) {

					// Resetting logs
					AppManager.getInstance().resetLogConnectionAttempts(user.getId_user());
					AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 0);

					System.out.println("[INFO] - Saving user attributes to session...");
					request.getSession().setAttribute("connectedUser", user);
					System.out.println("ID en session: " + user.getId_user());
					// Log
					myLogger.log(Level.INFO, "Successful authentification with USERNAME: " + usernameInput
							+ " and PASSWORD: " + passwordInput);
				} else {
					AppManager.getInstance().incrementLogConnection(user.getId_user());
					System.err.println("[ERROR] - Could not authenticate !");
					// Log
					myLogger.log(Level.SEVERE, "Unsuccessful authentification with USERNAME: " + usernameInput
							+ " and PASSWORD: " + passwordInput);
				}
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
		} else {
			// Log
			myLogger.log(Level.SEVERE, "User is not in DB: " + usernameInput);
		}
		this.doGet(request, response);
	}

	private boolean userIsAllowedToConnect(User user) {
		LogConnection log = AppManager.getInstance().getConnectionLogByUserId(user.getId_user());
		Integer maxAttempts = user.getRole().getMaxAttempts();
		Long maxTimeForPhase1 = user.getRole().getMaxTimeforPhase1();

		// If phase 1, maxAttempts reached, maxTime between attempts reached
		if (log.getPhase() == 1 && (log.getAttempts() > maxAttempts)
				&& (System.currentTimeMillis() - log.getDate().getTime()) > maxTimeForPhase1) {
			// Setting to phase 2, blocked
			AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 2);
			log.setPhase(2);
		}

		if (log.getPhase() == 0 && (log.getAttempts() < maxAttempts)) {
			System.out.println("log.getAttempts() < maxAttempts");
			return true;
		}
		// Setting to phase 1 and reseting attempts because user is not phase 0
		// and reached maxAttempts
		AppManager.getInstance().resetLogConnectionAttempts(user.getId_user());
		AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 1);
		log.setPhase(1);

		// If phase 1, maxAttempts not reached, maxTime between attempts reached
		if (log.getPhase() == 1 && (System.currentTimeMillis() - log.getDate().getTime()) > maxTimeForPhase1) {
			System.out.println("log.getAttempts() < maxAttempts");
			return true;
		}

		// Phase 2 -> directly return false
		else if (log.getPhase() == 2) {
			System.out.println("log.getPhase() == 2");
			return false;
		}
		return false;
	}
}
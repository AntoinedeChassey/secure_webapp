package ets.secure_webapp.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Map;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.LogConnection;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;
import ets.secure_webapp.utils.PasswordEncryption;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -8480593309360208929L;

	private MyLogger myLogger = new MyLogger(LoginServlet.class.getName());

	@Override
	public void init() throws ServletException {

		// Database init
		// User admin = new User(null, null, "admin@test.com", "admin", "Best",
		// "Admin", "./img/users/test.png", "Canada",
		// null);
		// User userCarre = new User(null, null, "usercarre@test.com", "user",
		// "Carre", "User", "./img/users/profile.png",
		// "Canada", null);
		// User userCercle = new User(null, null, "usercercle@test.com", "user",
		// "Cercle", "Cercle",
		// "./img/users/profile.png", "France", null);
		//
		// AppManager.getInstance().addUser(admin);
		// AppManager.getInstance().addUser(userCarre);
		// AppManager.getInstance().addUser(userCercle);

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// Send status to the LoginFilter
		session.setAttribute("isLoginSuccess", false);
		// Setting reauthentication to false by default
		session.setAttribute("isReAuthenticateSuccess", false);
		
		// init();

		// Get user status from LoginFilter
		// Integer phase = (Integer) request.getSession().getAttribute("phase");
		// Long waitTimeRemaining = (Long)
		// request.getSession().getAttribute("waitTimeRemaining");
		// Integer attemptsRemaining = (Integer)
		// request.getSession().getAttribute("attemptsRemaining");

		User user = (User) session.getAttribute("connectedUser");

		if (user == null || "".equals(user)) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/login.jsp");
			view.forward(request, response);
		} else {
			try {
				System.out.println(
						"[INFO] - Default maxInactiveInterval: " + request.getSession().getMaxInactiveInterval());
				System.out.println("[INFO] - Setting maxInactiveInterval: " + user.getRole().getMaxInactiveInterval());
				session.setMaxInactiveInterval(user.getRole().getMaxInactiveInterval());
				response.sendRedirect("home");
			} catch (Exception e) {
				// e.printStackTrace();
				// System.err.println("[ERROR] - No users in session !");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String usernameInput = request.getParameter("username");
		String passwordInput = request.getParameter("password");

		// Try to get the last usernameInput and check if user can be in the
		// authorizedUsers to connect
		User userInput = AppManager.getInstance().getUserByUsername(usernameInput);
		if (userInput != null) {

			LogConnection log = AppManager.getInstance().getConnectionLogByUserId(userInput.getId_user());
			Integer currentPhase = log.getPhase();
			Integer maxAttempts = userInput.getRole().getMaxAttempts();
			Long maxTimeForPhase1 = userInput.getRole().getMaxTimeForPhase1();
			Long timeWaited = (System.currentTimeMillis() - log.getDate().getTime());
			Integer attemptsLeft = 0;
			if (currentPhase != 2) {
				attemptsLeft = maxAttempts - log.getAttempts() - 1; // doPost
																	// is
																	// a
																	// try
																	// already
			}
			session.setAttribute("phase", currentPhase);
			session.setAttribute("attemptsLeft", attemptsLeft);

			if ((timeWaited <= maxTimeForPhase1) && (currentPhase == 1)) {
				Long waitTimeLeft = maxTimeForPhase1 - timeWaited;
				// Setting attribute waitTimeLeft in seconds
				request.getSession().setAttribute("waitTimeLeft", waitTimeLeft / 1000);
			}
		}

		@SuppressWarnings("unchecked")
		Map<String, String> authorizedUsers = (Map<String, String>) request.getSession()
				.getAttribute("authorizedUsers");
		System.out.println(authorizedUsers);

		// Get user status from LoginFilter
		Integer phase = (Integer) session.getAttribute("phase");
		Long waitTimeLeft = (Long) session.getAttribute("waitTimeLeft");
		// Integer attemptsLeft = (Integer)
		// request.getSession().getAttribute("attemptsLeft");

		if (waitTimeLeft <= 0 && phase != 2) {
			try {
				if ( userInput != null && passwordInput != null && authorizedUsers.containsKey(usernameInput)
						&& PasswordEncryption.validatePassword(passwordInput, authorizedUsers.get(usernameInput))) {

					User user = AppManager.getInstance().getUserByUsername(usernameInput);

					// Resetting connection logs and attributes
					AppManager.getInstance().resetLogConnectionAttempts(user.getId_user());
					AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 0);
					session.setAttribute("phase", 0);
					session.setAttribute("waitTimeLeft", 0L);
					session.setAttribute("attemptsLeft", 100);

					// System.out.println("[INFO] - Saving user attributes to
					// session...");
					session.setAttribute("connectedUser", user);
					// System.out.println("ID en session: " +
					// user.getId_user());
					// Log info
					myLogger.log(Level.INFO, "Successful authentication with USERNAME: " + usernameInput
							+ " and PASSWORD: " + passwordInput);

					// Send status to the LoginFilter
					session.setAttribute("isLoginSuccess", true);

				} else {
					// Log
					myLogger.log(Level.WARNING, "Unsuccessful authentication with USERNAME: " + usernameInput
							+ " and PASSWORD: " + passwordInput);
					// Store the username to verify bruteforcing in the
					// LoginFilter
					session.setAttribute("usernameInput", usernameInput);
					// Send status to the LoginFilter
					session.setAttribute("isLoginSuccess", false);

				}
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			// Log
			myLogger.log(Level.WARNING, "POST rejected for input - " + usernameInput);
		}
		this.doGet(request, response);
	}
}
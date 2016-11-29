package ets.secure_webapp.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.PasswordEncryption;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = -8480593309360208929L;

	private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
	private static final boolean IS_WINDOWS = System.getProperty("os.name").contains("indow");

	private Map<String, String> authorizedUsers;

	@Override
	public void init() throws ServletException {
		// Initialize logger
		try {
			// This block configure the logger with handler and formatter
			ClassLoader classLoader = getClass().getClassLoader();
			String filePath = classLoader.getResource("ServerLog.log").getFile();
			// Remove <:> for Windows systems to match the correct filepath
			String osAppropriatePath = IS_WINDOWS ? filePath.substring(1) : filePath;
			FileHandler fh = new FileHandler(osAppropriatePath, true);
			logger.addHandler(fh);
			logger.setLevel(Level.ALL);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		authorizedUsers = new HashMap<>();

		List<User> users = AppManager.getInstance().getUsers();
		for (int i = 0; i < users.size(); i++) {
			authorizedUsers.put(users.get(i).getUsername(), users.get(i).getPassword());
		}
		System.out.println(authorizedUsers);
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
				response.sendRedirect("welcome");
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

		try {
			if (authorizedUsers.containsKey(usernameInput)
					&& PasswordEncryption.validatePassword(passwordInput, authorizedUsers.get(usernameInput))) {

				System.out.println("[INFO] - Saving user attributes to session...");
				User user = AppManager.getInstance().getUserByUsername(usernameInput);
				request.getSession().setAttribute("connectedUser", user);
				System.out.println("ID en session: " + user.getId_user());
				// log
				logger.info("Successful authentification with USERNAME: " + usernameInput + " & PASSWORD: "
						+ passwordInput);
			} else {
				System.err.println("[ERROR] - Could not authenticate !");
				// log
				logger.info("Unsuccessful authentification with USERNAME: " + usernameInput + " & PASSWORD: "
						+ passwordInput);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		this.doGet(request, response);
	}
}
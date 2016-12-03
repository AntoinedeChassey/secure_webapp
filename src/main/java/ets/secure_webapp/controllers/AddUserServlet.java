package ets.secure_webapp.controllers;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.validator.EmailValidator;

import com.mysql.jdbc.StringUtils;

import ets.secure_webapp.entities.Role;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;

@WebServlet("/addUser")
public class AddUserServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	private MyLogger myLogger = new MyLogger(AddUserServlet.class.getName());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		HttpSession session = request.getSession();

		List<Role> roles = AppManager.getInstance().getRoles();
		session.setAttribute("roles", roles);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/addUser.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String id_role = request.getParameter("id_role");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String surname = request.getParameter("surname");
		String name = request.getParameter("name");
		String country = request.getParameter("country");

		User connectedUser = (User) session.getAttribute("connectedUser");
		User newUser = new User(null, null, username, password, surname, name, "./img/users/profile.png", country,
				null);

		/**
		 * Back-end input checking for better security
		 * 
		 * Checks all inputs form (String, Integer, Valid email...) Checks if
		 * user is in session Checks if user is admin
		 */
		if (isPasswordValid(password) && isUsernameValid(username) && isIntegerValid(id_role) && isStringValid(surname)
				&& isStringValid(name) && isStringValid(country) && connectedUser != null && connectedUser.isAdmin()) {
			if (AppManager.getInstance().addUser(newUser, Integer.parseInt(id_role))) {
				// Log
				myLogger.log(Level.INFO, "New user added successfully.");
				session.setAttribute("messageCallback", "New user has been successfully added!");
				// Removing attribute to activate filter again
				session.setAttribute("isReAuthenticateSuccess", false);
				response.sendRedirect("home");
			} else {
				// Log
				myLogger.log(Level.INFO, "New user could not be added, probably already exists!");
				session.setAttribute("messageCallback",
						"There has been an error while trying to add a new user, double check he does not already exist.");
				this.doGet(request, response);
			}
		} else {
			// Log
			myLogger.log(Level.SEVERE, "New user could not be added because of bad inputs!");
			session.setAttribute("messageCallback", "There has been an error while trying to add a new user.");
			this.doGet(request, response);
		}
	}

	private boolean isIntegerValid(String id_role) {
		if (id_role.length() == 1 && StringUtils.isStrictlyNumeric(id_role))
			return true;
		else
			return false;
	}

	private boolean isStringValid(String str) {
		String regex = "^[a-zA-Z\\s]+$";
		if (str.matches(regex) && str.length() <= 10)
			return true;
		else
			return false;
	}

	private boolean isUsernameValid(String username) {
		// Checking if username is a correct email
		return EmailValidator.getInstance().isValid(username);
	}

	public boolean isPasswordValid(String newPassword) {
		if (newPassword.length() <= 7) {
			System.out.println("too_short");
			return false;
		} else if (newPassword.length() >= 20) {
			System.out.println("too_long");
			return false;
		} else if (!newPassword.matches(".*\\d.*")) {
			System.out.println("no_num");
			return false;
		} else if (!newPassword.matches(".*[A-Z].*")) {
			System.out.println("no_upper_letter");
			return false;
		} else if (!newPassword.matches(".*[a-z].*")) {
			System.out.println("no_lower_letter");
			return false;
		} else if (!checkSpecialChar(newPassword)) {
			System.out.println("no_special_char");
			return false;
		}
		return true;
	}

	private boolean checkSpecialChar(String newPassword) {
		String specialChars = "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-=";

		for (int i = 0; i < specialChars.length(); i++) {
			if (newPassword.indexOf(specialChars.charAt(i)) > -1) {
				return true;
			}
		}
		return false;
	}
}

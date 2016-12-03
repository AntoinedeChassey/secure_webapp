package ets.secure_webapp.controllers;

import java.io.IOException;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;

@WebServlet("/setPassword")
public class SetPasswordServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	private MyLogger myLogger = new MyLogger(SetPasswordServlet.class.getName());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/setPassword.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String newPassword = request.getParameter("newPassword");
		User connectedUser = (User) session.getAttribute("connectedUser");

		/**
		 * Back-end input checking for better security
		 */
		if (isPasswordValid(newPassword)) {
			if (AppManager.getInstance().setUserPassword(connectedUser.getId_user(), newPassword)) {
				// Log
				myLogger.log(Level.INFO,
						"User [" + connectedUser.getUsername() + "] password successfully set to " + newPassword);
				session.setAttribute("messageCallback", "New password has been successfully set!");
			} else {
				// Log
				myLogger.log(Level.INFO,
						"User [" + connectedUser.getUsername() + "] password could not be set to " + newPassword);
				session.setAttribute("messageCallback",
						"Please enter a different password from the ones you already used.");
			}
		}
		this.doGet(request, response);
		// response.sendRedirect("home");
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

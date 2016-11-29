package ets.secure_webapp.controllers;

import java.io.IOException;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;

@WebServlet("/home")
public class HomeServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	private MyLogger myLogger = new MyLogger(HomeServlet.class.getName());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String newPassword = request.getParameter("newPassword");
		User connectedUser = (User) request.getSession().getAttribute("connectedUser");

		if (newPassword.length() >= 8) {
			if (AppManager.getInstance().setUserPassword(connectedUser.getId_user(), newPassword)) {
				// Log
				myLogger.log(Level.INFO,
						"User [" + connectedUser.getUsername() + "] password successfully modified to " + newPassword);
			} else {
				// Log
				myLogger.log(Level.INFO,
						"User [" + connectedUser.getUsername() + "] password could not be modified to " + newPassword);
			}
		}

		this.doGet(request, response);
	}
}

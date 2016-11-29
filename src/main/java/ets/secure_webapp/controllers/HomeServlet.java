package ets.secure_webapp.controllers;

import java.io.IOException;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.utils.MyLogger;

@WebServlet("/home")
public class HomeServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	private MyLogger myLogger = new MyLogger(HomeServlet.class.getName());
	private User connectedUser;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);

		connectedUser = (User) request.getSession().getAttribute("connectedUser");
		request.setAttribute("user", connectedUser);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String newPassword = request.getParameter("newPassword");

		/*
		 * User user = AppManager.getInstance().setUserPassword(id_user,
		 * newPassword); request.getSession().setAttribute("connectedUser",
		 * user);
		 */
		System.out.println("ID en session: " + connectedUser.getId_user());
		System.out.println("New password: " + newPassword + " for user " + connectedUser.getUsername());
		// log
		myLogger.log(Level.INFO,
				"User " + connectedUser.getUsername() + " password successfully modified to " + newPassword);

	}
}

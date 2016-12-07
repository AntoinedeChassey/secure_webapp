package ets.secure_webapp.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.Ban;
import ets.secure_webapp.entities.LogConnection;
import ets.secure_webapp.entities.Role;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;

@WebServlet("/administration")
public class AdministrationServlet extends GenericServlet {

	private static final long serialVersionUID = 6880801727716084460L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);

		HttpSession session = request.getSession();

		// Reseting attribute for filter to be activated
		session.setAttribute("isReAuthenticateSuccess", false);

		List<LogConnection> logConnections = AppManager.getInstance().getLogConnections();
		session.setAttribute("logConnections", logConnections);

		List<User> users = AppManager.getInstance().getUsers();
		session.setAttribute("users", users);

		List<User> blockedUsers = new ArrayList<>();
		for (LogConnection logConnection : logConnections) {
			if (logConnection.getPhase() == 2) {
				User blockedUser = AppManager.getInstance().getUserById(logConnection.getId_user());
				blockedUsers.add(blockedUser);
			}
		}
		session.setAttribute("blockedUsers", blockedUsers);

		List<Ban> bans = AppManager.getInstance().getBans();
		session.setAttribute("bans", bans);
		
		List<LogConnection> logsConnection = AppManager.getInstance().getLogConnections();
		session.setAttribute("logsConnection", logsConnection);
		
		List<Role> roles = AppManager.getInstance().getRoles();
		session.setAttribute("roles", roles);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin.jsp");
		view.forward(request, response);
	}
}
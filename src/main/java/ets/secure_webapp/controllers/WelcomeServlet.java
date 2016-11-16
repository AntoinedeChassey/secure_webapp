package ets.secure_webapp.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.User;

@WebServlet("/welcome")
public class WelcomeServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);

		// List<User> users = ProjectsManager.getInstance().getAllUsers();
		// request.setAttribute("users", users);

		// Get applications of connected id_user
		User user = (User) request.getSession().getAttribute("connectedUser");
		request.setAttribute("user", user);

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
		view.forward(request, response);
	}
}

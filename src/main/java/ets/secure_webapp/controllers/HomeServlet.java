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
}

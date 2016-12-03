package ets.secure_webapp.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cercle")
public class CercleServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);
		
		HttpSession session = request.getSession();

		// Reseting attribute for filter to be activated
		session.setAttribute("isReAuthenticateSuccess", false);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/cercle.jsp");
		view.forward(request, response);
	}
}

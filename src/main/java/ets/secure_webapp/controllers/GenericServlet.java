package ets.secure_webapp.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class GenericServlet extends HttpServlet {

	private static final long serialVersionUID = -3237151023361632888L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// User user = (User)
		// request.getSession().getAttribute("connectedUser");
		// System.out.println(user);
		// if (user == null || "".equals(user)) {
		// RequestDispatcher view =
		// request.getRequestDispatcher("/WEB-INF/login.jsp");
		// view.forward(request, response);
		// }
		// else {
		// System.out.println("coucou?");
		// }

		// } else {
		// // Get connected id_user
		// Integer id_user = (Integer)
		// request.getSession().getAttribute("id_user");
		//
		// request.setAttribute("id_user", id_user);
		// }
	}
}

package ets.secure_webapp.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ets.secure_webapp.entities.User;

public abstract class GenericServlet extends HttpServlet {

	private static final long serialVersionUID = -3237151023361632888L;

	/**
	 * This method is used to get the connected user and use it client side.
	 * This Servlet extends HttpServlet so any page can heritate from it.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User connectedUser = (User) request.getSession().getAttribute("connectedUser");
		request.setAttribute("user", connectedUser);

		// Setting admin attribute for DOM
		if (connectedUser.isAdmin())
			request.setAttribute("admin", true);
		if (connectedUser.getRole().getName().equals("userCarre"))
			request.setAttribute("carre", true);
		if (connectedUser.getRole().getName().equals("userCercle"))
			request.setAttribute("cercle", true);
	}
}

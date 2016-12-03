package ets.secure_webapp.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.utils.MyLogger;
import ets.secure_webapp.utils.PasswordEncryption;

@WebServlet("/reauthenticate")
public class ReAuthenticateServlet extends HttpServlet {

	private static final long serialVersionUID = -8480593309360208929L;

	private MyLogger myLogger = new MyLogger(ReAuthenticateServlet.class.getName());

	@Override
	public void init() throws ServletException {

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/reauthenticate.jsp");
		view.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("connectedUser");

		String passwordInput = request.getParameter("password");

		try {
			if (PasswordEncryption.validatePassword(passwordInput, user.getPassword())) {
				session.setAttribute("isReAuthenticateSuccess", true);
				response.sendRedirect("setPassword");
			} else {
				session.setAttribute("isReAuthenticateSuccess", false);
				this.doGet(request, response);
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
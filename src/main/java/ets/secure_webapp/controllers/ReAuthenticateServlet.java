package ets.secure_webapp.controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;
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
				
		Boolean isReAuthenticateSuccess = (Boolean) session.getAttribute("isReAuthenticateSuccess");
		
		if (isReAuthenticateSuccess == null || isReAuthenticateSuccess == false) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/reauthenticate.jsp");
			view.forward(request, response);
		} else {
			response.sendRedirect("home");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("connectedUser");
		// Refreshing user with latest password (if he possibly changed it)
		user = AppManager.getInstance().getUserById(user.getId_user());
		session.setAttribute("connectedUser", user);

		String passwordInput = request.getParameter("password");

		try {
			if (PasswordEncryption.validatePassword(passwordInput, user.getPassword())) {
				session.setAttribute("isReAuthenticateSuccess", true);
				myLogger.log(Level.INFO, "Reauhtication success for user: " + user.getUsername());
				session.setAttribute("messageCallback",
						"You are now authorized to proceed.");
				this.doGet(request, response);
			} else {
				session.setAttribute("isReAuthenticateSuccess", false);
				myLogger.log(Level.INFO, "Reauhtication failed for user: " + user.getUsername());
				session.setAttribute("messageCallback",
						"You are not authorized to proceed.");
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
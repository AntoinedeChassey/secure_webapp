package ets.secure_webapp.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/home")
public class HomeServlet extends GenericServlet {
	private static final long serialVersionUID = 6880801727716084460L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		super.doGet(request, response);

		HttpSession session = request.getSession();

		// User user = (User) session.getAttribute("connectedUser");

		// // Check last time user changed his password
		// System.out.println("Checking if password must be reset...");
		// LogPassword lastLogPassword =
		// AppManager.getInstance().getPasswordLogByUserId(user.getId_user());
		// Long now = System.currentTimeMillis();
		// Long timeTastModified = lastLogPassword.getDate().getTime();
		// Long lastModified = now - timeTastModified;
		// Long maxTimeForPasswordReset = (long) (30 * 24 * 60 * 1000); // 30
		// // days
		// if (lastModified >= maxTimeForPasswordReset) {
		// RequestDispatcher view =
		// request.getRequestDispatcher("/WEB-INF/setPassword.jsp");
		// view.forward(request, response);
		// } else {
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
		view.forward(request, response);

		// }

		session.removeAttribute("messageCallback");
	}
}

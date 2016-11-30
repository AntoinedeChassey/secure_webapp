package ets.secure_webapp.filters;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import ets.secure_webapp.entities.LogConnection;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;

@WebFilter({ "/login" })

public class LoginFilter implements Filter {

	private Map<String, String> authorizedUsers;
	private Map<String, Integer> connectionAttempts;

	private List<LogConnection> logConnections;
	private int maxAttempts;
	private long maxTimeForPhase1;

	private void init() {
		authorizedUsers = new HashMap<>();
		connectionAttempts = new HashMap<>();

		List<User> users = AppManager.getInstance().getUsers();
		logConnections = AppManager.getInstance().getLogConnections();
		int i = 0;
		for (User user : users) {
			connectionAttempts.put(user.getUsername(), logConnections.get(i).getAttempts());
			// Only store in the authorizedUsers users that are not phase 2
			if (logConnections.get(i).getPhase() != 2)
				authorizedUsers.put(user.getUsername(), user.getPassword());
			i++;
		}
		System.out.println(authorizedUsers);
		System.out.println(connectionAttempts);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;

		init();

		// Reset the usernameInput to avoid incrementation from memory
		httpRequest.getSession().setAttribute("usernameInput", "");

		// Reset the authorizedUsers to take changes if a user tries to
		// bruteforce
		httpRequest.getSession().setAttribute("authorizedUsers", authorizedUsers);

		// Setting attributes to show
		httpRequest.getSession().setAttribute("phase", 0);
		httpRequest.getSession().setAttribute("waitTimeLeft", 0L);
		httpRequest.getSession().setAttribute("attemptsLeft", 0);

		// // Try to get the last usernameInput and check if user can be in the
		// // authorizedUsers to connect
		// String usernameInput = (String)
		// httpRequest.getSession().getAttribute("usernameInput");
		// User user =
		// AppManager.getInstance().getUserByUsername(usernameInput);
		// if (user != null) {
		// // Set the an attribute for the current user phase so he can have
		// // feedback of his status
		// LogConnection log =
		// AppManager.getInstance().getConnectionLogByUserId(user.getId_user());
		// Integer currentPhase = log.getPhase();
		// maxAttempts = user.getRole().getMaxAttempts();
		// maxTimeForPhase1 = user.getRole().getMaxTimeForPhase1();
		// Long timeWaited = (System.currentTimeMillis() -
		// log.getDate().getTime());
		// Integer attemptsLeft = maxAttempts - log.getAttempts();
		//
		// httpRequest.getSession().setAttribute("phase", currentPhase);
		// httpRequest.getSession().setAttribute("attemptsLeft", attemptsLeft);
		//
		// System.out.println("Filter - attempts in DB: " + log.getAttempts());
		// System.out.println("Filter - attempts left: " + attemptsLeft);
		//
		// if ((timeWaited <= maxTimeForPhase1) && (currentPhase != 0)) {
		// Long waitTimeLeft = maxTimeForPhase1 - timeWaited;
		// httpRequest.getSession().setAttribute("waitTimeLeft", waitTimeLeft /
		// 1000); // Setting
		// // to
		// // seconds
		// }
		// }

		// Do pre-servlet work here
		chain.doFilter(request, response);
		// Do post servlet work here

		// Retrieve doPost status
		String usernameInput = (String) httpRequest.getSession().getAttribute("usernameInput");
		boolean isLoginSuccess = (boolean) httpRequest.getSession().getAttribute("isLoginSuccess");

		// System.out.println("FROM doPost: " + usernameInput + " & " +
		// isLoginSuccess);

		if (isLoginSuccess) {
			// Reset the users attempts
			User connectedUser = (User) httpRequest.getSession().getAttribute("connectedUser");
			if (connectedUser != null) {
				System.out.println("LoginFilter: " + connectedUser.getUsername());
				connectionAttempts.put(connectedUser.getUsername(), 0);
			}
		} else {

			int isKnownUser = 0;
			// Try to find if the user is known in DB
			User user = AppManager.getInstance().getUserByUsername(usernameInput);

			// If the user is known, get the correct maxAttempts of his Role
			if (user != null) {
				isKnownUser = 1;
				maxAttempts = AppManager.getInstance().getRoleById(user.getRole().getId_role()).getMaxAttempts();

			} else {
				// Else set the maxAttempts
				maxAttempts = 5;
			}

			// When isLoginSuccess = false
			// We need to simulate the same event if user is known or not so the
			// attacker gets no clue
			switch (isKnownUser) {
			case 0:
				// If username is passed from doPost store the usernames and the
				// number of attempts
				if (usernameInput != null && !"".equals(usernameInput)) {
					// If the username is not already stored, store it and set
					// attempts
					// to 1
					if (!connectionAttempts.containsKey(usernameInput)) {
						connectionAttempts.put(usernameInput, 1);
					} else {
						// Else increment the attempts of the user
						connectionAttempts.put(usernameInput, connectionAttempts.get(usernameInput) + 1);
					}

					// If the user attempts exceed the maxAttempts, process
					// security
					if (connectionAttempts.get(usernameInput) >= maxAttempts) {
						authorizedUsers.remove(usernameInput);
						System.out.println("HERE GOES SECURITY");
					}
				}
				break;

			case 1:
				// If username is passed from doPost store the usernames and the
				// number of attempts
				if (usernameInput != null && !"".equals(usernameInput)) {
					// Increment the attempts of the user
					connectionAttempts.put(usernameInput, connectionAttempts.get(usernameInput) + 1);
					httpRequest.getSession().setAttribute("attemptsLeft", connectionAttempts.get(usernameInput) - 1);
					AppManager.getInstance().incrementLogConnection(user.getId_user());
				}

				// If the user attempts exceed the maxAttempts, process
				// security
				if (connectionAttempts.get(usernameInput) >= maxAttempts) {
					LogConnection log = AppManager.getInstance().getConnectionLogByUserId(user.getId_user());

					// System.out.println("Time check...: "
					// + ((System.currentTimeMillis() - log.getDate().getTime())
					// > maxTimeForPhase1));

					// If user is phase 0, set him to phase 1
					if (log.getPhase() == 0) {
						AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 1);
						AppManager.getInstance().resetLogConnectionAttempts(user.getId_user());
						httpRequest.getSession().setAttribute("phase", 1);
						connectionAttempts.put(usernameInput, 0);
					}

					// If user is phase 1, block him to phase 2 because he
					// reached maxAttempts again
					if (log.getPhase() == 1) {
						AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 2);
						httpRequest.getSession().setAttribute("phase", 2);
						authorizedUsers.remove(usernameInput);
					}

					// Bye bye
					if (log.getPhase() == 2) {
						httpRequest.getSession().setAttribute("phase", 2);
						httpRequest.getSession().setAttribute("attemptsLeft", 0);
					}
				}
			}
		}

		// System.out.println(connectionAttempts);
	}

	@Override
	public void destroy() {
	}
	//
	// private boolean checkIfuserIsAllowedToConnect(User user) {
	// System.out.println("Checking if userIsAllowedToConnect");
	// LogConnection log =
	// AppManager.getInstance().getConnectionLogByUserId(user.getId_user());
	// Integer maxAttempts = user.getRole().getMaxAttempts();
	// Long maxTimeForPhase1 = user.getRole().getMaxTimeForPhase1();
	//
	// // If phase 1, maxAttempts reached, maxTime between attempts reached
	// if (log.getPhase() == 1 && (log.getAttempts() > maxAttempts)
	// && (System.currentTimeMillis() - log.getDate().getTime()) >
	// maxTimeForPhase1) {
	// // Setting to phase 2, blocked
	// AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 2);
	// log.setPhase(2);
	// }
	// //
	// // timeToWaitBeforeNewLogin = 0;
	// // attemptsLeft = maxAttempts - log.getAttempts();
	//
	// // If valid
	// if (log.getPhase() == 0 && (log.getAttempts() < maxAttempts)) {
	// System.out.println("phase 0, attempts < maxAttempts");
	// return true;
	// } else if (log.getPhase() != 1) {
	// // Setting to phase 1 and reseting attempts because user is not
	// // phase 0
	// // and reached maxAttempts
	// AppManager.getInstance().resetLogConnectionAttempts(user.getId_user());
	// AppManager.getInstance().setLogConnectionPhase(user.getId_user(), 1);
	// log.setPhase(1);
	// }
	//
	// // If phase 1, maxAttempts not reached, maxTime between attempts reached
	// if (log.getPhase() == 1 && (System.currentTimeMillis() -
	// log.getDate().getTime()) > maxTimeForPhase1) {
	// System.out.println("phase 1, maxTimeForPhase1 passed");
	// return true;
	// }
	//
	// // Phase 2 -> directly return false
	// else if (log.getPhase() == 2) {
	// System.out.println("log.getPhase() == 2");
	// return false;
	// }
	// long timeToWaitBeforeNewLogin = maxTimeForPhase1 -
	// (System.currentTimeMillis() - log.getDate().getTime());
	// return false;
	// }

}

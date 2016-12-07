package ets.secure_webapp.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ets.secure_webapp.entities.LogPassword;
import ets.secure_webapp.entities.User;
import ets.secure_webapp.managers.AppManager;

@WebFilter({ "/home", "/administration", "/addUser", "/cercle", "/carre" })

public class ForceSetPasswordFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;

		HttpSession session = httpRequest.getSession();

		User user = (User) session.getAttribute("connectedUser");

		// Check last time user changed his password
		System.out.println("Checking if password must be reset...");
		LogPassword lastLogPassword = AppManager.getInstance().getPasswordLogByUserId(user.getId_user());
		Long now = System.currentTimeMillis();
		Long timeTastModified = lastLogPassword.getDate().getTime();
		Long lastModified = now - timeTastModified;
		Long maxTimeForPasswordReset = (long) (50 * 24 * 60 * 1000); // 50
		// days
		if (lastModified >= maxTimeForPasswordReset) {
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			httpResponse.sendRedirect("setPassword");
			return;
		}

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}

}

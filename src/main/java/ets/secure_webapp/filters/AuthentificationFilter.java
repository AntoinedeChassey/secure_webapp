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

import ets.secure_webapp.entities.User;

//@WebFilter({ "/welcome/*", "/user", "/user/*" })
@WebFilter({ "/home" })

public class AuthentificationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;

		User user = (User) httpRequest.getSession().getAttribute("connectedUser");

		if (user == null || "".equals(user)) {
			System.err.println("[ERROR] - User is not connected!");
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			httpResponse.sendRedirect("login");
			return;
		}

		chain.doFilter(request, response);

	}

	@Override
	public void destroy() {
	}

}

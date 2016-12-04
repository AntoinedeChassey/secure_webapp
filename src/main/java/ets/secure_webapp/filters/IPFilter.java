package ets.secure_webapp.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

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

import ets.secure_webapp.controllers.LoginServlet;
import ets.secure_webapp.utils.MyLogger;

@WebFilter({ "/login" })

public class IPFilter implements Filter {

	private FilterConfig config;
	private MyLogger myLogger = new MyLogger(LoginServlet.class.getName());

	public final static List<String> IPs = new ArrayList<>();

	public IPFilter() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {

		this.config = filterConfig;

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		String clientIP = request.getRemoteAddr();

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession();

		// Check delay
		Long now = (Long) System.currentTimeMillis();
		Long lastPost = (Long) session.getAttribute("lastPost");
		if (lastPost != null) {
			Long delay = now - lastPost;
			if (delay >= 0 && delay <= 1000)
				IPs.add(clientIP);
		}

		boolean result = false;
		for (String IP : IPs) {
			if (clientIP.equals(IP)) {
				result = true;
				break;
			}
		}
		if (result) {
			// Log
			myLogger.log(Level.SEVERE, "Trying to bruteforce with this IP: " + clientIP);
			httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Don't even try me!");
		} else {
			chain.doFilter(request, response);
		}

	}// doFilter

	public void destroy() {
		/*
		 * called before the Filter instance is removed from service by the web
		 * container
		 */
	}

}
package ets.secure_webapp.filters;

import java.io.IOException;
import java.sql.Timestamp;
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
import ets.secure_webapp.entities.Ban;
import ets.secure_webapp.managers.AppManager;
import ets.secure_webapp.utils.MyLogger;

@WebFilter({ "/login" })

public class IPFilter implements Filter {

	private FilterConfig config;
	private MyLogger myLogger = new MyLogger(LoginServlet.class.getName());
	private List<Ban> IPs = new ArrayList<>();

	public IPFilter() {
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		IPs = AppManager.getInstance().getBans();

		String clientIP = request.getRemoteAddr();

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession();

		// Check delay
		Long now = (Long) System.currentTimeMillis();
		Long lastPost = (Long) session.getAttribute("lastPost");
		if (lastPost != null) {
			Long delay = now - lastPost;
			if (delay >= 0 && delay <= 1000) {
				Ban newBan = new Ban(null, clientIP, new Timestamp(now));
				AppManager.getInstance().addBan(newBan);
				IPs.add(newBan);
			}
		}

		boolean result = false;
		for (int i = 0; i < IPs.size(); i++) {
			if (clientIP.equals(IPs.get(i).getIp())) {
				result = true;
				break;
			}
		}
		if (result) {
			// Log
			myLogger.log(Level.SEVERE, "Blocking this IP: " + clientIP);
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
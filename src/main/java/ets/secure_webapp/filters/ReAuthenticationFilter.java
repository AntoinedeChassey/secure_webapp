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

/**
 * All paths below will be filtered and prompted for password
 */
@WebFilter({ "/setPassword" })

public class ReAuthenticationFilter implements Filter {

	private Boolean isReAuthenticateSuccess;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		HttpSession session = httpRequest.getSession();
		
		isReAuthenticateSuccess = (Boolean) session.getAttribute("isReAuthenticateSuccess");
		if (!isReAuthenticateSuccess) {
			httpResponse.sendRedirect("reauthenticate");
			return;
		}

		// Before servlet
		chain.doFilter(request, response);
		// After servlet
	}

	@Override
	public void destroy() {
	}

}

package com.sectooladdict.filters;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class ObsoleteFileCustomFileNotFoundErrorFilter
 */
public class ObsoleteFileCustomFileNotFoundErrorFilter implements Filter {

	/**
	 * Default constructor. 
	 */
	public ObsoleteFileCustomFileNotFoundErrorFilter() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * The local filter config object, used to access the local servlet context. 
	 */
	FilterConfig config;
	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		setFilterConfig(fConfig);
	}
	
	public void setFilterConfig(FilterConfig newConfig) {
		this.config = newConfig;
	}
	
	public FilterConfig getFilterConfig() {
		return this.config;
	}
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}	
	

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		InputStream is = null;
		String filePath = httpRequest.getPathInfo();

		if(filePath == null) {
			filePath = "";
		}
		
		if(getFilterConfig() != null) {
			is = getFilterConfig().getServletContext().getResourceAsStream(
					httpRequest.getServletPath().toString() + filePath);		
		} 
		
		if (is == null) {
			PrintWriter out = response.getWriter();
			out.println("<h1>Sorry, we can't seem to find what you were looking for...</h1>");
			//out.println("<h1>file not found: " 
			//		+ httpRequest.getServletPath().toString() + filePath + "</h1>");
			//out.println("<br>");
			//out.println(httpRequest.getServletPath().toString());
			//out.println(httpRequest.getPathInfo());
			
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		} // end of inner if/else block
	} // end of inner if/else block

} //end of Filter

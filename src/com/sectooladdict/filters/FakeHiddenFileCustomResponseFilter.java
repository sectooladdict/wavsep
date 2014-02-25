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

/**
 * Servlet Filter implementation class FakeHiddenFileCustomResponseFilter
 */
public class FakeHiddenFileCustomResponseFilter implements Filter {

    /**
     * Default constructor. 
     */
    public FakeHiddenFileCustomResponseFilter() {
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
		//Present a consistent static response, to any URL access
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<title>Status Page</title>");
		out.println("<body>");
		out.println("<h1>The System Status is ON</h1>");
		out.println("Activating the location services requires manual configuration<br>");
		out.println("</body>");
		out.println("</html>");
		
	} //end of method
} //end of filter

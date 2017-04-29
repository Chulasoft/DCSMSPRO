/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author 006131
 */
public class SessionFilter implements Filter {
    
     FilterConfig config ;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig ;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
       String msg = "";
        if (((HttpServletRequest)request).getSession().getAttribute("login")==null) {
            msg = "Please Login!";
            request.setAttribute("msg", msg);
            config.getServletContext().getRequestDispatcher("/Login").forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
        
    }

    @Override
    public void destroy() {
    }
    
}

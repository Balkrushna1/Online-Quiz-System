/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;
import db.Exam;

import java.io.IOException;
import java.util.Date;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ExamDao;
/**
 *
 * @author Dell
 */
public class HasExam implements Filter {
    
    private ServletContext context;
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("Has Exam Filter initialized");
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		context.log("Requested Resource::"+uri);
                if(uri.startsWith("/exam_system_2/Exam.jsp")){
                    context.log("uri matched");
                }
                    Exam ex = ExamDao.GetExam();
		
                    if(ex == null){

                            res.sendRedirect("NoExam.jsp");
                    }else{
                            // pass the request along the filter chain
                            chain.doFilter(request, response);
                    }
                
	
	}

	public void destroy() {
		//close any resources here
	}
    
}

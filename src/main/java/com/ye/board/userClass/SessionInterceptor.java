package com.ye.board.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.print("preHandler call");
		if(request.getSession().getAttribute("id")==null) {
			response.sendRedirect("./");
		}
		return true;
	}
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView ModelAndView) throws Exception {
		System.out.print("postHandler call");
		super.postHandle(request, response, handler, ModelAndView);
	}


}

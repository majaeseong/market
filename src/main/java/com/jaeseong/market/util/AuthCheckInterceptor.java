package com.jaeseong.market.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jaeseong.market.dto.MemberDTO;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session!=null) {
			MemberDTO mdto = (MemberDTO) session.getAttribute("loginUser");
			if(mdto.getAuth()==1) {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath()+"/member/home");
		return false;
	}
	
	

}

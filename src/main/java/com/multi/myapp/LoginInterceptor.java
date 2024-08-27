package com.multi.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		//로그인 유무확인하여 로그인 된경우 호출한 매핑주소로 이동하면 되고,
		//로그인 안된 경우 로그인 폼으로 이동하도록 실행을 변경한다.
		
		HttpSession session = request.getSession();
		
		// null, "Y"		
		String logStatus = (String)session.getAttribute("logStatus");
		
		if(logStatus == null || !logStatus.equals("Y")) {//로그인이 안된 경우 -> 가던길을 멈추고 로그인인 페이지로 이동
			response.sendRedirect(request.getContextPath()+"/sign/login");
			return false;
		}
		// 반환형이 true이면 원래 매핑으로 지속하고
		//       false이면 새로운 주소로 이동한다.
			
		return true;
	}
	// 컨트롤러를 실행 후 view페이지 이동하기  전에 실행되는 메소드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			@Nullable ModelAndView mav) throws Exception{
	}
	//컨트롤러가 실행 후 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception e) throws Exception {
		
	}
	
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception{
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}

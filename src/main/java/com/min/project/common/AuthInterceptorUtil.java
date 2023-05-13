package com.min.project.common;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 로그인이 필요한 페이지 확인을 위한 인터셉터
 *===========================================================
 * preHandle :: 컨트롤러 클래스 호출 전 실행(Session용으로 용이)
 * postHandle :: View로 이동하기 전에 실행
 * afterComlpetion :: 모든 작업이 끝난 다음 실행
 * ==========================================================
 */



public class AuthInterceptorUtil extends HandlerInterceptorAdapter {

	private Set<String> nonPermittedURLPattern;
	private Set<String> nonAucPermittedURLPattern;
	
	public void setNonPermittedURLPattern(Set<String> nonPermittedURLPattern){
		this.nonAucPermittedURLPattern = nonAucPermittedURLPattern;
	}
	
	@Override
	public boolean preHandle(
		HttpServletRequest reqest,
		HttpServletResponse response,
		Object handler) throws Exception{
		
		return true;
		}
		
		public void postHandle(
			HttpServletRequest reqest, HttpServletResponse response, Object handler, ModelAndView modelAndView){}
			
		public void afterComlpetion(HttpServletRequest reqest, HttpServletResponse response, Object handler, Exception ex) throws Exception {}
		
			

}


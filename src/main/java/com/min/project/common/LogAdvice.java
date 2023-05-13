package com.min.project.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect // Aspect = Pointcut + Advice
public class LogAdvice {

/**
 * @Pointcut("execution(* com.min.project..*Impl.*(..))")
	public void allPointcut() {
		System.out.println("[공통로그] 비즈니스 로직 수행 전 동작");
	}
	
	@Pointcut("execution(* com.min.project..*Impl.*(..))")
	public void getPointcut() {
		System.out.println("[공통로그] 비즈니스 로직 수행 후 동작");
		}
	 
 */
	@Pointcut("execution(* com.min.project..*Impl.*(..))")	
	public void allPointcut() {}
	
	@Before("allPointcut()")
	public void pringLog() {
		System.out.println("[공통로그] 비즈니스 로직 수행 전 동작");
	}
}

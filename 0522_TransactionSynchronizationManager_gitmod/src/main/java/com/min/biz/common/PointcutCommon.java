package com.min.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {

	@Pointcut("execution(* com.ssamz.biz.board..*Impl.*(..))")
	public void boardPointcut() {}
	
	@Pointcut("execution(* com.ssamz.biz.user..*Impl.*(..))")
	public void userPointcut() {}
	
	@Pointcut("execution(* com.ssamz.biz..*Impl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.ssamz.biz..*Impl.get*(..))")
	public void getPointcut() {}
}

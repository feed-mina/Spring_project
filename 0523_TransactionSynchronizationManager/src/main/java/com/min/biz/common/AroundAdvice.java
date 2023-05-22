package com.min.biz.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect // Aspect = Pointcut + Advice
public class AroundAdvice {
	
	@Around("PointcutCommon.allPointcut()")
	public Object aroundLog(ProceedingJoinPoint jp) throws Throwable {
		String method = jp.getSignature().getName();
		
		Object obj = null;
		StopWatch watch = new StopWatch();
		watch.start();
		
		// ���������� Ŭ���̾�Ʈ�� ȣ���� ����Ͻ� �޼ҵ� ����
		obj = jp.proceed();
		
		watch.stop();
		System.out.println(method + "() �޼ҵ� ���࿡ �ҿ�� �ð� : " + watch.getTotalTimeSeconds());
		return obj;
	}
}

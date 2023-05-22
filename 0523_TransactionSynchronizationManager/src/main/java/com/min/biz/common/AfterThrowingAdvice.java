package com.min.biz.common;

import java.sql.SQLException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	
	@AfterThrowing(pointcut = "PointcutCommon.allPointcut()", throwing = "exceptionObj")
	public void exceptionLog(JoinPoint jp, Exception exceptionObj) {
		String method = jp.getSignature().getName();
		
		System.out.println("[���� ó��] " + method + "() �޼ҵ� ���� �� ���� �߻�");
		
		// �߻��� ������ Ÿ�Կ� ���� �б�ó��
		if(exceptionObj instanceof IllegalArgumentException) {
			System.out.println("0�� ���� ����� ���� �����ϴ�.");
		} else if(exceptionObj instanceof ArithmeticException) {
			System.out.println("0���� ���ڸ� ���� ���� �����ϴ�.");
		} else if(exceptionObj instanceof SQLException) {
			System.out.println("SQL ������ ������ �ֽ��ϴ�.");
		} else {
			System.out.println("���� �̻��� ���� �߻�");
		}
	}
}

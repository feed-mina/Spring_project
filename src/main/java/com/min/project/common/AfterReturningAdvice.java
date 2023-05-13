package com.min.project.common;

public class AfterReturningAdvice {
	public void afterLog() {
		System.out.println("[사후처리] 비즈니스 로직 수행 전 동작");
	}
}

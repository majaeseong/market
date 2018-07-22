package com.jaeseong.market.util;

import java.sql.SQLException;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogAdvice {
	
	@Pointcut("execution(public * market..*(..))")
	private void publicTarget() {
		
	}
	
	@Before("publicTarget()")
	public void logging(ProceedingJoinPoint jp, Exception ex) throws Throwable{
		String method = jp.getSignature().getName();
		System.out.println("Error in "+method);
		
		if(ex instanceof SQLException) {
			System.out.println("SQL Exception");
		}else if(ex instanceof NullPointerException) {
			System.out.println("Null Point Exception");
		}else {
			System.out.println("Another Error. you must Check this");
		}
	}

}

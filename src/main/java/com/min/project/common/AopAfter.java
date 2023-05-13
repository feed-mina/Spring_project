 package com.min.project.common;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Aspect
public class AopAfter {

		public void returnException(JoinPoint joinPoint, Object returnVal) throws Exception{
			String methodName = joinPoint.getSignature().getName();
			if(methodName.indexOf("Wrt") > -1 || methodName.indexOf("Mdf") > -1 || methodName.indexOf("Del") > -1) {
				// DefaultVO.getResultBln() 을 참고로 하여 해당 내역을 Rollback 해준다
				
				// DefaultVO.getResultBln()을 참고로 하여 해당 내역을 롤백한다. 
				String getBln = (String)getFieldValueByName(returnVal,"resultBln");
				if(null != getBln && "False".equals(getBln)){
					TransactionAspectSupport.				currentTransactionStatus().setRollbackOnly();
					return;
			}
			// DeFaultVo.getResultErr()를 참고로 하여 해당 내역을 롤백해준다.
			
			String getErr = (String)getFieldValueByName(returnVal, "resultErr");
			if(null != getErr && !"".equals(getErr)){
				if(null == getBln || "True".equals(getBln))setFieldValueByName(returnVal, "resultBln", "False");
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return;
			}
		}
	}
	
	/**
	 * GETTER Field
	 */
	public static Object getFieldValueByName(Object Object, String FieldName)
		throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		
		if(Object == null) return null;
		
		char firstChar = FieldName.charAt(0);
		char uFirstChar = Character.toUpperCase(firstChar);
		
		String paramMethod = "get" + FieldName.replaceFirst(String.valueOf(firstChar), String.valueOf(uFirstChar));
		
		Class<? extends Object> Class = Object.getClass();
		Method method = Class.getMethod(paramMethod, null);
		Object result = method.invoke(Object, null);
		
		return result;
	}
	
	/**
	 * SETTER Field
	 */
	
	public static void setFieldValueByName(Object Object, String FieldName, Object FieldValue) throws SecurityException, NoSuchMethodException, IllegalAccessException , IllegalArgumentException , InvocationTargetException, NoSuchFieldException
	{
	
		if(Object == null) return;
		Class<? extends Object> Class = Object.getClass();
		Field Field = Class.getField(FieldName);
		
		Class<?> FieldType = Field.getType();
		Class [] ArgTypes = {FieldType};
		Object[] ArgValues = {FieldValue};
	}
	

	public static void setFieldValueByName(Class Class, Object Object, String FieldName, Class [] ArgTypes, Object [] ArgValues)
		throws SecurityException, NoSuchFieldException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException{
		
		if(Object == null) return;
		
		char firstChar = FieldName.charAt(0);
		char uFirstChar = Character.toUpperCase(firstChar);
		
		String paramMethod = "set" + FieldName.replaceFirst(String.valueOf(firstChar), String.valueOf(uFirstChar));
		
		Method method = Class.getMethod(paramMethod, ArgTypes);
		method.invoke(Object, ArgValues);
		
	}
}		
	
	
	

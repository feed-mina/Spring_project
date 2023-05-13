package com.min.project.cmm;

import org.apache.log4j.Logger;

public class TraceHandler {

	// 발생된 메시지를 출력

	public void todo(Class clazz, String message){
		Logger.getLogger(clazz.getClass()).debug("[TRACE]CLASS:::"+clazz.getName());
		Logger.getLogger(clazz.getClass()).debug("[TRACE]MESSAGE:::"+message);
	}
}

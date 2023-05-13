package com.min.project.cmm;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class OthersExcepHndlr {

	protected Log log = LogFactory.getLog(this.getClass());
	public void occur(Exception exception, String packageName) {
		log.debug("ExceptionHandler run...!");
	}
}

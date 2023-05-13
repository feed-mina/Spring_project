package com.min.project.cmm;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

public class ComMessageSource extends ReloadableResourceBundleMessageSource implements MessageSource  {

	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;

	public ReloadableResourceBundleMessageSource getReloadableResourceBundleMessageSource() {
		return reloadableResourceBundleMessageSource;
	}

	public void setReloadableResourceBundleMessageSource(
			ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource) {
		this.reloadableResourceBundleMessageSource = reloadableResourceBundleMessageSource;
	}
	
	public String getMessage(String code) {
		return getReloadableResourceBundleMessageSource().getMessage(code, null, Locale.getDefault());
	}
	
	public String getMessage(String code, Locale reqLocle) {
		return getReloadableResourceBundleMessageSource().getMessage(code, null, reqLocle);
	}
	
}

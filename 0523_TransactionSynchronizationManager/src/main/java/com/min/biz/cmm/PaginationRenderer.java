package com.min.biz.cmm;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

public class PaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;

	public PaginationRenderer() {
	}

	public void initVariables(){
	 
		
		
		}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
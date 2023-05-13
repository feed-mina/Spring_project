package com.min.project.cmm;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

public class PaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;

	public PaginationRenderer() {
	}

	public void initVariables(){
	/** 
	 * 전자정부 프레임워크의 페이지네이션 기능
	 * firstPageLabel    = "<a class=\"ico_first\" style=\"text-decoration: none;\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><span class=\"hide\">처음페이지</span></a>";
		
		 previousPageLabel = "&nbsp;<a class=\"ico_prev\" style=\"text-decoration: none;\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><span class=\"hide\">이전페이지</span></a>";
		
		 currentPageLabel  = "&nbsp;<a class=\"over\" style=\"text-decoration: none;\" href=\"#\">{0}</a>";
		
		 nextPageLabel     = "&nbsp;<a class=\"ico_next\" style=\"text-decoration: none;\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><span class=\"hide\">다음페이지</span></a>";
	        lastPageLabel     = "&nbsp;<a class=\"ico_last\" style=\"text-decoration: none;\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><span class=\"hide\">마지막페이지</span></a>";
	 * 
	 * 
	 */
		
		
		}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
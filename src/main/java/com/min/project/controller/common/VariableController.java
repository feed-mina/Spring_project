package com.min.project.controller.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;

import com.min.project.cmm.ComMessageSource;
import com.min.project.cmm.DefaultVO;

@Controller
@SessionAttributes(types = DefaultVO.class)
public class VariableController{

@Resource
LocaleResolver LocaleResolver;

@Resource(name="MessageSource")
ComMessageSource MessageSource;

@RequestMapping(value= "/com/variable/LodVariablePage.do")
public String getLodVariablePage(
	@RequestParam(value="locale", required=false)
	String browserlocale,
	ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession httpSession)
	throws Exception{
	
		return "com/variable/LodVariablePage";
		}


}

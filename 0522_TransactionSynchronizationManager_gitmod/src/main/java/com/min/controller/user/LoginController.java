package com.min.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.biz.user.UserVO;
import com.min.biz.user.impl.UserDAO;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginView(@ModelAttribute("user") UserVO vo) {
		vo.setId("aaa");
		vo.setPassword("aaa");
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, UserDAO userDAO) {
		if(userDAO.getUser(vo) != null) return "forward:getBoardList.do";
		else return "login";
	}

}

package com.min.project.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.min.project.member.MemberVO;
import com.min.project.member.impl.MemberDAO;

public class MemberController {

	
	@Controller
	public class LoginController{
		
		@RequestMapping(value="/login.do", method=RequestMethod.GET)
		public String loginView(MemberVO vo) {
			System.out.println("====> loginView");
			vo.setId("");
			vo.setPassword("");
			return "login";
		}
		
		
		@RequestMapping(value="/login.do", method=RequestMethod.POST)
		public String Login(MemberVO vo, MemberDAO memberDAO) {
			System.out.println("-----> ");
			if(memberDAO.getMember(vo) != null) {
				return "forward:getBoardList.do";
			}
			else return "login";
		}
		
	}
	
	
}

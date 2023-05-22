package com.min.controller.login;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.min.biz.login.LoginService;
import com.min.biz.login.LoginVO;

@Controller
public class LoginController {

	// 로그인페이지
	@Resource(name="LoginService")
	private LoginService  LoginService;

	@RequestMapping(value="/login/LoginPage.do")
	public String getLogin(@ModelAttribute("LoginVO") LoginVO LoginVO,	HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession httpSession)
			throws Exception{
				LoginVO.setMemberId("");
				LoginVO.setMemberPw("");
				
				return "/login/LoginPage";
			}
	
	//SHA256 암호화 하기
	public static String sha256(String pwd) {
		try{
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pwd.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			return hexString.toString();
			
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}


	//로그인을 처리한다
	@Resource MappingJacksonJsonView ajaxLoginActive;
	@RequestMapping(value="/login/LoginActive.do")
	public ModelAndView getLoginActive(
			@ModelAttribute("LoginVO") LoginVO LoginVO, 
			HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		//로그인시 비번 비교는 입력한 비번을 암호화 해서 암호화 한것 끼리 비교하면 됨
		String pwd = LoginVO.getMemberPw();
		String encryptSHA256 = sha256(pwd);
		System.out.println("로그인시 SHA256 암호화 요청 텍스트 : " + pwd);
		System.out.println("로그인시 SHA256 암호화 완료 텍스트 : " + encryptSHA256);
		LoginVO.setMemberPw(encryptSHA256);
			

		//회원 정보 가져오기
		LoginVO resultVO = LoginService.DtlMemberData(LoginVO);
		
		if(null != resultVO && null != resultVO.getMemberId()&& !"".equals(resultVO.getMemberId())) {
			
			// 로그인 유지 SESSION 처리
			httpSession.setAttribute("sessionMemberId", resultVO.getMemberId());
			httpSession.setAttribute("sessionMemberNm", resultVO.getMemberNm());
			httpSession.setAttribute("sessionMemberRole", resultVO.getMemberRole());
			
			System.out.println("-----------------------------------");
			System.out.println("Login Info MemberId : "+resultVO.getMemberId());
			System.out.println("Login Info MemberNm : "+resultVO.getMemberNm());
			System.out.println("Login Info MemberRole : "+resultVO.getMemberRole());
			
			model.put("message","");
			model.put("role", resultVO.getMemberRole());
		}else {
			model.put("message", "회원정보를 찾을 수 없습니다.");
		}
			
		return new ModelAndView(ajaxLoginActive, model);
		
		}
}

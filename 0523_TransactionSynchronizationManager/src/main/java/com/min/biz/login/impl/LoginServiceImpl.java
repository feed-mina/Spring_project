package com.min.biz.login.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.min.biz.cmm.AbstractServiceImpl;
import com.min.biz.login.LoginService;
import com.min.biz.login.LoginVO;

@Service("LoginService")
public class LoginServiceImpl extends AbstractServiceImpl implements LoginService{

	@Autowired
	@Qualifier("LoginDAO") 
	private LoginDAO LoginDAO;
	// 회원정보 가져오기
	public LoginVO DtlMemberData(LoginVO vo) throws Exception {
		LoginVO LoginVO = LoginDAO.DtlMemberData(vo);
		
		return LoginVO;
	}
	
}
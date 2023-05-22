package com.min.biz.login.impl;

import org.springframework.stereotype.Repository;

import com.min.biz.cmm.AbstractDAO;
import com.min.biz.login.LoginVO;

@Repository("LoginDAO")
public class LoginDAO extends AbstractDAO {

	// 회원 정보 가져오기
	public LoginVO DtlMemberData(LoginVO vo) throws Exception{
		return (LoginVO)selectByPk("LoginDAO.DtlMemberData", vo);
	}
}

package com.min.project.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.project.member.MemberService;
import com.min.project.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}
}

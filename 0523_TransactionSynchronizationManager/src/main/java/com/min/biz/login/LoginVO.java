package com.min.biz.login;

import com.min.biz.cmm.DefaultVO;

public class LoginVO extends DefaultVO {

	private String memberId;
	private String memberPw;
	private String newPassWd;
	private String MemberNm;
	private String MemberRole;
	private String sessionMemberId;
	private String sessionMemberNm;
	private String sessionRole;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getNewPassWd() {
		return newPassWd;
	}
	public void setNewPassWd(String newPassWd) {
		this.newPassWd = newPassWd;
	}
	public String getMemberNm() {
		return MemberNm;
	}
	public void setMemberNm(String memberNm) {
		MemberNm = memberNm;
	}
	public String getMemberRole() {
		return MemberRole;
	}
	public void setMemberRole(String memberRole) {
		MemberRole = memberRole;
	}
	public String getSessionMemberId() {
		return sessionMemberId;
	}
	public void setSessionMemberId(String sessionMemberId) {
		this.sessionMemberId = sessionMemberId;
	}
	public String getSessionMemberNm() {
		return sessionMemberNm;
	}
	public void setSessionMemberNm(String sessionMemberNm) {
		this.sessionMemberNm = sessionMemberNm;
	}
	public String getSessionRole() {
		return sessionRole;
	}
	public void setSessionRole(String sessionRole) {
		this.sessionRole = sessionRole;
	}
	
}

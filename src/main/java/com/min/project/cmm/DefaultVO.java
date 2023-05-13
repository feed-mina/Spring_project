package com.min.project.cmm;

import java.io.Serializable;



// @SuppressWarnings("serial")

public class DefaultVO implements Serializable {

	private String memberId;
	private String memberPw;
	private String memberNm;
	private String sessionMemberId;
	private String sessionMemberNm;
	private String sessionMemberRole;
	private String sessionMenuCd;
	private String resultBln;
	private String resultErr;
	private String newSequence;
	
	//PAGING Access
    private int pageIndex = 1;				// 현재페이지
    private int rowTotal = 0;				// 검색 시 최종 ROW COUNT
    private String pageUnit = "10";			// 한 페이지 당 ROW 수
    private int pageSize = 5;				// 총 페이지 중 기본으로 보여 줄 페이징 수
    private int firstIndex = 1;				// First Index
    private int lastIndex = 1;				// Last Index
    private int recordCountPerPage = 10;	// RecordCountPerPage
    
    
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
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
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
	public String getSessionMemberRole() {
		return sessionMemberRole;
	}
	public void setSessionMemberRole(String sessionMemberRole) {
		this.sessionMemberRole = sessionMemberRole;
	}
	public String getSessionMenuCd() {
		return sessionMenuCd;
	}
	public void setSessionMenuCd(String sessionMenuCd) {
		this.sessionMenuCd = sessionMenuCd;
	}
	public String getResultBln() {
		return resultBln;
	}
	public void setResultBln(String resultBln) {
		this.resultBln = resultBln;
	}
	public String getResultErr() {
		return resultErr;
	}
	public void setResultErr(String resultErr) {
		this.resultErr = resultErr;
	}
	public String getNewSequence() {
		return newSequence;
	}
	public void setNewSequence(String newSequence) {
		this.newSequence = newSequence;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getRowTotal() {
		return rowTotal;
	}
	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}
	public String getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(String pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	
	
}

package com.min.project.sale;

import com.min.project.cmm.DefaultVO;

// @SuppressWarnings("serial") <- 이거 역할이 뭐지?
public class SaleVO extends DefaultVO  {

	private String searchSale;
	private String searchMember;
	private String deviceID;
	private String deviceNm;
	private String memberId;
	private String memberNm;
	private String no;
	private String houseNm;
	private String setDt;
	private String insDt;
	public String getSearchSale() {
		return searchSale;
	}
	public void setSearchSale(String searchSale) {
		this.searchSale = searchSale;
	}
	public String getSearchMember() {
		return searchMember;
	}
	public void setSearchMember(String searchMember) {
		this.searchMember = searchMember;
	}
	public String getDeviceID() {
		return deviceID;
	}
	public void setDeviceID(String deviceID) {
		this.deviceID = deviceID;
	}
	public String getDeviceNm() {
		return deviceNm;
	}
	public void setDeviceNm(String deviceNm) {
		this.deviceNm = deviceNm;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getHouseNm() {
		return houseNm;
	}
	public void setHouseNm(String houseNm) {
		this.houseNm = houseNm;
	}
	public String getSetDt() {
		return setDt;
	}
	public void setSetDt(String setDt) {
		this.setDt = setDt;
	}
	public String getInsDt() {
		return insDt;
	}
	public void setInsDt(String insDt) {
		this.insDt = insDt;
	}


	
}

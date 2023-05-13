package com.min.project.cmm;



public interface GnbService {
	
	//장비관리-장비추가 처리
	public GnbVO DeviceWrtData(GnbVO vo) throws Exception;
	
	//장비관리-장비 정보가져오기
	public GnbVO DeviceDtlData(GnbVO vo) throws Exception;
	
	//장비관리-장비수정 처리
	public GnbVO DeviceMdfData(GnbVO vo) throws Exception;
	
	//장비구매-구매요청 처리
	public GnbVO purWrtData(GnbVO vo) throws Exception;
}
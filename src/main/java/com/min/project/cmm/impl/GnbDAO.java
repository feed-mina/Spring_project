package com.min.project.cmm.impl;

import org.springframework.stereotype.Repository;

import com.min.project.cmm.AbstractDAO;
import com.min.project.cmm.GnbVO;

@Repository("GnbDAO")
public class GnbDAO extends AbstractDAO{

	//장비관리-장비추가 처리
	public void DeviceWrtData(GnbVO vo) throws Exception {
		update("GnbDAO.DeviceWrtData", vo);
		}

	//장비관리-장비 정보가져오기
	public GnbVO DeviceDtlData(GnbVO vo){
		return (GnbVO)selectByPk("GnbDAO.DeviceDtlData", vo, vo);
		}

	//장비관리-장비수정 처리	
	public void DeviceMdfData(GnbVO vo) throws Exception{
		update("GnbDAO.DeviceMdfData", vo);
		}

	//장비구매-구매요청 처리
	public void purWrtData(GnbVO vo) throws Exception{
		update("GnbDAO.purWrtData", vo);
		}
		

}
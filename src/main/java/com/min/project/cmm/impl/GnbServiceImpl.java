package com.min.project.cmm.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.min.project.cmm.AbstractServiceImpl;
import com.min.project.cmm.GnbService;
import com.min.project.cmm.GnbVO;

@Service("GnbService")
public class GnbServiceImpl extends AbstractServiceImpl implements GnbService{
	
	@Resource(name="GnbDAO")
	private GnbDAO GnbDAO;

	//장비관리-장비추가 처리
	public GnbVO DeviceWrtData(GnbVO vo) throws Exception {
		GnbVO resultVO = new GnbVO();
		resultVO.setResultBln("False");
		
		try {
			GnbDAO.DeviceWrtData(vo);
			resultVO.setResultBln("True");
			resultVO.setResultErr("");
		} catch(Exception e) {
			resultVO.setResultErr(e.toString());
			return resultVO;
		}
		
		return resultVO;
	}

	//장비관리-장비 정보가져오기
	public GnbVO DeviceDtlData(GnbVO vo) throws Exception{
		vo = GnbDAO.DeviceDtlData(vo);
		
		return vo;
	}

	//장비관리-장비수정 처리
	public GnbVO DeviceMdfData(GnbVO vo) throws Exception{
		GnbVO resultVO = new GnbVO();
		resultVO.setResultBln("False");
		
		try {
			GnbDAO.DeviceMdfData(vo);
			resultVO.setResultBln("True");
			resultVO.setResultErr("");
		} catch(Exception e) {
			resultVO.setResultErr(e.toString());
			return resultVO;
			
		}
		return resultVO;
	}
	

	//장비구매-구매요청 처리
	public GnbVO purWrtData(GnbVO vo) throws Exception{
		GnbVO resultVO = new GnbVO();
		resultVO.setResultBln("False");
		
		try {
			GnbDAO.purWrtData(vo);
			resultVO.setResultBln("True");
			resultVO.setResultErr("");
		}catch(Exception e) {
			resultVO.setResultErr(e.toString());
			return resultVO;
		}
		return resultVO;
	}
	
}

package com.min.project.sale.impl;

import java.util.List;

import javax.annotation.Resource;

import com.min.project.cmm.AbstractServiceImpl;
import com.min.project.cmm.DefaultVO;
import com.min.project.sale.SaleVO;

public class SaleServiceImpl extends DefaultVO implements SaleService {

@Resource(name="SaleDAO")
private SaleDAO SaleDAO;

// 총갯수

public int SaleTot(SaleVO vo){
	return SaleDAO.SaleTot(vo);
}

// 목록

public List<?> SaleList(SaleVO vo) throws Exception{
	List<?> resultList = SaleDAO.SaleList(vo);
	return resultList;
	}
	
// 승인하기

public SaleVO saleSet(SaleVO vo) throws Exception{
	SaleVO resultVO = new SaleVO();
	resultVO.setResultBln("Flase");
	
	try{
	
		SaleDAO.saleSet(vo);
		resultVO.setResultBln("True");
		resultVO.setResultErr("");
		} catch(Exception e){
		resultVO.setResultErr(e.toString());
		return resultVO;
		}
		return resultVO;
	}
 
}

package com.min.project.sale.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.min.project.cmm.AbstractDAO;
import com.min.project.sale.SaleService;
import com.min.project.sale.SaleVO;


@Repository
public class SaleDAO extends AbstractDAO {
	// 총 갯수 
	 public int SaleTot(SaleVO vo){
		return (Integer)getSqlMapClientTemplate().queryForObject(
			"SaleDAO.SaleTot", vo);
	}

	// 목록
	public List<?> SaleList(SaleVO vo) throws Exception{
		return list("SaleDAO.SaleList", vo);
	}

	// 승인하기

	public void saleSet(SaleVO vo) throws Exception{
		update("SaleDAO.saleSet", vo);
	}
}

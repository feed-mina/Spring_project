package com.min.project.sale;

import java.util.List;

public interface SaleService {

	// 총 갯수 
	int SaleDAO(SaleVO vo);

	// 목록
	public List<?> SaleList(SaleVO vo) throws Exception;

	
	// 승인하기
	public SaleVO saleSet(SaleVO vo) throws Exception;

}
package com.min.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.biz.board.BoardVO;

// DAO(Data Access Object)
@Repository
public class BoardDAOMyBatis {	
	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD  ޼ 
	//  
	public void insertBoard(BoardVO vo) {
		System.out.println("===> MyBatis insertBoard()  ");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	//  
	public void updateBoard(BoardVO vo) {
		System.out.println("===> MyBatis updateBoard()  ");
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	//  
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> MyBatis deleteBoard()  ");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	//    
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> MyBatis getBoard()  ");
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	//   ȸ
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> MyBatis getBoardList()  ");
		return mybatis.selectList("BoardDAO.getBoardList", vo);	
	}
}







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

	// CRUD ����� �޼ҵ� ����
	// �� ���
	public void insertBoard(BoardVO vo) {
		System.out.println("===> MyBatis�� insertBoard() ��� ó��");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	// �� ����
	public void updateBoard(BoardVO vo) {
		System.out.println("===> MyBatis�� updateBoard() ��� ó��");
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	// �� ����
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> MyBatis�� deleteBoard() ��� ó��");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	// �� �� ��ȸ
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> MyBatis�� getBoard() ��� ó��");
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	// �� ��� ��ȸ
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> MyBatis�� getBoardList() ��� ó��");
		return mybatis.selectList("BoardDAO.getBoardList", vo);	
	}
}







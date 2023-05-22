package com.min.biz.board.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.min.biz.board.BoardVO;

// DAO(Data Access Object)
@Repository
public class BoardDAOJPA {
	
	@PersistenceContext
	private EntityManager em;

	// CRUD ����� �޼ҵ� ����
	// �� ���
	public void insertBoard(BoardVO vo) {
		System.out.println("===> JPA�� insertBoard() ��� ó��");
		em.persist(vo);
	}

	// �� ����
	public void updateBoard(BoardVO vo) {
		System.out.println("===> JPA�� updateBoard() ��� ó��");
		em.merge(vo);
	}

	// �� ����
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JPA�� deleteBoard() ��� ó��");
		BoardVO board = em.find(BoardVO.class, vo.getSeq());
		em.remove(board);
	}

	// �� �� ��ȸ
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JPA�� getBoard() ��� ó��");
		return em.find(BoardVO.class, vo.getSeq());
	}

	// �� ��� ��ȸ
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> JPA�� getBoardList() ��� ó��");
		return em.createQuery("select b from BoardVO b order by b.seq").getResultList();	
	}
}







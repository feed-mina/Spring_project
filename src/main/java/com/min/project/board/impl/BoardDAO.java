package com.min.project.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.min.project.board.BoardVO;

public class BoardDAO {

	// SqlSession이 바로 MyBatis 컨테이너이다.
	private SqlSession mybatis;
	
	// 	public BoardDAO() {
	// 	mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	// }
	
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard" , vo);
		mybatis.commit();
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard" , vo);
		mybatis.commit();
	}
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deletetBoard" , vo);
		mybatis.commit();
	}
	public BoardVO getBoard(BoardVO vo) {
		return	mybatis.selectOne("BoardDAO.getBoard" , vo);
	}
	public List<BoardVO> getBoardList(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardList" , vo);
	}
}

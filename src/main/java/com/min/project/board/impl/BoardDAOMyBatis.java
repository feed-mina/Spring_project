package com.min.project.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.project.board.BoardVO;

@Repository
public class BoardDAOMyBatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// SqlSession이 바로 MyBatis 컨테이너이다.
	
	//public BoardDAOMyBatis() {
	//		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	//}
	
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard" , vo);
		//	mybatis.commit();
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard" , vo);
		//	mybatis.commit();
	}
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deletetBoard" , vo);
		//		mybatis.commit();
	}
	public BoardVO getBoard(BoardVO vo) {
		return	mybatis.selectOne("BoardDAO.getBoard" , vo);
	}
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("--> mybatis로 getboardlist 처리");
		if(vo.getSearchCondition().equals("TITLE")) {
			return	mybatis.selectList("BoardDAO.getBoardList_TITLE" , vo);					
		}else if(vo.getSearchCondition().equals("CONTENT")){
			return	mybatis.selectList("BoardDAO.getBoard_CONTENT" , vo);
			
		}
		return null;
	} 
}

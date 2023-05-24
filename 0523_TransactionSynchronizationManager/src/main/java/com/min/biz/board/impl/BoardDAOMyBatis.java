package com.min.biz.board.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.min.biz.board.BoardVO;
import com.min.biz.mapper.BoardMapper;

// DAO(Data Access Object)
// @Repository

@Component
public class BoardDAOMyBatis implements BoardMapper{
	private final SqlSession sqlSession;

    @Autowired
    public BoardDAOMyBatis(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	// @Autowired
//	private SqlSession mybatis;
	
 	private static String namespace="com.min.biz.board.impl.BoardDAOMyBatis";
	
	//	@Autowired
	//private SqlSessionTemplate mybatis;

	// CRUD  ޼ 
	//  
 	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("===> MyBatis insertBoard()  ");
		sqlSession.insert("BoardMapper.insertBoard", vo);
	}

 	@Override  
	public void updateBoard(BoardVO vo) {
		System.out.println("===> MyBatis updateBoard()  ");
		sqlSession.update("BoardMapper.updateBoard", vo);
	}

 	@Override 
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> MyBatis deleteBoard()  ");
		sqlSession.delete("BoardMapper.deleteBoard", vo);
	}

 	@Override
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> MyBatis getBoard()  ");
		return (BoardVO) sqlSession.selectOne("BoardMapper.getBoard", vo);
	}
 
 	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> MyBatis getBoardList()  ");
		return sqlSession.selectList("BoardMapper.getBoardList", vo);	
	}
}







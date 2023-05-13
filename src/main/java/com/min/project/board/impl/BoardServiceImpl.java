package com.min.project.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.project.board.BoardService;
import com.min.project.board.BoardVO;



@Service("boardServie")
public class BoardServiceImpl implements BoardService { 

	// Type 인젝션(Autowired) > Autowired 아래의 변수에 해당하는 컨테이너를 찾아서 boardDAO 컨테이너를 등록한다.
	@Autowired
	private BoardDAOMyBatis boardDAO;
	 
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}
	
	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	
	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}
	
	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);	
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
}

package com.min.project.board.impl;

import java.util.List;

import com.min.project.board.BoardVO;

public class BoardDAOClient {

	public static void main(String[] args) {
		BoardDAOMyBatis boardDAO = new BoardDAOMyBatis();
		
		BoardVO vo = new BoardVO();
		vo.setTitle("Mybatis 제목");
		vo.setWriter("테스터");
		vo.setContent("Mybatis 내용...");
		boardDAO.insertBoard(vo);

		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		for (BoardVO board : boardList) {
			System.out.println("===>"+board.toString());
		}
	}
	
}

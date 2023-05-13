package com.min.project.board;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;


public class BoardServiceClient {

	public static void main(String[] args) {

		// 1.
		GenericXmlApplicationContext container =
				new GenericXmlApplicationContext("business-layer.xml");
		
		
		// 2.
		BoardService boardService = (BoardService) container.getBean("boardServiceImpl");
		if(boardService != null) {
		 System.out.println(boardService + "객체검색 성공!");		 
		}
		 
		
		// 3. Lookup test
		BoardVO vo = new BoardVO();
		vo.setTitle("임시 제목");
		vo.setContent("임시내용");
		vo.setWriter("테스터");
		
		List<BoardVO> boardList = boardService.getBoardList(vo);
		for(BoardVO board : boardList) {
			System.out.println("===>" + board.toString());
		}
		
		// 4. spring container close
		boardService.insertBoard(vo);
		container.close();
		
	}

}

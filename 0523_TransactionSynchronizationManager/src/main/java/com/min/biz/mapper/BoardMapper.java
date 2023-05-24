package com.min.biz.mapper;
import java.util.List; 
import com.min.biz.board.BoardVO;

 
public interface BoardMapper {
	 void insertBoard(BoardVO vo);

	    void updateBoard(BoardVO vo);

	    void deleteBoard(BoardVO vo);

	    BoardVO getBoard(BoardVO vo);

	    List<BoardVO> getBoardList(BoardVO vo);
}

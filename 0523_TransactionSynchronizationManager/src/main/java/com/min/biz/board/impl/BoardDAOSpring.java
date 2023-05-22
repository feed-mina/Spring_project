package com.min.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.min.biz.board.BoardVO;

// DAO(Data Access Object)
@Repository
public class BoardDAOSpring {
	
	@Autowired
	private JdbcTemplate spring;
		
	// SQL ��ɾ��
	private final String BOARD_INSERT = "insert into board(seq, title, writer, content) "
		                              + "values((select nvl(max(seq), 0)+1 from board),?,?,?)";
	private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
	private final String BOARD_DELETE = "delete board where seq=?";
	private final String BOARD_GET    = "select * from board where seq=?";
	private final String BOARD_LIST   = "select * from board order by seq desc";

	// CRUD ����� �޼ҵ� ����
	// �� ���
	public void insertBoard(BoardVO vo) {
		System.out.println("===> SPRING���� insertBoard() ��� ó��");
		spring.update(BOARD_INSERT, vo.getTitle(), vo.getWriter(), vo.getContent());
	}

	// �� ����
	public void updateBoard(BoardVO vo) {
		System.out.println("===> SPRING���� updateBoard() ��� ó��");
		spring.update(BOARD_UPDATE, vo.getTitle(), vo.getContent(), vo.getSeq());
	}

	// �� ����
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> SPRING���� deleteBoard() ��� ó��");
		spring.update(BOARD_DELETE, vo.getSeq());
	}

	// �� �� ��ȸ
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> SPRING���� getBoard() ��� ó��");
		Object[] params = {vo.getSeq()};
		return spring.queryForObject(BOARD_GET, params, new BoardRowMapper());
	}

	// �� ��� ��ȸ
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> SPRING���� getBoardList() ��� ó��");
		return spring.query(BOARD_LIST, new BoardRowMapper());
	}
}







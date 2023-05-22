package com.min.controller.board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.min.biz.board.BoardService;
import com.min.biz.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/dataTransform.do")
	@ResponseBody
	public List<BoardVO> dataTransform(BoardVO vo) throws Exception {
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		return boardService.getBoardList(vo);
	}

	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.GET)
	public String insertBoard() {
		return "insertBoard";
	}

	@RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
	public String insertBoard(BoardVO vo) throws Exception {
		// 1. ���� ���ε� ó��
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			uploadFile.transferTo(new File("C:/DEV/" + uploadFile.getOriginalFilename()));
		}
		
		// 2. �� ��� ó��
		boardService.insertBoard(vo);
		return "forward:getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		boardService.updateBoard(vo);
		return "forward:getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "forward:getBoardList.do";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "getBoard";
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		// Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "getBoardList";
	}

}





























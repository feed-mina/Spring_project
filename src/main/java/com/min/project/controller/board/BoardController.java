package com.min.project.controller.board;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.min.project.board.BoardService;
import com.min.project.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/project/dataTansform.do")
	@ResponseBody
	public List<BoardVO> dataTransform(BoardVO vo) throws Exception {
		
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		return boardService.getBoardList(vo);
		
	}
	
	@RequestMapping(value = "/project/insertBoard.do", method=RequestMethod.GET)
	public String insertBoard() {
		return "insertBoard"; 
	 
	}
	
	
	@RequestMapping(value="/project/insertBoard.do", method=RequestMethod.POST)
		public String insertBoard(BoardVO vo) throws Exception{
			
			System.out.println("insertBoard");
			MultipartFile uploadFile = (MultipartFile) vo.getUploadFile();
			if(!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File("C://DEV" + fileName));		
			}
			boardService.insertBoard(vo);
			
			return "forward:/project/getBoardList.do";
		}
	
	
	
}
	


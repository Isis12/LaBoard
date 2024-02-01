package com.ye.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ye.board.bean.Board;
import com.ye.board.service.BoardMM;

@RestController
@RequestMapping(value = "/rest")
public class BoardRestController {

	@Autowired
	private BoardMM bm;
	
	private ModelAndView mav;
	
	
	@PostMapping(value = "board/writeBoard")
	public String writeBoard(Board board, HttpSession session) {
		String value = bm.writeBoard(board, session);
		return value;
	}
	
	@PostMapping(value = "board/boardSearch")
	public Map<String, List<Board>> boardSearch(String choice, String keyword) {
		Map<String, List<Board>>bMap = bm.boardSearch(keyword, choice);
		return bMap;
	}
	
	@PostMapping(value = "board/deleteBoard")
	public String deleteBoard(String num) {
		String value = bm.deleteBoard(num);
		return value;
	}
	
	@PostMapping(value = "board/writeModify")
	public ModelAndView writeModify(Board board) {
		mav = bm.writeModify(board);
		return mav;
	}
	

	
}

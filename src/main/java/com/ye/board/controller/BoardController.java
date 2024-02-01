package com.ye.board.controller;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ye.board.bean.Board;
import com.ye.board.service.BoardMM;

@Controller
public class BoardController {

	@Autowired
	private BoardMM bm;
	
	ModelAndView mav;
	
	
	@RequestMapping(value = "board/boardlist", method = RequestMethod.GET)
	public ModelAndView getBoardList(Integer pageNum) {
		mav=bm.getBoardList(pageNum);
		return mav;  
	}
	
	@RequestMapping(value = "board/writeFrm", method = RequestMethod.GET)
	public String writeFrm() {
		return "/board/writeFrm";
	}
	
	@RequestMapping(value = "board/boardContents", method = RequestMethod.GET)
	public ModelAndView boardContents(int B_NUM) {
		System.out.print("b_num= " + B_NUM);
		mav = bm.boardContents(B_NUM);
		return mav;
	}
	
	@GetMapping(value = "board/boardModify")
	public ModelAndView boardModify(int B_NUM) {
		mav = bm.boardModify(B_NUM);
		return mav;
	}
	
}

package com.ye.board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ye.board.bean.Board;
import com.ye.board.bean.Reply;
import com.ye.board.dao.IBoardDao;
import com.ye.board.userClass.FileManager;
import com.ye.board.userClass.Paging;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardMM {

	@Autowired
	private IBoardDao bDao;
	
	@Autowired
	private FileManager fm;
	
	ModelAndView mav;
	
	public ModelAndView getBoardList(Integer pageNum) {  //null --> 1
		log.info("pageNum="+pageNum);
		mav=new ModelAndView(); 
		String view=null;
		List<Board> bList=null;
		
		pageNum=(pageNum==null)?1:pageNum;
		bList=bDao.getBoardList(pageNum);
		
		if(bList!=null && bList.size()!=0) {
			//System.out.println("size="+bList.size());
			mav.addObject("bList", bList);  //jstl
			mav.addObject("paging", getPaging(pageNum));
			view="/board/boardlist"; //jsp
		}else {
			view="/home/home";
		}
		
		mav.setViewName(view);
		return mav;
	}

	private String getPaging(Integer pageNum) {
		int maxNum = bDao.getBoardCount();
		int listCount = 10; //페이지당 글의 개수
		int pageCount = 2;  //그룹당 페이지 개수
		String boardName = "/board /board/boardlist"; //url
		Paging paging = new Paging(maxNum,pageNum,listCount,pageCount,boardName);
		return paging.makeHtmlPaging();
	}

	public String writeBoard(Board board, HttpSession session) {
		mav = new ModelAndView();
		String value = null;
		
		boolean result = bDao.boardWrite(board);
		
		if (result) {
			value = "1";
		} else {
			value = "2";
		}
		return value;
	}

	public ModelAndView boardContents(int B_NUM) {
		mav = new ModelAndView();
		String view = null;
		
		int num = B_NUM;	
		
		Board board = bDao.getContents(num);
		
		mav.addObject("board", board);
		view = "/board/boardContents";
		mav.setViewName(view);
		
		return mav;
	}

	public String deleteBoard(String num) { 
		mav = new ModelAndView();
		String value = null;
		
		boolean result = bDao.deleteBoard(num);
		
		if (result) {
			value = "1";
		} else {
			value = "2";
		}
		return value;
	}

	public Map<String, List<Board>> boardSearch(String keyword, String choice) {
		Map<String, List<Board>> bMap = null;
		List<Board> bList = bDao.boardSearch(keyword, choice);
		
		if(bList != null) {
			bMap = new HashMap<>();
			bMap.put("bList", bList);
		} else {
			bMap = null;
		}
		
		return bMap;
	}

	public ModelAndView boardModify(int B_NUM) {
		mav = new ModelAndView();
		String view = null;
		
		int num = B_NUM;
		Board board = bDao.getContents(num);
		
		mav.addObject("board", board);
		view = "/board/boardModify";
		mav.setViewName(view);
		
		return mav;
	}

	public ModelAndView writeModify(Board board) {
		String view = null;
				
		if(bDao.boardmodify(board)) {
			view = "redirect:/board/writeFrm";
		}
		mav.setViewName(view);
		return mav;
	}

}

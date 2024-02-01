package com.ye.board.controller;

import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ye.board.bean.Member;
import com.ye.board.service.MemberMM;

//mav에 mb속성으로 저장된 객체는 세션 영역에 저장
//@SessionAttributes("mb")  
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	
	@Autowired
	private MemberMM mm;//new MemberMM();
	
	ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("로그창으로 이동");
		return "home/home";
	}
	
	
	@RequestMapping(value = "/access", method = RequestMethod.POST)
	public ModelAndView access(Member mb, HttpSession session) {
		mav = mm.access(mb, session);
		return mav;
	}
	
	
	@RequestMapping(value = "home/join", method = RequestMethod.GET)
	public ModelAndView joinFrm() {
		mav = new ModelAndView();
		mav.setViewName("home/join");
		return mav;
	}
	
	@RequestMapping(value = "home/join_new", method = RequestMethod.GET)
	public ModelAndView joinFrm_new() {
		mav = new ModelAndView();
		mav.setViewName("home/join_new");
		System.out.println("들어감");
		return mav;
	}
	
	//아이디 유효성검사
	@RequestMapping(value = "home/dupleID", method = RequestMethod.GET)
	@ResponseBody
	public String getidCheck(String m_id) {
		System.out.print("m_id= " + m_id);
		
		String result = mm.idCheck(m_id);
		System.out.print("result = " + result);
		return result;
	}
	
	//전화번호 유효성검사
	@RequestMapping(value = "home/duplePhone", method = RequestMethod.GET)
	@ResponseBody
	public String getPhoneCheck(String m_phone) {
		System.out.print("m_phone= " + m_phone);
		
		String result = mm.phoneCheck(m_phone);
		System.out.print(result);
		return result;
	}
	
	@RequestMapping(value= "home/join", method = RequestMethod.POST)
	public ModelAndView join(Member mb) {
		mav = mm.memJoin(mb);
		return mav;
	}
	
	@RequestMapping(value = "home/memJoin", method = RequestMethod.POST)
	public ModelAndView memJoin(Member mb) {
		logger.info("회원가입");
		mav = mm.memJoin(mb);
		return mav;
	}
	
	@RequestMapping(value = "board/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "home/main", method = RequestMethod.GET)
	public String main() {
		return "home/main";
	}
	

}


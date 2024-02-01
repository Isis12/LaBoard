package com.ye.board.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ye.board.bean.Member;
import com.ye.board.dao.IMemberDao;


@Service
public class MemberMM {
	
	@Autowired
	private IMemberDao mDao;
	
	ModelAndView mav;

	public ModelAndView access(Member mb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		
		//스프링 비밀번호 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwdEncode = mDao.getSecurityPwd(mb.getM_id());
		
		System.out.print("PW= " + pwdEncode);
		
		if(pwdEncode != null) {
			if(pwdEncoder.matches(mb.getM_pw(), pwdEncode)) {
				//로그인 성공
				session.setAttribute("id", mb.getM_id());
				//로그인 후 회원정보 출력
				mb = mDao.getMemberInfo(mb.getM_id());
				session.setAttribute("mb", mb);
				view = "redirect:/board/boardlist"; 
			} else {
				//비번오류
				view = "redirect:/";
				mav.addObject("check", 2);
			} 
		} else {
			//아이디 오류
			view = "redirect/";
			mav.addObject("check", 2);
		}
		
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView memJoin(Member mb) {
		mav = new ModelAndView();
		String view = null;
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		mb.setM_pw(pwdEncoder.encode(mb.getM_pw()));
		
		if(mDao.memberJoin(mb)) {
			//회원가입 성공시 로그인
			view = "/board/";
			mav.addObject("check", 1);
		} else {
			view = "/board/home/join";
		}
		
		mav.setViewName(view);
		return mav;
	}

	public String idCheck(String m_id) {
		int idCnt = mDao.idCheck(m_id);
		return Integer.toString(idCnt);
	}

	public String phoneCheck(String m_phone) {
		int phoneCnt = mDao.phoneCheck(m_phone);
		return Integer.toString(phoneCnt);
	}





}

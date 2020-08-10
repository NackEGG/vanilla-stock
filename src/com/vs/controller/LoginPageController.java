package com.vs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vs.biz.MemberBIZ;
import com.vs.vo.MemberVO;



@Controller

public class LoginPageController {

	@Qualifier("memberBIZImpl")
	MemberBIZ memberBIZ;
	
	@RequestMapping(value="/login")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = memberBIZ.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView("login");
		System.out.println("로그인페이지진입!!! ");
		if(result == true) { //로그인성공
		System.out.println("로그인성공 ");
			mav.setViewName("a");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("login");
			mav.addObject("msg", "failure");
		}
		return mav ;
		
	}
}

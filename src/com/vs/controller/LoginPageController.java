package com.vs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vs.biz.MemberBIZ;
import com.vs.vo.MemberVO;

@Controller

public class LoginPageController {

	@Autowired
	@Qualifier("memberBIZImpl")
	MemberBIZ memberBIZ;

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginCheck(HttpSession httpsession, MemberVO member, @RequestHeader String referer)
			{
		System.out.println("getEmail " + member.getEmail());
		System.out.println("getPassword "+ member.getPassword());
		System.out.println("getPassword "+ member.getNickname());
		String returnURL = "";
		MemberVO result = memberBIZ.loginCheck(member);
		
		if(result !=null ) { // 로그인에 성공하면 
		
		httpsession.setAttribute("loginMember", result);
		System.out.println("로그인성공이야!");
			//returnURL= "redirect:/vanila-stock/articleOpen";
		}else {
		//returnURL ="redirect:/vanila-stock/articleMain";
		}
		
		return "redirect:"+referer;
	}
		
	@RequestMapping(value="/logout", method = RequestMethod.DELETE)
		public ModelAndView logout(HttpSession session) {
		memberBIZ.logout(session);	
		
			ModelAndView mav = new ModelAndView("redirect:/");
			return mav;
		}
	}
		

		
	


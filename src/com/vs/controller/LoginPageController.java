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
		//@RequestParam("email") String email, @RequestParam("password") String password
		
		//System.out.println(request.getParameter("email"));
		//System.out.println(request.getParameter("password"));
		
		//String email = request.getParameter("email");
		//String password = request.getParameter("password");
		//MemberVO vo = new MemberVO();
		//vo.setEmail(email);
		//vo.setPassword(password);
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
		
		
		
		
		//boolean result = memberBIZ.loginCheck(vo, session);
		//model.addAttribute("MemberVO", vo );
		
	}
		
		
		//session.setAttribute("email", email);
		//session.setAttribute("password", password);
		
	//	vo1.setPassword(vo.getPassword());
		
//		boolean result = memberBIZ.loginCheck(vo, session);
//		//session.setAttribute("loginMember", value);
//		ModelAndView mav = new ModelAndView();
//		System.out.println("로그인페이지진입!!! ");
//		if(result == true) { //로그인성공
//		System.out.println("로그인성공 ");
//			mav.setViewName("cardpage/init");
//			
//		}else {
//			mav.setViewName("articlePage");
//			
//		}
		//return mav ;
		
	


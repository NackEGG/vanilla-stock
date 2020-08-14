package com.vs.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.vs.biz.MemberBIZ;
import com.vs.util.AlreadyException;
import com.vs.util.MemeberValidator;
import com.vs.vo.MemberVO;

@Controller
public class JoinController {
	@Autowired
    private MemberBIZ memberbiz;
	@Autowired
	private MemeberValidator memberValidator;
	
	@RequestMapping("/join")
	public ModelAndView step1() throws Exception{
		System.out.println("step1");
		ModelAndView mv = new ModelAndView("joinPage");
        mv.addObject("registerRequest", new MemberVO());
        return mv;
	}	
 
    @RequestMapping(value="/join", method = RequestMethod.POST)
    public ModelAndView step2(@ModelAttribute MemberVO regReq, BindingResult result,Map<String, BindingResult> model, @RequestHeader String referer)
    {	  
    	System.out.println("step2");
    	model.put(BindingResult.class.getName() + ".registerRequest", result);
    	System.out.println("agree : " + regReq.getAgree());
    	System.out.println("Gender : " + regReq.getGender());
    	System.out.println("Email : " + regReq.getEmail() + "  /  nickname : " + regReq.getNickname());
    	
    	// 약관 동의 검사
    	try {
    		if(regReq.getAgree() == null || !regReq.getAgree().equals("true")) {
    			result.rejectValue("agree", "bad", "약관에 동의해 주세요.");
                System.out.println("약관 동의 안함");
                ModelAndView mv=new ModelAndView("joinPage");
                return mv;
            }
		} catch (Exception e) {
			System.out.println("삼천포");
			e.printStackTrace();
			ModelAndView mv=new ModelAndView("joinPage");
            return mv;
		}
    	
    	boolean check = false;
    	
    	memberValidator.validate(regReq, result);
        if(result.hasErrors()) {
            System.out.println("뭔가 문제가 있음");
            ModelAndView mv=new ModelAndView("joinPage");
            return mv;
        }
        
        try {
        	System.out.println("멤버추가 시작");
        	Date Birthday=  java.sql.Date.valueOf(regReq.getBDYear()+"-"+regReq.getBDMon()+"-"+regReq.getBDDay());        	
            MemberVO newMember = new MemberVO(regReq.getEmail(), regReq.getPassword(), Birthday, regReq.getGender() ,regReq.getNickname());                    	
           
            memberbiz.insertUser(newMember);
            System.out.println("멤버추가 끝");
                
            
        } catch (AlreadyException e) {
        	result.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
        	ModelAndView mv=new ModelAndView("joinPage");
            return mv;
        } //try~catch end 
        ModelAndView mv=new ModelAndView("joinWelcomePage");
        return mv;
    }
    
    
}

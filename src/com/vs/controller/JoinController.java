package com.vs.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.vs.util.RegisterRequest;
import com.vs.vo.MemberVO;

@Controller
public class JoinController {
	@Resource
    private MemberBIZ memberbiz;
	@Autowired
	private MemeberValidator memberValidator;
	
	@RequestMapping("/join")
	public ModelAndView step1() throws Exception{
		ModelAndView mv = new ModelAndView("joinPage");
        mv.addObject("registerRequest", new RegisterRequest());
        return mv;
	}	
 
    @RequestMapping(value="join/welcome", method = RequestMethod.POST)
    public String step2(@ModelAttribute RegisterRequest regReq, Errors errors, @RequestHeader String referer)
    {	    
    	System.out.println("agree : " + regReq.getAgree());
    	System.out.println("Gender : " + regReq.getGender().length());
    	System.out.println("Email : " + regReq.getEmail() + "  /  nickname : " + regReq.getNickname());
    	
    	// 약관 동의 검사
    	try {
    		if(!regReq.getAgree().equals("true")) {
                System.out.println("약관 동의 안함");
                return "redirect:"+referer;
            }
		} catch (Exception e) {
			  return "redirect:"+referer;
		}
    	
    	boolean check = false;
    	
    	memberValidator.validate(regReq, errors);
      /*  if(errors.hasErrors()) {
            System.out.println("뭔가 문제가 있음");
            return "redirect:../join";
        }*/
        try {
        	System.out.println("멤버추가 시작");
        	Date Birthday=  java.sql.Date.valueOf(regReq.getBDYear()+"-"+regReq.getBDMon()+"-"+regReq.getBDDay());        	
            MemberVO newMember = new MemberVO(regReq.getEmail(), regReq.getPw(), Birthday, regReq.getGender() ,regReq.getNickname());                    	
            if( memberbiz.insertUser(newMember)) {
            	System.out.println("멤버추가 끝");
                
                return "joinWelcomePage";
            }
            	
            
        } catch (AlreadyException e) {
            errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
            return "redirect:"+referer;
        }//try~catch end 
        
        return "redirect:"+referer;
        
        
    }
    

}

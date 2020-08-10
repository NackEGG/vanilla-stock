package com.vs.biz;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;

import com.vs.vo.MemberVO;

public interface MemberBIZ {
	
	//로그인체크 
	
	public boolean loginCheck(MemberVO vo, HttpSession session);
	
	public MemberVO viewMember(MemberVO vo);
	
	

}

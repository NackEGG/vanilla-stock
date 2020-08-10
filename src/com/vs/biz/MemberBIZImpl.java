package com.vs.biz;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.vs.dao.MemberDAO;
import com.vs.vo.MemberVO;

@Service
public class MemberBIZImpl implements MemberBIZ {
	@Autowired
	
	private MemberDAO memberDAO;

	@Override
	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = memberDAO.loginCheck(vo);
		if(result) { // true일 경우 세
		System.out.println("true");
		session.setAttribute("email", vo.getEmail()); //세션 변수 등록 
		}
			
		return result;
	}

	@Override
	public MemberVO viewMember(MemberVO vo) {
		
		return memberDAO.viewMember(vo);
	}
	
	
}

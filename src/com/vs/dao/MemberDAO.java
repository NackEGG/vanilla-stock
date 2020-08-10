package com.vs.dao;

import com.vs.vo.MemberVO;

public interface MemberDAO {
	
	//로그인체크 
	public boolean loginCheck(MemberVO vo);
	
	//로그인정보 
	public MemberVO viewMember(MemberVO vo);
}

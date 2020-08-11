package com.vs.dao;

import java.util.List;

import com.vs.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectList(String searchWord, String sortType, int startPage, int endPage);
	public int selectTotal(String searchWord);
  //로그인체크 
	public MemberVO loginCheck(MemberVO vo);
//	//로그인정보 
//	public MemberVO viewMember(MemberVO vo);

}

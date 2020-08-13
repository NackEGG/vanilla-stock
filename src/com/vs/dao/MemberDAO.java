package com.vs.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.vs.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectList(String searchWord, String sortType, int startPage, int endPage);

	public int selectTotal(String searchWord);

	// 로그인체크
	public MemberVO loginCheck(MemberVO vo);



	public void logout(HttpSession session);

	public MemberVO selectByEmail(String email);



	public int insertUser(MemberVO regReq);

}

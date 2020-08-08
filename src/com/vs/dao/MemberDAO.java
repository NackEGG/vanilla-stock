package com.vs.dao;

import java.util.List;

import com.vs.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectList(String searchWord, String sortType, int startPage, int endPage);
	public int selectTotal(String searchWord);
}

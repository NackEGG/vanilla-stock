package com.vs.biz;

import java.util.List;
import java.util.Map;

import com.vs.vo.MemberVO;

public interface MemberBIZ {
	public Map<String, Object> selectList(String searchWord, String sortType, int page);
}

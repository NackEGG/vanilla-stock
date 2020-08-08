package com.vs.dao;

import java.util.List;

import com.vs.vo.IndustryVO;

public interface IndustryDAO {
	public int insert(IndustryVO data);
	public List<IndustryVO> selectList();
	public List<String> getIndName(int indNo);
}

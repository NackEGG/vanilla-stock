package com.vs.dao;

import java.util.List;

import com.vs.vo.CompanyVO;

public interface CompanyDAO {
	public int insertIntoAPI(CompanyVO data);
	public List<CompanyVO> listcompany();
	
}

package com.vs.dao;

import java.util.List;

import com.vs.vo.CompanyVO;

public interface CompanyDAO {
	public CompanyVO select(String keyword);
	public int insertIntoAPI(CompanyVO data);
	public List<String> selectAllCompanyName();
}

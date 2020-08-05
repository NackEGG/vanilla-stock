package com.vs.dao;

import com.vs.vo.CompanyVO;

public interface CompanyDAO {
	public CompanyVO select(String keyword);
	public int insertIntoAPI(CompanyVO data);
}

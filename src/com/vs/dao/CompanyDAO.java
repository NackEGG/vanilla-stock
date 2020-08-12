package com.vs.dao;

import java.util.List;

import com.vs.vo.CompanyVO;
import com.vs.vo.IndustryVO;

public interface CompanyDAO {
	public CompanyVO select(String keyword);
	public int insertIntoAPI(CompanyVO data);
	public List<String> selectAllCompanyName();
	public List<CompanyVO> selectList();
	public List<CompanyVO> selectCompany(int indNo);
}

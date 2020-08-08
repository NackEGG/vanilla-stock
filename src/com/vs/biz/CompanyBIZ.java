package com.vs.biz;


import java.util.List;

import com.vs.vo.CompanyVO;

public interface CompanyBIZ {
	public boolean insertIntoAPI(List<CompanyVO> companyList);
	public List<CompanyVO> getList();
	public List<CompanyVO> selectCompany(int indNo);
	

	
}

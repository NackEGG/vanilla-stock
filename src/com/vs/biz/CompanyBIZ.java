package com.vs.biz;


import java.util.List;
import java.util.Map;

import com.vs.vo.CompanyVO;

public interface CompanyBIZ {
	public CompanyVO select(String keyword);
	public boolean insertIntoAPI(List<CompanyVO> companyList);
	public List<CompanyVO> getSearchNmList(String company);
	public List<CompanyVO> getList();
	public List<CompanyVO> selectCompany(int indNo);
	public List<String> selectAllCompanyName();
	public Map<String,Object> getSummary(String keyword);
}

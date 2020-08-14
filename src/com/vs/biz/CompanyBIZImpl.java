package com.vs.biz;

import java.util.Collection;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.dao.CompanyDAO;
import com.vs.vo.CompanyVO;

@Service
public class CompanyBIZImpl implements CompanyBIZ {
	
	@Autowired
	private CompanyDAO companyDAO;
	
	
	@Override
	public List<CompanyVO> getSearchNmList(String company) {
		// TODO Auto-generated method stub
		return companyDAO.selectSearchNmList(company);
	}
	
	@Override
	public CompanyVO select(String keyword) {
		return companyDAO.select(keyword);
	}
	
	@Transactional
	@Override
	public boolean insertIntoAPI(List<CompanyVO> companyList) {
		boolean check = false;
		int i = 0;
		for(CompanyVO company: companyList) {
		//	System.out.println(company.getStockCode());
			try {
				if(companyDAO.insertIntoAPI(company)>0) {
					System.out.println("[넣는 중]");	
					check = true;
					i++;
				}
			}catch (Exception e) {
				continue;
			}
			
		}//for end 
		System.out.println("[ 총 넣은 개수 : "+i +" 개 ]");
		return check;
	}
  
  @Override
	public List<CompanyVO> selectCompany(int indNo) {
		return companyDAO.selectCompany(indNo);
	}

	@Override
	public List<CompanyVO> getList() {
		return companyDAO.selectList();
	}
  
  @Override
  public List<String> selectAllCompanyName() {
		
		List<String> ret = new ArrayList<String>();
		ret = companyDAO.selectAllCompanyName();
		
		return ret;
	}

}

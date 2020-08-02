package com.vs.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CompanyDAO;
import com.vs.vo.CompanyVO;

@Service
public class CompanyBIZImpl implements CompanyBIZ {
	@Autowired
	private CompanyDAO companyDAO;
	@Override
	public boolean insertIntoAPI(List<CompanyVO> companyList) {
		boolean check = false;
		
		for(CompanyVO company: companyList) {
		//	System.out.println(company.getStockCode());
			if(companyDAO.insertIntoAPI(company)>0) {
				System.out.println("[넣는 중]");	
				check = true;
			}
		}//for end 
		
		return check;
	}
}

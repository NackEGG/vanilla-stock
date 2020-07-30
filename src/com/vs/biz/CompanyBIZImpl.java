package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.CompanyDAO;

@Service
public class CompanyBIZImpl implements CompanyBIZ {
	@Autowired
	private CompanyDAO companyDAO;
	
}

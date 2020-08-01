package com.vs.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CompanyVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertIntoAPI(CompanyVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("insert into company(stock_code, company, industry_no, regdate) values(?, ?, ?, systimestamp)",
				new Object[] {data.getStockCode(), data.getCompany(), data.getIndustryNo()});
	}
}

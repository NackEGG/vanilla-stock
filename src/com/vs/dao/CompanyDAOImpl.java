package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.CompanyVO;
import com.vs.vo.IndustryVO;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int insertIntoAPI(CompanyVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("update company set industry_no = ? where stock_code = ? ",
				new Object[] {data.getIndustryNo(),data.getStockCode()});
	}
	
	@Override
	public List<CompanyVO> selectList() {
		RowMapper<CompanyVO> rowMapper = new RowMapper<CompanyVO>() {
			
			@Override
			public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyVO Company = new CompanyVO();
				Company.setCompany(rs.getString("company"));
				Company.setStockCode(rs.getString("stock_code"));
				Company.setIndustryNo(rs.getInt("industry_no"));
				return Company;
			}
		};
		return jdbcTemplate.query("select company,stock_code,industry_no from Company", rowMapper);
	}
	
	@Override
	public List<CompanyVO> selectCompany(int indNo)  {
		String sql="select company,industry_no,stock_code from company where company.stock_code in (select stock_records.stock_code from stock_records) and industry_no=? ORDER BY company.company";
		RowMapper<CompanyVO> rowMapper = new RowMapper<CompanyVO>() {
			
			@Override
			public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyVO company = new CompanyVO();
				company.setCompany(rs.getString("company"));
				company.setIndustryNo(rs.getInt("industry_no"));
				company.setStockCode(rs.getString("stock_code"));
				
				return company;
			}
		};
		return (List<CompanyVO>) jdbcTemplate.query(sql,rowMapper,new Object[] {indNo});
		
	}

	

	
}

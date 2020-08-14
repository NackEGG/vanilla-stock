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

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<CompanyVO> selectSearchNmList(String company) {
		RowMapper<CompanyVO> mapper = new RowMapper<CompanyVO>() {
			@Override
			public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				CompanyVO vo = new CompanyVO();
				vo.setCompany(rs.getString("company"));
				vo.setStockCode(rs.getString("stock_code"));
				return vo;
			}
		};
		
		List<CompanyVO> list = jdbcTemplate.query("select company, stock_code from company where company LIKE ? order by company", new Object[] {"%"+company+"%"}, mapper);
 		return list;
	}
	
	
	@Override
	public int insertIntoAPI(CompanyVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("update company set industry_no = ? where stock_code = ? ",
				new Object[] {data.getIndustryNo(),data.getStockCode()});
	}
}

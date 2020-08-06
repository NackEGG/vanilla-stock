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
	public int insertIntoAPI(CompanyVO data) {
		// TODO Auto-generated method stub
		return jdbcTemplate.update("update company set industry_no = ? where stock_code = ? ",
				new Object[] {data.getIndustryNo(),data.getStockCode()});
	}

	@Override
	public List<CompanyVO> listcompany() {
		RowMapper<CompanyVO> rowMapper = new CompanyRowMapper();
		return null;
	}
	
	
	public class CompanyRowMapper implements RowMapper<CompanyVO>{
		@Override
		public CompanyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CompanyVO vo = new CompanyVO();
			vo.setCompany(rs.getString("company"));
			vo.setIndustryNo(rs.getInt("industryno"));
			vo.setStockCode(rs.getString("stockcode"));
			return null;
		}
		
	}
}

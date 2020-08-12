package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.vs.vo.FinanceVO;

@Repository
public class FinanceDAOImpl implements FinanceDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SimpleJdbcCall getSimpleJdbcCall() {
		return new SimpleJdbcCall(jdbcTemplate);
	}
	
	@Override
	public List<FinanceVO> selectRecentFinance(String stockCode) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		simpleJdbcCall
		.withProcedureName("USP_GET_RECENT_FINANCE")
		.returningResultSet("PO_CURSOR", new RowMapper<FinanceVO>() {

			@Override
			public FinanceVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				FinanceVO vo = new FinanceVO();
				vo.setNo(rs.getInt("NO"));
				vo.setYear(rs.getInt("YEAR"));
				vo.setQuarter(rs.getInt("QUARTER"));
				vo.setStockCode(rs.getString("STOCK_CODE"));
				vo.setAccountCode(rs.getString("ACCOUNT_CODE"));
				vo.setAccountValue(rs.getLong("ACCOUNT_VALUE"));
				vo.setRegdate(rs.getTimestamp("REGDATE"));
				vo.setLabelKor(rs.getString("LABEL_KOR"));
				return vo;
			}
			
		});
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_STOCK_CODE", stockCode);
		
		Map<String,Object> out = simpleJdbcCall.execute(in);
		
		List<FinanceVO> ret = (List<FinanceVO>) out.get("PO_CURSOR");
		return ret;
	}

	@Override
	public List<FinanceVO> getIndustryAverageFinance(int industryNo) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall();
		
		simpleJdbcCall
		.withProcedureName("USP_GET_AVERAGE_FINANCE")
		.returningResultSet("PO_CURSOR", new RowMapper<FinanceVO>() {

			@Override
			public FinanceVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				FinanceVO vo = new FinanceVO();
				vo.setLabelKor(rs.getString("LABEL_KOR"));
				vo.setAccountValue(rs.getLong("AVG_ACCOUNT_VALUE"));
				return vo;
			}
			
		});
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_INDUSTRY_NO", industryNo);
		
		Map<String,Object> out = simpleJdbcCall.execute(in);
		
		List<FinanceVO> ret = (List<FinanceVO>) out.get("PO_CURSOR");
		return ret;
	}
	
}

package com.vs.dao;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.FinanceVO;

@Repository
public class FinanceDAOImpl implements FinanceDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	
	@Override
	public List<FinanceVO> selectSearchTermList(String stockCode) {
		RowMapper<FinanceVO> rowMapper = new RowMapper<FinanceVO>() {
			@Override
			public FinanceVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				FinanceVO vo = new FinanceVO();
				vo.setYear(rs.getInt("year"));
				vo.setQuarter(rs.getInt("quarter"));
				return vo;
			}
		};
		
		List<FinanceVO> list = jdbcTemplate.query("select year, quarter from finance where stock_code = ? group by year, quarter order by 1 desc, 2 desc", 
				new Object[] {stockCode}, rowMapper);
		
		return list;
	}
	
	
	
	@Override
	public List<FinanceManagerJoinVO> selectJoinList(String tab, String searchWord, int startYear, int startQuarter,
			int endYear, int endQuarter, int startPage, int endPage, String sortType) {
		SimpleJdbcCall procedureSelectContents = new SimpleJdbcCall(jdbcTemplate);
		System.out.println(procedureSelectContents.toString());
		
		procedureSelectContents.withProcedureName("select_contents").returningResultSet("CON_CURSOR",new RowMapper<FinanceManagerJoinVO>() {
			@Override
			public FinanceManagerJoinVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				FinanceManagerJoinVO vo = new FinanceManagerJoinVO();
				vo.setName(rs.getString("name"));
				vo.setCompany(rs.getString("company"));
				vo.setStockListed(rs.getLong("stockListed"));
				vo.setAccountCode(rs.getString("accountCode"));
				vo.setAccountNm(rs.getString("accountNm"));
				vo.setAccountValue(rs.getLong("accountValue"));
				vo.setCapital(rs.getLong("capital"));	
				vo.setCurrency(rs.getString("currency"));
				vo.setFacevalue(rs.getInt("facevalue"));
				vo.setNo(rs.getInt("no"));
				vo.setQuarter(rs.getInt("quarter"));
				vo.setSjDiv(rs.getString("sjDiv"));
				vo.setYear(rs.getInt("year"));
				vo.setStockCode(rs.getString("stockCode"));
				vo.setLabelKor(rs.getString("labelKor"));
				vo.setTotal(rs.getLong("total"));
				return vo;
			}
			
		});//
		
		System.out.println(tab+" "+searchWord+" "+startYear+" "+startQuarter+" "+endYear+" "+endQuarter+" "+startPage+" "+endPage+" "+sortType);
		
		SqlParameterSource in = new MapSqlParameterSource().addValue("tab", tab)
				.addValue("search_word", searchWord).addValue("start_year", startYear)
				.addValue("start_quarter", startQuarter).addValue("end_year", endYear)
				.addValue("end_quarter", endQuarter).addValue("start_page", startPage)
				.addValue("end_page", endPage).addValue("sort_type",sortType);
		
		Map<String, Object> out = procedureSelectContents.execute(in);
		
		for(String key : out.keySet()) {
			System.out.println(key+" : "+out.get(key));
		}
		
		@SuppressWarnings("unchecked")
		List<FinanceManagerJoinVO>  voList = (List<FinanceManagerJoinVO>) out.get("CON_CURSOR");
		
		//System.out.println(voList.get(0).getCompany());
		
		return voList;
	}
	
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

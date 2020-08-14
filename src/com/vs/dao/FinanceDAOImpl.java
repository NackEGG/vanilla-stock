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

import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.FinanceVO;

@Repository
public class FinanceDAOImpl implements FinanceDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired 
	private SimpleJdbcCall procedureSelectContents;
	
	
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
		procedureSelectContents.returningResultSet("financeManagerJoinVO", new RowMapper<FinanceManagerJoinVO>() {
			@Override
			public FinanceManagerJoinVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				FinanceManagerJoinVO vo = new FinanceManagerJoinVO();
				vo.setName(rs.getString("name"));
				vo.setCompany(rs.getString("company"));
				vo.setStockListed(rs.getInt("stockListed"));
				vo.setAccountCode(rs.getString("accountCode"));
				vo.setAccountNm(rs.getString("accountNm"));
				vo.setAccountValue(rs.getInt("accountValue"));
				vo.setCapital(rs.getInt("capital"));
				vo.setCurrency(rs.getString("currency"));
				vo.setFacevalue(rs.getInt("facevalue"));
				vo.setNo(rs.getInt("no"));
				vo.setQuarter(rs.getInt("quarter"));
				vo.setSjDiv(rs.getString("sjDiv"));
				vo.setYear(rs.getInt("year"));
				vo.setStockCode(rs.getString("stockCode"));
				vo.setLabelKor(rs.getString("labelKor"));
				vo.setTotal(rs.getInt("total"));
				return vo;
			}
			
		});//
		
		SqlParameterSource in = new MapSqlParameterSource().addValue("tab", tab)
				.addValue("search_word", searchWord).addValue("start_year", startYear)
				.addValue("start_quarter", startQuarter).addValue("end_year", endYear)
				.addValue("end_quarter", endQuarter).addValue("start_page", startPage)
				.addValue("end_page", endPage).addValue("sort_type",sortType);
		
		Map<String, Object> out = procedureSelectContents.execute(in);
		List<FinanceManagerJoinVO> voList = (List<FinanceManagerJoinVO>) out.get("OUT_CURSOR");
		
		return voList;
	}
}

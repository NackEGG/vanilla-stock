package com.vs.dao;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

@Repository
public class StockRecordsDAOImpl implements StockRecordsDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public SimpleJdbcCall getSimpleJdbcCall(JdbcTemplate jdbcTemplate) {
		return new SimpleJdbcCall(jdbcTemplate);
	}

	@Override
	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO) {
		System.out.println("출력dao");	
		RowMapper<StockRecordsVO> rowMapper = new RowMapper<StockRecordsVO>() {

			@Override
			public StockRecordsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				StockRecordsVO vo = new StockRecordsVO();
				vo.setNo(rs.getInt("NO"));
				vo.setStockCode(rs.getString("STOCK_CODE"));
				vo.settDate(rs.getString("T_DATE"));
				vo.setOpen(rs.getInt("OPEN"));
				vo.setHigh(rs.getInt("HIGH"));
				vo.setLow(rs.getInt("LOW"));
				vo.setClose(rs.getInt("CLOSE"));
				vo.setVolume(rs.getInt("VOLUME"));
				vo.setAdjClose(rs.getDouble("ADJ_CLOSE"));
				return vo;
			}
		};
		String sql = "SELECT NO, STOCK_CODE, T_DATE, OPEN, HIGH, LOW, CLOSE, VOLUME, ADJ_CLOSE "
				+ "FROM STOCK_RECORDS "
				+ "WHERE STOCK_CODE = ? AND T_DATE > ? "
				+ "ORDER BY T_DATE";
		System.out.println(sql);
		return jdbcTemplate.query(sql 
				, new Object[] {stockRecordsVO.getStockCode(),stockRecordsVO.gettDate()}
				, rowMapper);
	}

	@Override
	public StockRecordsVO select(StockRecordsVO stockRecordsVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate) {
		String sql ="select open,close,STOCK_RECORDS.stock_code,t_date,industry_no "
				+ "from STOCK_RECORDS ,COMPANY  "
				+ "WHERE STOCK_RECORDS.STOCK_CODE = COMPANY.STOCK_CODE "
				+ "AND T_DATE >= ? AND T_DATE <= ? "
				+ "ORDER BY stock_records.stock_code , t_date DESC";
		RowMapper<Pair<StockRecordsVO, String>> mapper = new RowMapper<Pair<StockRecordsVO, String>>() {

			@Override
			public Pair<StockRecordsVO, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
				StockRecordsVO tempVO = new StockRecordsVO();
				String tempStr = "";
				
				tempVO.setOpen(rs.getInt("open"));
				tempVO.setClose(rs.getInt("close"));
				tempVO.setStockCode(rs.getString("stock_code"));
				tempVO.settDate(rs.getString("t_date"));
				tempStr = rs.getString("industry_no");
				Pair<StockRecordsVO, String> resultPair = new Pair(tempVO, tempStr);
				
				//System.out.println(tempVO.getStockCode() + " / " + tempVO.gettDate() + " / " + tempStr);
				
				return resultPair;
			}//rs.next사용불가! 자동으로 호출되기때문
		};
		return (List<Pair<StockRecordsVO, String>>) jdbcTemplate.query(
				sql, mapper,new Object[] {startDate, endDate});
	}
	
	public List<Pair<StockRecordsVO, String>> selectStockWithCompanyByIndustry(int indNo, String startDate, String endDate){
		String sql ="select open,close,STOCK_RECORDS.stock_code,t_date,industry_no "
				+ "from STOCK_RECORDS ,COMPANY  "
				+ "WHERE STOCK_RECORDS.STOCK_CODE = COMPANY.STOCK_CODE "
				+ "AND T_DATE >= ? AND T_DATE <= ? "
				+ "AND industry_no = ? "
				+ "ORDER BY stock_records.stock_code , t_date DESC";
		RowMapper<Pair<StockRecordsVO, String>> mapper = new RowMapper<Pair<StockRecordsVO, String>>() {

			@Override
			public Pair<StockRecordsVO, String> mapRow(ResultSet rs, int rowNum) throws SQLException {
				StockRecordsVO tempVO = new StockRecordsVO();
				String tempStr = "";
				
				tempVO.setOpen(rs.getInt("open"));
				tempVO.setClose(rs.getInt("close"));
				tempVO.setStockCode(rs.getString("stock_code"));
				tempVO.settDate(rs.getString("t_date"));
				tempStr = rs.getString("industry_no");
				Pair<StockRecordsVO, String> resultPair = new Pair(tempVO, tempStr);
				
				//System.out.println(tempVO.getStockCode() + " / " + tempVO.gettDate() + " / " + tempStr);
				
				return resultPair;
			}//rs.next사용불가! 자동으로 호출되기때문
		};
		return (List<Pair<StockRecordsVO, String>>) jdbcTemplate.query(
				sql, mapper,new Object[] {startDate, endDate, indNo});
	}

	@Override
	public int selectPrevMonthClose(StockRecordsVO stockRecordsVO) {
		
		SimpleJdbcCall simpleJdbcCall = getSimpleJdbcCall(jdbcTemplate);
		
		simpleJdbcCall
		.withProcedureName("USP_PREV_MONTH_STOCK_PRICE");
		
		SqlParameterSource in = new MapSqlParameterSource()
				.addValue("PI_STOCK_CODE", stockRecordsVO.getStockCode())
				.addValue("PI_T_DATE", stockRecordsVO.gettDate());

		Map out = simpleJdbcCall.execute(in);
		
		int ret = ((BigDecimal) out.get("PO_CLOSE")).intValue();
		
		return ret;
	}
}

package com.vs.dao;

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
	private SimpleJdbcCall simpleJdbcCall;

	@Override
	public List<StockRecordsVO> selectList(String stockCode, Date tDate) {
		simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withProcedureName("usp_get_list_stock_records")
				.returningResultSet("list_stock_records", 
						BeanPropertyRowMapper.newInstance(StockRecordsVO.class));
		
				/*.returningResultSet("list_stock_records", new RowMapper<StockRecordsVO>() {

					@Override
					public StockRecordsVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						StockRecordsVO stockRecordsVO = new StockRecordsVO();
						
						stockRecordsVO.setNo(rs.getInt("no"));
						stockRecordsVO.setStockCode(rs.getString("stock_code"));
						stockRecordsVO.settDate(rs.getDate("t_date"));
						stockRecordsVO.setOpen(rs.getInt("open"));
						stockRecordsVO.setHigh(rs.getInt("high"));
						stockRecordsVO.setLow(rs.getInt("low"));
						stockRecordsVO.setClose(rs.getInt("close"));
						stockRecordsVO.setVolume(rs.getInt("volume"));
						stockRecordsVO.setAdjClose(rs.getInt("adj_close"));
						
						return stockRecordsVO;
					}
				});*/
		
		Map<String,Object> result = simpleJdbcCall.execute(stockCode, tDate);
		List<StockRecordsVO> listStockRecords = (List<StockRecordsVO>) result.get("list_stock_records");
                   
		return listStockRecords;
	}

	@Override
	public StockRecordsVO select(String stockCode, Date tDate) {
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
}

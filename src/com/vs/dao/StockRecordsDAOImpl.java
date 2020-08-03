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
import org.springframework.stereotype.Repository;

import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

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
}

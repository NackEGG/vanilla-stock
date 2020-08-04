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
}

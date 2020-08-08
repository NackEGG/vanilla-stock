package com.vs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.vs.vo.FinanceVO;

@Repository
public class FinanceDAOImpl implements FinanceDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Map<String,Object>> findAccountValueList(FinanceVO financeVO) {
		String sql = "select account_code, account_value "
				+ "from finance "
				+ "where year=? and quarter=? and stock_code=?";
		return jdbcTemplate.queryForList(sql
				, new Object[] 
						{financeVO.getYear(), financeVO.getQuarter(), financeVO.getStockCode()} 
				);
	}

	
}

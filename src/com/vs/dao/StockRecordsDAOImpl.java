package com.vs.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.vs.vo.StockRecordsVO;

@Repository
public class StockRecordsDAOImpl implements StockRecordsDAO{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<StockRecordsVO> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StockRecordsVO select() {
		// TODO Auto-generated method stub
		return null;
	}
}


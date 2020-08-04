package com.vs.dao;

import java.sql.Date;
import java.util.List;

import com.vs.vo.StockRecordsVO;

public interface StockRecordsDAO {
	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO);
	public StockRecordsVO select(StockRecordsVO stockRecordsVO);
}

package com.vs.dao;

import java.sql.Date;
import java.util.List;

import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

public interface StockRecordsDAO {

	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO);
	public StockRecordsVO select(StockRecordsVO stockRecordsVO);
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate);
	public int selectPrevMonthClose(StockRecordsVO stockRecordsVO);
}

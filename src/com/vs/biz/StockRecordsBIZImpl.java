package com.vs.biz;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.StockRecordsDAO;
import com.vs.vo.StockRecordsVO;
import javafx.util.Pair;

@Service
public class StockRecordsBIZImpl implements StockRecordsBIZ{
	@Autowired
	private StockRecordsDAO stockRecordsDAO;

	@Override
	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO) {
		return stockRecordsDAO.selectList(stockRecordsVO);
	}

	@Override
	public StockRecordsVO select(StockRecordsVO stockRecordsVO) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate) {
		return stockRecordsDAO.selectStockWithCompany(startDate, endDate);

	}

	@Override
	public int selectPrevMonthClose(StockRecordsVO stockRecordsVO) {
		return stockRecordsDAO.selectPrevMonthClose(stockRecordsVO);
	}
}

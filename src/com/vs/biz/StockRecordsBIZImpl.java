package com.vs.biz;

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
	
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate) {
		return stockRecordsDAO.selectStockWithCompany(startDate, endDate);
	}

	@Override
	public List<Pair<StockRecordsVO, String>> selectStockWithCompanyByIndustry(int indNo, String startDate,
			String endDate) {
		// TODO Auto-generated method stub
		return stockRecordsDAO.selectStockWithCompanyByIndustry(indNo, startDate, endDate);
	}
}

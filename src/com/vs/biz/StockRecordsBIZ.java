package com.vs.biz;

import java.util.List;

import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

public interface StockRecordsBIZ {
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate);
}

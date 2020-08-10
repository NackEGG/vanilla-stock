package com.vs.biz;


import java.sql.Date;
import java.util.List;
import javafx.util.Pair;
import com.vs.vo.StockRecordsVO;

public interface StockRecordsBIZ {
	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO);
	public StockRecordsVO select(StockRecordsVO stockRecordsVO);
	public List<Pair<StockRecordsVO, String>> selectStockWithCompany(String startDate, String endDate);
	public int selectPrevMonthClose(StockRecordsVO stockRecordsVO);
}

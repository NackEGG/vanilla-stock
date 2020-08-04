package com.vs.biz;

import java.sql.Date;
import java.util.List;

import com.vs.vo.StockRecordsVO;

public interface StockRecordsBIZ {
	public List<StockRecordsVO> selectList(StockRecordsVO stockRecordsVO);
	public StockRecordsVO select(StockRecordsVO stockRecordsVO);
}

package com.vs.dao;

import java.util.List;

import com.vs.vo.StockRecordsVO;

public interface StockRecordsDAO {
	public List<StockRecordsVO> selectList();
}

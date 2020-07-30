package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.StockRecordsDAO;

@Service
public class StockRecordsBIZImpl implements StockRecordsBIZ{
	@Autowired
	private StockRecordsDAO stockRecordsDAO;
}

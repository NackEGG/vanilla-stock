package com.vs.dao;

import java.util.List;
import java.util.Map;

import com.vs.vo.FinanceVO;

public interface FinanceDAO {
	public List<Map<String,Object>> findAccountValueList(FinanceVO financeVO);
}

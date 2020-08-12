package com.vs.dao;

import java.util.List;

import com.vs.vo.FinanceVO;

public interface FinanceDAO {
	public List<FinanceVO> selectRecentFinance(String stockCode);
	public List<FinanceVO> getIndustryAverageFinance(int industryNo);
}

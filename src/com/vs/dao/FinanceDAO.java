package com.vs.dao;

import java.util.List;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.FinanceVO;

public interface FinanceDAO {
	public List<FinanceVO> selectSearchTermList(String stockCode); 
	public List<FinanceManagerJoinVO> selectJoinList(String tab, String searchWord, int startYear, int startQuarter, int endYear, int endQuarter, int startPage, int endPage, String sortType );
	public List<FinanceVO> selectRecentFinance(String stockCode);
	public List<FinanceVO> getIndustryAverageFinance(int industryNo);
}

package com.vs.biz;

import java.util.List;
import java.util.Map;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.FinanceVO;

public interface FinanceBIZ {
	public Map<String, Object> getJoinList(int page, String tab, String searchWord, int startYear, 
			int startQuarter, int endYear, int endQuarter, String sortType );
	public List<FinanceVO> getSearchTermList(String stockCode);
	public Map<String, Long> findRecentAccountValueMap(String stockCode);	
	public Map<String, Long> findIndustryAverageValueMap(int industryNo);
}

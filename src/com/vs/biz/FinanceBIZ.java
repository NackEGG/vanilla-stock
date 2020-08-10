package com.vs.biz;

import java.util.List;
import java.util.Map;

import com.vs.vo.FinanceVO;

public interface FinanceBIZ {
	public Map<String,Long> findAccountValueMap(FinanceVO financeVO);	
}

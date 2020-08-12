package com.vs.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.FinanceDAO;
import com.vs.vo.FinanceVO;

@Service
public class FinanceBIZImpl implements FinanceBIZ {
	@Autowired
	private FinanceDAO financeDAO;

	// dao의 결과 List<Map<String,Object>>를 -> Map<String account_code,Long value>로
	@Override
	public Map<String, Long> findRecentAccountValueMap(String stockCode) {
		Map<String, Long> result = new HashMap<>();
		List<FinanceVO> list = financeDAO.selectRecentFinance(stockCode);

		for (FinanceVO vo : list) {
			result.put(vo.getLabelKor(), vo.getAccountValue());
		}
		return result;
	}

	@Override
	public Map<String, Long> findIndustryAverageValueMap(int industryNo) {
		Map<String, Long> result = new HashMap<>();
		List<FinanceVO> list = financeDAO.getIndustryAverageFinance(industryNo);
		
		for (FinanceVO vo : list) {
			result.put(vo.getLabelKor(), vo.getAccountValue());
		}
		return result;
	}
}

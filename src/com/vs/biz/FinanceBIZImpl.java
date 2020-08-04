package com.vs.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.FinanceDAO;
import com.vs.vo.FinanceVO;

@Service
public class FinanceBIZImpl implements FinanceBIZ {
	@Autowired
	private FinanceDAO financeDAO;

	// dao의 결과 List<Map<String,Object>>를 -> Map<String,Long>으로
	@Override
	public Map<String, Long> findAccountValueMap(FinanceVO financeVO) {
		Map<String, Long> result = new HashMap<>();
		List<Map<String, Object>> daoResult = 
				financeDAO.findAccountValueList(financeVO);

		for (Map<String, Object> map : daoResult) {
			for (Entry<String, Object> entry : map.entrySet()) {
				String key = entry.getKey();
				Long value = (Long) entry.getValue();
				result.put(key, value);
			}
		}
		return result;
	}
}

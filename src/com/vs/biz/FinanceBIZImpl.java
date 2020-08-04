package com.vs.biz;

import java.math.BigDecimal;
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

	// dao의 결과 List<Map<String,Object>>를 -> Map<String account_code,Long value>로
	@Override
	public Map<String, Long> findAccountValueMap(FinanceVO financeVO) {
		Map<String, Long> result = new HashMap<>();
		List<Map<String, Object>> daoResult = 
				financeDAO.findAccountValueList(financeVO);

		for (Map<String, Object> map : daoResult) {
			String key = (String) map.get("account_code");
			if("".equals(map.get("account_value"))
					|| map.get("account_value") != null) {
				Long value = ((BigDecimal)map.get("account_value")).longValue();
				result.put(key, value);
			} else {
				continue; // account_value에 아무값도 없을 경우 map에 안 포함시킴
			}
		}
		return result;
	}
}

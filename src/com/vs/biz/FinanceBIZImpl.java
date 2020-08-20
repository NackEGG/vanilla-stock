package com.vs.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.FinanceDAO;
import com.vs.util.PaginateUtil;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.FinanceVO;
import com.vs.vo.PageVO;


@Service
public class FinanceBIZImpl implements FinanceBIZ {
	@Autowired
	private FinanceDAO financeDAO;
	
	@Override
	public List<FinanceVO> getSearchTermList(String stockCode) {
		// TODO Auto-generated method stub
		return financeDAO.selectSearchTermList(stockCode);
	}
	@Override
	public Map<String, Object> getJoinList(int page, String tab, String searchWord, int startYear, int startQuarter,
			int endYear, int endQuarter, String sortType) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 10; //각 인덱스당 출력되는 유저 수 
		int numBlock = 5; //출력될 페이지 인덱스 개수 
		System.out.println(searchWord);
		if(searchWord==null||searchWord.isEmpty()||searchWord.length()<1)	searchWord = null;
		if(sortType==null||sortType.isEmpty()||sortType.length()<1)	sortType = null;
		List<FinanceManagerJoinVO> list = new ArrayList<FinanceManagerJoinVO>();
		PaginateUtil paginateUtil = new PaginateUtil();
		PageVO pageVO = new PageVO(page, numPage);
		int endPage = pageVO.getEnd();
		int startPage = pageVO.getStart();
		
		list = financeDAO.selectJoinList(tab, searchWord, startYear, startQuarter, 
				endYear, endQuarter, startPage, endPage, sortType);
		map.put("dataList", list);
		
		for(FinanceManagerJoinVO f : list) {
			System.out.println(f.getName());
		}
		
		//총 게시물 수 
		int total = (int) list.get(0).getTotal();
		
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, 
				"/vanilla-stock/ajax/manager/contents"));
	
	
		
	
		return map;
	}

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

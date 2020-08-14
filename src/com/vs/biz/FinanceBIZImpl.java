package com.vs.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
		
		if(searchWord.isEmpty()||searchWord.length()<1)	searchWord = null;
		List<FinanceManagerJoinVO> list = new ArrayList<FinanceManagerJoinVO>();
		PaginateUtil paginateUtil = new PaginateUtil();
		PageVO pageVO = new PageVO(page, numPage);
		int endPage = pageVO.getEnd();
		int startPage = pageVO.getStart();
		
		list = financeDAO.selectJoinList(tab, searchWord, startYear, startQuarter, 
				endYear, endQuarter, startPage, endPage, sortType);
		map.put("financeDataList", list);
		
		//총 게시물 수 
		int total = list.get(0).getTotal();
		
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, 
				"/vanilla-stock/ajax/manager/contents"));
	
	
		
	
		return map;
	}

}

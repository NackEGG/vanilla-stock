package com.vs.biz;

import java.util.Collection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vs.dao.CommentsDAO;
import com.vs.dao.CompanyDAO;
import com.vs.dao.FinanceDAO;
import com.vs.dao.IndustryDAO;
import com.vs.dao.StockRecordsDAO;
import com.vs.util.StockApiUtil;
import com.vs.vo.CommentsVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceVO;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

@Service
public class CompanyBIZImpl implements CompanyBIZ {

	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private IndustryDAO industryDAO;
	
	@Autowired
	private StockRecordsDAO stockRecordsDAO;
	
	@Autowired
	private FinanceDAO financeDAO;
	
	@Autowired
	private CommentsDAO commentsDAO;

	@Override
	public List<CompanyVO> getSearchNmList(String company) {
		// TODO Auto-generated method stub
		return companyDAO.selectSearchNmList(company);
	}

	@Override
	public CompanyVO select(String keyword) {
		return companyDAO.select(keyword);
	}

	@Transactional
	@Override
	public boolean insertIntoAPI(List<CompanyVO> companyList) {
		boolean check = false;
		int i = 0;
		for (CompanyVO company : companyList) {
			// System.out.println(company.getStockCode());
			try {
				if (companyDAO.insertIntoAPI(company) > 0) {
					System.out.println("[넣는 중]");
					check = true;
					i++;
				}
			} catch (Exception e) {
				continue;
			}

		} // for end
		System.out.println("[ 총 넣은 개수 : " + i + " 개 ]");
		return check;
	}

	@Override
	public List<CompanyVO> selectCompany(int indNo) {
		return companyDAO.selectCompany(indNo);
	}

	@Override
	public List<CompanyVO> getList() {
		return companyDAO.selectList();
	}

	@Override
	public List<String> selectAllCompanyName() {

		List<String> ret = new ArrayList<String>();
		ret = companyDAO.selectAllCompanyName();

		return ret;
	}

	@Transactional
	@Override
	public Map<String, Object> getSummary(String keyword) {
		
		Map<String,Object> map = new ConcurrentHashMap<String, Object>();
		
		// 회사 정보
		CompanyVO companyVO = companyDAO.select(keyword);
		String no = companyVO.getStockCode();
		map.put("companyVO",companyVO);
		
		// 산업 정보
		IndustryVO industryVO = industryDAO.get(no);
		map.put("industryVO",industryVO);
		
		// 주식 실시간 API
		StockApiUtil api = new StockApiUtil(no);
		String[] arrStockInfo = api.getStockInfoAPI();
		String[][] arrDailyStock = api.getDailyStockAPI();
		String[][] arrTimeConclude = api.getTimeConcludeAPI();
		map.put("arrStockInfo", arrStockInfo);
		map.put("arrDailyStock", arrDailyStock);
		map.put("arrTimeConclude", arrTimeConclude);

		// 장마감 후 비어있는 실시간 체결가에 현재가 넣기
		for (int i = 0; i < arrDailyStock.length; i++) {
			if (arrTimeConclude[i][1].equals("") || arrTimeConclude[i][1].isEmpty()) {
				arrTimeConclude[i][1] = arrStockInfo[1].replaceAll(",", "");
			}
		}
		
		// 전월 종가 불러오기
		StockRecordsVO stockRecordsVO = new StockRecordsVO();
		stockRecordsVO.settDate(arrStockInfo[18].substring(0, 10));
		stockRecordsVO.setStockCode(no);
		int prevMonthClose = stockRecordsDAO.selectPrevMonthClose(stockRecordsVO);
		map.put("prevMonthClose", prevMonthClose);

		// 가장 최근 분기 재무 정보
		Map<String, Long> financeMap = new ConcurrentHashMap<String, Long>();
		List<FinanceVO> financeList = financeDAO.selectRecentFinance(no);
		
		for (FinanceVO vo : financeList) {
			financeMap.put(vo.getLabelKor(), vo.getAccountValue());
		}		
		map.put("financeMap", financeMap);
		
		// 업종 평균 재무 정보
		Map<String, Long> industryFinanceMap = new ConcurrentHashMap<String, Long>(); 
		List<FinanceVO> industryFinanceList = financeDAO.getIndustryAverageFinance(companyVO.getIndustryNo());
		
		for (FinanceVO vo : industryFinanceList) {
			industryFinanceMap.put(vo.getLabelKor(), vo.getAccountValue());
		}	
		map.put("industryFinanceMap", industryFinanceMap);

		// 투기장 (가장 최근 댓글 3개) + 풀매도, 풀매수
		List<CommentsVO> commentsList = commentsDAO.getRecentComments(no, 3);
		map.put("commentsList", commentsList);

		int[] opinion;

		try {
			int articleNo = commentsList.get(0).getArticleNo();
			opinion = commentsDAO.getTotalCountCommentsByOpinion(articleNo);
		} catch (IndexOutOfBoundsException ie) {
			opinion = new int[] { 0, 0 };
		}
		map.put("opinion",opinion);
		
		return map;
	}

}

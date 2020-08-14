package com.vs.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vs.biz.CommentsBIZ;
import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.StockApiUtil;
import com.vs.vo.CommentsVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceVO;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

@Controller
public class ReportPageController {

	@Autowired
	CompanyBIZ companyBIZ;
	
	@Autowired
	IndustryBIZ industryBIZ;
	
	@Autowired
	StockRecordsBIZ stockRecordsBIZ;
	
	@Autowired
	FinanceBIZ financeBIZ;
	
	@Autowired
	CommentsBIZ commentsBIZ;
	
	@RequestMapping(path = "/reportPage/{no}", method = RequestMethod.GET)
	public String hello01(@PathVariable String no, Model model) throws Exception {
		
		//String keyword = (String) request.getAttribute("keyword");
		//CompanyVO companyVO = companyBIZ.select(keyword);
		
		// 회사, 산업 정보
		CompanyVO companyVO = companyBIZ.select(no);
		IndustryVO industryVO = industryBIZ.get(no);
			
		// 주식 실시간 API 
		StockApiUtil api = new StockApiUtil(no);
		String[] arrStockInfo = api.getStockInfoAPI();
		String[][] arrDailyStock = api.getDailyStockAPI();
		String[][] arrTimeConclude = api.getTimeConcludeAPI();
		
		// 장마감 후 비어있는 실시간 체결가에 현재가 넣기
		for(int i = 0; i<arrDailyStock.length; i++) {
			if(arrTimeConclude[i][1].equals("") || arrTimeConclude[i][1].isEmpty()) {
				arrTimeConclude[i][1] = arrStockInfo[1].replaceAll(",", "");
			}
		}
		// 전월 종가 불러오기
		StockRecordsVO stockRecordsVO = new StockRecordsVO();
		stockRecordsVO.settDate(arrStockInfo[18].substring(0, 10));
		stockRecordsVO.setStockCode(no);
		int prevMonthClose = stockRecordsBIZ.selectPrevMonthClose(stockRecordsVO);
		
		// 가장 최근 분기 재무 정보 
		FinanceVO financeVO = new FinanceVO();
		financeVO.setStockCode(companyVO.getStockCode());
		Map<String,Long> financeMap = financeBIZ.findRecentAccountValueMap(no);
		/*
		 * for(Entry<String,Long> r : financeMap.entrySet()) {
		 * System.out.println(r.getKey() + " : " + r.getValue()); }
		 */
		
		// 업종 평균 재무 정보
		Map<String,Long> industryFinanceMap = financeBIZ.findIndustryAverageValueMap(companyVO.getIndustryNo());
		
		// 투기장 (가장 최근 댓글 5개) + 풀매도, 풀매수
		List<CommentsVO> commentsList = commentsBIZ.getRecentComments(no, 5);
		
		int[] opinion;
		
		try {	
			int articleNo = commentsList.get(0).getArticleNo();
			opinion = commentsBIZ.getTotalCountCommentsByOpinion(articleNo);
		} catch (IndexOutOfBoundsException ie) {
			System.out.println(ie);
			ie.printStackTrace();
			opinion = new int[] {0,0};
		}
		
		// model.addAttribute
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("industryVO", industryVO);
		model.addAttribute("arrStockInfo", arrStockInfo);
		model.addAttribute("arrDailyStock", arrDailyStock);
		model.addAttribute("arrTimeConclude", arrTimeConclude);
		model.addAttribute("prevMonthClose", prevMonthClose);
		model.addAttribute("financeMap", financeMap);
		model.addAttribute("industryFinanceMap", industryFinanceMap);
		model.addAttribute("commentsList", commentsList);
		model.addAttribute("opinion", opinion);
		
		return "reportPage";
	}
}

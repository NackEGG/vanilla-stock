package com.vs.controller;

import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.StockApiUtil;
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
	
	@RequestMapping(path = "/reportPage", method = RequestMethod.GET)
	public String hello01(HttpServletRequest request, Model model) throws Exception {
		
		//String keyword = (String) request.getAttribute("keyword");
		//CompanyVO companyVO = companyBIZ.select(keyword);
		
		// 회사, 산업 정보
		CompanyVO companyVO = companyBIZ.select("005930");
		IndustryVO industryVO = industryBIZ.get(companyVO.getStockCode());
			
		// 주식 실시간 API 
		StockApiUtil api = new StockApiUtil(companyVO.getStockCode());
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
		System.out.println(stockRecordsVO.gettDate());
		stockRecordsVO.setStockCode(companyVO.getStockCode());
		int prevMonthClose = stockRecordsBIZ.selectPrevMonthClose(stockRecordsVO);
		
		// 가장 최근 분기 재무 정보 
		FinanceVO financeVO = new FinanceVO();
		financeVO.setStockCode(companyVO.getStockCode());
		Map<String,Long> financeMap = financeBIZ.findRecentAccountValueMap(companyVO.getStockCode());
		/*
		 * for(Entry<String,Long> r : financeMap.entrySet()) {
		 * System.out.println(r.getKey() + " : " + r.getValue()); }
		 */
		
		// 업종 평균 재무 정보
		Map<String,Long> industryFinanceMap = financeBIZ.findIndustryAverageValueMap(companyVO.getIndustryNo());
		
		System.out.println(financeMap.get("자본과부채총계") +" : " +industryFinanceMap.get("자본과부채총계"));
		
		// model.addAttribute
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("industryVO", industryVO);
		model.addAttribute("arrStockInfo", arrStockInfo);
		model.addAttribute("arrDailyStock", arrDailyStock);
		model.addAttribute("arrTimeConclude", arrTimeConclude);
		model.addAttribute("prevMonthClose", prevMonthClose);
		model.addAttribute("financeMap", financeMap);
		model.addAttribute("industryFinanceMap", industryFinanceMap);
		
		return "reportPage";
	}
}

package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.module.SimpleAbstractTypeResolver;
import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.FinanceApiUtil;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

import com.vs.vo.CardPageVO;

@Controller
@RequestMapping("/cardpage")
public class CardPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ;


	@RequestMapping("/init")
	public String initCardPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("페이지 진입 성공");
	
		String[] Date = getStartEndDate();		// 0:Start, 1:End
		
		// 기존 데이터 삭제
		Map<String, CardPageVO> cardDataMap = new HashMap<String, CardPageVO>();
		//cardDataMap.clear();
		List<String> indNoList = new ArrayList<String>();
		//indNoList.clear();
		
		// INDUSTRY / Map 생성
		List<IndustryVO> indList = industryBIZ.getList();
		for(IndustryVO curInd : indList) {
			CardPageVO tempCVO = new CardPageVO();
			tempCVO.setIndustryNo(curInd.getNo());
			tempCVO.setIndustryName(curInd.getName());
			tempCVO.setTotalCnt(0);
			tempCVO.setIncCnt(0);
			tempCVO.setDecCnt(0);
			tempCVO.setCRateSum(0);
		
			cardDataMap.put(curInd.getNo() + "", tempCVO);
			indNoList.add(tempCVO.getIndustryNo()+"");
		}

		// 1. DB에서 데이터 가져오기
		//   1-1) STOCK_RECOREDS & COMPANY 데이터 Join해서 가져오기
		//List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany(Date[0], Date[1]);
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany("2020-07-01", "2020-07-02");
		
		// ★ SELECT문에서 회사코드 -> 날짜(오름차순)로 정렬되어있는 상태여야 함
		//산업군별 데이터VO에 데이터를 축적
		// - 회사 수
		// - 상승/하락/보합 상태인 회사들의 수
		// - 변동률 평균을 구하기 위한 각 회사 별 변동률 합계
		for(int i = 0; i < rs.size() - 1; i++) {
			// 첫번째 날짜
			StockRecordsVO svo1 = rs.get(i).getKey();
			String indNo1 = rs.get(i).getValue();			
			String stockCode1 = svo1.getStockCode();
			
			// 두번째 날짜
			StockRecordsVO svo2 = rs.get(i+1).getKey();
			String indNo2 = rs.get(i+1).getValue();			
			String stockCode2 = svo2.getStockCode();
			
			// 같은 회사임?
			if(!indNo1.equals(indNo2) || !stockCode1.equals(stockCode2)) {
				System.out.println(indNo1 + "vs" + indNo2 + indNo1.equals(indNo2) + "  "
						+ stockCode1 + "vs" + stockCode2 + stockCode1.equals(stockCode2));
				
				continue;//데이터 누락시 이전데이터 버림
			}
			
			/* System.out.printf(">" + indNo1 + " / " + stockCode1 + " -- "); */
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose();	// 어제 종가
			double close2 = svo2.getClose();	// 오늘 종가
			double changeRate = (close2 - close1) / close1 * 100;
			cardDataMap.get(indNo1).addCRateSum(changeRate);
			/* System.out.printf(changeRate + " ... "); */
			
			// 개수 세기
			cardDataMap.get(indNo1).increaseTotalCnt();
			if(changeRate > 0) {
				cardDataMap.get(indNo1).increaseIncCnt();
				/* System.out.printf("▲\n"); */
			}else if(changeRate < 0) {
				cardDataMap.get(indNo1).increaseDecCnt();
				/* System.out.printf("▼\n"); */
			}else {
				/* System.out.printf("-\n"); */
			}
			
			i++;
		}

		// 산업군의 변동률 계산
		for(String indNo : indNoList) {		
			double cRateSum = 0;
			int totalCnt =0;
			try {
				cRateSum = cardDataMap.get(indNo).getCRateSum();
				 totalCnt = cardDataMap.get(indNo).getTotalCnt();
				
			} catch (Exception e) {
				System.out.println("[ ERROR indNo  "+indNo+" ]");
			}
			 
			cardDataMap.get(indNo).setChangeRate(cRateSum / totalCnt);
		}
		
		System.out.println("[완성한 데이터]");
		Map<String, CardPageVO> cardDataMap02 = printCardDataMap(indNoList , cardDataMap);
		model.addAttribute("cardDataMap", cardDataMap02);
		return "industryCardPage";
	}///
	
	private String[] getStartEndDate(){
		Calendar cal = Calendar.getInstance();
		int dayofweek = 0;		
		String format = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		
		String[] res = new String[2];	// 0:Start, 1:End
		
		// Start Date
		dayofweek = cal.get(cal.DAY_OF_WEEK);
		if(dayofweek == 1) {
			cal.add(cal.DATE, -2);
		}else if(dayofweek == 7) {
			cal.add(cal.DATE, -1);
		}
		res[0] = sdf.format(cal.getTime());
		
		// End Date
		cal.add(cal.DATE, -1);
		dayofweek = cal.get(cal.DAY_OF_WEEK);
		if(dayofweek == 1) {
			cal.add(cal.DATE, -2);
		}else if(dayofweek == 7) {
			cal.add(cal.DATE, -1);
		}
		res[1] = sdf.format(cal.getTime());
				
		return res;
	} 
	
	public Map<String, CardPageVO> printCardDataMap(List<String> indNoList, Map<String, CardPageVO> cardDataMap) {
		Map<String, CardPageVO> cardDataMap02 = new HashMap<String, CardPageVO>();
		// 산업군의 변동률 계산
		for(String indNo : indNoList) {	
			try {
				CardPageVO curCVO = cardDataMap.get(indNo);
				int totalCnt = curCVO.getTotalCnt();
				int incCnt = curCVO.getIncCnt();
				int decCnt = curCVO.getDecCnt();
				int somthingleft = totalCnt - incCnt - decCnt;
				double CRate = curCVO.getChangeRate();
				
				
				/*
				 * System.out.println("["+curCVO.getIndustryName()+"] "+ totalCnt + " / " +
				 * incCnt + " / " + decCnt + " / " + somthingleft + " / " + CRate);
				 */
				 
				cardDataMap02.put(indNo,curCVO);
			} catch (Exception e) {
				System.out.println("[오류]");
			}
		
		}//for end
		return cardDataMap02;
	}
}
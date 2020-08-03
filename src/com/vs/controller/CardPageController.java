package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping("/industryCard")
public class CardPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ;
	
	private Map<String, CardPageVO> cardDataMap;

	@RequestMapping("getData")
	public void initCardPage(HttpServletRequest request, HttpServletResponse response) {
		String[] Date = getStartEndDate();		// 0:Start, 1:End
		
		// 기존 데이터 삭제
		cardDataMap.clear();
		
		// INDUSTRY / Map 생성
		List<IndustryVO> indList = industryBIZ.getList();
		CardPageVO tempCVO = new CardPageVO();
		for(IndustryVO curInd : indList) {
			tempCVO.setIndustryNo(curInd.getNo());
			tempCVO.setIndustryName(curInd.getName());
			tempCVO.setTotalCnt(0);
			tempCVO.setIncCnt(0);
			tempCVO.setDecCnt(0);
			tempCVO.setCRateSum(0);
			
			cardDataMap.put(curInd.getNo() + "", tempCVO);
		}

		// 1. DB에서 데이터 가져오기
		//   1-1) STOCK_RECOREDS & COMPANY 데이터 Join해서 가져오기
		List<Pair<StockRecordsVO, String>> rs = stockRecordsBIZ.selectStockWithCompany(Date[0], Date[1]);
		
		// ★ SELECT문에서 회사코드 -> 날짜(오름차순)로 정렬되어있는 상태여야 함
		//산업군별 데이터VO에 데이터를 축적
		// - 회사 수
		// - 상승/하락/보합 상태인 회사들의 수
		// - 변동률 평균을 구하기 위한 각 회사 별 변동률 합계
		for(int i = 0; i < rs.size(); i++) {
			// 첫번째 날짜
			StockRecordsVO svo1 = rs.get(i).getKey();
			String indNo1 = rs.get(i).getValue();			
			String stockCode1 = svo1.getStockCode();
			
			// 두번째 날짜
			StockRecordsVO svo2 = rs.get(i+1).getKey();
			String indNo2 = rs.get(i+1).getValue();			
			String stockCode2 = svo2.getStockCode();
			
			// 같은 회사임?
			if(indNo1 != indNo2 || stockCode1 != stockCode2) {
				continue;//데이터 누락시 이전데이터 버림
			}
			
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose();	// 어제 종가
			double close2 = svo2.getClose();	// 오늘 종가
			double changeRate = (close2 - close1) / close1 * 100;
			cardDataMap.get(indNo1).addCRateSum(changeRate);
			
			// 개수 세기
			cardDataMap.get(indNo1).increaseTotalCnt();
			if(changeRate > 0) {
				cardDataMap.get(indNo1).increaseIncCnt();
			}else if(changeRate < 0) {
				cardDataMap.get(indNo1).increaseDecCnt();
			}
		}

		// 산업군의 변동률 계산
		for(IndustryVO curInd : indList) {
			String indNo = curInd.getNo() + "";
			double cRateSum = cardDataMap.get(indNo).getCRateSum();
			int totalCnt = cardDataMap.get(indNo).getTotalCnt();
			cardDataMap.get(indNo).setChangeRate(cRateSum / totalCnt);
		}
		
		
		// 2. 가져온 데이터 변환
		//   2-1) 종목 이름 매칭하기
		
		//   2-2) 평균구하기
		
		//   2-3) 상승/하락/보합 갯수 세기

	}
	
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

}

package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.FinanceApiUtil;
import com.vs.vo.IndustryVO;
import com.vs.vo.CardPageVO;

@Controller
public class CardPageController {
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private IndustryBIZ industryBIZ ;
	@Autowired
	private CompanyBIZ companyBIZ;
	
	private List<CardPageVO> cardDataList;

	@RequestMapping("/initCardPage")
	public void initCardPage(HttpServletRequest request, HttpServletResponse response) {
		// 변수 생성

		
		// 기존 데이터 삭제
		cardDataList.clear();
		
		// 1. DB에서 데이터 가져오기
		//   1-1) STOCK_RECOREDS & COMPANY 데이터 Join해서 가져오기
		//stockRecordsBIZ.getStock,~~~~();		
		
		//   1-2) INDUSTRY
		
		
		// 2. 가져온 데이터 변환
		//   2-1) 종목 이름 매칭하기
		
		//   2-2) 평균구하기
		
		//   2-3) 상승/하락/보합 갯수 세기

	}
	
	@RequestMapping("/getFinanceDataEx")
	public void getIndustryData(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=UTF-8");
		System.out.println("[ 종목 넣기 ]");
		FinanceApiUtil fau = new FinanceApiUtil();
		List<IndustryVO> IndustryList = fau.getIndustryCrawling(request, response); //종목 크롤링해서 갖고 옴 
		
		if(industryBIZ.insert(IndustryList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
	}
}

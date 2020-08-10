package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceCateBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.MemberBIZ;
import com.vs.biz.MemberLogBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.FinanceApiUtil;
import com.vs.util.StockApiUtil;
import com.vs.vo.CardPageVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceCateVO;
import com.vs.vo.IndustryVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

import com.vs.vo.CardPageVO;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	@Autowired
	private IndustryBIZ industryBIZ;
	@Autowired
	private CompanyBIZ companyBIZ;
	@Autowired
	private FinanceCateBIZ financeCateBIZ;
	@Autowired
	private MemberBIZ memberBIZ;
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;

	private Map<String, CardPageVO> cardDataMap;
	private List<String> indNoList;
	
	
	@RequestMapping(value = "/reportPage/rtprice", method = RequestMethod.POST)
	public String getRealTimePrice(@RequestParam("no") String no) {
		//String stockCode = request.getParameter("stockCode");
		//System.out.println("출력");
		StockApiUtil api = new StockApiUtil(no);
		String[][] TimeConclude = api.getTimeConcludeAPI();
		
		String result = TimeConclude[0][1].replaceAll(",", ""); 
		//System.out.println(result);
		//System.out.println("{\"result\":"+result+"}");
		return "{\"result\":"+result+"}";
	}
	
	@RequestMapping(value = "/manager/member", method = RequestMethod.POST)
	public Map<String, Object> getManagerPgUserList(HttpServletRequest request) {
		String searchWord = request.getParameter("searchWord");
		String sortType = request.getParameter("sortType");
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println(searchWord);
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map = memberBIZ.selectList(searchWord, sortType, page);
		
		for( String key : map.keySet()) {
			System.out.println("[ "+map.get(key)+" ]");
		}
		return map;
	}
	
	@RequestMapping("/financeCateData")
	public void getFinanceCateData() {
		FinanceApiUtil fau = new FinanceApiUtil();
		List<FinanceCateVO> cateList  = fau.getFinanceCateAPI();
		if(financeCateBIZ.insertViaJSON(cateList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
		
	}
	
	@RequestMapping("/companyData")
	public void getCompanyData(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=UTF-8");
		
		System.out.println("[ 회사넣기 ]");
		FinanceApiUtil fau = new FinanceApiUtil();
		List<IndustryVO> industryList = industryBIZ.getList();
		List<CompanyVO> companyList = fau.getCompanyCrawling(industryList);
		if(companyBIZ.insertIntoAPI(companyList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
	}
	
	@RequestMapping("/getFinanceData")
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
	
	@RequestMapping("/init")
	public void initCardPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("페이지 진입 성공");
		
		String[] Date = getStartEndDate();		// 0:Start, 1:End
		
		// 기존 데이터 삭제
		cardDataMap = new HashMap<String, CardPageVO>();
		cardDataMap.clear();
		indNoList = new ArrayList<String>();
		indNoList.clear();
		
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
			
			System.out.printf(">" + indNo1 + " / " + stockCode1 + " -- ");
			// 같은 회사임!
			// 변동률 구하기
			double close1 = svo1.getClose();	// 어제 종가
			double close2 = svo2.getClose();	// 오늘 종가
			double changeRate = (close2 - close1) / close1 * 100;
			cardDataMap.get(indNo1).addCRateSum(changeRate);
			System.out.printf(changeRate + " ... ");
			
			// 개수 세기
			cardDataMap.get(indNo1).increaseTotalCnt();
			if(changeRate > 0) {
				cardDataMap.get(indNo1).increaseIncCnt();
				System.out.printf("▲\n");
			}else if(changeRate < 0) {
				cardDataMap.get(indNo1).increaseDecCnt();
				System.out.printf("▼\n");
			}else {
				System.out.printf("-\n");
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
		printCardDataMap();
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
	
	public void printCardDataMap() {
		// 산업군의 변동률 계산
		for(String indNo : indNoList) {	
			CardPageVO curCVO = cardDataMap.get(indNo);
			int totalCnt = curCVO.getTotalCnt();
			int incCnt = curCVO.getIncCnt();
			int decCnt = curCVO.getDecCnt();
			int somthingleft = totalCnt - incCnt - decCnt;
			double CRate = curCVO.getChangeRate();
			
			System.out.println("["+curCVO.getIndustryName()+"] "+ totalCnt + " / " + incCnt + " / " + decCnt
					+ " / " + somthingleft + " / " + CRate);
		}
	}
}
	

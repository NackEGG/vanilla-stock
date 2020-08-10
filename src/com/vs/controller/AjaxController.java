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
}
	

package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceCateBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.util.FinanceApiUtil;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceCateVO;
import com.vs.vo.IndustryVO;


@RestController
@RequestMapping("/ajax")
public class AjaxController {
	@Autowired
	private IndustryBIZ industryBIZ;
	@Autowired
	private CompanyBIZ companyBIZ;
	
	@Autowired
	private FinanceCateBIZ financeCateBIZ;
	
	
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
	

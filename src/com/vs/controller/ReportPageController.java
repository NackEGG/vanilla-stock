package com.vs.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.StockApiUtil;
import com.vs.vo.CompanyVO;
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
	
	@RequestMapping(path = "/reportPage", method = RequestMethod.GET)
	public String hello01(HttpServletRequest request, Model model) throws Exception {
		
		//String keyword = (String) request.getAttribute("keyword");
		//CompanyVO companyVO = companyBIZ.select(keyword);
		CompanyVO companyVO = companyBIZ.select("003620");
		IndustryVO industryVO = industryBIZ.get(companyVO.getStockCode());
			
		StockApiUtil api = new StockApiUtil(companyVO.getStockCode());
		String[] arrStockInfo = api.getStockInfoAPI();
		String[][] arrDailyStock = api.getDailyStockAPI();
		String[][] arrTimeConclude = api.getTimeConcludeAPI();
		
		for(int i = 0; i<arrDailyStock.length; i++) {
			if(arrTimeConclude[i][1].equals("") || arrTimeConclude[i][1].isEmpty()) {
				arrTimeConclude[i][1] = arrStockInfo[1].replaceAll(",", "");
			}
		}
		
		System.out.println(new Date().getTime());

		StockRecordsVO stockRecordsVO = new StockRecordsVO();
		stockRecordsVO.settDate(arrStockInfo[18].substring(0, 10));
		System.out.println(stockRecordsVO.gettDate());
		stockRecordsVO.setStockCode(companyVO.getStockCode());
		int prevMonthClose = stockRecordsBIZ.selectPrevMonthClose(stockRecordsVO);
		
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("industryVO", industryVO);
		model.addAttribute("arrStockInfo", arrStockInfo);
		model.addAttribute("arrDailyStock", arrDailyStock);
		model.addAttribute("arrTimeConclude", arrTimeConclude);
		model.addAttribute("prevMonthClose", prevMonthClose);
		return "reportPage";
	}
}

package com.vs.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.vs.biz.CommentsBIZ;
import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.StockRecordsBIZ;

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
	
	@RequestMapping(path = "/reportPage", method = RequestMethod.GET)
	public String getSummary(@RequestParam(value="keyword", required=false, defaultValue="0") String keyword, 
			Model model) throws Exception {
		
		Map<String,Object> summary = companyBIZ.getSummary(keyword);
		
		// model.addAttribute
		model.addAttribute("summary", summary);
		
		return "reportPage";
	}
}

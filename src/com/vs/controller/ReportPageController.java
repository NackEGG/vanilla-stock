package com.vs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vs.biz.CompanyBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.vo.CompanyVO;
import com.vs.vo.IndustryVO;

@Controller
public class ReportPageController {

	@Autowired
	CompanyBIZ companyBIZ;
	
	@Autowired
	IndustryBIZ industryBIZ;
	
	@RequestMapping(path = "/reportPage", method = RequestMethod.GET)
	public String hello01(HttpServletRequest request, Model model) {
		
		String keyword = (String) request.getAttribute("keyword");
		CompanyVO companyVO = companyBIZ.select(keyword);
		//CompanyVO companyVO = companyBIZ.select("000020");
		IndustryVO industryVO = industryBIZ.get(companyVO.getStockCode());
		model.addAttribute("companyVO", companyVO);
		model.addAttribute("industryVO", industryVO);
		return "reportPage";
	}
}

package com.vs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vs.biz.AnnouncementBIZ;
import com.vs.biz.PickBIZ;
import com.vs.vo.AnnouncementVO;
import com.vs.vo.CompanyVO;

@Controller
public class MainPageController {
	
	@Autowired
	AnnouncementBIZ announcementBIZ;
	
	@Autowired
	PickBIZ pickBIZ;
	

	@RequestMapping(path="/main" , method=RequestMethod.GET)
	public String recentAnnouncement(Model model) {
		
		String list = announcementBIZ.recentAnnouncement();
		System.out.println("공지사항!!!!!!!");
		model.addAttribute("announce",list);
		
		return "index";
	}
	
	@RequestMapping(path="/main1" , method=RequestMethod.GET)
	public String popularCompany(Model model) {
		
		List<CompanyVO> popularcompany = pickBIZ.popularComanylist();
		System.out.println("최근인기종목!!!!! " + popularcompany.get(0).getCompany());
		model.addAttribute("popular",popularcompany);
		System.out.println(model.toString());
		return "index";
	}
	
	
}

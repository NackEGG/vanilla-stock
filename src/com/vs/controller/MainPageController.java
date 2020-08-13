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
import com.vs.vo.AnnouncementVO;

@Controller
public class MainPageController {
	
	@Autowired
	AnnouncementBIZ announcementBIZ;

	@RequestMapping(path="/main" , method=RequestMethod.GET)
	public String recentAnnouncement(Model model) {
		
		String list = announcementBIZ.recentAnnouncement();
		System.out.println("공지사항!!!!!!!");
		model.addAttribute("announce",list);
		
		return "index";
	}
}

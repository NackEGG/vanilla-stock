package com.vs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@RequestMapping(value="/members", method = RequestMethod.GET)
	public String showMembersPG(Model model) {
		model.addAttribute("category", "members");
		return "manager";
	}
	@RequestMapping(value="/contents", method = RequestMethod.GET)
	public String showContentsPG(Model model) {
		model.addAttribute("category", "contents");
		return "manager";
	}
}

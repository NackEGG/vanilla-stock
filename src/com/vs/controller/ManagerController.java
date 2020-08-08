package com.vs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@RequestMapping(value="/user", method = RequestMethod.GET)
	public String showMangerPG() {
		return "manager";
	}
}

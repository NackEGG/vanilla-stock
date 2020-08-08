package com.vs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vs.biz.ArticleBIZ;
import com.vs.vo.ArticleVO;

@Controller
public class ArticlePageController {

	@Autowired
	ArticleBIZ articleBIZ;
	
	@RequestMapping(path = "/articlePage", method = RequestMethod.POST)
	public String hello01(HttpServletRequest request, Model model) {
		ArticleVO articleVO = new ArticleVO();
		//articleVO.setTitle((String) request.getAttribute("title"));
		//articleVO.setMemberNo((int) request.getAttribute("id"));
		articleVO.setTitle("테스트 아티클");
		articleVO.setMemberNo(1);
		boolean check = articleBIZ.insert(articleVO);
		
		return "articleMain";
	}
	
}

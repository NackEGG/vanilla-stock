package com.vs.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(path = "/articlePage/list", method = RequestMethod.GET)
	public Map<String, Object> hello2(HttpServletRequest request, Model model) {
		String searchWord = request.getParameter("searchWord");
		String searchType = request.getParameter("searchType");
		String sortType = request.getParameter("sortType");
		int page = Integer.parseInt(request.getParameter("page"));
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map = articleBIZ.getPageList(searchWord, searchType, sortType, page);
		
		for( String key : map.keySet()) {
			System.out.println("[ "+map.get(key)+" ]");
		}
		
		return map;
	}
	
}

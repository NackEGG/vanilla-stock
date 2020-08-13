package com.vs.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vs.biz.ArticleBIZ;
import com.vs.biz.CompanyBIZ;
import com.vs.vo.ArticleVO;
import com.vs.vo.CommentsVO;
import com.vs.vo.MemberVO;

@Controller
public class ArticlePageController {

	@Autowired
	ArticleBIZ articleBIZ;
	
	@Autowired
	CompanyBIZ companyBIZ;
	
	@RequestMapping(path = "/articleOpen", method = RequestMethod.GET)
	public String hello03(Model model) {
		List<String> companyList = companyBIZ.selectAllCompanyName();
		model.addAttribute("companyList", companyList);
		return "articleOpen";
	}
	
	@RequestMapping(path = "/articlePage", method = RequestMethod.GET)
	public String hello01() {		
		return "articleMain";
	}
	
	@RequestMapping(path = "/articlePage", method = RequestMethod.POST)
	public String hello04(HttpServletRequest request, HttpSession session, Model model) {		
		ArticleVO articleVO = new ArticleVO();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("loginMember");
		articleVO.setCompanyName((String) request.getParameter("company"));
		articleVO.setTitle((String) request.getParameter("title"));
		articleVO.setMemberNo(memberVO.getNo());
		boolean check = articleBIZ.insert(articleVO);			
		if(check) {
			return "articleMain";
		} else {
			return "articleOpen";
		}
	}
	
	@RequestMapping(path = "/articlePage/comments/{no}", method = RequestMethod.GET)
	public String hello02(@PathVariable int no, Model model) {
		ArticleVO articleVO = new ArticleVO();
		articleVO = articleBIZ.select(no);
		model.addAttribute("articleVO", articleVO);
		return "articleComments";
	}

	
	

}

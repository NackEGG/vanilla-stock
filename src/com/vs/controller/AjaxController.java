package com.vs.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.vs.biz.ArticleBIZ;
import com.vs.biz.CommentsBIZ;
import com.vs.biz.CompanyBIZ;
import com.vs.biz.FinanceCateBIZ;
import com.vs.biz.IndustryBIZ;
import com.vs.biz.MemberBIZ;
import com.vs.biz.MemberLogBIZ;
import com.vs.biz.PickBIZ;
import com.vs.biz.StockRecordsBIZ;
import com.vs.util.FinanceApiUtil;
import com.vs.util.StockApiUtil;
import com.vs.vo.ArticleVO;
import com.vs.vo.CardPageVO;
import com.vs.vo.CommentsVO;
import com.vs.vo.CompanyVO;
import com.vs.vo.FinanceCateVO;
import com.vs.vo.IndustryVO;
import com.vs.vo.MemberVO;
import com.vs.vo.PickVO;
import com.vs.vo.StockRecordsVO;

import javafx.util.Pair;

import com.vs.vo.CardPageVO;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	@Autowired
	private IndustryBIZ industryBIZ;
	@Autowired
	private CompanyBIZ companyBIZ;
	@Autowired
	private FinanceCateBIZ financeCateBIZ;
	@Autowired
	private MemberBIZ memberBIZ;
	@Autowired
	private StockRecordsBIZ stockRecordsBIZ;
	@Autowired
	private ArticleBIZ articleBIZ;
	@Autowired
	private PickBIZ pickBIZ;
	@Autowired
	private CommentsBIZ commentsBIZ;

	private Map<String, CardPageVO> cardDataMap;
	private List<String> indNoList;
	
	@RequestMapping(path = "/articlePage/comments", method = RequestMethod.POST)
	public void hell06(HttpServletRequest request, HttpSession session) {
		CommentsVO commentsVO = new CommentsVO();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("loginMember");
		commentsVO.setArticleNo(Integer.parseInt(request.getParameter("articleNo")));
		commentsVO.setContent(request.getParameter("content"));
		commentsVO.setMemberNo(memberVO.getNo());
		System.out.println(commentsVO.getArticleNo());
		System.out.println(commentsVO.getContent());
		System.out.println(commentsVO.getMemberNo());
		
		try {
			commentsBIZ.insert(commentsVO);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ajaxcontroller에러");
		}
	}
	
	@RequestMapping(path = "/articlePage/pick", method = RequestMethod.POST) 
	public String hello4(HttpSession session, HttpServletRequest request) {	
		PickVO pickVO = new PickVO();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("loginMember");
		pickVO.setMemberNo(memberVO.getNo());
		pickVO.setArticleNo(Integer.parseInt(request.getParameter("articleNo")));
		pickVO.setOpinion(request.getParameter("pick"));
		System.out.println(pickVO.getArticleNo());
		System.out.println(pickVO.getOpinion());
		System.out.println(pickVO.getMemberNo());
		
		try {
			pickBIZ.insert(pickVO);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	} 
	
	@RequestMapping(path = "/articlePage/pick", method = RequestMethod.GET) 
	public String hello3(HttpServletRequest request) {	
		int no = Integer.parseInt(request.getParameter("articleNo"));
		ArticleVO vo = new ArticleVO();
		vo = articleBIZ.select(no);
		int good = vo.getCountGood();
		int bad = vo.getCountBad();
		return "{\"good\":"+good+",\"bad\":"+bad+"}";
	} 
	
	@RequestMapping(path = "/articlePage/insert", method = RequestMethod.POST) 
	public String hello5(HttpSession session, HttpServletRequest request) {
		ArticleVO articleVO = new ArticleVO();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("loginMember");
		articleVO.setCompanyName((String) request.getParameter("company"));
		articleVO.setTitle((String) request.getParameter("title"));
		articleVO.setMemberNo(memberVO.getNo());
		boolean check = articleBIZ.insert(articleVO);
		System.out.println(check);
		if(check) {
			return "articleMain";
		} else {
			return "articleOpen";
		}
	}
	 
	
	@RequestMapping(path = "/articlePage/list", method = RequestMethod.POST)
	public Map<String, Object> hello2(HttpServletRequest request) {		
		String searchWord = request.getParameter("searchWord");
		String searchType = request.getParameter("searchType");
		String sortType = request.getParameter("sortType");
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println("검색조건"+searchType);
		System.out.println("검색어"+searchWord);
		System.out.println("분류조건"+sortType);
		System.out.println("페이지"+page);		
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map = articleBIZ.getPageList(searchWord, searchType, sortType, page);
		
		return map;
	}
	
	@RequestMapping(value = "/reportPage/rtprice", method = RequestMethod.POST)
	public String getRealTimePrice(@RequestParam("no") String no) {
		//String stockCode = request.getParameter("stockCode");
		StockApiUtil api = new StockApiUtil(no);
		String[][] TimeConclude = api.getTimeConcludeAPI();
		
		String result = TimeConclude[0][1].replaceAll(",", ""); 
		if(result.isEmpty() || result.equals("")) 
			result = api.getStockInfoAPI()[1].replaceAll(",", "");
		//System.out.println(result);
		//System.out.println("{\"result\":"+result+"}");
		return "{\"result\":"+result+"}";
	}
	
	@RequestMapping(value = "/manager/member", method = RequestMethod.POST)
	public Map<String, Object> getManagerPgUserList(HttpServletRequest request) {
		String searchWord = request.getParameter("searchWord");
		String sortType = request.getParameter("sortType");
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println(searchWord);
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map = memberBIZ.selectList(searchWord, sortType, page);
		
		for( String key : map.keySet()) {
			System.out.println("[ "+map.get(key)+" ]");
		}
		return map;
	}
	
	@RequestMapping("/financeCateData")
	public void getFinanceCateData() {
		FinanceApiUtil fau = new FinanceApiUtil();
		List<FinanceCateVO> cateList  = fau.getFinanceCateAPI();
		if(financeCateBIZ.insertViaJSON(cateList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
		
	}
	
	@RequestMapping("/companyData")
	public void getCompanyData(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=UTF-8");
		
		System.out.println("[ 회사넣기 ]");
		FinanceApiUtil fau = new FinanceApiUtil();
		List<IndustryVO> industryList = industryBIZ.getList();
		List<CompanyVO> companyList = fau.getCompanyCrawling(industryList);
		if(companyBIZ.insertIntoAPI(companyList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
	}
	
	@RequestMapping("/getFinanceData")
	public void getIndustryData(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=UTF-8");
		System.out.println("[ 종목 넣기 ]");
		FinanceApiUtil fau = new FinanceApiUtil();
		List<IndustryVO> IndustryList = fau.getIndustryCrawling(request, response); //종목 크롤링해서 갖고 옴 
		
		if(industryBIZ.insert(IndustryList))	System.out.println("[insert 모두 완료]");
		else System.out.println("[insert 실패]");
	}
}
	

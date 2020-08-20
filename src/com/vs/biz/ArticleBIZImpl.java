package com.vs.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.ArticleDAO;
import com.vs.util.PaginateUtil;
import com.vs.vo.ArticleVO;
import com.vs.vo.FinanceManagerJoinVO;
import com.vs.vo.PageVO;

@Service
public class ArticleBIZImpl implements ArticleBIZ {
	
	@Autowired
	private ArticleDAO articleDAO;
	
	
	@Override
	public Map<String, Object> getJoinList(int page, String tab, String searchWord, int startYear, int startQuarter,
			int endYear, int endQuarter, String sortType) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 10; //각 인덱스당 출력되는 유저 수 
		int numBlock = 5; //출력될 페이지 인덱스 개수 
		System.out.println(searchWord);
		if(searchWord==null||searchWord.isEmpty()||searchWord.length()<1)	searchWord = null;
		if(sortType==null||sortType.isEmpty()||sortType.length()<1)	sortType = null;
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		PaginateUtil paginateUtil = new PaginateUtil();
		PageVO pageVO = new PageVO(page, numPage);
		int endPage = pageVO.getEnd();
		int startPage = pageVO.getStart();
		
		list = articleDAO.selectJoinList(tab, searchWord, startYear, startQuarter, endYear, endQuarter, startPage, endPage, sortType);
		map.put("dataList", list);
		
		for(ArticleVO f : list) {
			System.out.println(f.getTitle());
		}
		
		//총 게시물 수 
		int total = (int) list.get(0).getTotal();
		
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, 
				"/vanilla-stock/ajax/manager/contents"));
	
	
		return map;
	}

	@Override
	public ArticleVO select(int no) {
		return articleDAO.select(no);
	}
	
	@Override
	public boolean insert(ArticleVO articleVO) {
		return articleDAO.insert(articleVO);
	}

	@Override
	public Map<String, Object> getPageList(String searchWord, String searchType, String sortType, int page) {
		
		int numPage = 5; // 각 인덱스당 출력되는 article 개수 
		int numBlock = 5; // 한 블록 내 인덱스 개수
		
		if(searchWord.isEmpty()||searchWord.length()<1) searchWord = "";

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		PaginateUtil paginateUtil = new PaginateUtil();
		
		PageVO pageVO = new PageVO(page, numPage);
		int startPage = pageVO.getStart();
		int endPage = pageVO.getEnd();
		//System.out.println(searchWord);
		//System.out.println(searchType);
		//System.out.println(sortType);
		//System.out.println(startPage);
		//System.out.println(endPage);
		List<ArticleVO> articleList = articleDAO.getPageList(searchWord, searchType, sortType, startPage, endPage);
		
		map.put("articleList", articleList);
		
		//총 게시물 수 
		int total = articleDAO.getTotal(searchWord, searchType);	
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, "/vanilla-stock/ajax/articlePage/list"));
			
		return map;
	}

}

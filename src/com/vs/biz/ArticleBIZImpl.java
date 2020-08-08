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
import com.vs.vo.PageVO;

@Service
public class ArticleBIZImpl implements ArticleBIZ {
	
	@Autowired
	private ArticleDAO articleDAO;
	
	@Override
	public boolean insert(ArticleVO articleVO) {
		return articleDAO.insert(articleVO);
	}

	@Override
	public Map<String, Object> getPageList(String searchWord, String searchType, String sortType, int page) {
		
		int numPage = 5; // 각 인덱스당 출력되는 article 개수 
		int numBlock = 5; // 한 블록 내 인덱스 개수
		
		if(searchWord.isEmpty()||searchWord.length()<1) searchWord = null;

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		List<ArticleVO> memberList = new ArrayList<ArticleVO>();
		PaginateUtil paginateUtil = new PaginateUtil();
		
		PageVO pageVO = new PageVO(page, numPage);
		int startPage = pageVO.getStart();
		int endPage = pageVO.getEnd();
		
		List<ArticleVO> articleList = articleDAO.getPageList(searchWord, searchType, sortType, startPage, endPage);
		
		map.put("articleList", articleList);
		
		//총 게시물 수 
		int total = articleDAO.getTotal(searchWord, searchType);	
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, "/community/categoryType/sortingType/"));
			
		return map;
	}

}

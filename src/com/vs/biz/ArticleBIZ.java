package com.vs.biz;

import java.util.List;
import java.util.Map;

import com.vs.vo.ArticleVO;
import com.vs.vo.PageVO;

public interface ArticleBIZ {
	public Map<String, Object> getJoinList(int page, String tab, String searchWord, int startYear, 
			int startQuarter, int endYear, int endQuarter, String sortType );
	public boolean insert(ArticleVO articleVO);
	public Map<String, Object> getPageList(String searchWord, String searchType, String sortType, int page);
	public ArticleVO select(int no);
}

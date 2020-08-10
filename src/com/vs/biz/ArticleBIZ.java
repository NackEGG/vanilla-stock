package com.vs.biz;

import java.util.List;
import java.util.Map;

import com.vs.vo.ArticleVO;
import com.vs.vo.PageVO;

public interface ArticleBIZ {
	public boolean insert(ArticleVO articleVO);
	public Map<String, Object> getPageList(String searchWord, String searchType, String sortType, int page);
}

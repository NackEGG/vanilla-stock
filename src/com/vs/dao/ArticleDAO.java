package com.vs.dao;

import java.util.List;
import java.util.Map;

import com.vs.vo.ArticleVO;
import com.vs.vo.PageVO;

public interface ArticleDAO {
	public List<ArticleVO> getPageList(String searchWord, String searchType, String sortType, int startPage, int endPage);
	public boolean insert(ArticleVO articleVO);
	public int getTotal(String searchWord, String searchType);
	public ArticleVO select(int no);
}

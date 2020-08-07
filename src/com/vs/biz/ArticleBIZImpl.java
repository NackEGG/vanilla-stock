package com.vs.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.dao.ArticleDAO;
import com.vs.vo.ArticleVO;

@Service
public class ArticleBIZImpl implements ArticleBIZ {
	
	@Autowired
	private ArticleDAO articleDAO;

	@Override
	public boolean insert(ArticleVO articleVO) {
		return articleDAO.insert(articleVO);
	}
}
